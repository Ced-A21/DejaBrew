#include <iostream>
#include <string>
#include <cstdio>
#include <limits>
#include <list>

using namespace std;

int main()
{
    const string password = "Doomsday";
    string input;

    do{
        cout<< "Enter your password: "<<endl;
        cin>>input;
        if (input != password){
            cout<< "Wrong answer bitch"<<endl;
        }
        else{
            cout<<"Welcome Sir."<<endl;
            break;
        }

    }
    while (input != password);

    cout << "Testing";


    return 0;
}