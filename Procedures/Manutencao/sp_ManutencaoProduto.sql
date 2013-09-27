USE VITRINE
GO

IF OBJECT_ID('dbo.sp_ManutencaoProduto', 'P') IS NOT NULL
    DROP PROCEDURE dbo.sp_ManutencaoProduto;
GO

CREATE PROCEDURE dbo.sp_ManutencaoProduto @Acao          CHAR(1),--"I" para Insert, "U" para Update, "D" para Delete
                                          @IdProduto     INT,      
                                          @IdLoja        INT,
                                          @IdCategoria   INT,
                                          @DescrProduto  VARCHAR(150),
                                          @QtdeEstoque   INT,
                                          @ValorCusto    MONEY,
                                          @ValorVenda    MONEY,
                                          @FreteGratis   BIT,
                                          @AtivoProduto  BIT
WITH ENCRYPTION AS 
BEGIN
  IF (@Acao = 'I')
  BEGIN
    INSERT INTO dbo.PRODUTO(
                            idLoja,
                            idCategoria,
                            descrProduto,
                            qtdeEstoque,
                            valorCusto,
                            valorVenda,
                            freteGratis,
                            ativoProduto)
                     VALUES(@IdLoja,      
                            @IdCategoria, 
                            @DescrProduto,
                            @QtdeEstoque, 
                            @ValorCusto,  
                            @ValorVenda,  
                            @FreteGratis, 
                            @AtivoProduto);

    DECLARE @IdCadastrado INT,
            @IdPagamento  INT;
    
     SELECT @IdCadastrado = idProduto
       FROM PRODUTO
      WHERE idLoja = @IdLoja
        AND descrProduto LIKE @DescrProduto
    
     SELECT TOP 1
            @IdPagamento = idPagamento
       FROM dbo.PAGAMENTO
      WHERE descrPagamento LIKE '%COMBINAR%';

    IF (@IdCadastrado <> 0)
    BEGIN
        DECLARE @Contador INT
        SET @Contador = 1
       
        WHILE (@Contador <= 4)
        BEGIN
            INSERT INTO dbo.IMAGENS(idProduto,
                                    nomeImagem,
                                    localImagem,
                                    partImagem)
                             VALUES(@IdCadastrado,
                                    'Produto',
                                    '~/Content/Imagens/SemImagem.gif',
                                    @Contador);
            SET @Contador = @Contador+1
        END

        INSERT INTO dbo.PRODUTO_PAGAMENTO(idProduto,
                                          idPagamento,
                                          qtdeParcela,
                                          jurosParcela)
                                   VALUES(@IdCadastrado,
                                          @IdPagamento,
                                          1,
                                          0.00);
    END
  END ELSE
  IF (@Acao = 'U')
  BEGIN
	UPDATE dbo.PRODUTO
	   SET idCategoria  = @IdCategoria,  
           descrProduto = @DescrProduto, 
           qtdeEstoque  = @QtdeEstoque,  
           valorCusto   = @ValorCusto,   
           valorVenda   = @ValorVenda,   
           freteGratis  = @FreteGratis,  
           ativoProduto = @AtivoProduto 
	 WHERE idProduto    = @IdProduto
  END ELSE
  IF(@Acao = 'D')
  BEGIN
    DELETE FROM IMAGENS 
          WHERE idProduto = @IdProduto;
    DELETE FROM PRODUTO_PAGAMENTO 
          WHERE idProduto = @IdProduto;
    DELETE FROM PRODUTO 
          WHERE idProduto = @IdProduto;
    DELETE FROM DESEJOS 
          WHERE idProduto = @IdProduto;
  END
END