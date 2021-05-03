import { UserService } from './../../services/user.service';
import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-department',
  templateUrl: './department.component.html',
  styleUrls: ['./department.component.scss']
})
export class DepartmentComponent implements OnInit {
  tabdepartment=false;
  formdepartment=true;
  constructor(private US:UserService) { }
  lstdepartment=[];
  ngOnInit() {
    this.US.getUser(Number(localStorage.getItem('id'))).subscribe(val=>{
      console.log(val);
      //@ts-ignore
      this.user=val.data[0];
    })
    this.lstdepartment=[
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
