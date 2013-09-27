USE VITRINE
GO

IF OBJECT_ID('dbo.sp_ConsultaPedido', 'P') IS NOT NULL
    DROP PROCEDURE dbo.sp_ConsultaPedido;
GO

CREATE PROCEDURE dbo.sp_ConsultaPedido @Modo          VARCHAR(50), --// "Carrinho", "Pedido", "Compra", "Venda"
                                       @GuidVisitante VARCHAR(50) = NULL,
                                       @IdUsuario     INT         = NULL
WITH ENCRYPTION AS
BEGIN
    IF(@Modo = 'Carrinho')
    BEGIN
        SELECT ITENS_PEDIDO.idPedido,
               ITENS_PEDIDO.idItem,  
               ITENS_PEDIDO.idProduto,
               ITENS_PEDIDO.valorItem,
               ITENS_PEDIDO.qtdeItem,
               ITENS_PEDIDO.qtdeParcela,
               ITENS_PEDIDO.idProdPag,
               PEDIDO.numPedido,
               PEDIDO.dtPedido,
               PRODUTO.descrProduto,
               CATEGORIA.descrCategoria,
               LOJA.nomeFantasia,
               IMAGENS.localImagem,
               PAGAMENTO.descrPagamento,
               LOJA.idLoja
          FROM dbo.ITENS_PEDIDO
         INNER JOIN PEDIDO
            ON ITENS_PEDIDO.idPedido = PEDIDO.idPedido
         INNER JOIN dbo.PRODUTO
            ON ITENS_PEDIDO.idProduto = PRODUTO.idProduto
         INNER JOIN dbo.CATEGORIA
            ON PRODUTO.idCategoria = CATEGORIA.idCategoria
          LEFT OUTER JOIN dbo.LOJA
            ON PRODUTO.idLoja = LOJA.idLoja
          LEFT OUTER JOIN dbo.IMAGENS
            ON PRODUTO.idProduto = IMAGENS.idProduto
         INNER JOIN dbo.PRODUTO_PAGAMENTO
            ON ITENS_PEDIDO.idProdPag = PRODUTO_PAGAMENTO.idProdPag
         INNER JOIN PAGAMENTO
            ON PRODUTO_PAGAMENTO.idPagamento = PAGAMENTO.idPagamento
          LEFT OUTER JOIN CONSUMIDOR
            ON PEDIDO.idConsumidor = CONSUMIDOR.idConsumidor
         WHERE PEDIDO.ativoPedido = 0
           AND ISNULL(PEDIDO.guidVisitante, CAST(PEDIDO.idConsumidor AS varchar(10))) = ISNULL(@GuidVisitante, CAST(PEDIDO.idConsumidor AS varchar(10)))
        UNION
        SELECT ITENS_PEDIDO.idPedido,
               ITENS_PEDIDO.idItem,  
               ITENS_PEDIDO.idProduto,
               ITENS_PEDIDO.valorItem,
               ITENS_PEDIDO.qtdeItem,
               ITENS_PEDIDO.qtdeParcela,
               ITENS_PEDIDO.idProdPag,
               PEDIDO.numPedido,
               PEDIDO.dtPedido,
               PRODUTO.descrProduto,
               CATEGORIA.descrCategoria,
               LOJA.nomeFantasia,
               IMAGENS.localImagem,
               PAGAMENTO.descrPagamento,
               LOJA.idLoja
          FROM dbo.ITENS_PEDIDO
          LEFT OUTER JOIN PEDIDO
            ON ITENS_PEDIDO.idPedido = PEDIDO.idPedido
         INNER JOIN dbo.PRODUTO
            ON ITENS_PEDIDO.idProduto = PRODUTO.idProduto
         INNER JOIN dbo.CATEGORIA
            ON PRODUTO.idCategoria = CATEGORIA.idCategoria
          LEFT OUTER JOIN dbo.LOJA
            ON PRODUTO.idLoja = LOJA.idLoja
          LEFT OUTER JOIN dbo.IMAGENS
            ON PRODUTO.idProduto = IMAGENS.idProduto
         INNER JOIN dbo.PRODUTO_PAGAMENTO
            ON ITENS_PEDIDO.idProdPag = PRODUTO_PAGAMENTO.idProdPag
         INNER JOIN PAGAMENTO
            ON PRODUTO_PAGAMENTO.idPagamento = PAGAMENTO.idPagamento
          LEFT OUTER JOIN CONSUMIDOR
            ON PEDIDO.idConsumidor = CONSUMIDOR.idConsumidor
         WHERE PEDIDO.ativoPedido = 1
           AND IMAGENS.partImagem = 1
           AND ISNULL(CAST(PEDIDO.idConsumidor AS varchar(10)), PEDIDO.guidVisitante) = ISNULL(CAST(@IdUsuario AS varchar(10)), PEDIDO.guidVisitante)
      ORDER BY LOJA.idLoja;
    END ELSE
    IF(@Modo = 'Pedido')
    BEGIN
       SELECT ITENS_PEDIDO.idPedido,
              ITENS_PEDIDO.idProduto,
              ITENS_PEDIDO.valorItem,
              ITENS_PEDIDO.qtdeItem,
              ITENS_PEDIDO.qtdeParcela,
              ITENS_PEDIDO.idProdPag,
              ITENS_PEDIDO.sitPedido,
              PEDIDO.numPedido,
              PEDIDO.dtPedido,
              PRODUTO.descrProduto,
              CATEGORIA.descrCategoria,
              LOJA.nomeFantasia,
              PAGAMENTO.descrPagamento,
              IMAGENS.localImagem
         FROM dbo.ITENS_PEDIDO
         LEFT OUTER JOIN PEDIDO
           ON ITENS_PEDIDO.idPedido = PEDIDO.idPedido
        INNER JOIN dbo.PRODUTO
           ON ITENS_PEDIDO.idProduto = PRODUTO.idProduto
        INNER JOIN dbo.CATEGORIA
           ON PRODUTO.idCategoria = CATEGORIA.idCategoria
         LEFT OUTER JOIN dbo.LOJA
           ON PRODUTO.idLoja = LOJA.idLoja
         LEFT OUTER JOIN dbo.IMAGENS
           ON PRODUTO.idProduto = IMAGENS.idProduto
        INNER JOIN dbo.PRODUTO_PAGAMENTO
           ON ITENS_PEDIDO.idProdPag = PRODUTO_PAGAMENTO.idProdPag
        INNER JOIN PAGAMENTO
           ON PRODUTO_PAGAMENTO.idPagamento = PAGAMENTO.idPagamento
         LEFT OUTER JOIN CONSUMIDOR
           ON PEDIDO.idConsumidor = CONSUMIDOR.idConsumidor
        WHERE ITENS_PEDIDO.pago   = 0
          AND IMAGENS.partImagem  = 1
          AND PEDIDO.ativoPedido  = 1
          AND PEDIDO.idConsumidor = (SELECT idConsumidor 
                                      FROM dbo.CONSUMIDOR
                                     WHERE idUsuario = @IdUsuario)
     ORDER BY LOJA.idLoja;
    END ELSE
    IF(@Modo = 'Compra')
    BEGIN
       SELECT ITENS_PEDIDO.idPedido,
              ITENS_PEDIDO.idProduto,
              ITENS_PEDIDO.valorItem,
              ITENS_PEDIDO.qtdeItem,
              ITENS_PEDIDO.qtdeParcela,
              ITENS_PEDIDO.idProdPag,
              ITENS_PEDIDO.sitPedido,
              ITENS_PEDIDO.pago,
              ITENS_PEDIDO.dtPagamento,
              PEDIDO.numPedido,
              PEDIDO.dtPedido,
              PRODUTO.descrProduto,
              CATEGORIA.descrCategoria,
              LOJA.nomeFantasia,
              PAGAMENTO.descrPagamento,
              IMAGENS.localImagem
         FROM dbo.ITENS_PEDIDO
         LEFT OUTER JOIN PEDIDO
           ON ITENS_PEDIDO.idPedido = PEDIDO.idPedido
        INNER JOIN dbo.PRODUTO
           ON ITENS_PEDIDO.idProduto = PRODUTO.idProduto
        INNER JOIN dbo.CATEGORIA
           ON PRODUTO.idCategoria = CATEGORIA.idCategoria
         LEFT OUTER JOIN dbo.LOJA
           ON PRODUTO.idLoja = LOJA.idLoja
         LEFT OUTER JOIN dbo.IMAGENS
           ON PRODUTO.idProduto = IMAGENS.idProduto
        INNER JOIN dbo.PRODUTO_PAGAMENTO
           ON ITENS_PEDIDO.idProdPag = PRODUTO_PAGAMENTO.idProdPag
        INNER JOIN PAGAMENTO
           ON PRODUTO_PAGAMENTO.idPagamento = PAGAMENTO.idPagamento
         LEFT OUTER JOIN CONSUMIDOR
           ON PEDIDO.idConsumidor = CONSUMIDOR.idConsumidor
        WHERE ITENS_PEDIDO.pago   = 1
          AND IMAGENS.partImagem  = 1
          AND PEDIDO.ativoPedido  = 1
          AND PEDIDO.idConsumidor = (SELECT idConsumidor 
                                      FROM dbo.CONSUMIDOR
                                     WHERE idUsuario = @IdUsuario);
    END ELSE
    IF(@Modo = 'Venda')
    BEGIN
       SELECT ITENS_PEDIDO.idPedido,
              ITENS_PEDIDO.idProduto,
              ITENS_PEDIDO.valorItem,
              ITENS_PEDIDO.qtdeItem,
              ITENS_PEDIDO.qtdeParcela,
              ITENS_PEDIDO.idProdPag,
              ITENS_PEDIDO.sitPedido,
              ITENS_PEDIDO.pago,
              ITENS_PEDIDO.dtPagamento,
              PEDIDO.numPedido,
              PEDIDO.dtPedido,
              PRODUTO.descrProduto,
              PRODUTO.likeProduto,
              PRODUTO.unlikeProduto,
              PRODUTO.qtdeEstoque,
              CATEGORIA.descrCategoria,
              PAGAMENTO.descrPagamento,
              IMAGENS.localImagem,
              CONSUMIDOR.nomeConsumidor,
              USUARIO.emailUsuario
         FROM dbo.ITENS_PEDIDO
         LEFT OUTER JOIN PEDIDO
           ON ITENS_PEDIDO.idPedido = PEDIDO.idPedido
        INNER JOIN dbo.PRODUTO
           ON ITENS_PEDIDO.idProduto = PRODUTO.idProduto
        INNER JOIN dbo.CATEGORIA
           ON PRODUTO.idCategoria = CATEGORIA.idCategoria
        INNER JOIN dbo.LOJA
           ON PRODUTO.idLoja = LOJA.idLoja
         LEFT OUTER JOIN dbo.IMAGENS
           ON PRODUTO.idProduto = IMAGENS.idProduto
        INNER JOIN dbo.PRODUTO_PAGAMENTO
           ON ITENS_PEDIDO.idProdPag = PRODUTO_PAGAMENTO.idProdPag
        INNER JOIN PAGAMENTO
           ON PRODUTO_PAGAMENTO.idPagamento = PAGAMENTO.idPagamento
        INNER JOIN CONSUMIDOR
           ON PEDIDO.idConsumidor = CONSUMIDOR.idConsumidor
        INNER JOIN USUARIO
           ON CONSUMIDOR.idUsuario = USUARIO.idUsuario
        WHERE PEDIDO.ativoPedido  = 1
          AND IMAGENS.partImagem  = 1
          AND PRODUTO.idLoja = (SELECT idLoja 
                                  FROM dbo.LOJA
                                 WHERE idUsuario = @IdUsuario);
    END
END