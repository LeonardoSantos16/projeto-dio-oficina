use oficina;

insert into Clientes(nomeClientes, Endereço, CPF, Telefone)
	values('leleleo', 'vascodagama', 12345678919, 32323323),
		  ('Willian', 'zezinho123', 32345686723, 40028922),
          ('Roger', 'Praça da sé', 33354364232, 39823456),
          ('Vinicíus', 'Rua Europa', 63322133661, 44429021);
select * from Clientes;

insert into Mecânicos(nomeMecânicos, Endereço, Especialidade)
	values('Paulo', 'Rua Marcelino', 'Reparador de sistemas'),
		  ('Jose', 'Rua lalaland', 'Customizador'),
          ('Pedro', 'Nova era', 'Reparador geral'), 
          ('Gabriel', 'Nova iguaçu', 'Especializado em carros de corrida');
select * from Mecânicos;

insert into Veiculos(cor, TipoVeiculo ,Modelo, Clientes_idClientes, Mecânicos_idMecânicos_Veiculos)
	values('Preto', 'Carro', 'Ford',1,1),
		  ('Azul', 'Carro', 'Mercedes',2,2),
          ('Preto', 'Caminhão','Ford',3,3),
          ('Cinza', 'Carro', 'Porsche',4,4);
select * from Veiculos;

insert into Serviço(tipoServiço, Mecânicos_idMecânicos_Serviço)
		values('Revisão',1),
			  ('Concertar',2),
              ('Concertar',3),
              ('Revisão',4);

insert into OS(dataEmissão, dataConclusão, valorTotal, Mecânicos_idMecânicos_OS)
	values('2022-08-28', '2022-09-22', 500.00,1),
		  ('2022-04-09', '2022-9-15', 758.32,2),
          ('2022-11-18', '2022-12-19', 442.32,3),
          ('2022-08-15', '2002-11-20', 1100.53,4);
select * from OS;
insert into Peça(Componente, valorPeça)
	values('Pneu', 200),
		  ('Motor', 300),
          ('Vela', 400),
          ('Pistão', 600);
        
insert into maoObra(valorObra)
	values(130.32),
          (250.99),
          (350.00),
          (450.99);

insert into Serviço_OS(Serviço_idServiço, OS_idOS)
	values(1,1),
		  (2,2),
          (3,3),
          (4,4);

insert into OSPeça(OS_idOSPeça, Peça_idPeça)
	values(1,1),
		  (2,2),
          (3,3),
          (4,4);

insert into OSObra(OS_idOSObra, maoObra_idmaoObra)
	values(1,1),
		  (2,2),
          (3,3),
          (4,4);
 
 select * from Mecânicos;
 
 -- Informações do cliente e veiculo
 select nomeClientes as Cliente, Endereço, CPF, Telefone, Cor, TipoVeiculo as 'Tipo do Veículo', Modelo from Clientes as c, Veiculos as v where c.idClientes = v.Clientes_idClientes group by TipoVeiculo;

select nomeClientes as Cliente, Endereço, CPF, Telefone, Cor, TipoVeiculo as 'Tipo do Veículo', Modelo from Clientes as c, Veiculos as v where c.idClientes = v.Clientes_idClientes;

 
 select nomeClientes as Cliente, TipoVeiculo as 'Tipo do Veículo', dataConclusão as 'Data de conclusão', valorTotal as 'Valor total' from Clientes as c, Veiculos as v, OS where c.idClientes = v.idVeiculos and c.idClientes = OS.idOS;
 
 -- select nomeClientes as Clientes, TipoVeiculo, dataConclusão, valorTotal, Componente from Clientes, Veiculos, OS, Peça where Clientes.idClientes = idVeiculos and Clientes.idClientes = idOS and Clientes.idClientes;
 
 -- select nomeMecânico, Veiculo, fk_Veiculos_Mecânicos where idClientes = fk_Veiculos_Mecânicos and idClientes =fk_Veiculos_Clientes;
 
 select Componente, valorObra as 'Valor da mão de obra', valorTotal as 'Valor total' from Peça, OS, OSPeça, maoObra, OSObra where OS_idOSPeça = idOS and Peça_idPeça = idPeça and OS_idOSObra = idOS and maoObra_idmaoObra = idmaoObra;
 
 select nomeClientes as Cliente, TipoVeiculo as 'Tipo do Veículo', Modelo, tipoServiço as 'Tipo de serviço', valorTotal as 'Valor total' from Clientes as c, Veiculos as v , Serviço as s, OS, Mecânicos as m, Serviço_OS   where  Mecânicos_idMecânicos_Veiculos = m.idMecânicos and v.Clientes_idClientes = 
 c.idClientes and s.Mecânicos_idMecânicos_Serviço =  m.idMecânicos and OS.Mecânicos_idMecânicos_OS = m.idMecânicos and Serviço_idServiço = s.idServiço and OS_idOS = OS.idOS order by valorTotal asc;
 
 select nomeMecânicos as 'Mecânicos', tipoServiço as 'Tipo do Veículo', dataEmissão as 'Data de emissão', dataConclusão as 'Data de conclusão' from Serviço_OS as so, Mecânicos as m, Serviço as s, OS where s.Mecânicos_idMecânicos_Serviço = m.idMecânicos and m.idMecânicos = OS.Mecânicos_idMecânicos_OS and Serviço_idServiço = s.idServiço and idOS = OS_idOS; 

select nomeClientes as Cliente, TipoVeiculo as 'Tipo do Veículo', Modelo, tipoServiço as 'Tipo de serviço', valorTotal as 'Valor total' from Clientes as c, Veiculos as v, Serviço as s, OS as o, Mecânicos as m, Serviço_OS as so where  v.Mecânicos_idMecânicos_Veiculos = m.idMecânicos 
and v.Clientes_idClientes = c.idClientes and s.Mecânicos_idMecânicos_Serviço =  m.idMecânicos and o.Mecânicos_idMecânicos_OS = m.idMecânicos and so.Serviço_idServiço = idServiço and so.OS_idOS = o.idOS having o.valorTotal > 800;

select AVG(valorTotal) as 'Valor total', AVG(valorObra) as 'Valor da obra' from OS, maoObra;