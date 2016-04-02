//
//  main.cpp
//  random_books
//
//  Created by Ferran coma rosell on 16/12/15.
//  Copyright © 2015 Ferran coma rosell. All rights reserved.
//

#include <iostream>
#include <fstream>
#include <vector>
#include <cstdlib>
using namespace std;



int main() {
    
    //Entrada de variables
    int to_read, readed, paralel, requisit, seed;
    cout << "Quants llibres per llegir vols? ";
    cin >> to_read;
    cout << endl;
    cout << "Quants llibres llegits vols? ";
    cin >> readed;
    cout << endl;
    cout << "Quants llibres paralels vols? ";
    cin >> paralel;
    cout << endl;
    cout << "Quants llibres requisit vols? ";
    cin >> requisit;
    cout << endl;
    //cout << "Introduce una semilla? ";
    //cin >> seed;
    cout << endl;
    string num_prova;
    cout << "Quina prova es? ";
    cin >> num_prova;
    cout << endl << "S'esta generant l'arxiu d'entrada..."<<endl<<endl;
    
    //Montem nom_arxiu
    string nom_arxiu = "schedule"+num_prova;
    
    //Montem els vecors de sortida
    vector<int> vec_to_read (to_read);
    vector<int> vec_readed (readed);
    vector<int> llibres_totals (to_read+readed);
    vector<int> llibres_totals2 (to_read+readed);
    for(int x = 0; x < llibres_totals.size(); x++){
        llibres_totals[x] = -1;
        llibres_totals2[x] = -1;
    }
    
    vector<pair<int,int> > vec_requisits (requisit);
    vector<pair<int,int> > vec_paralel (paralel);
    int i;
    for(int x = 0; x < to_read; x++){
        vec_to_read[x]=i;
        i++;
    }
    for(int x = 0; x < readed; x++){
        vec_readed[x]=i;
        i++;
    }
    
    //Generacio paralels
    //no volem una seed parell, perque al fer modul sempre surtira 0 amb els nombres parells
    for(int x = 0; x < paralel; x++){
        int aux1 = rand() % llibres_totals.size();
        int aux2 = rand() % llibres_totals.size();
        llibres_totals[aux1] = x;
        llibres_totals[aux2] = x;
    }
    
    for(int x = 0; x < requisit; x++){
        int aux1 = rand() % llibres_totals2.size();
        while(llibres_totals2[aux1] != -1){
            aux1 = rand() % llibres_totals2.size();
        }
        int aux2 = rand() % llibres_totals2.size();
        while((llibres_totals2[aux2] == llibres_totals2[aux1] && llibres_totals2[aux1] != -1) || aux2 == aux1){
            aux2 = rand() % llibres_totals2.size();
        }
        llibres_totals2[aux1] = aux2;
    }
    
    
    //Generacio del fitxer
    ofstream arxiu;
    arxiu.open(nom_arxiu+".pddl");
    
    arxiu << ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;" << endl;
    arxiu << ";;                                                  ;;" << endl;
    arxiu << ";;        Arxiu Generat Automaticament amb:         ;;" << endl;
    arxiu << ";;   1- " << to_read <<" llibres per llegir                        "<<endl;
    arxiu << ";;   2- " << readed << " llibres llegits                           " << endl;
    arxiu << ";;   3- " << paralel << " relacions paraleles                       "<<endl;
    arxiu << ";;   4- " << requisit << " relacions de requisits                    "<<endl;
    arxiu << ";;   5- Amb la llabor: "<< seed << "                            "<<endl;
    arxiu << ";;                                                  ;;" << endl;
    arxiu << ";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;" << endl;
    arxiu << endl<<endl;
    
    arxiu << "(define (problem "+nom_arxiu+") (:domain libros)"<<endl;
    arxiu << "(:objects" << endl;
    
    arxiu << "      enero febrero marzo abril mayo junio" << endl;
    arxiu << "      julio agosto septiembre octubre noviembre diciembre" << endl;
    
    arxiu << "      ;;Llibres per llegir:" <<endl<<"      ";
    for(int x = 0; x  < vec_to_read.size(); x++){
        arxiu << "llibre" <<vec_to_read[x] << " ";
    }
    arxiu << endl;
    
    arxiu << "      ;;Llibres llegits:"<<endl<<"      ";
    for(int x = 0; x  < vec_readed.size(); x++){
        arxiu << "llibre" << vec_readed[x] << " ";
    }
    arxiu << endl;
    
    arxiu << ")"<<endl;
    arxiu << "(:init"<<endl;
    
    for(int x = 0; x  < vec_to_read.size(); x++){
        arxiu << "  "<< "(to_read " << "llibre" << vec_to_read[x] << ")"<<endl;
    }
    arxiu << endl;
    
    for(int x = 0; x  < vec_readed.size(); x++){
        arxiu <<  "  " << "(readed " << "llibre" << vec_readed[x] << ")"<<endl;
    }
    
    arxiu << endl;
    for(int x = 0; x < llibres_totals.size(); x++){
        if(llibres_totals[x] != -1){
            bool trobat = false;
            for(int n = x+1; n < llibres_totals.size() && !trobat; n++){
                if(llibres_totals[n] == llibres_totals[x]){
                    trobat = true;
                    llibres_totals[n] = -1;
                    llibres_totals[x] = -1;
                    arxiu << "  " << "(paralel " << "llibre" << x << " " << "llibre" << n <<")"<<endl;
                }
            }
        }
    }
    arxiu << endl;
    
    for(int x = 0; x < llibres_totals2.size(); x++){
        if(llibres_totals2[x] != -1){
            arxiu << "  " << "(required " << "llibre" << x << " " << "llibre" << llibres_totals2[x] <<")"<<endl;
        }
    }
    arxiu << endl;
    
    arxiu << "  (seguidos enero febrero)" << endl;
    arxiu << "  (seguidos febrero marzo)" << endl;
    arxiu << "  (seguidos marzo abril)" << endl;
    arxiu << "  (seguidos abril mayo)" << endl;
    arxiu << "  (seguidos mayo junio)" << endl;
    arxiu << "  (seguidos junio julio)" << endl;
    arxiu << "  (seguidos julio agosto)" << endl;
    arxiu << "  (seguidos agosto septiembre)" << endl;
    arxiu << "  (seguidos septiembre octubre)" << endl;
    arxiu << "  (seguidos octubre noviembre)" << endl;
    arxiu << "  (seguidos noviembre diciembre)" << endl;
    
    arxiu << endl << ")" << endl;
    
    arxiu << "(:goal (and" << endl;
    for(int x = 0; x  < vec_to_read.size(); x++){
        arxiu << "  "<<"(readed " << "llibre" << vec_to_read[x] << ")"<<endl;
    }
    arxiu << "  " << ")" << endl;
    arxiu << "))" << endl << endl;
    
}
