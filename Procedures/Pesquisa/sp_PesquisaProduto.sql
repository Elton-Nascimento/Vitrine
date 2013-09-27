USE VITRINE
GO

IF OBJECT_ID('dbo.sp_PesquisaProduto', 'P') IS NOT NULL
    DROP PROCEDURE dbo.sp_PesquisaProduto;
GO

CREATE PROCEDURE dbo.sp_PesquisaProduto @IdCategoria  INT = NULL,
                                        @DescrProduto VARCHAR(150)
WITH ENCRYPTION AS
BEGIN
         SELECT PRODUTO.idProduto,
                PRODUTO.idCategoria,
                PRODUTO.descrProduto,
                PRODUTO.qtdeEstoque,
                PRODUTO.valorVenda,
                PRODUTO.likeProduto,
                PRODUTO.unlikeProduto,
                CATEGORIA.descrCategoria,
                IMAGENS.localImagem
           FROM PRODUTO(NOLOCK)
          INNER JOIN CATEGORIA
             ON PRODUTO.idCategoria = CATEGORIA.idCategoria
          INNER JOIN IMAGENS
             ON PRODUTO.idProduto = IMAGENS.idProduto
          WHERE PRODUTO.ativoProduto = 1
            AND qtdeEstoque > 0
            AND IMAGENS.partImagem = 1
            AND PRODUTO.idCategoria = ISNULL(@IdCategoria,PRODUTO.idCategoria)
            AND PRODUTO.descrProduto LIKE '%' + ISNULL(@DescrProduto,'') + '%';
END