use ecommerce;

INSERT INTO clients (TipoCliente, Fname, Minit, Lname, Gender, CPF, CNPJ, Rua, Bairro, Complemento, Cidade, Estado)
VALUES('PF', 'Lucas', 'A.', 'Mendes', 'M', '12345678901', NULL, 'Rua A', 'Centro', 'Ap 101', 'SaoPaulo', 'SP'),
('PF', 'Marina', 'B.', 'Silva', 'F', '23456789012', NULL, 'Rua B', 'Jardins', NULL, 'RioJaneir', 'RJ'),
('PF', 'Joao', 'C.', 'Oliveira', 'M', '34567890123', NULL, 'Paulista', 'BelaVista', NULL, 'SaoPaulo', 'SP'),
('PF', 'Fernanda', 'D.', 'Costa', 'F', '45678901234', NULL, 'Laranjeira', 'Centro', NULL, 'Salvador', 'BA'),
('PF', 'Rafael', 'E.', 'Souza', 'M', '56789012345', NULL, 'Comercio', 'Industri', NULL, 'Recife', 'PE'),
('PF', 'Beatriz', 'F.', 'Lima', 'F', '67890123456', NULL, 'Rua Nova', 'Centro', NULL, 'Curitiba', 'PR'),
('PF', 'Carlos', 'G.', 'Pereira', 'M', '78901234567', NULL, 'Rua Verde', 'Botanico', NULL, 'Brasilia', 'DF'),
('PJ', NULL, NULL, NULL, NULL, NULL, '11222333000188', 'Empresaria', 'DistrIndust', 'Bloco A', 'Campinas', 'SP'),
('PJ', NULL, NULL, NULL, NULL, NULL, '22334455000177', 'Empresas', 'Comercial', 'Sala 305', 'BeloHoriz', 'MG'),
('PJ', NULL, NULL, NULL, NULL, NULL, '33445566000199', 'Negocios', 'Centro', 'Andar 2', 'PortoAlgr', 'RS');
   
 INSERT INTO seller (Social_Name, CNPJ, CPF, Name_Fantasy, Location, CellNumber)
VALUES('Tech Distribuidora LTDA', '12345678000199', NULL, 'TechStore', 'São Paulo - SP, Av. Paulista, 1000', '11999990000'),
('Alimentos Brasil S.A.', '98765432000188', NULL, 'Brasil Foods', 'Campinas - SP, Rua das Indústrias, 45', '19988887777'),
('Brinquedos Criativos ME', '45678912000155', NULL, 'Mundo Kids', 'Curitiba - PR, Rua das Crianças, 200', '41977776666'),
('Moda Urbana Ltda', '32165498000133', NULL, 'Urban Style', 'Rio de Janeiro - RJ, Av. Copacabana, 500', '21966665555'),
('João Pedro da Silva', NULL, '123456789', 'JP Eletrônicos', 'Belo Horizonte - MG, Rua Central, 300', '31955554444'),
('Ana Luiza Ramos', NULL, '234567891', 'Ana Presentes', 'Salvador - BA, Rua do Comércio, 78', '71944443333'),
('Carlos Henrique Lima', NULL, '345678912', 'CH Games', 'Porto Alegre - RS, Av. das Nações, 1200', '51933332222');       

INSERT INTO supplier (SocialName, CNPJ, CellNumber)
VALUES('Tech Distribuidora LTDA', '12345678000199', '11999990000'),
('Alimentos Brasil S.A.', '98765432000188', '19988887777'),
('Brinquedos Criativos ME', '45678912000155', '41977776666'),
('Moda Urbana Ltda', '32165498000133', '21966665555'),
('JP Eletrônicos', '11223344000166', '31955554444'),
('Ana Presentes', '22334455000177', '71944443333'),
('CH Games', '33445566000199', '51933332222');

