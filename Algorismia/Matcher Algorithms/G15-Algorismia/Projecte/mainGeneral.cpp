//
//  mainGeneral.cpp
//  
//
//  Created by Ferran coma rosell on 29/12/15.
//
//

#include <iostream>
#include <fstream>
#include <cstdio>
#include <ctime>
#include <string>
#include "hash/Hash.hpp"
#include "cercabinaria/CercaBinaria.hpp"
#include "bloom/bloom_filter.hpp"
#include "trie/trie.hpp"

using namespace std;


inline void print_capcalera(){
    cout << " ;---------------------------------------;" <<endl;
    cout << " ;                                       ;" <<endl;
    cout << " ;           MAIN - ALGORISMIA           ;" <<endl;
    cout << " ;            Comprovacio de             ;" <<endl;
    cout << " ;           temps de procesat           ;" <<endl;
    cout << " ;                                       ;" <<endl;
    cout << " ;---------------------------------------;" <<endl;
}


int main(){
    print_capcalera();
    cout << endl;
    clock_t start;
    double duration;
    
	/////////////////////////////////////////////////////
	///////BUCLE PARA COMPROBAR LOS JUEGOS DE PRUEBAS
	/////////////////////////////////////////////////////
	unsigned int numTests;
	vector<string> diccionarios;
	vector<string> textos;
	vector<string> tests;
    cout << "Quants jocs de proba tens? " << endl;
	cin >> numTests;
	cout << numTests << " jocs" << endl;
	string aux;
	string aux2;
	for (unsigned int i = 0; i < numTests; i++){
		cin >> aux;
		tests.push_back(aux);
		aux2 = aux + '.' + "txt";
        //aux2 = to_string(i+1) + ".txt";
		diccionarios.push_back("dic" + aux2);
		textos.push_back("text" + aux2);
	}
	
	for (unsigned int i = 0; i < numTests; i++){
		vector<unsigned int> keys_diccionario;
		vector<unsigned int> valores_texto;
		aux2 = "jocdeprobes/" + diccionarios[i];
		cout << "Joc de probes: " << aux2 << endl;
		unsigned int ii = i;
		//arxiu d'entrada
		ifstream arxiu(aux2.c_str());// jp1.txt);
		int temanyDadesArxiu1;
		unsigned int buffer;
		while (arxiu >>buffer) keys_diccionario.push_back(buffer);
		temanyDadesArxiu1 = keys_diccionario.size();
		
		aux2 = "outputs/testVGraficas-"+ tests[i] + ".txt";
		ofstream arxiuSortides;
		arxiuSortides.open(aux2.c_str());
		
		//////////////////////////////////
		//////////////TESTS//////////////
		/////////////////////////////////
		
		arxiuSortides << "Test amb " << temanyDadesArxiu1 << " dades en el diccionari" << endl;
		arxiuSortides << endl;
		
		arxiuSortides << "Insercio de hash..." << endl;
		//omplir taula de hash
		taula_hash hash(2*temanyDadesArxiu1);
		
		
		start = clock();
		for (unsigned int i = 0; i < keys_diccionario.size(); i++) 
			hash.insertKey(keys_diccionario[i]);

		duration = ( clock() - start ) / (double) CLOCKS_PER_SEC;
		
		arxiuSortides << "Insercio de hash completada" << endl;
		arxiuSortides << "Temps d'insercio: " << duration <<endl;
		arxiuSortides << endl;
		
		
		
		
		//omplir filtre de bloom
		//////////////
		arxiuSortides << "Insercio de la taula de bits del filtre de bloom..." << endl;
		const double expected_fpp = 1.0 / keys_diccionario.size();
		unsigned int random_seed = 0;
		bloom_parameters parameters(keys_diccionario.size(), expected_fpp, ++random_seed); //iniciar parametros
		if (parameters.optimos.num_hashes > 5) parameters.optimos.num_hashes -= 2;
		if (parameters.optimos.num_hashes > 7) parameters.optimos.num_hashes -= 1;
		bloom_filter filter(parameters); //iniciar filtro con parametros optimos
		
		start = clock();
		
		filter.insert(keys_diccionario.begin(),keys_diccionario.end()); //insertar lista de palabras
		
		duration = ( clock() - start ) / (double) CLOCKS_PER_SEC;

		arxiuSortides << "Numero de funcions de hash: " << parameters.optimos.num_hashes << endl;
		arxiuSortides << "Tamany de taula de bits: " << parameters.optimos.table_size << endl;
		arxiuSortides << "Insercio completada" << endl;
		arxiuSortides << "Temps d'insercio: " << duration <<endl;
		arxiuSortides << endl;
		
		
		/////////////////////////////////////
		//omplim vetor cerca binaria
		arxiuSortides << "Insercio del vector de cerca binaria..." << endl;
		start = clock();
		
		CercaBinaria cb(keys_diccionario);
		

		duration = ( clock() - start ) / (double) CLOCKS_PER_SEC;

		arxiuSortides << "Insercio al vector de cerca binaria completada" << endl;
		arxiuSortides << "Temps d'insercio: " << duration <<endl;
		arxiuSortides << endl;
		

        /////////////////////////////////////
        //omplim trie
        arxiuSortides << "Insercio del trie..." << endl;
        start = clock();

        Trie *t = new Trie();

        for(unsigned int i = 0; i < keys_diccionario.size(); ++i) t->insert(keys_diccionario[i]);

        duration = ( clock() - start ) / (double) CLOCKS_PER_SEC;

        arxiuSortides << "Insercio al trie completada" << endl;
        arxiuSortides << "Temps d'insercio: " << duration <<endl;
        arxiuSortides << endl;

		
		arxiu.close();
		
		
		
		
		
		
		
		arxiuSortides << endl << endl <<
						 " ;---------------------------------------;" <<endl;
		arxiuSortides << " ;          Prueba de contains           ;" <<endl;
		arxiuSortides << " ;---------------------------------------;" <<endl << endl;
		
		//arxiu d'entrada2
		aux2 = "jocdeprobes/" + textos[ii];
		ifstream arxiuTexto(aux2.c_str());//jp2.txt");
		while (arxiuTexto >>buffer) valores_texto.push_back(buffer);
		
		int trobats = 0, fallats = 0;
		
		
		
		//comprvar elements hash
		arxiuSortides << "Comprovacio de hash..." << endl;
		start = clock();
		for (unsigned int i = 0; i < valores_texto.size(); i++) {
			if (hash.getKey(valores_texto[i])) trobats++;
			else fallats++;
		}
		duration = ( clock() - start ) / (double) CLOCKS_PER_SEC;
		
		arxiuSortides << "Comprovacio de hash completada" << endl;
		arxiuSortides << "-------------------------------------------" << endl;
		arxiuSortides << "Temps d'acces: " << duration <<endl;
		arxiuSortides << "Encerts: " << trobats << endl;
		arxiuSortides << "Fallats: " << fallats << endl;
		arxiuSortides << "Comprovacions relitzades totals: " << hash.getComprovacions() << endl;
		arxiuSortides << "-------------------------------------------" << endl;
		arxiuSortides << endl << endl;
		
		

		//BLOOOOOM
		trobats = 0, fallats = 0;
		
		//comprvar elements filtre bloom
		arxiuSortides << "Comprovacio del filtre de bloom..." << endl;
		start = clock();
		trobats = filter.contains(valores_texto.begin(), valores_texto.end());
		fallats = valores_texto.size() - trobats;
		duration = ( clock() - start ) / (double) CLOCKS_PER_SEC;
		
		arxiuSortides << "Comprovacio de bloom completada" << endl;
		arxiuSortides << "-------------------------------------------" << endl;
		arxiuSortides << "Temps d'acces: " << duration <<endl;
		arxiuSortides << "Encerts: " << trobats << endl;
		arxiuSortides << "Fallats: " << fallats << endl;
		arxiuSortides << "Comprovacions relitzades totals: " << filter.comprobaciones(valores_texto.size()) << endl;
		///////////////////
		//HE DE COMPROBAR EL NUMERO DE COMPROBACIONES K HAGO
		/////////////////////////
		arxiuSortides << "-------------------------------------------" << endl;
		arxiuSortides << endl << endl;

        trobats = 0;
        fallats = 0;
        //comprvar elements trie
        arxiuSortides << "Comprovacio de trie..." << endl;
        start = clock();
        for (unsigned int i = 0; i < valores_texto.size(); i++) {
            if (t-> exists(valores_texto[i])) trobats++;
            else fallats++;
        }
        duration = ( clock() - start ) / (double) CLOCKS_PER_SEC;
        
        arxiuSortides << "Comprovacio de trie completada" << endl;
        arxiuSortides << "-------------------------------------------" << endl;
        arxiuSortides << "Temps d'acces: " << duration <<endl;
        arxiuSortides << "Encerts: " << trobats << endl;
        arxiuSortides << "Fallats: " << fallats << endl;
        arxiuSortides << "Comprovacions relitzades totals: " << hash.getComprovacions() << endl;
        arxiuSortides << "-------------------------------------------" << endl;
        arxiuSortides << endl << endl;
		
		
		//reset arxiu entrada2
		arxiuTexto.close();
		
		trobats = 0, fallats = 0;
		
		//comprvar elements cerca binaria
		arxiuSortides << "Comprovacio de cerca binaria..." << endl;
		start = clock();
		for (unsigned int i = 0; i < valores_texto.size(); i++) {
			if (cb.existeix(valores_texto[i])) trobats++;
			else fallats++;
		}

		duration = ( clock() - start ) / (double) CLOCKS_PER_SEC;
		
		arxiuSortides << "Comprovacio de cerca binaria completada" << endl;
		arxiuSortides << "-------------------------------------------" << endl;
		arxiuSortides << "Temps d'acces: " << duration <<endl;
		arxiuSortides << "Encerts: " << trobats << endl;
		arxiuSortides << "Fallats: " << fallats << endl;
		arxiuSortides << "Comprovacions relitzades totals: " << cb.getComprovacions() << endl;
		arxiuSortides << "-------------------------------------------" << endl;
		arxiuSortides << endl;

		cout << "-------------------------------------------" << endl;
		cout << endl;
		cout << "-------------------------------------------" << endl;
	}
    cout << "------------------FIN---------------------" << endl;
}


