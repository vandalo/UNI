#include <GL/glew.h>
#include "MyGLWidget.h"
#include  <math.h>
#include <iostream>
using namespace std;

MyGLWidget::MyGLWidget (QGLFormat &f, QWidget* parent) : QGLWidget(f, parent)
{
  setFocusPolicy(Qt::ClickFocus); // per rebre events de teclat
  scale = 1.0f;
}

void MyGLWidget::initializeGL () 
{
  // glew és necessari per cridar funcions de les darreres versions d'OpenGL
  glewExperimental = GL_TRUE;
  glewInit(); 
  glGetError();  // Reinicia la variable d'error d'OpenGL

  glClearColor(0.5, 0.7, 1.0, 1.0); // defineix color de fons (d'esborrat)
  carregaShaders();
  createBuffers();
  alpha=0;
  angle = 1.04719755;
  anglx = angly = 0.;
  //posx = posy = 0.;
  centrarPatri();
  //modelTransform ();
  projectTransform(1.0,1.04719755);//2*asin(1/2)
  viewTransform();
  glEnable (GL_DEPTH_TEST);

}

void MyGLWidget::paintGL () 
{
  // Esborrem el frame-buffer
  glClear (GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

  //Activem VAO per pintar Homer
   modelTransform1();
    glBindVertexArray (VAO_Homer);
    glDrawArrays (GL_TRIANGLES, 0, m.faces ().size () * 3);

    modelTransform2();
     glBindVertexArray (VAO_Homer);
     glDrawArrays (GL_TRIANGLES, 0, m.faces ().size () * 3);


  // Activem el VAO per a pintar el terra
      modelTransformNoR();
      glBindVertexArray (VAO_Terra);
      glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);

   glBindVertexArray (0);
}


void MyGLWidget::modelTransform1 ()
{
  // Matriu de transformació de model
  glm::mat4 transform = glm::scale(glm::mat4(1.0f), glm::vec3(scale));
  transform = glm::translate(transform, glm::vec3(1,0,1));
  transform = glm::rotate(transform, alpha, glm::vec3(0.,1.,0.));
  transform = glm::scale(transform, glm::vec3(1/altura));
  transform = glm::translate(transform, caixa);
  glUniformMatrix4fv(transLoc, 1, GL_FALSE, &transform[0][0]);

}

void MyGLWidget::modelTransform2 ()
{
  // Matriu de transformació de model
  glm::mat4 transform = glm::scale(glm::mat4(1.0f), glm::vec3(scale));
  transform = glm::translate(transform, glm::vec3(-1,0,-1));
  transform = glm::rotate(transform, alpha, glm::vec3(0.,1.,0.));
  transform = glm::rotate(transform, (float)M_PI, glm::vec3(0.,1,0));
  transform = glm::scale(transform, glm::vec3(1/altura));
  transform = glm::translate(transform, caixa);
  glUniformMatrix4fv(transLoc, 1, GL_FALSE, &transform[0][0]);

}

void MyGLWidget::mouseMoveEvent(QMouseEvent*e ){
    int xaux = e->pos().x();
    int yaux = e->pos().y();
    angly += (xaux-posx)*0.01;
    anglx += (yaux-posy)*0.01;
    posx = xaux;
    posy = yaux;
    viewTransform();
    updateGL();
}

void MyGLWidget::mousePressEvent(QMouseEvent *event) {
    posx = event->pos().x();
    posy = event->pos().y();
}

