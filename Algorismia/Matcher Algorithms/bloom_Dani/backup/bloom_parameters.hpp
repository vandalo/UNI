#define maxSize 10000000 //10.000.000
#include <algorithm>
#include <cmath>
#include <cstddef>
#include <iterator>
#include <limits>
#include <string>
#include <vector>
using namespace std;

static const size_t bits_per_char = 0x08;    // 8 bits in 1 char(unsigned)
static const unsigned char bit_mask[bits_per_char] = {
	0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80};

class bloom_parameters {
public:
	bloom_parameters(unsigned long long int expected_elements, double false_positive_p, unsigned long long int random_seed);

	//Struct para guardar los parametros optimos
	struct optimos {
		optimos() {}
		unsigned int num_hashes; //la k de la formula
		unsigned long long int table_size; //la m de la formula
	} opt_par;
	
	unsigned long long int min_size, max_size, expected_elements, random_seed;
	unsigned int min_hashes, max_hashes;
	double false_positive_p; //la p de la formula, en este caso la decidimos nosotros
	
protected:
	virtual bool calcular_optimos();
};
	
	
	
	
	

	