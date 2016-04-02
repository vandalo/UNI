//
//  main.cpp
//  PracticaAlgorismiaGeneradorArxius
//
//  Created by Ferran coma rosell on 5/12/15.
//  Copyright © 2015 Ferran coma rosell. All rights reserved.
//

#include <iostream>
#include <ctime>
#include <fstream>
#include <string>
#include <vector>
using namespace std;
int M = 34234;


int abs(int x){
    int res = x;
    if (x < 0)res = x*-1;
    return res;
}

int main() {
    int num_joc_probes;
    cout << "Quans jocs de proba vols generar? ";
    cin >> num_joc_probes;
    vector<vector<int> >vec(num_joc_probes);
    for(int i = 0; i < num_joc_probes; ++i){
    
        //Recopilacio de dades
        int n, n2;
        cout << "Test " << i+1 << endl << endl;;
        cout << "Introdueix el numero de Paraules que vols tenir al diccionari"<<endl<< "(Num. de paraules): ";
        cin >> n;
        cout << "Introdueix quants valors de Text vols"<<endl<< "(Num. de Texts): "<<endl;
        cin >> n2;
        vec[i].push_back(n);
        vec[i].push_back(n2);
        //Generador de dades
        ofstream arxiu;
        arxiu.open("dic"+to_string(i+1)+".txt");
        for(int i = 0; i < n; ++i){
            int random = rand()%(n*4);
            arxiu << abs(random) << endl;
        }
        arxiu.close();
        arxiu.open("text"+to_string(i+1)+".txt");
        for(int i = 0; i < n2; ++i){
            int random = rand()%(n*4);
            arxiu << abs(random) << endl;
        }
        arxiu.close();
    }
    ofstream arxiu;
    arxiu.open("Log_tests.txt");
    for(int i = 0; i < num_joc_probes; ++i){
        arxiu << "Test " << i+1 << endl;
        arxiu << "---------------------------"<< endl;
        arxiu << "Temany Dicc: "<< vec[i][0] << endl;
        arxiu << "Temany Text: "<< vec[i][1] << endl;
        arxiu << "---------------------------"<< endl << endl;
    }
    arxiu.close();
}
