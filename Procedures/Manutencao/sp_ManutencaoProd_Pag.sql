USE VITRINE
GO

IF OBJECT_ID('dbo.sp_ManutencaoProd_Pag', 'P') IS NOT NULL
    DROP PROCEDURE dbo.sp_ManutencaoProd_Pag;
GO

CREATE PROCEDURE dbo.sp_ManutencaoProd_Pag @Acao         CHAR(1),--"I" para Insert, "U" para Update, "D" para Delete
                                           @IdProdPag	 INT = NULL,
                                           @IdProduto    INT = NULL,
                                           @IdPagamento	 INT = NULL,
                                           @QtdeParcela	 INT = 1,
                                           @JurosParcela FLOAT
WITH ENCRYPTION AS 
BEGIN  
  IF (@Acao = 'I')
  BEGIN
    INSERT INTO dbo.PRODUTO_PAGAMENTO(
                                      idProduto,
                                      idPagamento,
                                      qtdeParcela,
                                      jurosParcela                   
                                      )
                               VALUES( 
                                      @IdProduto,     
                                      @IdPagamento,	  
                                      @QtdeParcela,	  
                                      @JurosParcela
                                     );
  END ELSE
  IF (@Acao = 'U')
  BEGIN
	UPDATE dbo.PRODUTO_PAGAMENTO
	   SET qtdeParcela  = @QtdeParcela,
           jurosParcela = @JurosParcela
	 WHERE idProdPag    = @IdProdPag
       AND PRODUTO_PAGAMENTO.idPagamento NOT IN (SELECT idPagamento 
                                                   FROM PAGAMENTO
                                                  WHERE descrPagamento LIKE '%Combinar%');;
  END ELSE
  IF (@Acao = 'D')
  BEGIN
    DELETE FROM dbo.PRODUTO_PAGAMENTO
          WHERE PRODUTO_PAGAMENTO.idProdPag = @IdProdPag
            AND PRODUTO_PAGAMENTO.idPagamento NOT IN (SELECT idPagamento 
                                                        FROM PAGAMENTO
                                                       WHERE descrPagamento LIKE '%Combinar%');
  END
END