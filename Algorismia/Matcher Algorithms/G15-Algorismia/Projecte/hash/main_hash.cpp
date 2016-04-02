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
    taula.insertKey(1);
    taula.insertKey(2);
    taula.insertKey(3);
    taula.insertKey(4);
    taula.insertKey(5);
    cout<< taula.getKey(1)<<endl;
    cout<< taula.getKey(2)<<endl;
    cout<< taula.getKey(3)<<endl;
    cout<< taula.getKey(4)<<endl;
    cout<< taula.getKey(5)<<endl;
    cout<< taula.getKey(6)<<endl;
    cout<< taula.getKey(7)<<endl;
    cout<< taula.getKey(8)<<endl;
    cout<< taula.getKey(9)<<endl;
}
