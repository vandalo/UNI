//
//  Hash.cpp
//  
//
//  Created by Ferran coma rosell on 28/12/15.
//
//

#include "Hash.hpp"

taula_hash::taula_hash(int temany){
    this->hash.resize(temany);
    this->num_comprovacions = 0;
}

int taula_hash::hash1(int key){
    return key%this->hash.size();
}

int taula_hash::getComprovacions(){
    return this->num_comprovacions;
}

bool taula_hash::getKey(int key){
    int pos = hash1(key);
    bool trobat = false;
    for (list<int>::iterator it = this->hash[pos].begin(); it != this->hash[pos].end() && !trobat; it++) {
        trobat = *it == key;
        this->num_comprovacions++;
    }
    return trobat;
}

void taula_hash::insertKey(int key){
    int pos = hash1(key);
    this->hash[pos].push_back(key);
}