void MyGLWidget::centrarPatri ()
{
    float minx,maxx,miny,maxy,minz,maxz;
    minx=miny=minz = 1111111111111111.0;
    maxx=maxy=maxz=-111111111111.0;
    for (unsigned int i = 0; i < m.vertices().size(); i+=3) {
         if (m.vertices()[i] > maxx)maxx =  m.vertices()[i];
         else if(m.vertices()[i] < minx) minx =  m.vertices()[i];

         if (m.vertices()[i+1] > maxy)maxy =  m.vertices()[i+1];
         else if(m.vertices()[i+1] < miny) miny =  m.vertices()[i+1];

         if (m.vertices()[i+2] > maxz)maxz =  m.vertices()[i+2];
         else if(m.vertices()[i+2] < minz) minz =  m.vertices()[i+2];
    }

    float x = (minx + maxx)/2;
    float y = miny;
    altura = maxy - miny;
    float z = (minz + maxz)/2;
    R = sqrt(16 + 1 + 16);
    //R = sqrt((maxx -minx)*(maxx -minx) + (maxy -miny)*(maxy -miny) + (maxz -minz)*(maxz -minz));
    R = R/2;
    caixa =  glm::vec3(-1*x,-1*y,-1*z);
}

void MyGLWidget::modelTransformNoR ()
{
  // Matriu de transformació de model sense rotar-lo
  glm::mat4 transform = glm::scale(glm::mat4(1.0f), glm::vec3(scale));
  glUniformMatrix4fv(transLoc, 1, GL_FALSE, &transform[0][0]);

}


void MyGLWidget::projectTransform (double ra,double FOV) {
    // glm::perspective (FOV en radians , ra window, znear, zfar)
    glm::mat4 Proj = glm::perspective (FOV, ra, (double)R, (double)3*R);
    glUniformMatrix4fv (projLoc, 1, GL_FALSE, &Proj[0][0]);
}

void MyGLWidget::viewTransform () {
    //glm::lookAt (OBS, VRP, UP)
    //glm::mat4 View = glm::lookAt (glm::vec3(0.,0.,2*R), glm::vec3(0,0,0), glm::vec3(0,1,0));
    glm::mat4 View =glm::translate(glm::mat4(1.0f),glm::vec3(0,0,(double)-2*R));
    View = glm::rotate(View,anglx,glm::vec3(1.,0.,0.));
    View = glm::rotate(View,-1*angly,glm::vec3(0.,1.,0.));
    View =glm::translate(View,glm::vec3(0.,-0.5,0.));
    glUniformMatrix4fv (viewLoc, 1, GL_FALSE, &View[0][0]);
}




void MyGLWidget::resizeGL (int w, int h) 
{

    if(w > h ) {
        projectTransform((double)w/(double)h,angle);
    }
    else if(h > w ) {
        angle=2*atan(tan(1.04719755/2)/((double)w/(double)h));
        if(angle <= 0) angle = 0.001745329252;
        if(angle > M_PI) angle = M_PI;
        projectTransform((double)w/(double)h,angle);
    }

    glViewport(0, 0, w, h);
}

void MyGLWidget::keyPressEvent(QKeyEvent* event) 
{
  switch (event->key()) {
    case Qt::Key_Escape:
      exit(0);
    case Qt::Key_S: { // escalar a més gran
      scale += 0.05;
      //modelTransform ();
      updateGL();
      break;
    }
    case Qt::Key_D: { // escalar a més petit
      scale -= 0.05;
      //modelTransform ();
      updateGL();
      break;
    }
      case Qt::Key_R: { // rotar 45graus
        alpha +=45;
        updateGL();
        break;
      }
      case Qt::Key_X: { // rotar 45graus
        angle += 0.1;
        if (angle >M_PI) angle = M_PI;
        projectTransform(1,angle);
        updateGL();
        break;
      }
      case Qt::Key_Z: { // rotar 45graus
        angle -= 0.1;
        if (angle<0) angle = 0;
        projectTransform(1,angle);
        updateGL();
        break;
      }

    default: event->ignore(); break;
  }
}

