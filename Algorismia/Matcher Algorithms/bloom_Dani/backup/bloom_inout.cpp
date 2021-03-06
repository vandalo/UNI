#include "bloom_inout.hpp"

using namespace std;

bloom_inout::bloom_inout(){}

bool bloom_inout::load_word_list(int argc, char* argv[], vector<int>& word_list){
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


//creamos algunos elementos que no estan en el diccionario para 
//comprobar la probabilidad de que nos salga un falso positivo
void bloom_inout::generate_outliers(const vector<string>& word_list, deque<string>& outliers){
   cout << "Generando palabras inexistentes... ";
   for (vector<string>::const_iterator it = word_list.begin(); it != word_list.end(); ++it) {
      if ((*it) != reverse((*it))) {
         outliers.push_back((*it) + reverse((*it)));
         outliers.push_back((*it) + (*it));
         outliers.push_back(reverse((*it)) + (*it) + reverse((*it)));
      }
      string ns = *it;
      for (unsigned int i = 0; i < ns.size(); ++i) {
         if (1 == (i & 0x00)) ns[i] = ~ns[i];
      }
      outliers.push_back(ns);
   }

	static const string rand_str[] = {
		"oD5l", "pccW", "5yHt", "ndaN", "OaJh", "tWPc", "Cr9C", "a9zE",
		"H1wL", "yo1V", "16D7", "f2WR", "0MVQ", "PkKn", "PlVa", "MvzL",
		"9Csl", "JQTv", "IveD", "FDVS", "Q7HE", "QgcF", "Q9Vo", "V8zJ",
		"EJWT", "GuLC", "rM3d", "PJF4", "HXPW", "qKx3", "ztRP", "t4KP",
		"m1zV", "fn12", "B1QP", "Jr4I", "Mf8M", "4jBd", "anGR", "Pipt",
		"QHon", "GNlc", "UeXM", "mVM5", "ABI8", "RhB3", "5h2s", "hOYo",
		"gaId", "DX40", "THMu", "EwlP", "n9Mz", "oC1S", "BfMl", "uCZ1",
		"G2bA", "MOH9", "zZ0O", "PKDO", "3nRU", "Z6ie", "4cso", "LnQO",
		"MJTtT","td3rC","A5JNR","1yL5B","rQnJk","jNKYF","CD0XD","pFLSG",
		"fxO1a","CAjBE","ORk4e","0LERI","R7d0x","Qqd7v","6Kih5","9tTCB",
		"yCg9U","D2Tv7","XpNHn","6zeFQ","BT2cs","WGhKW","zTv6B","TTPFk",
		"XjNVX","pg9yW","4pKiZ","mQUhL","xrXzR","kVRm5","NSyC4","olXm9",
		"UWkYy","8Ys6r","yd4Fl","5L4mB","nP3nH","f0DFb","glnQa","DlXQa",
		"cQdH6","eBmIN","fDj6F","ezLow","C15vu","I2Z2j","BQgzg","eVBid",
		"hn5TO","WZyQN","xXgsE","sL6nK","8DKD8","jcrbp","AcRak","h8N5o",
		"LViwC","ThEKf","O7fd5","oN0Id","OM1m0","4OLiR","VIa8N","bJZFG",
		"9j3rL","SzW0N","7m7pY","mY9bg","k1p3e","3OFm1","r45se","VYwz3",
		"pDjXt","ZcqcJ","npPHx","hA3bw","w7lSO","jEmZL","1x3AZ","FN47G",
		"kThNf","aC4fq","rzDwi","CYRNG","gCeuG","wCVqO","d1R60","bEauW",
		"KeUwW","lIKhO","RfPv3","dK5wE","1X7qu","tRwEn","1c03P","GwHCl",
		"CsJaO","zl4j1","e0aEc","Uskgi","rgTGR","jyR4g","Tt6l4","lRoaw",
		"94ult","qZwBX","eYW8S","Qf6UH","AbV56","N1hJq","JIaVe","8LHEx",
		"DeNbS","30I0a","hm6qw","3jcaO","4WkuA","mQ219","Gb81C","yx4HM",
		"Chlqfi9S1y", "BMwUgVFu2X", "ZmpEGOVrVe", "13ggJxrPkC", "fcJJpyMGjm", "9T00Dv4ZAb",
		"p3YRcP7M2o", "sR0qNUXCHv", "gCxWZbJ6rb", "R4YtzRXXUl", "vwyYz5j6pY", "XPWUvLXhJ7",
		"7PwfnVVb7U", "1f34Q6hOYz", "1EM2abZY61", "0a6Ivi4S0a", "Teq2LrQs2T", "dWXLCgWHc8",
		"LawMv7ujn4", "N8VFgbZQx5", "tfvHHxoDgi", "ImwYgXA2tf", "KkIES9NqZO", "ajcz0qjjda",
		"6Vz28vlGs9", "VMCc5W8cCt", "BiQB8BRJ98", "43CpOJSMpA", "jfBJdqwXcU", "ecHR9EO2ib",
		"LH7CcXyCZ7", "JntqGSgSpa", "0MbTMpZPFW", "5FJSdiCXzR", "5gda2AhA2x", "lrDFc1lnXk",
		"zrEwECHvjs", "B0JldDxFa1", "6DYal4QxKa", "Hsqx6kP2S4", "zZwnALSuFh", "Shh4ISZcKW",
		"P9VDaNSk7Z", "mEI2PLSCO6", "WyTyrQORtu", "IvJyMMRgh3", "Q6pgJq8Nkv", "dhOgR3tDAD",
		"Y9h6bVgbxO", "wA15tiOPTm", "8TaIKf1zCO", "z75dzabHBs", "AS6OPnwoJI", "2DSZka9Auj",
		"QLzUjV2CWs", "KZSN2SVhia", "7ttYKWF2ue", "1Zxfu7B2ST", "RnkpmwjsCi", "YpcSIzaqx5",
		"RDEwFD9gmX", "Nlx3V4Cjw4", "9ZdvITOj8M", "httUPWMNXO", "Ypv9PjxGwa", "LlwyNolNnH",
		"6xpJOht47a", "tbmz4WIdcG", "OwzuVDlb7D", "PBQKJxo8DQ", "uVnMQn7hK6", "rlnZINuDUa",
		"2feyyYukPa", "teOlpKuDBn", "LxBSWh0dL1", "Onyb7r4Jp0", "bZxXE6xOXg", "d9NSvNTunQ",
		"ONerLBic32", "8mar4rKmFk", "5cCN9uwaCg", "ElVrYOHHMv", "YF6Og8DX40", "OgiCwpCQ5a",
		"K6nSRZVxdR", "gqyXXXoVFW", "ulyRYizcBP", "khUx31K5UR", "qZFRzVthju", "pQBh0vnB20",
		"dk8NIN7ajy", "XP7ed1OjZx", "IRYNwA5iFR", "hiSEBhTukC", "Ns4jJ3jzGo", "dYoCSxjIvM",
		"HzGLbl5i1g", "baizENd4ko", "6rCqGBO8t1", "QWGfC8UaA7", "JFhRfxQe4K", "8R4W6IWANz",
		"2TnWf1w7JH", "0z69e0wcoG", "8SN1mRHCY7", "oFGCYHHwGX", "G8xqnBgxjO", "6B3SAOayHt",
		"XRW3ZSG1gw", "WcIjTxMxOM", "wNqCAIaTb2", "gO4em4HW8H", "TgGFSMEtbG", "WiwmbEw3QA",
		"D2xshYUgpu", "xRUZCQVzBs", "nCnUmMgIjE", "p4Ewt1yCJr", "MeOjDcaMY5", "1XelMeXiiI"
	};

	static const unsigned int rand_str_size = sizeof(rand_str) / sizeof(string);

	for (unsigned int i = 0; i < rand_str_size; ++i) {
		string s0 = rand_str[i];
		string s1 = rand_str[(i + 1) % rand_str_size];
		string s2 = rand_str[(i + 2) % rand_str_size];
		string s3 = rand_str[(i + 3) % rand_str_size];
		string s4 = rand_str[(i + 4) % rand_str_size];
		string s5 = rand_str[(i + 5) % rand_str_size];
		string s6 = rand_str[(i + 6) % rand_str_size];

		outliers.push_back(s0);
		outliers.push_back(s0 + s1);
		outliers.push_back(s0 + s2 + s4);
		outliers.push_back(s0 + s1 + s3);
		outliers.push_back(s0 + s1 + s2 + s3 + s4 + s5);
		outliers.push_back(s0 + s1 + s2 + s3 + s4 + s5 + s6);

		outliers.push_back(reverse(s0));
		outliers.push_back(reverse(s0 + s1));
		outliers.push_back(reverse(s0 + s2 + s4));
		outliers.push_back(reverse(s0 + s1 + s3));
		outliers.push_back(reverse(s0 + s1 + s2 + s3 + s4 + s5));
		outliers.push_back(reverse(s0 + s1 + s2 + s3 + s4 + s5 + s6));
	}
	sort(outliers.begin(),outliers.end());
	purify_outliers(word_list,outliers);
	cout << "Fin." << endl;
	}

	//funcion para eliminar los elementos que si que existen en el diccionario
void bloom_inout::purify_outliers(const vector<string>& word_list, deque<string>& outliers) {
	set<string> set1;
	set<string> set2;

	copy(word_list.begin(), word_list.end(),inserter(set1,set1.begin()));
	copy(outliers.begin(), outliers.end(), inserter(set2,set2.begin()));

	deque<string> intersect_list;

	set_intersection(set1.begin(),set1.end(), set2.begin(),set2.end(),
		back_inserter(intersect_list));

	sort(intersect_list.begin(),intersect_list.end());

	if (!intersect_list.empty()) {
		deque<string> new_outliers;
		for (deque<string>::iterator it = outliers.begin(); it != outliers.end(); ++it) {
			if (!binary_search(intersect_list.begin(),intersect_list.end(),*it)) {
				new_outliers.push_back(*it);
			}
		}
		outliers.swap(new_outliers);
	}
}