INSERT INTO product (Product, Classification_Kids, Category, Price, Assessment, Size)
VALUES('Celular', 0, 'eletronics', 1200.00, 4.5, NULL),
('Camisa', 0, 'clothes', 80.00, 3.2, 'M'),
('Boneco', 1, 'toys', 45.00, 2.8, NULL),
('Granola', 0, 'food', 25.00, 4.7, '500g'),
('Fone', 0, 'eletronics', 250.00, 4.0, NULL),
('Biscoito', 0, 'food', 36.00, 2.5, '200g'),
('Jogo', 1, 'toys', 110.00, 4.8, NULL),
('Calça', 0, 'clothes', 150.00, 2.0, 'G'),
('Suco', 0, 'food', 180.00, 4.9, '1L'),
('Carregador', 0, 'eletronics', 90.00, 4.3, NULL),
('Carrinho', 1, 'toys', 55.00, 3.0, NULL),
('Café', 0, 'food', 2200.00, 4.9, '1kg'),
('Notebook', 0, 'eletronics', 60.00, 4.1, NULL),
('Puzzle', 1, 'toys', 200.00, 2.7, NULL),
('Jaqueta', 0, 'clothes', 1200.00, 1.9, 'GG'),
('Tenis', 0, 'clothes', 75.00, 2.5, '42');

INSERT INTO stock (IdProduct, StockLocation, Quanty, Category)
VALUES(1, 'Centro SP', 2, 'eletronics'),
  (2, 'Depósito RJ', 0, 'clothes'),
  (3, 'Armazém BH', 3, 'toys'),
  (4, 'Centro BA', 200, 'food'),
  (5, 'Filial MG', 1, 'eletronics'),
  (6, 'Filial PR', 0, 'food'),
  (7, 'Galpão CE', 4, 'toys'),
  (8, 'Distribuidor PE', 150, 'clothes'),
  (9, 'Centro DF', 50, 'food'),
  (10, 'Filial SC', 20, 'eletronics'),
  (11, 'Armazém GO', 15, 'toys'),
  (12, 'Depósito MT', 80, 'food'),
  (13, 'Centro ES', 10, 'eletronics'),
  (14, 'Filial PA', 5, 'toys'),
  (15, 'Galpão AM', 7, 'clothes'),
  (16, 'Distribuidor RS', 12, 'clothes');
    
INSERT INTO orders (Id_OrderClient, OrderStatus, OrderDescription, SendValue, PaymentCash, OrderDate, ShippingDate, DeliveryDate, TrackingCode)
	VALUES(1, 'delivered', 'Smartphone', 20.00, 1200.00, '2025-10-01', '2025-10-02', '2025-10-05', 'BR001'),
	(2, 'delivered', 'Camiseta', 10.00, 80.00, '2025-10-02', '2025-10-03', '2025-10-06', 'BR002'),
	(3, 'confirmed', 'Boneco', 15.00, 45.00, '2025-10-03', '2025-10-04', NULL, 'BR003'),
	(4, 'cancel', 'Granola', 10.00, 0.00, '2025-10-04', NULL, NULL, NULL),
	(5, 'delivered', 'Fone', 10.00, 250.00, '2025-10-05', '2025-10-06', '2025-10-08', 'BR005'),
	(6, 'confirmed', 'Biscoito', 10.00, 36.00, '2025-10-06', '2025-10-07', NULL, 'BR006'),
	(7, 'delivered', 'Jogo', 10.00, 110.00, '2025-10-07', '2025-10-08', '2025-10-10', 'BR007'),
	(8, 'cancel', 'Calça', 10.00, 0.00, '2025-10-08', NULL, NULL, NULL),
	(9, 'delivered', 'Suco', 10.00, 180.00, '2025-10-09', '2025-10-10', '2025-10-12', 'BR009'),
	(10, 'delivered', 'Carregador', 10.00, 90.00, '2025-10-10', '2025-10-11', '2025-10-13', 'BR010'),
	(1, 'confirmed', 'Carrinho', 10.00, 55.00, '2025-10-11', '2025-10-12', NULL, 'BR011'),
	(2, 'delivered', 'Café', 10.00, 2200.00, '2025-10-12', '2025-10-13', '2025-10-15', 'BR012'),
	(3, 'delivered', 'Notebook', 10.00, 60.00, '2025-10-13', '2025-10-14', '2025-10-16', 'BR013'),
	(4, 'confirmed', 'Puzzle', 10.00, 200.00, '2025-10-14', '2025-10-15', NULL, 'BR014'),
	(5, 'delivered', 'Jaqueta', 10.00, 1200.00, '2025-10-15', '2025-10-16', '2025-10-18', 'BR015'),
	(6, 'confirmed', 'Tenis', 10.00, 75.00, '2025-10-16', '2025-10-17', NULL, 'BR016');
    
