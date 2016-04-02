#include "bloom_inout.hpp"

using namespace std;

bloom_inout::bloom_inout(){}

bool bloom_inout::load_word_list(int argc, char* argv[], vector<unsigned int>& word_list){
   static const string wl_list[] = { "word-list.txt",
		"word-list-large.txt",
		"random-list.txt" ,
		"numbers.txt" };

   size_t index = 0;

   if (argc == 2) index = atoi(argv[1]);

   cout << "Cargando palabras " << wl_list[index] << "...";
   if (!read_file(wl_list[index],word_list)) return false;
   cout << " Fin." << endl;
   return true;
}





