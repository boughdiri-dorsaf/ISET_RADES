import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
export interface master{
  nom:string,
  id_departement:number,
  seuil_admission:number,
  seuil_admis_attente:number,
  date_fin_master: string,
  id_etablissement:number
}
@Injectable({
  providedIn: 'root'
})
export class MasterService {

  constructor(private http:HttpClient) { }
  ajoutermaster(M:master){
    return  this.http.post('http://localhost:3000/api/master',M);
  }
  getmasters(){
    return this.http.get('http://localhost:3000/api/master');
  }
}
