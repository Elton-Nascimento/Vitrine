USE VITRINE
GO

IF OBJECT_ID('dbo.sp_ConsultaProduto', 'P') IS NOT NULL
    DROP PROCEDURE dbo.sp_ConsultaProduto;
GO

CREATE PROCEDURE dbo.sp_ConsultaProduto @IdProduto    INT          = 0,
                                        @IdCategoria  INT          = 0,
                                        @DescrProduto VARCHAR(150) = NULL,
                                        @IdLoja       INT          = 0
WITH ENCRYPTION AS
BEGIN
SELECT PRODUTO.idProduto,
       PRODUTO.idLoja,
       PRODUTO.idCategoria,
       PRODUTO.descrProduto,
       PRODUTO.qtdeEstoque,
       PRODUTO.valorCusto,
       PRODUTO.valorVenda,
       PRODUTO.freteGratis,
       PRODUTO.likeProduto,
       PRODUTO.unlikeProduto,
       PRODUTO.ativoProduto,
       CATEGORIA.descrCategoria
  FROM PRODUTO(NOLOCK)
 INNER JOIN CATEGORIA
    ON CATEGORIA.idCategoria = PRODUTO.idCategoria
 WHERE PRODUTO.idProduto = CASE 
                             WHEN @IdProduto = 0 THEN PRODUTO.idProduto
                             ELSE @IdProduto
                           END
   AND PRODUTO.idCategoria = CASE 
                              WHEN @IdCategoria = 0 THEN PRODUTO.idCategoria
                              ELSE @IdCategoria
                             END
   AND PRODUTO.descrProduto LIKE '%'+ISNULL(@DescrProduto,'')+'%'
   AND PRODUTO.idLoja = CASE 
                          WHEN @IdLoja = 0 THEN PRODUTO.idLoja
                          ELSE @IdLoja
                        END;
END