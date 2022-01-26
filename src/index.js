const express = require('express');

const morgan = require('morgan'); 
const exphbs = require('express-handlebars');
const Handlebars = require("handlebars");
const path = require('path');
//inicializar
const app = express();
//setings
app.set('port', process.env.PORT || 3000);
app.set('views',path.join(__dirname, 'views'));
app.engine('.hbs', exphbs({
    defaultLayout: 'main',
    layoutsDir: path.join(app.get('views'), 'layouts'),
    partialsDir: path.join(app.get('views'), 'partials'),
    extname:'.hbs',

    })
);
app.set('view engine', '.hbs');

//mediowares
app.use(morgan('dev'));
app.use(express.urlencoded({extended:false}));
app.use(express.json());

//variables globales
app.use((req,res,next)=>{
    next();
});


//routas
app.use("/", require("./routes/"));

//app.get('/add',(req,res)=>{
    //res.render('add');
//});//

//Publico
app.use(express.static(path.join(__dirname,'public')));
//Starting
app.listen(app.get('port'), () => {
    console.log('Server on port ', app.get('port'))
});