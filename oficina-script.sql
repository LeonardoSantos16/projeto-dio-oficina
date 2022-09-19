create database oficina;
use oficina;
-- drop database oficina;
-- show tables;

create table Clientes(
	idClientes int auto_increment primary key,
    nomeClientes varchar(45),
    Endereço varchar(45),
    CPF char(11) not null,
    Telefone int,
    constraint unique_cpf_clientes unique (CPF)
    );

create table Mecânicos(
	idMecânicos int auto_increment primary key,
    nomeMecânicos varchar(45),
    Endereço varchar(45),
    Especialidade varchar(45)
    );
create table Veiculos(
	idVeiculos int auto_increment primary key,
    Cor varchar(25),
    TipoVeiculo varchar(25),
    Modelo varchar(45),
    Clientes_idClientes int,
    Mecânicos_idMecânicos_Veiculos int,
    constraint fk_Veiculos_Clientes foreign key (Clientes_idClientes) references Clientes(idClientes),
    constraint fk_Veiculos_Mecânicos foreign key (Mecânicos_idMecânicos_Veiculos) references Mecânicos(idMecânicos)
    );


create table Serviço(
	idServiço int auto_increment primary key,
    tipoServiço enum('Concertar', 'Revisão') not null,
    Mecânicos_idMecânicos_Serviço int,
    constraint fk_Serviço_Mecânicos foreign key (Mecânicos_idMecânicos_Serviço) references Mecânicos(idMecânicos)
    );
 
 create table OS(
	idOS int auto_increment primary key,
    dataEmissão date,
    dataConclusão date,
    valorTotal float,
    valorPeça float,
    Mecânicos_idMecânicos_OS int,
    constraint fk_OS_Mecânicos foreign key (Mecânicos_idMecânicos_OS) references Mecânicos(idMecânicos)
    );

create table maoObra(
	idmaoObra int auto_increment primary key,
    valorObra float
    );

create table Peça(
	idPeça int auto_increment primary key,
    Componente enum('Motor','Pneu','Freio','Vela','Valvula','Pistão', 'Pintura','Lavagem', 'Cilindro Disco') not null,
    valorPeça int
    );

create table Serviço_OS(
	Serviço_idServiço int,
    OS_idOS int,
    primary key(Serviço_idServiço, OS_idOS),
    constraint fk_Serviço_OS_Serviço foreign key (Serviço_idServiço) references Serviço(idServiço),
    constraint fk_Serviço_OS_OS_idOS foreign key (OS_idOS) references OS(idOS)
	);

create table OSPeça(
	OS_idOSPeça int,
    Peça_idPeça int,
    primary key(OS_idOSPeça, Peça_idPeça),
    constraint fk_OSPeça_OS foreign key (OS_idOSPeça) references OS(idOS),
    constraint fk_OSPeça_Peça foreign key (Peça_idPeça) references Peça(idPeça)
    );

create table OSObra(
	OS_idOSObra int,
    maoObra_idmaoObra int,
    primary key(OS_idOSObra, maoObra_idmaoObra),
    constraint fk_OSObra_OS foreign key (OS_idOSObra) references OS(idOS),
    constraint fk_OSObra_Obra foreign key (maoObra_idmaoObra) references maoObra(idmaoObra)
);	


	

