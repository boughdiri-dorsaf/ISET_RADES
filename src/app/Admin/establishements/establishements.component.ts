import { UserService } from './../../services/user.service';
import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-establishements',
  templateUrl: './establishements.component.html',
  styleUrls: ['./establishements.component.scss']
})
export class EstablishementsComponent implements OnInit {
  tabestablishement=false;
  formestablishment=true;
  constructor(private US:UserService) { }
  lstestablishment=[];
  ngOnInit() {
    this.US.getUser(Number(localStorage.getItem('id'))).subscribe(val=>{
      console.log(val);
      //@ts-ignore
      this.user=val.data[0];
    })
    this.lstestablishment=[
      {nom:'Master Professionnel Developpement des applications mobiles',date_fin:'2021/05/23',etablissement:'Iset Rades',Seuil_Admission:25},
      {nom:'Master Professionnel Business Intelligence',date_fin:'2021/08/23',etablissement:'Iset Rades',Seuil_Admission:50},
      {nom:'Master Professionnel Business Intelligence',date_fin:'2021/08/23',etablissement:'Iset Rades',Seuil_Admission:50},
      {nom:'Master Professionnel Business Intelligence',date_fin:'2021/08/23',etablissement:'Iset Rades',Seuil_Admission:50},
      {nom:'Master Professionnel Business Intelligence',date_fin:'2021/08/23',etablissement:'Iset Rades',Seuil_Admission:50},
      {nom:'Master Professionnel Business Intelligence',date_fin:'2021/08/23',etablissement:'Iset Rades',Seuil_Admission:50},
      {nom:'Master Professionnel Business Intelligence',date_fin:'2021/08/23',etablissement:'Iset Rades',Seuil_Admission:50},
      {nom:'Master Professionnel Business Intelligence',date_fin:'2021/08/23',etablissement:'Iset Rades',Seuil_Admission:50},
      {nom:'Master Professionnel Business Intelligence',date_fin:'2021/08/23',etablissement:'Iset Rades',Seuil_Admission:50}
    ];
  }

}
