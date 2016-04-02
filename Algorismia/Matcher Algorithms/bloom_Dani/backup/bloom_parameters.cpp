#define maxSize 10000000
#include "bloom_parameters.hpp"
using namespace std;

bloom_parameters::bloom_parameters(unsigned long long int elements_num, 
		double p, unsigned long long int seed): min_size(1),
     max_size(numeric_limits<unsigned long long int>::max()),
     expected_elements(elements_num), random_seed(seed),
     min_hashes(1), max_hashes(maxSize),
     false_positive_p(p) {
		 calcular_optimos();
	}


     //aqui hacemos el calculo de los parametros optimos
     //gracias a las formulas vistas, para saber,
     //la K optima (numero de funciones hash,
//      y la m optima (numero de bits de cada tabla
bool bloom_parameters::calcular_optimos(){
		double min_m = numeric_limits<double>::infinity(), min_k = 0.0,
		curr_m = 0.0, k = 1.0;
		double num, denom;
		while (k < 1000.0) {
			num  = (-k * expected_elements);
			denom = log(1.0 - pow(false_positive_p, 1.0 / k));
			curr_m = num / denom;
			if (curr_m < min_m)  {
				min_m = curr_m;
				min_k = k;
			}
			k += 1.0;
		}
		
		//guardamos los parametros optimos
		opt_par.num_hashes = (unsigned int)min_k;
		opt_par.table_size = (unsigned long long int)min_m;
		opt_par.table_size += (((opt_par.table_size % bits_per_char) != 0) 
				? (bits_per_char - (opt_par.table_size % bits_per_char)) : 0);

		//si el num de hashes esta fuera de los limites lo corregimos
		if (opt_par.num_hashes < min_hashes) opt_par.num_hashes = min_hashes;
		else if (opt_par.num_hashes > max_hashes) opt_par.num_hashes = max_hashes;

		//lo mismo con el tamano de la tabla
		if (opt_par.table_size < min_size) opt_par.table_size = min_size;
		else if (opt_par.table_size > max_size) opt_par.table_size = max_size;

		return true;
}






