//
// Created by andre on 02/12/2024.
//
#include <fstream>
#include <iostream>
#include <vector>

bool isSafe(std::vector<std::string> &v, int previous , bool croissant, bool decroissant, int index,
            bool &unsafe);

std::vector<std::string> split(std::string s, std::string delimiter) {
    size_t pos_start = 0, pos_end, delim_len = delimiter.length();
    std::string token;
    std::vector<std::string> res;

    while ((pos_end = s.find(delimiter, pos_start)) != std::string::npos) {
        token = s.substr (pos_start, pos_end - pos_start);
        pos_start = pos_end + delim_len;
        res.push_back (token);
    }

    res.push_back (s.substr (pos_start));
    return res;
}
int calculateDif(int a, int b){
    if(a > b){
        return a - b;
    }
    return b - a;
}



int main(){
    std::ifstream myfile (R"(C:\Users\andre\OneDrive\Documents\devoir\fac\MPRO\m1\cplusplus\81.txt)");
    std::string myline;
    int count = 0;
    bool unsafe = false;
    bool saved = false;
    int bonus = 0;
    if ( myfile.is_open() ) {
        while ( myfile ) {
            std::getline (myfile, myline);
            std::vector<std::string> v = split (myline, " ");
            int previous = -1;
            bool croissant = false;
            bool decroissant = false;
            unsafe = false;
            int index = 0;
            unsafe = !isSafe(v, previous, croissant, decroissant, index, unsafe);
            if(unsafe){
                saved = false;
                for(int i = 0; i < v.size(); i++){
                    std::vector<std::string> copy;
                    for(int j = 0; j < v.size(); j++){
                        if(j != i){
                            copy.push_back(v.at(j));
                        }
                    }
                    std::cout<<"try ";
                    if(isSafe(copy,-1,false,false,0,unsafe)){
                        saved = true;
                    }
                    copy.clear();
                }
                if(saved){
                    bonus++;
                }
            }
            std::string safety = "not safe ";
            if(!unsafe){
                count++;
                safety = "safe ";
            }
            std::cout<<safety<<std::endl;
        }
    }
    if(!unsafe){
        count--;
    }
    if(saved){
        bonus--;
    }
    std::cout << count << std::endl;
    std::cout <<  bonus <<std::endl;
    std::cout << bonus + count << std::endl;
    return 0;
}

bool isSafe(std::vector<std::string> &v, int previous, bool croissant, bool decroissant, int index,
            bool &unsafe) {
    bool unsafe2 = false;
    decroissant = false;
    croissant = false;
    previous = -1;
    for (const std::string& str : v){
        std::cout<<str<<" ";
        int i = std::stoi(str);

        if(previous != -1){
            if(calculateDif(i, previous) > 3){
                unsafe = true;
                unsafe2 = true;
            }
            if(i < previous){
                decroissant = true;
            }
            else if(i > previous){
                croissant = true;
            }else{
                unsafe = true;
                unsafe2 = true;
            }
            if(croissant & decroissant){
                unsafe = true;
                unsafe2 = true;
            }
        }
        previous = i;
        index++;

    }
    std::string safety = "not safe ";
    if(!unsafe2){
        safety = "safe ";
    }
    std::cout<<safety<<std::endl;
    return !unsafe2;
}
