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
gouvernorat_adresse:string;
pays:string;
}

@Injectable({
  providedIn: 'root'
})

export class UserService {

  constructor(private http: HttpClient) { }
  RegisterUser(user:User){
    this.http.post('http://localhost:3000/api/users/signup',user).subscribe();
  }
  authentifierUser(email:string,password:string){
    var user={email:email,password:password}
  return  this.http.post('http://localhost:3000/api/users/login',user)
  }
  getUser(id:number){
    return this.http.get('http://localhost:3000/api/users/'+id);
  }
  resetpasswordUser(email:string){
    var user={email:email}
    return this.http.put('http://localhost:3000/api/users/forgotPassword',user);
  }
  ChangerPassword(user){
    var params={resetLink:user.resetLink,newPassword:user.newPassword}
    return this.http.put('http://localhost:3000/api/users/resetPassword',params);
  }
  emailverif(email){
    var checkpass=new RegExp(/^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/g);
 var   ok=false;
     if(email!=undefined)
     {if(checkpass.test(email))
       {ok= true;}
     }
     return ok;
   }

}
