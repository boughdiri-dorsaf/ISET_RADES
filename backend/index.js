const app = require('express')();
let bodyParser = require('body-parser')

const versionApi = '/api/v1';

app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());


//get all messages 
app.get(`${versionApi}/messages`, (req, res) => {
    let Message = require('./models/message')
        Message.all(function(messages){
            res.json({messages: messages})
        })
})

//get message par id 
app.get(`${versionApi}/message/:id`, (req, res) => {
    let message = require('./models/message')

    message.find(req.params.id, function(message){
        res.json({message: message})
    })
})

//post messagethe
app.post(`${versionApi}/messages`, (req, res) => {
    if(req.body.message === undefined || req.body.message === ''){
        res.json("Vous n'avez pas entré de message :( ")
    }else{
        let Message = require('./models/message')
        Message.create(req.body.message, function(){
            res.json({index: req.body.message.length,data: req.body.message})
        })
    }
})

//put message par id 
app.put(`${versionApi}/message/:id`, (req, res) => {
    if(req.body.message === undefined || req.body.message === ''){
        res.json("Vous n'avez pas entré de message :( ")
    }else{
        let Message = require('./models/message')
        Message.update(req.body.message, req.params.id, function(){
            res.json({index: req.body.message.length,data: req.body.message})
        })
    }
})
//add user
app.post(`${versionApi}/user/Add`, (req, res) => {
    if(req.body === undefined || req.body.message === ''){
        res.json("Error, pas de données")
    }else{
        let user = require('./models/user')
        user.adduser(req.body, function(result){
           console.log(result);
           result.insertId
           res.json({index:req.body,second:"1"});
          
           
        })
    }
})
//modify user
app.put(`${versionApi}/user/Modify`, (req, res) => {
    if(req.body === undefined || req.body.message === ''){
        res.json("Error, pas de données")
    }else{
        let user = require('./models/user')
        user.updateuser(req.body, function(result){
           console.log(result);
           result.insertId
           res.json({index:req.body,second:"1"});
          
           
        })
    }
})
//delete message par id 
app.delete(`${versionApi}/message/:id`, (req, res) => {
    let message = require('./models/message')

    message.delete(req.params.id, function(message){
        res.json({message: "message supprimer avec success !"})
    })
})



app.listen(3000, () => console.log("connexion etablie !"));