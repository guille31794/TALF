#include <iostream>
#include <vector>
#include <map>
#include <utility>
using namespace std;
int main()
{
  int a[] = {3, 4, 5, 6, 7};
  //vector<int> vInt(a,a+5);
  map<string, vector<int> >table;
  table.insert(make_pair(string("pilila"), vector<int>(a, a+5)));
  map<string, vector<int> >::iterator ite = table.find("pilila");
  ite->second.push_back(1);
  ite->second.push_back(2);
  for(map<string, vector<int> >::iterator i = table.begin(); i != table.end(); ++i)
  {
    cout << i -> first << " ";
    for (vector<int>::iterator it = i -> second.begin(); it != i -> second.end(); ++it)
    {
      cout << *it << " ";
    }
  }
  cout << endl;
  return 0;
}
