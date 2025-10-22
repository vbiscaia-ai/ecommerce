use ecommerce;

select * from clients;
select * from seller;
select * from supplier;
select * from product;
select * from stock;
select * from orders;
select * from payments;
select * from product_for_seller;
select * from product_order;
select * from productsupplier;
select * from stocklocation;
select * from review;
select * from payment_transaction;


#QUANTOS PEDIDOS CANCELADOS ? 
#DOIS PEDIDOS CANCELADOS, 
#FERNANDA COSTA E PJ = 11222333000188
#ENTRAR EM CONTATO DESCOBRIR O MOTIVO DO CANCELAMENTO

SELECT
  c.IdClient AS Id_OrderClient,
  c.CNPJ AS empresa,
  CONCAT(c.Fname, ' ', c.Lname) AS Cliente,
  o.OrderStatus,
  COUNT(*) AS TotalPorStatus
FROM orders o
JOIN clients c ON o.Id_OrderClient = c.IdClient
WHERE o.OrderStatus = 'cancel'
GROUP BY c.IdClient, c.CNPJ, CONCAT(c.Fname, ' ', c.Lname), o.OrderStatus
ORDER BY TotalPorStatus DESC;

#PEDIDOS ENTREGUES 
# 11 PEDIDOS ENTREGUES

 SELECT 
  OrderStatus,
  COUNT(*) AS TotalPedidos
FROM Orders
WHERE OrderStatus = 'Delivered'
GROUP BY OrderStatus;

#MÉDIA TEMPO DE ENTREGA 
#3.3636 DIAS
SELECT 
  AVG(DATEDIFF(DeliveryDate, OrderDate)) AS MediaDiasEntrega
FROM orders
WHERE DeliveryDate IS NOT NULL;

#CLIENTES COM MAIS DE 1 PEDIDO
#TEMOS DOIS CLIENTES COM 3 PEDIDOS
#TRÊS CLIENTES COM 2 PEDIDOS

SELECT 
  c.IdClient,
  CONCAT(c.Fname, ' ', c.Lname) AS NomeCliente,
  COUNT(*) AS TotalPedidos
FROM orders o
JOIN clients c ON o.Id_OrderClient = c.IdClient
GROUP BY c.IdClient, NomeCliente
HAVING COUNT(*) >= 2;

# TOTAL DE VENDAS POR METODO DE PAGAMENTO
# TOTAL EM PIX: 351,00 R$
# TOTAL BITCOIN: 0,12 BTC
# TOTAL CREDIT_CARD: 5.430,00 R$ 

SELECT 
  SUM(AmountPaid) AS TotalPix
FROM payment_transaction
WHERE PaymentMethod = 'pix';

 select SUM(AmountPaid) AS Totalbitcoin
FROM payment_transaction
WHERE PaymentMethod = 'bitcoin';

 select SUM(AmountPaid) AS Totalcreditcard
FROM payment_transaction
WHERE PaymentMethod = 'credit_card';


#ESTOQUE CRITICO
# ATENÇÃO (CAMISA, FONE) COM ESTOQUE 0
# MAIS 5 PRODUTOS COM ESTOQUE ABAIXO DE 10 INTENS 
SELECT 
  p.Product AS NomeProduto,
  s.Quanty AS QuantidadeEstoque,
  s.StockLocation AS LocalEstoque,
  p.Category AS Categoria
FROM stock s
JOIN product p ON s.IdProduct = p.IdProduct
WHERE s.Quanty < 10
ORDER BY s.Quanty ASC;

#ESTOQUE CRITICO POR LOCALIDADE
# ATENÇÃO PARA OS DEPOSITOS 
# 4 COM ESTOQUE 0 

SELECT 
  s.StockLocation AS LocalEstoque,
  SUM(s.Quanty) AS TotalEstoque,
  COUNT(DISTINCT s.IdProduct) AS ProdutosDiferentes
FROM stock s
GROUP BY s.StockLocation
HAVING SUM(s.Quanty) < 10
ORDER BY TotalEstoque ASC;
