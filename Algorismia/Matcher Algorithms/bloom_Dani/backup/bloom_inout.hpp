#include <iostream>
#include <fstream>
#include <vector>
#include <deque>
#include <set>
#include "bloom_filter.hpp"
using namespace std;

class bloom_inout {

public:
	bloom_inout();
	bool load_word_list(int argc, char* argv[], vector<string>& word_list);
	
	/*template <class T, class Allocator, template <class,class> class Container>
	inline bool read_file(const string& file_name, Container<T, Allocator>& c) {
		ifstream stream(file_name.c_str());
		string buffer;
		while (getline(stream,buffer)) {
			c.push_back(buffer);
			c.push_back(uppercase(buffer));
		}
		return true;
	}*/
	
	template <class T, class Allocator, template <class,class> class Container>
	inline bool read_file(const string& file_name, Container<T, Allocator>& c) {
		ifstream stream(file_name.c_str());
		string buffer;
		while (getline(stream,buffer)) {
			//c.push_back(buffer);
			c.push_back(uppercase(buffer));
		}
		return true;
	}


	inline string uppercase(string str) {
		for (size_t i = 0; i < str.size(); ++i) {
			str[i] = (char)toupper(str[i]);
		}
		return str;
	}

	inline string reverse(string str) {
		std::reverse(str.begin(),str.end());
		return str;
	}
	
	
	void generate_outliers(const vector<string>& word_list, deque<string>& outliers);
	void purify_outliers(const vector<string>& word_list,deque<string>& outliers);
};


