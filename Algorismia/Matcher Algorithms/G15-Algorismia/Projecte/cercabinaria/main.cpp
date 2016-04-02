#include <iostream>
#include "CercaBinaria.hpp"
using namespace std;



int main(){

	//inicialitzo la classe amb el diccionari emmagatzemat a l'arxiu jp.txt
	CercaBinaria* cb = new CercaBinaria("jp.txt");


	//crido la funcio existeix amb el numero 1, que ens retornara cert si existeix el 1 al diccionari i 0 altrament
	cout << cb->existeix(1) << endl;
}