USE VITRINE
GO

IF OBJECT_ID('dbo.sp_ManutencaoPedido', 'P') IS NOT NULL
    DROP PROCEDURE dbo.sp_ManutencaoPedido;
GO

CREATE PROCEDURE dbo.sp_ManutencaoPedido @Acao          CHAR(1),--"I" para Insert, "U" para Update, "D" para Delete
                                         @IdUsuario     INT         = NULL,
                                         @IdPedido      INT         = NULL,
                                         @GuidVisitante VARCHAR(50) = NULL,
                                         @IdItem        INT,
                                         @IdProduto     INT,
                                         @ValorItem     MONEY,
                                         @QtdeItem      INT,
                                         @SitPedido     VARCHAR(50) = NULL,
                                         @Pago          BIT,
                                         @DtPagamento   DATETIME    = NULL,
                                         @QtdeParcela   INT,
                                         @IdProdPag     INT
WITH ENCRYPTION AS 
BEGIN
  DECLARE @IdConsumidor INT;

   SELECT @IdConsumidor = idConsumidor
     FROM CONSUMIDOR
    WHERE idUsuario = @idUsuario

  IF(@Acao = 'I')
  BEGIN
    IF(@IdPedido IS NULL OR @IdPedido = 0)
    BEGIN
      DECLARE @Pedido INT;

      INSERT INTO dbo.PEDIDO(idConsumidor,
                             guidVisitante)
                      VALUES(@IdConsumidor, 
                             @guidVisitante)
           
      SELECT @Pedido = @@IDENTITY;

      INSERT INTO dbo.ITENS_PEDIDO(idProduto,
                                   idPedido,
                                   valorItem,
                                   qtdeItem,
                                   qtdeParcela,
                                   idProdPag)
                            VALUES(@IdProduto,
                                   @Pedido,
                                   @ValorItem,  
                                   @QtdeItem,   
                                   @QtdeParcela,
                                   @IdProdPag);
    END ELSE
    BEGIN
      INSERT INTO dbo.ITENS_PEDIDO(idPedido,
                                   idProduto,
                                   valorItem,
                                   qtdeItem,
                                   qtdeParcela,
                                   idProdPag)
                            VALUES(@IdPedido,
                                   @IdProduto,
                                   @ValorItem,  
                                   @QtdeItem,    
                                   @QtdeParcela,
                                   @IdProdPag);
    END
  END ELSE
  IF(@Acao = 'U')
  BEGIN
    UPDATE ITENS_PEDIDO SET sitPedido   = @SitPedido,
                            pago        = @Pago,
                            dtPagamento = @DtPagamento;
  END ELSE
  IF (@Acao = 'D')
  BEGIN
    DELETE FROM dbo.ITENS_PEDIDO
          WHERE idItem  = @IdItem;
  END
END