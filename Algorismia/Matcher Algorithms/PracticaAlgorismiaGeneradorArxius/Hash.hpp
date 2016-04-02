//
//  Hash.hpp
//  
//
//  Created by Ferran coma rosell on 28/12/15.
//
//

#ifndef Hash_hpp
#define Hash_hpp
#define maxSize 10000000 //10.000.000

#include <algorithm>
#include <cmath>
#include <cstddef>
#include <iterator>
#include <limits>
#include <string>
#include <vector>
#include <stdio.h>
#include <list>
using namespace std;


class taula_hash {
    
protected:
    vector<list<int> >hash;
    int max_list_size;
    
public:
    //crea una taula de temany Temany
    taula_hash(int temany);
    
    //retorna true si la key estava en el diccionari
    bool getKey(int key);
    
    //afegeix una key al diccionari
    void insertKey(int key);
    
protected:
    //fa el modul amb temany de taula i retorna la posició
    virtual int hash1(int key);
    

};

#endif /* Hash_hpp */