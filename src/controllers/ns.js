const db = require("../database");
//CRUD 1
exports.interfaz = async(req, res) => {
    
    const {cliente, ci_cliente} = req.body;
    const pruebabd = await db.connect();
    console.log(db.connect());
    try {
        
        await pruebabd.query("insert into cliente(NOMBRE_CLIENTE, CI_CLIENTE) VALUES ($1 , $2)", [cliente , ci_cliente]);
        res.json({status:"ok"});

    } catch (error) {
        throw error;
    }
    finally{
        pruebabd.release();
    }
};
//CRUD  INTERFAZ 2
exports.interfaz2 = async(req, res) => {
    
    const {nombre_libro, version, autor, isbn, editorial, num_ejemplares, ver_digital} = req.body;
    const pruebabd = await db.connect();
    console.log(db.connect());
    try {
        
        await pruebabd.query("insert into libro(NOMBRE_LIBRO, VERSION_LIBRO, AUTOR, ISBN, EDITORIAL_LIBRO, NO_EJEMPLARES, VERSION_DIGITAL) VALUES ($1 , $2, $3, $4, $5, $6, $7)", [nombre_libro, version, autor, isbn, editorial, num_ejemplares, ver_digital]);
        res.json({status:"ok"});

    } catch (error) {
        throw error;
    }
    finally{
        pruebabd.release();
    }
};

//TRANSACCION 1
exports.constras1 = async(req, res) => {
    const client= await db.query("select id_cliente as ident, nombre_cliente as nombre from cliente");
    const client2 = await db.query("select bib.id_bibliotecario as ident, bib.apellido_bibliotecario as apellido from bibliotecario bib inner join ano_bibliotecario on bib.id_bibliotecario=ano_bibliotecario.id_bibliotecario where ano_bibliotecario.anos_bibliotecario=\'2019\'");
    const client3= await db.query("select id_ejemplar as ident, codigo_ejemplar as codigo from ejemplar");
if (client.rowCount>0 && client2.rowCount>0 && client3.rowCount>0 ) {
    req.datos =client.rows;
    req.datos2=client2.rows;
    req.datos3 =client3.rows;
            res.render("interfaz3", {
                cliente:req.datos,
                bibliotecario: req.datos2,
                ejemplar:req.datos3,
            });
} else {

}
};
exports.actu1    = async(req, res) => {
    
    const {ejemplar, cliente, bibliotecario, fecha_prestamo, fecha_entrega, costo_prestamo} = req.body;
    const pruebabd = await db.connect();
    console.log(db.connect());
    try {
        await pruebabd.query("begin")
        await pruebabd.query("insert into prestamo (id_ejemplar, id_cliente, id_bibliotecario, fecha_prestamo, fecha_entrega, costo_prestamo) values ($1 , $2, $3, $4, $5, $6)", [ejemplar, cliente, bibliotecario, fecha_prestamo, fecha_entrega, costo_prestamo]);
        const libro = await pruebabd.query("select id_libro as libro from ejemplar where id_ejemplar = $1" ,[ejemplar]);
        await pruebabd.query("update libro set no_ejemplares=no_ejemplares-1 where no_ejemplares>0 and id_libro = $1", [libro.rows[0].libro]);
        await pruebabd.query("commit");
        res.json({status:"ok"});

    } catch (error) {
        await pruebabd.query("rollback");
        throw error;

    }
    finally{
        pruebabd.release();
    }
};

//TRANSACCION 2

exports.constras2 = async(req, res) => {
    const client= await db.query("select cliente.id_cliente as ident, nombre_cliente as nombre from cliente "+ 
    "inner join prestamo pr on cliente.id_cliente=pr.id_cliente "+
    "where penalizacion isNULL ");
if (client.rowCount>0) {
    req.datos =client.rows;
            res.render("interfaz4", {
                cliente:req.datos,
            });
} else {

}
};
exports.actu2 = async(req, res) => {
    
    const {cliente, penalizacion, aspecto_entrega, observaciones} = req.body;
    const pruebabd = await db.connect();
    console.log(db.connect());
    try {
        await pruebabd.query("begin")
        
        const ejemplar = await pruebabd.query("select id_ejemplar from prestamo where id_cliente=$1 and penalizacion is NULL",[cliente]);
        const libro = await pruebabd.query("select id_libro as libro from ejemplar where id_ejemplar = $1",[ejemplar.rows[0].id_ejemplar]);
        await pruebabd.query("update libro set no_ejemplares=no_ejemplares+1 where no_ejemplares>0 and id_libro = $1", [libro.rows[0].libro]);
        await pruebabd.query("update prestamo set penalizacion=$1, apecto_entrega=$2, observaciones=$3 where id_cliente=$4 and penalizacion is NULL", [penalizacion, aspecto_entrega, observaciones, cliente]);
        await pruebabd.query("commit");
        res.json({status:"ok"});

    } catch (error) {
        await pruebabd.query("rollback");
        throw error; 

    }
    finally{
        pruebabd.release();
    }
};
   