INSERT INTO orders (Id_OrderClient, OrderStatus, OrderDescription, SendValue, PaymentCash, OrderDate, ShippingDate, DeliveryDate, TrackingCode) VALUES
(1, 'delivered', 'Smartphone', 20.00, 1200.00, '2025-10-01', '2025-10-02', '2025-10-05', 'BR001'),
(2, 'delivered', 'Camiseta', 10.00, 80.00, '2025-10-02', '2025-10-03', '2025-10-06', 'BR002'),
(3, 'confirmed', 'Boneco', 15.00, 45.00, '2025-10-03', '2025-10-04', NULL, 'BR003');

INSERT INTO order_product (IdOrder, IdProduct, Quantity)
VALUES(1, 1, 1),
  (2, 2, 1),
  (3, 3, 1),
  (4, 4, 1),
  (5, 5, 1),
  (6, 6, 1),
  (7, 7, 1),
  (8, 8, 1),
  (9, 9, 1),
  (10, 10, 1),
  (11, 11, 1),
  (12, 12, 1),
  (13, 13, 1),
  (14, 14, 1),
  (15, 15, 1),
  (16, 16, 1);
    
INSERT INTO payments (IdClient, TypePayment, LimitAvailable)
	VALUES(1, 'credit_card', 1500.00),
	(2, 'pix', 500.00),
	(3, 'bitcoin', 0.75),
	(4, 'credit_card', 800.00),
	(5, 'pix', 300.00),
	(6, 'credit_card', 1200.00),
	(7, 'bitcoin', 0.50),
	(8, 'pix', 600.00),
	(9, 'credit_card', 1000.00),
	(10, 'pix', 400.00),
	(1, 'pix', 200.00),
	(2, 'credit_card', 2500.00),
	(3, 'pix', 150.00),
	(4, 'bitcoin', 0.20),
	(5, 'credit_card', 900.00);
    
INSERT INTO product_for_seller (Id_Product_Seller, IdPproduct, Product_Quantity)
	VALUES(1, 1, 10),
	(1, 5, 5),
	(1, 10, 3),
	(2, 2, 20),
	(2, 8, 2),
	(2, 15, 1),
	(3, 3, 15),
	(3, 7, 7),
	(4, 4, 50),
	(4, 6, 40),
	(5, 11, 6),
	(6, 12, 8),
	(7, 13, 4),
	(7, 16, 12);
    
    
INSERT INTO productsupplier (IdPsSupplier, IdPsProduct, Quantity)
	VALUES(1, 1, 50),
	(1, 5, 30),
	(2, 4, 200),
	(2, 6, 120),
	(3, 3, 40),
	(3, 7, 25),
	(4, 8, 60),
	(4, 15, 10),
	(5, 10, 15),
	(6, 11, 8),
	(7, 13, 20),
	(7, 16, 45);
    
INSERT INTO stocklocation (IdLocproduct, IdLocStock, Location)
	VALUES(1, 1, 'Centro SP - Prateleira A1'),
	(2, 2, 'Depósito RJ - Prateleira B3'),
	(3, 3, 'Armazém BH - Setor C2'),
	(4, 4, 'Centro BA - Palete 10'),
	(5, 1, 'Centro SP - Prateleira A2'),
	(6, 4, 'Centro BA - Palete 11'),
	(7, 3, 'Armazém BH - Setor C5'),
	(8, 2, 'Depósito RJ - Prateleira B1'),
	(9, 4, 'Centro BA - Palete 12'),
	(10, 1, 'Centro SP - Prateleira A3'),
	(11, 5, 'Filial MG - Depósito 1'),
	(12, 6, 'Filial PR - Depósito 2');
    
