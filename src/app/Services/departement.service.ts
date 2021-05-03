import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
export interface departement{
  code:string;
  libelle:string;
  description:string;
}
@Injectable({
  providedIn: 'root'
})
export class DepartementService {

  constructor(private http:HttpClient) { }
  ajouterDepartement(D:departement){
    return  this.http.post('http://localhost:3000/api/departement',D);
  }
  getDepartements(){
    return  this.http.get('http://localhost:3000/api/departement');
  }
  getDepartementbyId(id:number){
    return  this.http.get('http://localhost:3000/api/departement/'+id);
  }
  UpdateDepartement(D:departement){
    return  this.http.patch('http://localhost:3000/api/departement',D);
  }
  DeleteDepartementbyId(id:number){
    return  this.http.delete('http://localhost:3000/api/departement/'+id);
  }
}
