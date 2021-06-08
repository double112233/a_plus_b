#include<iostream>
#include<random>
#include<ctime>
#define int long long
using namespace std;
const int MOD=2e9+1,base=1e9;
inline int rd(){
    int x=1;
    for(int i=0;i<10;i++){
        x=x*rand()%MOD;
    }
    x=(x+MOD)%MOD-base;
    return x;
}
signed main(){
    int t;
    cin>>t;
    srand(t);
    cout<<rd()<<' '<<rd()<<'\n';
}
