-- -----------------------------------------------------
-- Schema minimarket
-- -----------------------------------------------------

CREATE SCHEMA IF NOT EXISTS `minimarket` ;
USE `minimarket` ;

-- -----------------------------------------------------
-- Table `minimarket`.`tipoproducto`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `minimarket`.`tipoproducto` (
  `idtipoProducto` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idtipoProducto`));

-- -----------------------------------------------------
-- Table `minimarket`.`Proveedor`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `minimarket`.`Proveedor` (
  `idProveedor` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(60) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `numeroTelefono` INT NOT NULL,
  PRIMARY KEY (`idProveedor`));

-- -----------------------------------------------------
-- Table `minimarket`.`Producto`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `minimarket`.`Producto` (
  `idProcto` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(45) NULL DEFAULT NULL,
  `stock` INT NOT NULL,
  `precio` INT NOT NULL,
  `tipoproducto_idtipoProducto` INT NOT NULL,
  `Proveedor_idProveedor` INT NOT NULL,
  PRIMARY KEY (`idProcto`),
  INDEX `fk_Producto_tipoproducto_idx` (`tipoproducto_idtipoProducto` ASC) VISIBLE,
  INDEX `fk_Producto_Proveedor1_idx` (`Proveedor_idProveedor` ASC) VISIBLE,
  CONSTRAINT `fk_Producto_tipoproducto`
    FOREIGN KEY (`tipoproducto_idtipoProducto`)
    REFERENCES `minimarket`.`tipoproducto` (`idtipoProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Producto_Proveedor1`
    FOREIGN KEY (`Proveedor_idProveedor`)
    REFERENCES `minimarket`.`Proveedor` (`idProveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table `minimarket`.`Boleta`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `minimarket`.`Boleta` (
  `idBoleta` INT NOT NULL AUTO_INCREMENT,
  `numeroCompra` INT NOT NULL,
  `descripcion` VARCHAR(45) NULL,
  `fechaCompra` DATETIME NOT NULL,
  PRIMARY KEY (`idBoleta`));


-- -----------------------------------------------------
-- Table `minimarket`.`DetalleBoleta`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `minimarket`.`DetalleBoleta` (
  `idDetalleBoleta` INT NOT NULL,
  `cantidad` INT NOT NULL,
  `Producto_idProcto` INT NOT NULL,
  `Boleta_idBoleta` INT NOT NULL,
  PRIMARY KEY (`idDetalleBoleta`),
  INDEX `fk_DetalleBoleta_Producto1_idx` (`Producto_idProcto` ASC) VISIBLE,
  INDEX `fk_DetalleBoleta_Boleta1_idx` (`Boleta_idBoleta` ASC) VISIBLE,
  CONSTRAINT `fk_DetalleBoleta_Producto1`
    FOREIGN KEY (`Producto_idProcto`)
    REFERENCES `minimarket`.`Producto` (`idProcto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DetalleBoleta_Boleta1`
    FOREIGN KEY (`Boleta_idBoleta`)
    REFERENCES `minimarket`.`Boleta` (`idBoleta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Querys schema minimarket
-- -----------------------------------------------------

select * from tipoproducto;

-- -----------------------------------------------------
-- INSERT `minimmarket`.`tipoproducto`
-- -----------------------------------------------------
INSERT INTO `minimarket`.`tipoproducto` (`idtipoProducto`, `tipo`) VALUES ('1', 'Productos de aseo');
INSERT INTO `minimarket`.`tipoproducto` (`idtipoProducto`, `tipo`) VALUES ('2', 'Verduras');
INSERT INTO `minimarket`.`tipoproducto` (`idtipoProducto`, `tipo`) VALUES ('3', 'Frutas');
INSERT INTO `minimarket`.`tipoproducto` (`idtipoProducto`, `tipo`) VALUES ('4', 'Cecinas');
INSERT INTO `minimarket`.`tipoproducto` (`idtipoProducto`, `tipo`) VALUES ('5', 'Abarrotes');
INSERT INTO `minimarket`.`tipoproducto` (`idtipoProducto`, `tipo`) VALUES ('6', 'Lacteos');
INSERT INTO `minimarket`.`tipoproducto` (`idtipoProducto`, `tipo`) VALUES ('7', 'Bebestibles');

select * from proveedor;

-- -----------------------------------------------------
-- INSERT `minimmarket`.`proveedor`
-- -----------------------------------------------------
INSERT INTO `minimarket`.`proveedor` (`idProveedor`, `nombre`, `direccion`, `email`, `numeroTelefono`) VALUES ('1', 'Embotelladorra Andina', 'no se donde 123', 'andina@cocacola.cl', '2482748');
INSERT INTO `minimarket`.`proveedor` (`idProveedor`, `nombre`, `direccion`, `email`, `numeroTelefono`) VALUES ('2', 'Productos de aseo', 'donde hacen aseo 423', 'aseo@limpio.cl', '4389929');
INSERT INTO `minimarket`.`proveedor` (`idProveedor`, `nombre`, `direccion`, `email`, `numeroTelefono`) VALUES ('3', 'Lo valledor', 'donde venden frutas y verduras puesto 2', 'verdurasFrutas@lovalledor.cl', '2394738');
INSERT INTO `minimarket`.`proveedor` (`idProveedor`, `nombre`, `direccion`, `email`, `numeroTelefono`) VALUES ('4', 'Productos varios', 'vende de todo 234', 'vendodetodito@gmail.com', '3927819');

select * from producto;

-- -----------------------------------------------------
-- INSERT `minimmarket`.`producto`
-- -----------------------------------------------------
INSERT INTO `minimarket`.`producto` (`idProcto`, `nombre`, `descripcion`, `stock`, `precio`, `tipoproducto_idtipoProducto`, `Proveedor_idProveedor`) VALUES ('1', 'Coca-cola', 'Bebida 1,25lt', '30', '800', '7', '1');
INSERT INTO `minimarket`.`producto` (`idProcto`, `nombre`, `descripcion`, `stock`, `precio`, `tipoproducto_idtipoProducto`, `Proveedor_idProveedor`) VALUES ('2', 'Papas', 'bolsa 1kg', '30', '1500', '2', '3');
INSERT INTO `minimarket`.`producto` (`idProcto`, `nombre`, `descripcion`, `stock`, `precio`, `tipoproducto_idtipoProducto`, `Proveedor_idProveedor`) VALUES ('3', 'Caja de leche', '1Lt', '25', '1250', '6', '4');
INSERT INTO `minimarket`.`producto` (`idProcto`, `nombre`, `descripcion`, `stock`, `precio`, `tipoproducto_idtipoProducto`, `Proveedor_idProveedor`) VALUES ('4', 'Jamonada', '250gr', '50', '1000', '4', '4');
INSERT INTO `minimarket`.`producto` (`idProcto`, `nombre`, `descripcion`, `stock`, `precio`, `tipoproducto_idtipoProducto`, `Proveedor_idProveedor`) VALUES ('5', 'Detergente liquido', '5lt', '40', '5000', '1', '2');
INSERT INTO `minimarket`.`producto` (`idProcto`, `nombre`, `descripcion`, `stock`, `precio`, `tipoproducto_idtipoProducto`, `Proveedor_idProveedor`) VALUES ('6', 'Manzanas', 'malla manzanas 5un', '15', '2000', '3', '3');
INSERT INTO `minimarket`.`producto` (`idProcto`, `nombre`, `descripcion`, `stock`, `precio`, `tipoproducto_idtipoProducto`, `Proveedor_idProveedor`) VALUES ('7', 'Pan', '1Kg', '30', '1250', '5', '4');

select * from boleta;

-- -----------------------------------------------------
-- INSERT `minimmarket`.`boleta`
-- -----------------------------------------------------
INSERT INTO `minimarket`.`boleta` (`idBoleta`, `numeroCompra`, `descripcion`, `fechaCompra`) VALUES ('1', '1', 'Pagado', '2022-11-11');
INSERT INTO `minimarket`.`boleta` (`idBoleta`, `numeroCompra`, `descripcion`, `fechaCompra`) VALUES ('2', '2', 'Pagado', '2020-12-23');
INSERT INTO `minimarket`.`boleta` (`idBoleta`, `numeroCompra`, `descripcion`, `fechaCompra`) VALUES ('3', '33', 'Pagado', '2019-2-24');
INSERT INTO `minimarket`.`boleta` (`idBoleta`, `numeroCompra`, `descripcion`, `fechaCompra`) VALUES ('4', '23', 'Pagado', '2020-2-24');

select * from detalleboleta;

-- -----------------------------------------------------
-- INSERT `minimmarket`.`detalleboleta`
-- -----------------------------------------------------
INSERT INTO `minimarket`.`detalleboleta` (`idDetalleBoleta`, `cantidad`, `Producto_idProcto`, `Boleta_idBoleta`) VALUES ('1', '4', '5', '1');
INSERT INTO `minimarket`.`detalleboleta` (`idDetalleBoleta`, `cantidad`, `Producto_idProcto`, `Boleta_idBoleta`) VALUES ('2', '3', '2', '1');
INSERT INTO `minimarket`.`detalleboleta` (`idDetalleBoleta`, `cantidad`, `Producto_idProcto`, `Boleta_idBoleta`) VALUES ('3', '1', '7', '1');
INSERT INTO `minimarket`.`detalleboleta` (`idDetalleBoleta`, `cantidad`, `Producto_idProcto`, `Boleta_idBoleta`) VALUES ('4', '1', '1', '1');

INSERT INTO `minimarket`.`detalleboleta` (`idDetalleBoleta`, `cantidad`, `Producto_idProcto`, `Boleta_idBoleta`) VALUES ('5', '2', '5', '2');
INSERT INTO `minimarket`.`detalleboleta` (`idDetalleBoleta`, `cantidad`, `Producto_idProcto`, `Boleta_idBoleta`) VALUES ('6', '5', '2', '2');
INSERT INTO `minimarket`.`detalleboleta` (`idDetalleBoleta`, `cantidad`, `Producto_idProcto`, `Boleta_idBoleta`) VALUES ('7', '6', '7', '2');
INSERT INTO `minimarket`.`detalleboleta` (`idDetalleBoleta`, `cantidad`, `Producto_idProcto`, `Boleta_idBoleta`) VALUES ('8', '7', '1', '2');

INSERT INTO `minimarket`.`detalleboleta` (`idDetalleBoleta`, `cantidad`, `Producto_idProcto`, `Boleta_idBoleta`) VALUES ('9', '1', '5', '3');
INSERT INTO `minimarket`.`detalleboleta` (`idDetalleBoleta`, `cantidad`, `Producto_idProcto`, `Boleta_idBoleta`) VALUES ('10', '1', '2', '3');
INSERT INTO `minimarket`.`detalleboleta` (`idDetalleBoleta`, `cantidad`, `Producto_idProcto`, `Boleta_idBoleta`) VALUES ('11', '1', '7', '3');
INSERT INTO `minimarket`.`detalleboleta` (`idDetalleBoleta`, `cantidad`, `Producto_idProcto`, `Boleta_idBoleta`) VALUES ('12', '2', '1', '3');

INSERT INTO `minimarket`.`detalleboleta` (`idDetalleBoleta`, `cantidad`, `Producto_idProcto`, `Boleta_idBoleta`) VALUES ('13', '1', '5', '4');
INSERT INTO `minimarket`.`detalleboleta` (`idDetalleBoleta`, `cantidad`, `Producto_idProcto`, `Boleta_idBoleta`) VALUES ('14', '1', '2', '4');
INSERT INTO `minimarket`.`detalleboleta` (`idDetalleBoleta`, `cantidad`, `Producto_idProcto`, `Boleta_idBoleta`) VALUES ('15', '1', '7', '4');
INSERT INTO `minimarket`.`detalleboleta` (`idDetalleBoleta`, `cantidad`, `Producto_idProcto`, `Boleta_idBoleta`) VALUES ('16', '2', '1', '4');


-- -----------------------------------------------------
-- JOIN'S
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Boleta con suma por cantidades
-- -----------------------------------------------------

select idBoleta as `Numero de boleta`, nombre as `Nombre`, precio as `Precio un.`, cantidad, FORMAT( cantidad * precio,'C','ES-cl') as `Precio $`, fechaCompra as `Fecha`
from detalleboleta
join boleta, producto
where (detalleboleta.Producto_idProcto = producto.idProcto)  and (detalleboleta.Boleta_idBoleta = boleta.idBoleta);

-- -----------------------------------------------------
-- Total de boleta numero 1
-- -----------------------------------------------------

select idBoleta as `Numero Boleta`,  sum(cantidad * precio) as `Total $` 
from detalleboleta
join boleta, producto
where (detalleboleta.Producto_idProcto = producto.idProcto)  
and (detalleboleta.Boleta_idBoleta = boleta.idBoleta) 
and idboleta = 1;

-- -----------------------------------------------------
-- Total de boleta numero 2
-- -----------------------------------------------------

select idBoleta as `Numero Boleta`,  sum(cantidad * precio) as `Total $` 
from detalleboleta
join boleta, producto
where (detalleboleta.Producto_idProcto = producto.idProcto)  and (detalleboleta.Boleta_idBoleta = boleta.idBoleta) and idboleta = 2;

-- -----------------------------------------------------
-- Total de boleta numero 3
-- -----------------------------------------------------

select idBoleta as `Numero Boleta`,  sum(cantidad * precio) as `Total $` 
from detalleboleta
join boleta, producto
where (detalleboleta.Producto_idProcto = producto.idProcto)  and (detalleboleta.Boleta_idBoleta = boleta.idBoleta) and idboleta = 3;

-- -----------------------------------------------------
-- total de las 3 boletas
-- -----------------------------------------------------

select idBoleta as `Numero Boleta`,  sum(cantidad * precio), fechaCompra
from detalleboleta 
inner join boleta, producto
where (detalleboleta.Producto_idProcto = producto.idProcto)  and (detalleboleta.Boleta_idBoleta = boleta.idBoleta) group by idBoleta;

-- -----------------------------------------------------
-- total de las boletas con la misma fecha
-- -----------------------------------------------------

select idBoleta as `Numero Boleta`,  sum(cantidad * precio) as `total boleta por fecha`, fechaCompra
from detalleboleta 
inner join boleta, producto
where (detalleboleta.Producto_idProcto = producto.idProcto)  and (detalleboleta.Boleta_idBoleta = boleta.idBoleta) group by fechaCompra;

-- -----------------------------------------------------
-- total de las boletas con la misma fecha
-- -----------------------------------------------------

select idBoleta as `Boleta`,  sum(cantidad * precio) as `total boleta por fecha`
from detalleboleta 
join boleta, producto
where (detalleboleta.Producto_idProcto = producto.idProcto)  and (detalleboleta.Boleta_idBoleta = boleta.idBoleta) and fechaCompra like '2020%' group by idBoleta;

-- -----------------------------------------------------
-- total de las boletas con la misma fecha
-- -----------------------------------------------------

select idBoleta as `Boleta`,  sum(cantidad * precio) as `total boleta por fecha`
from detalleboleta 
join boleta, producto
where (detalleboleta.Producto_idProcto = producto.idProcto)  and (detalleboleta.Boleta_idBoleta = boleta.idBoleta) and fechaCompra like '2020%';

