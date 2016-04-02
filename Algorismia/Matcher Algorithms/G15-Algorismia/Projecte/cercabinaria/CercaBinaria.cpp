#include "CercaBinaria.hpp"


int CercaBinaria::binary_search(const vector<unsigned int>& v, int x, int esq, int dre){
    this->num_comprovacions++;
	if(esq > dre) return -1;

	int mid = (esq+dre) / 2;

	if(v[mid] == (unsigned int)x) return mid;
	else if(v[mid] < (unsigned int)x) return binary_search(v,x,mid+1, dre);
	else return binary_search(v,x,esq,mid-1);
}

CercaBinaria::CercaBinaria(const vector<unsigned int>& v){
    this->num_comprovacions = 0;
    diccionari = v;
	sort(diccionari.begin(), diccionari.end());
}

bool CercaBinaria::existeix(int n){
	return binary_search(this->diccionari, n, 0, (this->diccionari).size()) != -1;

}

unsigned long long int CercaBinaria::getComprovacions(){
    return this->num_comprovacions;
}