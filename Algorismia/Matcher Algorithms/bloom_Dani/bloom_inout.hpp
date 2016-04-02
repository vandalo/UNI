#include <fstream>
#include <vector>
#include <deque>
#include <set>
#include "bloom_filter.hpp"
using namespace std;

class bloom_inout {

public:
	bloom_inout();
	bool load_word_list(int argc, char* argv[], vector<unsigned int>& word_list);
	
	template <class T, class Allocator, template <class,class> class Container>
	inline bool read_file(const string& file_name, Container<T, Allocator>& c) {
		ifstream stream(file_name.c_str());
		unsigned int buffer;
		while (stream >>buffer) {
			c.push_back(buffer);
		}
		return true;
	}
	
};


