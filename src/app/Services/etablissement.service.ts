import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
export interface establishment{
  libelle:string;
  code_postale:string;
  rue:string;
  ville:string;
  gouvernorat_adresse:string;
  pays:string;

}
@Injectable({
  providedIn: 'root'
})
export class EtablissementService {

  constructor(private http:HttpClient) { }
  ajouteretablissement(E:establishment){
    return  this.http.post('http://localhost:3000/api/etablissement',E);
  }
  getetablissements(){
    return  this.http.get('http://localhost:3000/api/etablissement');
  }
  getetablissementbyId(id:number){
    return  this.http.get('http://localhost:3000/api/etablissement/'+id);
  }
}
