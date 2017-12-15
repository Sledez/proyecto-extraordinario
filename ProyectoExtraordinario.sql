--Salvador Ledezma 1639523

-- talvez este proyecto no sea tan grande como lo fue nuestro proyecto de primera oportunidad pero es funcional
-- procure que a pesar de no ser tan grande llevara todo lo que se pidio
-- no esta en la escala o tamaño que el de primera pues no tuve el mismo tiempo y desafortunadamante no fue mi
-- unica segunda :/ y con el trabajo pues no tuve mucho tiempo para sentarme y hacerlo exepcional
-- pero ojala se un buen proyecto 

create database Pos2

use Pos2

create table Vendedor
(	IdVen int not null identity primary key, 
	NomVen varchar (50) not null,
	IMSS int not null, ) 
go 
drop table Vendedor

create table Cliente
(	IdCli int not null identity primary key, 
	NomCli varchar (50) not null,
	Correo varchar (50) not null,
	Tel int not null, 
	edad int not null)
go 
drop table Cliente

create table Venta 
(	IdVenta int not null identity primary key,
	IdVen int not null  foreign key references Vendedor (IdVen),
	IdCli int not null  foreign key references Cliente  (IdCli),
	IdPro int not null foreign key references Producto  (IdPro),
	NumArt int not null, 
	PrecioProd int not null,
	TotalPago AS NumArt * PrecioProd,
)
go
drop table Venta

create table Producto
(	IdPro int not null identity primary key,
	--IdEst int not null  foreign key references Estante (IdEst),
	NomPro varchar (50) null, 
	PrecioProdu int not null,
	Cant int not null,
)
go
drop table Producto
--create table Estante
--(	IdEst int not null identity primary key,
--
--)
--go

insert into Vendedor values
( 'Salvador Ledezma', 1 )

insert into Vendedor values
( 'Jaime Rodriguez', 2 )

select * from Vendedor 


insert into Cliente values
( 'bruno Ledezma', 'Bruno@gmail.com', 12345, 19 )

insert into Cliente values
( 'Enrique Peña', 'peña@gmail.com', 23456, 30 )

select * from Cliente


--ventas con info de empleado, cliente que producto fue, cuantos, y precio el precio se obtiene de 
-- la tabla producto y el total es computado


insert into Venta (IdVen, IdCli, IdPro, NumArt, PrecioProd)
 ( select 2, 2, 1, 3,PrecioProdu from Producto where IdPro = 1)

 insert into Venta (IdVen, IdCli, IdPro, NumArt, PrecioProd)
 ( select 2, 2, 3, 4,PrecioProdu from Producto where IdPro =3)

  insert into Venta (IdVen, IdCli, IdPro, NumArt, PrecioProd)
 ( select 1, 2, 2, 2,PrecioProdu from Producto where IdPro =2)

   insert into Venta (IdVen, IdCli, IdPro, NumArt, PrecioProd)
 ( select 1, 1, 4, 2,PrecioProdu from Producto where IdPro =4)

select * from Venta

--INSERT INTO tablaDestino( nom_empleados )
--SELECT nom_empleados FROM tablaOrigen


insert into Producto values
( 'galletas', 15, 10 )
insert into Producto values
( 'Soda', 10, 10 )
insert into Producto values
( 'Papas', 11, 10 )
insert into Producto values
( 'pilas', 30, 10 )
insert into Producto values
( 'agua', 5, 10 )


select * from Vendedor
select * from Cliente
select * from Venta
select * from Producto



CREATE PROCEDURE GetReporteSalvador
as 
SELECT* FROM Venta as V
WHERE IdVen = 1

CREATE PROCEDURE GetReporteJaime
as 
SELECT* FROM Venta as V
WHERE IdVen = 2

CREATE PROCEDURE GetReporteTotal
as 
SELECT* FROM Venta as V



exec GetReporteJaime

exec GetReporteSalvador

exec GetReporteTotal


update Producto
set PrecioProdu = 7
where IdPro=3

update Producto
set Cant = 3
where IdPro=4

create trigger quePaso
on venta
for insert
as 
begin
print 'Venta Exitosa' 
select * from inserted
end

dROP trigger quePaso
}


drop trigger ventainventario

create trigger ventainventario
on venta
for insert
as 
declare @IdPro as int ;
declare @Cantvendida as int ;
declare @oldCant as int ;
declare @Canttotal as int ;

select @Cantvendida = i.NumArt from inserted i
select @IdPro = i.IdPro from inserted i;
select @oldCant = Producto.Cant from Producto where IdPro = @IdPro;
select @Canttotal = @oldCant- @Cantvendida

begin
update Producto set Cant = @Canttotal where IdPro = @IdPro;
end

delete from Producto
where IdPro=5

Create view VistaInventario as
select pro.NomPro, pro.Cant 
from Producto Pro 

select *from VistaInventario

