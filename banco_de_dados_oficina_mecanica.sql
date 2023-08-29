create database OficinaMecânica;
use OficinaMecânica;

-- tabela clientes 
 create table clients(
    idClient int auto_increment primary key,
    Fname varchar (20),
    Minit char (3),
    Lname varchar (30),
    CPF char (11) not null,
    adress varchar (300),
    constraint unique_cpf_client unique (CPF)
);

-- tabela de Dados de veículos
create table Vehicles(
    idVehicle int primary key,
    idClient int,
    Make varchar(50),
    Model varchar(50),
    Year int,
    foreign key (idClient) references Clients(idClient)
);

-- tabela Agendamento
create table Appointments(
    idAppointment int primary key,
    idClient int,
    idVehicle int,
    appointmentDate DATETIME,
    serviceType varchar(100),
    Notes varchar(300),
    foreign key (idClient) references Clients(idClient),
    foreign key (idVehicle) references Vehicles(idVehicle)
);

-- tabela Serviços
create table Services(
    idService int primary key,
    idAppointment int,
    totalCost decimal(10, 2),
    foreign key (idAppointment) references Appointments(idAppointment)
);

-- tabela Pagamento
create table payments(
    idClient int,
    idPayment int,
    typePayment enum ("Boleto", "Cartão de débito", "Cartão de crédito", "Dois cartões", "Pix", "Dinheiro", "Qr code"),
    primary key (idClient, idPayment)
);

