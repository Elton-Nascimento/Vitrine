USE VITRINE
GO

IF OBJECT_ID (N'dbo.fn_dsPagamento', N'TF') IS NOT NULL
    DROP FUNCTION dbo.fn_dsPagamento;
GO

CREATE FUNCTION dbo.fn_dsPagamento(@IdProduto   INT, 
                                   @IdProdPag   INT,
                                   @QtdeProduto INT = 0)
RETURNS @tb_return TABLE
(
  valorTotal   MONEY, 
  valorParcela MONEY,
  qtdeParcela  INT DEFAULT(1)
)
AS
BEGIN
    DECLARE @Juros        FLOAT,
            @ValorVenda   MONEY,
            @ValorParcela MONEY,
            @QtdeParcela  INT;
    
    SELECT @ValorVenda   = valorVenda,
           @ValorParcela = valorVenda
      FROM PRODUTO(NOLOCK)
     WHERE idProduto = @IdProduto;
          
    SELECT @Juros       = jurosParcela,
           @QtdeParcela = qtdeParcela
      FROM PRODUTO_PAGAMENTO(NOLOCK)
     WHERE idProdPag = @IdProdPag
    
    IF(@QtdeProduto <> 0)    
    BEGIN
        SELECT @ValorParcela = @ValorVenda+((@Juros * @ValorVenda)/100),
               @ValorVenda   = @ValorParcela * @QtdeProduto
    END;

    INSERT INTO @tb_return(valorTotal,
                           valorParcela,
                           qtdeParcela)
                    VALUES(@ValorVenda,
                           @ValorParcela,
                           @QtdeParcela);
    RETURN
END;