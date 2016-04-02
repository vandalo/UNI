#include <iostream>
#include <vector>
#include <algorithm>
#include <fstream>
using namespace std;



class CercaBinaria {

	private:
		vector<unsigned int> diccionari;
        unsigned long long int num_comprovacions;
		int binary_search(const vector<unsigned int>& v, int x, int esq, int dre);

	public:

		CercaBinaria(const vector<unsigned int>& v);
        unsigned long long int getComprovacions();
		bool existeix(int num);

};