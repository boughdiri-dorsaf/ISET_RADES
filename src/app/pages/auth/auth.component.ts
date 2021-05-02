import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { PopupComponent } from './../../popup/popup.component';
import  swal  from 'sweetalert';
import { Router } from '@angular/router';
import { UserService } from './../../services/user.service';
import { Component, OnInit } from '@angular/core';

interface Alert {
  type: string;
  message: string;
}
@Component({
  selector: 'app-auth',
  templateUrl: './auth.component.html',
  styleUrls: ['./auth.component.scss']
})

export class AuthComponent implements OnInit {
email='';
password=''
alerts=[];
  constructor(private US:UserService,private route:Router,private modalService: NgbModal) { }

  ngOnInit() {
  }
  Login(){
 if(!this.US.emailverif(this.email)){
   var alert={
    type: 'danger',
      message: 'This is an success alert'
  };
     this.alerts.push({
      type: 'danger',
        message: 'Cette Email est Invalide'
    })
    var i = this.alerts.indexOf(alert);
    setTimeout(()=>{
      this.alerts.splice(i,1);
    },3000);
    return;
 }
    this.US.authentifierUser(this.email,this.password).subscribe(val=>{
      console.log(val)
      //@ts-ignore
      if(val.success==1){
        //@ts-ignore
       localStorage.setItem('token',val.token)
        //@ts-ignore
       localStorage.setItem('id',val.id_user)
      this.route.navigateByUrl('dashboard');
      }
      else{
        var alert={
          type: 'danger',
            message: 'Email/Mot de passe erroné'
        };
           this.alerts.push({
            type: 'danger',
              message: 'Email/Mot de passe erroné'
          })
          var i = this.alerts.indexOf(alert);
          setTimeout(()=>{
            this.alerts.splice(i,1);
          },3000);
          return;
      }
    });
  }
  open() {
    const modalRef = this.modalService.open(PopupComponent);
    modalRef.componentInstance.name = 'Hanen';
  }
  closealert(alert: Alert) {
    this.alerts.splice(this.alerts.indexOf(alert), 1);
  }
resetpassword(){
  swal(
    "Veuillez Introduire votre Adresse Email", {
     
    content: "input",
    title:'Renitialisation Mot de passe'
  }
  )
  .then((value) => {
   if(!this.US.emailverif(value)){
    swal("Erreur", "Email Invalide","error").then(()=>{
      this.resetpassword();
    });
    return
   }
       this.US.resetpasswordUser(value).subscribe((val)=>{
         console.log(val);
         //@ts-ignore
         if(val.success==0){
          swal("Email", "Cette Adresse email n'existe pas","error");
          return
         }
         swal("Email", "Lien de renitialisation envoyé avec succée","success");
       });
      
  });
}
}
