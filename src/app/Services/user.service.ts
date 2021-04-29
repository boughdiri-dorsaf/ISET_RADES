import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
export interface User{
email:string;
password:string;
nom:string;
prenom:string;
age:number;
cin:string;
sexe:String;
num_passport:string;
date_naissance:string;
code_postale:string ;
rue:string;
ville:string;
id:number;
gouvernourat:string;
pays:string;
}

@Injectable({
  providedIn: 'root'
})

export class UserService {

  constructor(private http: HttpClient) { }
  RegisterUser(user:User){
    this.http.post('http://localhost:3000/api/v1/user/Add',user).subscribe();
  }

}
