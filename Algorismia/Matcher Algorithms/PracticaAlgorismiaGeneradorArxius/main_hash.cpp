//
//  main_hash.cpp
//  
//
//  Created by Ferran coma rosell on 28/12/15.
//
//

#include <iostream>
#include <fstream>
#include <vector>
#include <cstdlib>
#include "Hash.hpp"
using namespace std;



int main() {
    taula_hash taula(5);
    taula.insertKey(25);
    taula.insertKey(13);
    taula.insertKey(3);
    cout<< taula.getKey(3)<<endl;
    cout<< taula.getKey(4)<<endl;
    cout<< taula.getKey(25)<<endl;
}
