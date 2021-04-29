let connexion = require("../config/db")
class etudiant{
    //Add User
static adduser(content, cb){
    connexion.query('INSERT INTO `user`(`email`, `password`, `id_role`, `nom`, `prenom`, `age`, `cin`, `sexe`, `num_passport`, `date_naissance`) VALUES '+
    '(?,?,?,?,?,?,?,?,?,?)',
    [
     content.email,
     content.password,
     1,
     content.nom,
     content.prenom,
     content.age,
     content.cin,
     content.sexe,
     content.num_passport,
     content.date_naissance 
    ], (err, res) => {
      if(err) throw err
      cb(res)
      this.addadresse(content,res.insertId,function(){})
      
    })
  }
  static addadresse(content,id_user, cb){
    connexion.query('INSERT INTO `adresse`( `code_postale`, `rue`, `ville`, `gouvernorat_adresse`, `pays`, `id_user`) VALUES '+
    '(?,?,?,?,?,?)',
    [
     content.code_postale,
     content.rue,
     content.ville,
     content.gouvernourat,
     content.pays,
     id_user
    ], (err, res) => {
      if(err) throw err
      cb(res)
      console.log('worked')
    })
  }
//Add User
//Update User
static updateuser(content, cb){
    connexion.query('UPDATE `user` SET `email`=?,`password`=?,`nom`=?,`prenom`=?,`age`=?,`cin`=?,`sexe`=?,`num_passport`=?,`date_naissance`=? WHERE `id_user`=?'
    ,
    [
     content.email,
     content.password,
     content.nom,
     content.prenom,
     content.age,
     content.cin,
     content.sexe,
     content.num_passport,
     content.date_naissance,
     content.id_user 
    ], (err, res) => {
      if(err) throw err
      cb(res)
      this.updateadresse(content,function(){})
      
    })
  }
  static updateadresse(content, cb){
    console.log(content)
    connexion.query('UPDATE `adresse` SET `code_postale`=?,`rue`=?,`ville`=?,`gouvernorat_adresse`=?,`pays`=? WHERE `id_user`=?'
   ,
    [
     content.code_postale,
     content.rue,
     content.ville,
     content.gouvernourat,
     content.pays,
     content.id_user
    ], (err, res) => {
      if(err) throw err
      cb(res)
      console.log('worked')
    })
  }
//Update User
}
/*

{
"email":"",
"password":"",
"nom":"Ahmed",
"prenom":"Bejaoui",
"age":0,
"cin":"",
"sexe":"",
"num_passport":"",
"id_user":1111111119,
"date_naissance":"2020-04-06",
"code_postale":"",
"rue":"",
"ville":"",
"gouvernourat":"",
"pays":""
}
*/
module.exports = etudiant