void MyGLWidget::createBuffers () 
{

   // Dades del terra
  // Dos VBOs, un amb posició i l'altre amb color
  glm::vec3 posterra[4] = {
    glm::vec3(-2.0, 0.0, -2.0),
    glm::vec3(-2.0, 0.0, 2.0),
    glm::vec3(2.0, 0.0, -2.0),
    glm::vec3(2.0, 0.0, 2.0)
  }; 
  glm::vec3 colterra[4] = {
	glm::vec3(1,0,1),
	glm::vec3(1,0,1),
	glm::vec3(1,0,1),
	glm::vec3(1,0,1)
  };

  // Creació del Vertex Array Object per pintar
  glGenVertexArrays(1, &VAO_Terra);
  glBindVertexArray(VAO_Terra);

  glGenBuffers(1, &VBO_TerraPos);
  glBindBuffer(GL_ARRAY_BUFFER, VBO_TerraPos);
  glBufferData(GL_ARRAY_BUFFER, sizeof(posterra), posterra, GL_STATIC_DRAW);

  // Activem l'atribut vertexLoc
  glVertexAttribPointer(vertexLoc, 3, GL_FLOAT, GL_FALSE, 0, 0);
  glEnableVertexAttribArray(vertexLoc);

  glGenBuffers(1, &VBO_TerraCol);
  glBindBuffer(GL_ARRAY_BUFFER, VBO_TerraCol);
  glBufferData(GL_ARRAY_BUFFER, sizeof(colterra), colterra, GL_STATIC_DRAW);

  // Activem l'atribut colorLoc
  glVertexAttribPointer(colorLoc, 3, GL_FLOAT, GL_FALSE, 0, 0);
  glEnableVertexAttribArray(colorLoc);


  //PATRI

  m.load("/dades/alec.lafita/linux/idi/bloc-2/Patricio.obj");

  glGenVertexArrays(1, &VAO_Homer);
  glBindVertexArray(VAO_Homer);

  glGenBuffers(1, &VBO_HomerPos);
  glBindBuffer(GL_ARRAY_BUFFER, VBO_HomerPos);
  glBufferData (GL_ARRAY_BUFFER, sizeof(GLfloat) * m.faces ().size () * 3 * 3, m.VBO_vertices (), GL_STATIC_DRAW);


  // Activem l'atribut vertexLoc
  glVertexAttribPointer(vertexLoc, 3, GL_FLOAT, GL_FALSE, 0, 0);
  glEnableVertexAttribArray(vertexLoc);

  glGenBuffers(1, &VBO_HomerCol);
  glBindBuffer(GL_ARRAY_BUFFER, VBO_HomerCol);
  glBufferData (GL_ARRAY_BUFFER, sizeof(GLfloat) * m.faces ().size () * 3 * 3, m.VBO_matdiff (), GL_STATIC_DRAW);

  // Activem l'atribut colorLoc
  glVertexAttribPointer(colorLoc, 3, GL_FLOAT, GL_FALSE, 0, 0);
  glEnableVertexAttribArray(colorLoc);


  glBindVertexArray (0);

}

void MyGLWidget::carregaShaders() 
{
  // Creem els shaders per al fragment shader i el vertex shader
  QGLShader fs (QGLShader::Fragment, this);
  QGLShader vs (QGLShader::Vertex, this);
  // Carreguem el codi dels fitxers i els compilem
  fs.compileSourceFile("shaders/fragshad.frag");
  vs.compileSourceFile("shaders/vertshad.vert");
  // Creem el program
  program = new QGLShaderProgram(this);
  // Li afegim els shaders corresponents
  program->addShader(&fs);
  program->addShader(&vs);
  // Linkem el program
  program->link();
  // Indiquem que aquest és el program que volem usar
  program->bind();

  // Obtenim identificador per a l'atribut “vertex” del vertex shader
  vertexLoc = glGetAttribLocation (program->programId(), "vertex");
  // Obtenim identificador per a l'atribut “color” del vertex shader
  colorLoc = glGetAttribLocation (program->programId(), "color");
  // Uniform locations
  transLoc = glGetUniformLocation(program->programId(), "TG");
  projLoc = glGetUniformLocation (program->programId(), "proj");
  viewLoc = glGetUniformLocation (program->programId(), "view");

}