INSERT INTO review (IdClient, IdProduct, Rating, Comment, ReviewDate)
	VALUES(1, 1, 5, 'Excelente smartphone; desempenho e bateria muito bons.', '2025-10-05'),
	(2, 2, 1, 'Camiseta encolheu e perdeu a cor na primeira lavagem.', '2025-10-06'),
	(3, 3, 1, 'Boneco quebrou em poucos dias; muito frágil.', '2025-10-07'),
	(4, 4, 4, 'Granola saborosa e embalagem adequada; entregue conforme pedido.', '2025-10-08'),
	(5, 5, 5, 'Fone com som claro e boa construção; muito satisfeito.', '2025-10-09'),
	(6, 6, 3, 'Biscoito saboroso, porém veio parte da embalagem amassada.', '2025-10-10'),
	(7, 7, 2, 'Jogo com peças que se soltam; não recomendaria para crianças pequenas.', '2025-10-11'),
	(8, 8, 1, 'Calça com costura que abriu após o primeiro uso; qualidade ruim.', '2025-10-12'),
	(9, 9, 5, 'Suco de ótima qualidade e sabor natural; chegou gelado e bem embalado.', '2025-10-13'),
	(10, 10, 4, 'Carregador eficiente e compacto; funciona como anunciado.', '2025-10-14'),
	(1, 11, 2, 'Carrinho com acabamento frágil; roda apresentou defeito após alguns usos.', '2025-10-15'),
	(2, 12, 5, 'Café excelente, aroma forte e embalado corretamente.', '2025-10-16'),
	(3, 13, 4, 'Notebook atende tarefas básicas; bateria poderia durar mais.', '2025-10-17'),
	(4, 14, 4, 'Puzzle com corte de peças preciso e imagem bonita; bom entretenimento.', '2025-10-18'),
	(5, 15, 1, 'Jaqueta com defeito na forração e manchas; devolvi o produto.', '2025-10-19'),
	(6, 16, 3, 'Tênis confortável, mas a sola desgasta rápido; relação custo-benefício média.', '2025-10-20');
    
    INSERT INTO payment_transaction (IdOrder, IdClient, PaymentMethod, AmountPaid, PaymentDate)
	VALUES(1, 1, 'credit_card', 1200.00, '2025-10-05 09:30:00'),
	(2, 2, 'pix', 80.00, '2025-10-06 11:15:00'),
	(3, 3, 'pix', 45.00, '2025-10-04 14:20:00'),
	(4, 4, 'pix', 0.00, '2025-10-04 12:00:00'),
	(5, 5, 'credit_card', 250.00, '2025-10-06 10:05:00'),
	(6, 6, 'pix', 36.00, '2025-10-07 13:45:00'),
	(7, 7, 'credit_card', 110.00, '2025-10-08 09:50:00'),
	(8, 8, 'pix', 0.00, '2025-10-08 16:30:00'),
	(9, 9, 'credit_card', 180.00, '2025-10-10 08:25:00'),
	(10, 10, 'credit_card', 90.00, '2025-10-11 17:05:00'),
	(11, 1, 'pix', 55.00, '2025-10-12 15:10:00'),
	(12, 2, 'credit_card', 2200.00, '2025-10-13 09:00:00'),
	(13, 3, 'pix', 60.00, '2025-10-14 12:40:00'),
	(14, 4, 'credit_card', 200.00, '2025-10-15 14:00:00'),
	(15, 5, 'credit_card', 1200.00, '2025-10-16 10:20:00'),
	(16, 6, 'pix', 75.00, '2025-10-17 11:55:00');
    
INSERT INTO payment_transaction (IdOrder, IdClient, PaymentMethod, AmountPaid, PaymentDate) 
    VALUES(17, 1, 'bitcoin', 0.06, '2025-10-01 10:00:00'),
(18, 2, 'bitcoin', 0.04, '2025-10-02 11:15:00'),
(19, 3, 'bitcoin', 0.02, '2025-10-03 14:30:00');