#include <iostream>
#include <stdlib.h>
#include <algorithm>
#include <vector>
#include <time.h>

using namespace std;

#define UNDEF -1
#define TRUE 1
#define FALSE 0

uint numVars;
uint numClauses;
vector<vector<int> > clauses;
vector<int> model;
vector<int> modelStack;
uint indexOfNextLitToPropagate;
uint decisionLevel;
vector<float> repeticions;
vector<int> dominant;
vector<vector<int> >vecClausesXLiteral;
int voltes;


void readClauses( ){
  // Skip comments
  char c = cin.get();
  while (c == 'c') {
    while (c != '\n') c = cin.get();
    c = cin.get();
  }
  // Read "cnf numVars numClauses"
  string aux;
  cin >> aux >> numVars >> numClauses;
  clauses.resize(numClauses);  
  repeticions.resize(numVars+1,0);
  dominant.resize(numVars+1,0);
  vecClausesXLiteral.resize(numVars+1);
  for(uint i = 0; i < (numVars+1); i++){vecClausesXLiteral[i] = vector<int>();}
  // Read clauses
  for (uint i = 0; i < numClauses; ++i) {
    int lit;
    while (cin >> lit and lit != 0) {
        //cout << "lit:"<<lit<< " ";
        if(lit < 0){repeticions[-lit]++; dominant[-lit]--;vecClausesXLiteral[-lit].push_back(i);}
        else {repeticions[lit]++; dominant[lit]++;vecClausesXLiteral[lit].push_back(i);}
        clauses[i].push_back(lit);
    }
  }    
}



int currentValueInModel(int lit){
  if (lit >= 0) return model[lit];
  else {
    if (model[-lit] == UNDEF) return UNDEF;
    else return 1 - model[-lit];
  }
}


void setLiteralToTrue(int lit){
  modelStack.push_back(lit);
  if (lit > 0) model[lit] = TRUE;
  else model[-lit] = FALSE;
}


bool propagateGivesConflict ( ) {
    int aux, val, numUndefs, lastLitUndef;
  while ( indexOfNextLitToPropagate < modelStack.size() ) {
    ++indexOfNextLitToPropagate;
    for (uint i = 0; i < vecClausesXLiteral[abs(modelStack[indexOfNextLitToPropagate-1])].size() ; ++i) {
      bool someLitTrue = false;
      numUndefs = 0;
      lastLitUndef = 0;
      aux = vecClausesXLiteral[abs(modelStack[indexOfNextLitToPropagate-1])][i];
      for (uint k = 0; not someLitTrue and k < clauses[aux].size(); ++k){
        val = currentValueInModel(clauses[aux][k]);
        if (val == TRUE) someLitTrue = true;
        else if (val == UNDEF){ ++numUndefs; lastLitUndef = clauses[aux][k]; }
      }
      if (not someLitTrue and numUndefs == 0){
          for(uint k = 0; k < clauses[aux].size(); k++){
              repeticions[abs(clauses[aux][k])]+=2;
          }
          return true; // conflict! all lits false
      }
      else if (not someLitTrue and numUndefs == 1) {setLiteralToTrue(lastLitUndef);	repeticions[abs(lastLitUndef)]+=0.4;}
    }    
  }
  return false;
}


void backtrack(){
  uint i = modelStack.size() -1;
  int lit = 0;
  while (modelStack[i] != 0){ // 0 is the DL mark
    lit = modelStack[i];
    model[abs(lit)] = UNDEF;
    modelStack.pop_back();
    --i;
  }
  // at this point, lit is the last decision
  modelStack.pop_back(); // remove the DL mark
  --decisionLevel;
  indexOfNextLitToPropagate = modelStack.size();
  setLiteralToTrue(-lit);  // reverse last decision
}


// Heuristic for finding the next decision literal:
int getNextDecisionLiteral(){
  voltes++;
  if(voltes >= 5000){
      voltes = 0;
      for(int i=1;i<=repeticions.size();i++){
          repeticions[i]-=0.1;
      }
  }
  //for (uint i = 1; i <= numVars; ++i) // stupid heuristic:
  //  if (model[i] == UNDEF) return i;  // returns first UNDEF var, positively
  //return 0; // reurns 0 when all literals are defined
  int max = 0, pos = 0;
  //voltes++;
  for(uint i = 1; i < repeticions.size(); i++){
      if(repeticions[i] > max and model[i] == UNDEF){
          max = repeticions[i];
          pos = i;
      }
  }
  if(dominant[pos]>0)return pos;
  else return -pos;
}


void checkmodel(){
  for (int i = 0; i < numClauses; ++i){
    bool someTrue = false;
    for (int j = 0; not someTrue and j < clauses[i].size(); ++j)
      someTrue = (currentValueInModel(clauses[i][j]) == TRUE);
    if (not someTrue) {
      cout << "Error in model, clause is not satisfied:";
      for (int j = 0; j < clauses[i].size(); ++j) cout << clauses[i][j] << " ";
      cout << endl;
      exit(1);
    }
  }  
}

int main(){ 
  clock_t start = clock();
  readClauses(); // reads numVars, numClauses and clauses
  model.resize(numVars+1,UNDEF);
  indexOfNextLitToPropagate = 0;  
  decisionLevel = 0;
  
  // Take care of initial unit clauses, if any
  for (uint i = 0; i < numClauses; ++i)
    if (clauses[i].size() == 1) {
      int lit = clauses[i][0];
      int val = currentValueInModel(lit);
      if (val == FALSE) {
          cout << "UNSATISFIABLE" << endl;
          cout << "Time is: " << ((double)clock()-start)/CLOCKS_PER_SEC << endl;
          return 10;}
      else if (val == UNDEF) setLiteralToTrue(lit);
    }
  
  // DPLL algorithm
  while (true) {
    while ( propagateGivesConflict() ) {
      if ( decisionLevel == 0) {http://www.cplusplus.com/reference/vector/vector/resize/
          cout << "UNSATISFIABLE" << endl;
          cout << "Time is: " << ((double)clock()-start)/CLOCKS_PER_SEC << endl;
          return 10;
      }
      backtrack();
    }
    int decisionLit = getNextDecisionLiteral();
    if (decisionLit == 0) {
        checkmodel(); cout << "SATISFIABLE" << endl;
        cout << "Time is: " << ((double)clock()-start)/CLOCKS_PER_SEC << endl;
        return 20;
    }
    // start new decision level:
    modelStack.push_back(0);  // push mark indicating new DL
    ++indexOfNextLitToPropagate;
    ++decisionLevel;
    setLiteralToTrue(decisionLit);  // now push decisionLit on top of the mark
  }
  cout << "Time is: " << ((double)clock()-start)/CLOCKS_PER_SEC << endl;
}  
