#include "bloom_parameters.hpp"
#include <iostream>
using namespace std;

class bloom_filter {

public:
	bloom_filter(const bloom_parameters& p);

		//FUNCIONES PARA INSERIR Y COMPROBAR EXISTENCIA DE LAS PALABRAS
	inline void insert(unsigned int key_begin) {
		for (unsigned int i = 0; i < numHashes; ++i) 
			bit_table[MurmurHash64A(&key_begin,4, seed_values[i]) % table_size] = 1;
		//++inserted_elements;
	}
	

	template<typename Iterator>
	inline void insert(const Iterator begin, const Iterator end) {
		Iterator itr = begin;
		while (end != itr) insert(*(itr++));
	}
	

	inline virtual bool contains(unsigned int key_begin) const {
		for (unsigned int i = 0; i < numHashes; ++i) 
			if (!(bit_table[MurmurHash64A(&key_begin,4, seed_values[i]) % table_size] == 1)) return false;
		return true;
	}
	
	template<typename InputIterator>
	inline unsigned int contains(const InputIterator begin, const InputIterator end) {
		unsigned int cont = 0;
		InputIterator itr = begin;
		while (end != itr) if(contains(*(itr++))) cont++;
		return cont;
	}
	
	

	inline virtual unsigned long long int size() const {
		return table_size;
	}


protected:
	
	//FUNCIONES DEL ALGORITMO PARA DETERMINAR QUE BITS ESTAN
	//A 1 O A 0 Y PARA SETEAR LOS BITS EN CASO DE INSERT
	//O COMPROBARLOS EN CASO DE CONTAINS
	vector<unsigned int> seed_values;
	bool *bit_table;
	unsigned int numHashes;
	unsigned long long int table_size;
	//unsigned int inserted_elements;
	unsigned long long int random_seed;
	
	void calculate_seeds();
	
	
	inline unsigned int MurmurHash64A ( const void * key, int len, unsigned long int seed ) const{
		const unsigned long long int m = 0xc6a4a7935bd1e995;
		const int r = 47;
		unsigned long long int h = seed ^ (len * m);
		const unsigned long long int * data = (const unsigned long long int *)key;
		const unsigned long long int * end = data + (len/8);

		while(data != end) {
			unsigned long long int k = *data++;
			k *= m; 
			k ^= k >> r; 
			k *= m; 
			h ^= k;
			h *= m; 
		}

		const unsigned char * data2 = (const unsigned char*)data;

		switch(len & 7) {
		case 7: h ^= (unsigned long long int)(data2[6]) << 48;
		case 6: h ^= (unsigned long long int)(data2[5]) << 40;
		case 5: h ^= (unsigned long long int)(data2[4]) << 32;
		case 4: h ^= (unsigned long long int)(data2[3]) << 24;
		case 3: h ^= (unsigned long long int)(data2[2]) << 16;
		case 2: h ^= (unsigned long long int)(data2[1]) << 8;
		case 1: h ^= (unsigned long long int)(data2[0]); h *= m;
		};
		h ^= h >> r; h *= m; h ^= h >> r;
		return h; } 
};
