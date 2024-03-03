var R = require("r-integration");
const { appendFileSync } =require ("fs");
const fs = require('fs');
const bodyParser = require('body-parser');
const express = require('express');
const { time } = require("console");
const app = express();
app.use(bodyParser.urlencoded({ extended: false }));

// Parse application/json
app.use(bodyParser.json());

app.use(express.static('public'));
app.set('view engine','ejs');
app.get('/',(req,res)=>{

    res.render("home.ejs",{page:"home"});
})


app.get('/age',(req,res)=>{
    R.executeRScript("./scripts/age.R");
    res.render("home.ejs",{page:"age"});
})

app.get('/death',(req,res)=>{

    R.executeRScript("./scripts/death.R");
    res.render("home.ejs",{page:"death"});
})
app.get('/ageVsEjection',(req,res)=>{

  R.executeRScript("./scripts/ageVsEjec.R");
  res.render("home.ejs",{page:"ageVsEjec"});
})

app.get('/adddata',(req,res)=>{

  // R.executeRScript("./scripts/ageVsEjec.R");
  res.render("home.ejs",{page:"adddata"});
})
app.post('/adddata',(req,res)=>{
console.log(req.body)
data=req.body;
  const csv = `${data.age},${data.anaemia},${data.creatinine_phosphokinase},${data.diabetes},${data.ejection_fraction},${data.high_blood_pressure},${data.platelets},${data.serum_creatinine},${data.serum_sodium},${data.sex},${data.smoking},${data.time},${data.Death_Event}\n`;
    try {
      appendFileSync("./data.csv", csv);
    } catch (err) {
      console.error(err);
    }
  res.render("home.ejs",{page:"adddata"});
})
app.get('/PlateletsVSSerum',(req,res)=>{

  R.executeRScript("./scripts/PlateletsVsSerum.R");
  res.render("home.ejs",{page:"PateletsVsSerum"});
})
app.get('/binomial',(req,res)=>{

  let Result= R.executeRScript("./scripts/binomial.R");
  res.render("home.ejs",{page:"binomial",x:Result[1],n:Result[2],p:Result[3],pp:Result[4]});
})


app.get('/confidence',(req,res)=>{

  let result = R.callMethod("./scripts/confidence.R", "x",{d:"1"});

  res.render("home.ejs",{page:"confidence",data:result});
})

app.get('/prediction',(req,res)=>{
  res.render("home.ejs",{page:"prediction",p:-1});
})

app.post('/prediction',(req,res)=>{
  data=(req.body)
  
  let age=data.age;
  let time=data.time;
  let ejection_fraction=data.ejection_fraction;
  let serum_creatinine=data.serum_creatinine;

let result = R.callMethod("./scripts/prediction.R", "x", {a:`${age}`,t:`${time}`,ef:`${ejection_fraction}`,sc:`${serum_creatinine}`});
 
res.render("home.ejs",{page:"prediction",p:result[2]});
})


app.get("/summary",(req,res)=>{

R.executeRScript("./scripts/summary.R");

 

  fs.readFile('a1.json', 'utf8', (err, data) => {
    if (err) {
      console.error(err);
      return;
    }
  
    const summary = JSON.parse(data);
    
    for(h in summary){
      summary.h=(JSON.parse(summary[h][0]))
    }

    a=JSON.parse(summary.a).table_data;
    sc=JSON.parse(summary.sc).table_data;
    ss=JSON.parse(summary.ss).table_data;
    ef=JSON.parse(summary.ef).table_data;
    p=JSON.parse(summary.p).table_data;
    cp=JSON.parse(summary.cp).table_data;
    
    res.render("home.ejs",{page:"summary",a,sc,ss,ef,p,cp});

   
  });

})


const PORT = process.env.PORT || 3000;
app.listen(PORT,err => console.log("Listeining "+PORT+" Port"))