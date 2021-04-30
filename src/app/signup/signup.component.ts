import { UserService,User } from './../Services/user.service';
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-signup',
  templateUrl: './signup.component.html',
  styleUrls: ['./signup.component.css']
})
export class SignupComponent implements OnInit {
firstphase=false;
secondphase=true;
thirdphase=true;
  constructor(private US:UserService,private route:Router) { }
U:User={
  nom:'', //done
  prenom:'', //done
  email:'',//done
  password:'',//done
  rue:"",//done
  ville:'',//done
  gouvernourat:'',//done
  id:0,
  num_passport:"",//done
  cin:"",//done
  age:0,
  sexe:'Masculin',//done
  date_naissance:"2021-29-04",//done
  code_postale:"",//done
  pays:""//done
}
  ngOnInit(): void {
  }
  errormsg=true;
  msg=''
  email=''
  pwd=''
  FirsttoSecond(){
    if(this.U.email==''){
      this.msg='Veuillez entrer Votre adresse email';
      this.errormsg=false;
      setTimeout(()=>{this.errormsg=true},6000);
      return;
    }
    if(this.email==''){
      this.msg='Veuillez Confirmer Votre adresse email';
      this.errormsg=false;
      setTimeout(()=>{this.errormsg=true},6000);
      return;
    }
    if(this.email!=this.U.email){
      this.msg='Adresse email Erroné';
      this.errormsg=false;
      setTimeout(()=>{this.errormsg=true},6000);
      return;
    }
    if(this.U.password==''){
      this.msg='Veuillez entrer Votre Mot de passe';
      this.errormsg=false;
      setTimeout(()=>{this.errormsg=true},6000);
      return;
    }
    if(this.pwd==''){
      this.msg='Veuillez Confirmer Votre Mot de passe';
      this.errormsg=false;
      setTimeout(()=>{this.errormsg=true},6000);
      return;
    }
    if(this.pwd!=this.U.password){
      this.msg='Mot de passe Erroné';
      this.errormsg=false;
      setTimeout(()=>{this.errormsg=true},6000);
      return;
    }
    this.firstphase=true;
    this.secondphase=false;
  }
  SecondtoFirst(){
    
      this.firstphase=false;
      this.secondphase=true;
    
  }
 
   Register(){
    if(this.U.nom==''){
      this.msg='Veuillez entrer Votre Nom';
      this.errormsg=false;
      setTimeout(()=>{this.errormsg=true},6000);
      return;
    }
    if(this.U.prenom==''){
      this.msg='Veuillez entrer Votre Prenom';
      this.errormsg=false;
      setTimeout(()=>{this.errormsg=true},6000);
      return;
    }
    if(this.U.cin.length!=8){
      this.msg='Numéro cin invalide';
      this.errormsg=false;
      setTimeout(()=>{this.errormsg=true},6000);
      return;
    }
    if(this.U.date_naissance==null){
      this.msg='Veuillez entrer Votre Date Naissance';
      this.errormsg=false;
      setTimeout(()=>{this.errormsg=true},6000);
      return;
    }
   
    if(this.U.rue==''){
      this.msg='Veuillez Introduire Votre Rue ';
      this.errormsg=false;
      setTimeout(()=>{this.errormsg=true},6000);
      return;
    }
    if(this.U.ville==''){
      this.msg='Veuillez entrer Votre Ville';
      this.errormsg=false;
      setTimeout(()=>{this.errormsg=true},6000);
      return;
    }
    if(this.U.code_postale==''){
      this.msg='Veuillez entrer Votre Prenom';
      this.errormsg=false;
      setTimeout(()=>{this.errormsg=true},6000);
      return;
    }
    if(this.U.gouvernourat==''){
      this.msg='Veuillez entrer le Gouvernorat';
      this.errormsg=false;
      setTimeout(()=>{this.errormsg=true},6000);
      return;
    }
    if(this.U.pays==''){
      this.msg='Veuillez entrer Votre Pays';
      this.errormsg=false;
      setTimeout(()=>{this.errormsg=true},6000);
      return;
    }
    this.US.RegisterUser(this.U);
    this.route.navigateByUrl('login');
   
   }
}
