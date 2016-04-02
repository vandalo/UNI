#include <string>

class Trie {
	

	private:
		struct node
		{
			int prefix_count;
			bool isEnd;
			struct node *child[10];
		} *head;


	public:
		Trie();
		void insert(unsigned int word);
		bool exists(unsigned int word);


};