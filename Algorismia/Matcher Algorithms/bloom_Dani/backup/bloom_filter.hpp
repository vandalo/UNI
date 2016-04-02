#include "bloom_parameters.hpp"
using namespace std;

class bloom_filter {
protected:

	typedef unsigned int bloom_type;
	typedef unsigned char cell_type;

public:
	bloom_filter(const bloom_parameters& p);


	virtual ~bloom_filter() {
		delete[] bit_table_;
	}


	
		////////////
		//FUNCIONES PARA INSERIR Y COMPROBAR EXISTENCIA DE LAS PALABRAS
	inline void insert(const unsigned char* key_begin, const unsigned int& length) {
		unsigned int bit_index = 0;
		unsigned int bit = 0;
		for (unsigned int i = 0; i < hash_vec.size(); ++i) {
			compute_indices(hash_ap(key_begin,length,hash_vec[i]),bit_index,bit);
			bit_table_[bit_index / bits_per_char] |= bit_mask[bit];
		}
		++inserted_elements;
	}

	
	template<typename T>
	inline void insert(const T& t) {
		insert((const unsigned char*)&t,sizeof(T));
	}


	template<typename InputIterator>
	inline void insert(const InputIterator begin, const InputIterator end) {
		InputIterator itr = begin;
		while (end != itr) {
			insert(*(itr++));
		}
	}
	

	inline virtual bool contains(const unsigned char* key_begin, const unsigned int length) const {
		unsigned int bit_index = 0;
		unsigned int bit = 0;
		for (unsigned int i = 0; i < hash_vec.size(); ++i) {
			compute_indices(hash_ap(key_begin,length,hash_vec[i]),bit_index,bit);
			if ((bit_table_[bit_index / bits_per_char] & bit_mask[bit]) != bit_mask[bit]) {
				return false;
			}
		}
		return true;
	}

	
	template<typename T>
	inline bool contains(const T& t) const {
		return contains(reinterpret_cast<const unsigned char*>(&t),static_cast<unsigned int>(sizeof(T)));
	}

	
	inline void insert(const string& key) {
		insert((const unsigned char*)key.c_str(),key.size());
	}

	inline void insert(const char* data, const size_t& length) {
      insert((const unsigned char*)data,length);
	}
   
	inline bool contains(const string& key) const {
		return contains((const unsigned char*)key.c_str(),key.size());
	}

   inline bool contains(const char* data, const size_t& length) const {
		return contains((const unsigned char*)data,length);
	}
   
//////////////
	
	

	inline virtual unsigned long long int size() const {
		return table_size_;
	}


protected:
	
	//FUNCIONES DEL ALGORITMO PARA DETERMINAR QUE BITS ESTAN
	//A 1 O A 0 Y PARA SETEAR LOS BITS EN CASO DE INSERT
	//O COMPROBARLOS EN CASO DE CONTAINS
	inline virtual void compute_indices(const bloom_type& hash, unsigned int& bit_index, unsigned int& bit) const {
		bit_index = hash % table_size_;
		bit = bit_index % bits_per_char;
	}

	void generate_unique_salt(); 
	

	inline bloom_type hash_ap(const unsigned char* begin, unsigned int remaining_length, bloom_type hash) const {
		const unsigned char* itr = begin;
		unsigned int loop = 0;
		while (remaining_length >= 8) {
			const unsigned int& i1 = *((const unsigned int*)itr); itr += sizeof(unsigned int);
			const unsigned int& i2 = *((const unsigned int*)itr); itr += sizeof(unsigned int);
			hash ^= (hash <<  7) ^  i1 * (hash >> 3) ^ (~((hash << 11) + (i2 ^ (hash >> 5))));
			remaining_length -= 8;
		}
		if (remaining_length) {
			if (remaining_length >= 4)  {
				const unsigned int& i = *((const unsigned int*)itr);
				if (loop & 0x01) hash ^=    (hash <<  7) ^  i * (hash >> 3);
				else hash ^= (~((hash << 11) + (i ^ (hash >> 5))));
				++loop;
				remaining_length -= 4;
				itr += sizeof(unsigned int);
			}
			if (remaining_length >= 2) {
				const unsigned short& i = *((const unsigned short*)itr);
				if (loop & 0x01) hash ^=    (hash <<  7) ^  i * (hash >> 3);
				else hash ^= (~((hash << 11) + (i ^ (hash >> 5))));
				++loop;
				remaining_length -= 2;
				itr += sizeof(unsigned short);
			}
			if (remaining_length) {
				hash += ((*itr) ^ (hash * 0xA5A5A5A5)) + loop;
			}
		}
		return hash;
	}
	
	vector<bloom_type> hash_vec;
	unsigned char*          bit_table_;
	unsigned int            numHashes;
	unsigned long long int  table_size_;
	unsigned long long int  raw_table_size_;
	unsigned int            inserted_elements;
	unsigned long long int  random_seed;
	double                  falsepp;
};


//return pow(1.0 - exp(-1.0 * salt_.size() * inserted_elements / size()), 1.0 * salt_.size());
//reinterpret_cast<const unsigned int*>(itr)