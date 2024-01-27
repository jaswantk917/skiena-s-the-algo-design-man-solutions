#include <algorithm>
#include <cmath>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <deque>
#include <fstream>
#include <iostream>
#include <list>
#include <map>
#include <queue>
#include <random>
#include <set>
#include <stack>
#include <string>
#include <unordered_set>
#include <utility>
#include <vector>

#define F first
#define S second
#define PB push_back
#define MP make_pair

typedef long long ll;

using namespace std;

int divide(int div, int D) {
    int ans = 0;
    int curr = 0;

    if (D == 0) {
        cout << "error: division by ";
        return -0;
    }

    string curs = to_string(D);
    for (auto d : curs) {
        string empt = "";
        empt.append(1, d);
        curr = curr * 10 + stoi(empt);
        if (curr >= div) {
            int temp = 0;
            while (curr >= div) {
                curr = curr - div;
                temp++;
            }
            ans = ans * 10 + temp;
        } else {
            ans = ans * 10;
        }
    }
    return ans;
}

int main() {

    int D;
    cout << "Enter first number" << endl;
    cin >> D;
    int d;
    cout << "Enter another number" << endl;
    cin >> d;
    cout << "Result: " << divide(d, D) << endl;
    return 0;
}