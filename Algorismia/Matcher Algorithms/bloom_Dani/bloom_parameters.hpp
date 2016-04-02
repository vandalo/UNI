#define maxSize 10000000 //10.000.000
#include <algorithm>
#include <cmath>
#include <cstddef>
#include <iterator>
#include <limits>
#include <string>
#include <vector>
using namespace std;

class bloom_parameters {
public:
	bloom_parameters(unsigned long long int expected_elements, double false_positive_p, unsigned long long int random_seed);

	//Struct para guardar los parametros optimos
	struct optimos {
		optimos() {}
		unsigned int num_hashes; //la k de la formula
		unsigned long long int table_size; //la m de la formula
	} optimos;
	
	unsigned long long int min_size, max_size, expected_elements, random_seed;
	unsigned int min_hashes, max_hashes;
	double false_positive_p; //la p de la formula, en este caso la decidimos nosotros
	
protected:
	virtual bool calcular_optimos();
};
	
	
	
	
	

	