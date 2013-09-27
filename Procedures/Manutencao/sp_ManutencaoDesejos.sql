USE VITRINE
GO

IF OBJECT_ID('dbo.sp_ManutencaoDesejos', 'P') IS NOT NULL
    DROP PROCEDURE dbo.sp_ManutencaoDesejos;
GO

CREATE PROCEDURE dbo.sp_ManutencaoDesejos @Acao      CHAR(1),--"I" para Insert, "D" para Update
                                          @IdDesejo  INT = 0,
                                          @IdUsuario INT = 0,
                                          @IdProduto INT
WITH ENCRYPTION AS
BEGIN
  DECLARE @IdConsumidor INT;

   SELECT @IdConsumidor = idConsumidor
     FROM CONSUMIDOR
    WHERE idUsuario = @IdUsuario

  IF (@Acao = 'I')
  BEGIN
    IF NOT EXISTS(SELECT 1
                    FROM dbo.DESEJOS
                   WHERE idProduto = @IdProduto)
    BEGIN
        INSERT INTO dbo.DESEJOS(idConsumidor,
                                idProduto)
                         VALUES(@IdConsumidor,
                                @IdProduto);
    END
  END ELSE
  IF (@Acao = 'D')
  BEGIN
    DELETE FROM dbo.DESEJOS 
          WHERE idDesejo = @IdDesejo
  END
END