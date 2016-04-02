
#include <iostream>
#include <string>
#include "bloom_filter.hpp"
using namespace std;

int main()
{
// expected elements, wanted prob, seed
   bloom_parameters parameters(1000, 0.0001, 0xA5A5A5A5); 

   //Instantiate Bloom Filter
   bloom_filter filter(parameters);
   string str_list[] = { "AbC", "iJk", "XYZ" };
   
   // Insert into Bloom Filter
      // Insert some strings
      for (size_t i = 0; i < (sizeof(str_list) / sizeof(string)); ++i) filter.insert(str_list[i]);

      // Insert some numbers
      for (size_t i = 1000; i < 1011; ++i) filter.insert(i);

   // Query Bloom Filter
      // Query the existence of strings
		for (size_t i = 0; i < (sizeof(str_list) / sizeof(string)); ++i)
			if (filter.contains(str_list[i])) cout << "BF contains: " << str_list[i] << endl;
      

      // Query the existence of numbers
      for (size_t i =1005; i < 1015; ++i) {
         if (filter.contains(i)) cout << "BF contains: " << i << endl;
      }

   return 0;
}
