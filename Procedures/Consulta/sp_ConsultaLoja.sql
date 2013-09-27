USE VITRINE
GO

IF OBJECT_ID('dbo.sp_ConsultaLoja', 'P') IS NOT NULL
    DROP PROCEDURE dbo.sp_ConsultaLoja;
GO

CREATE PROCEDURE dbo.sp_ConsultaLoja @IdUsuario INT = 0,
                                     @IdLoja    INT = 0
                                     
WITH ENCRYPTION AS
BEGIN
    SELECT LOJA.idLoja,
           LOJA.idUsuario,
           LOJA.bannerLoja,
           LOJA.logoLoja,
           LOJA.razaoSocial,
           LOJA.nomeFantasia,
           LOJA.foneLoja,
           LOJA.siteLoja,
           LOJA.cepLoja,
           LOJA.ufLoja,
           LOJA.cidLoja,
           LOJA.enderLoja,
           LOJA.numLoja,
           LOJA.complLoja,
           LOJA.bairroLoja
      FROM LOJA(NOLOCK)
      LEFT OUTER JOIN PRODUTO(NOLOCK)
        ON LOJA.idLoja = PRODUTO.idLoja
     WHERE LOJA.idUsuario = CASE 
                              WHEN @IdUsuario = 0 THEN LOJA.idUsuario
                              ELSE @IdUsuario
                            END
       AND LOJA.idLoja = CASE 
                           WHEN @IdLoja = 0 THEN LOJA.idLoja
                           ELSE @IdLoja
                         END;
END