#include <stdio.h>
#include <stdlib.h>
#include <string>
#include <algorithm>
#include <iostream>
#include "trie.hpp"
#include <ctime>
using namespace std;


int main()
{

	clock_t start;
	Trie *t = new Trie();
	int cont  = 0;
	double duration;

	
	for(int i = 0; i < 300000; ++i) {t-> insert((long long unsigned int) i);}
	start = clock();
	for(int i = 0; i < 300000; ++i) {
		if(t-> exists((long long unsigned int) i)) cont++;
	}
	duration = ( clock() - start ) / (double) CLOCKS_PER_SEC;


	cout << duration << endl;

}