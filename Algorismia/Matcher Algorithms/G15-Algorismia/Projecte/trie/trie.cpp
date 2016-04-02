#include "trie.hpp"
using namespace std;


Trie::Trie(){
	head = new node();
	head->isEnd = false;
	head->prefix_count = 0;
}

void Trie::insert(unsigned int word){
	node *current = head;
	current->prefix_count++;
	string numberAsWord = to_string(word);
	for(unsigned int i = 0 ; i < numberAsWord.length(); ++i)
	{
		int digit = (int)numberAsWord[i] - (int)'0';	//extrct first character of word
		if(current->child[digit] == NULL)
			current->child[digit] = new node();

		current->child[digit]->prefix_count++;
		current = current->child[digit];		
	}
	current->isEnd = true;
}

bool Trie::exists(unsigned int word){
	node *current = head;
	string numberAsWord = to_string(word);
	for(unsigned int i = 0 ; i < numberAsWord.length(); ++i)
	{
		int digit = (int)numberAsWord[i] - (int)'0';
		if(current->child[digit] == NULL)
			return false;		//not found
		current = current->child[digit];
	}
	return current->isEnd;
}