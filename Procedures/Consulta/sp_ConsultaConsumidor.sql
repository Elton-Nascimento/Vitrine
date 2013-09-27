USE VITRINE
GO

IF OBJECT_ID('dbo.sp_ConsultaConsumidor', 'P') IS NOT NULL
    DROP PROCEDURE dbo.sp_ConsultaConsumidor;
GO

CREATE PROCEDURE dbo.sp_ConsultaConsumidor @IdUsuario INT
WITH ENCRYPTION AS
BEGIN
  IF (ISNULL(@IdUsuario,0) = 0)
  BEGIN
    SELECT TOP 200
           idConsumidor,
           idUsuario,
           nomeConsumidor,
           dtNascimento,
           telConsumidor,
           celConsumidor,
           cepConsumidor,
           ufConsumidor,
           cidConsumidor,
           enderConsumidor,
           numConsumidor,
           complConsumidor,
           bairroConsumidor,
           sexoConsumidor
      FROM dbo.CONSUMIDOR(NOLOCK);
  END ELSE
  BEGIN
    SELECT idConsumidor,
           idUsuario,
           nomeConsumidor,
           dtNascimento,
           telConsumidor,
           celConsumidor,
           cepConsumidor,
           ufConsumidor,
           cidConsumidor,
           enderConsumidor,
           numConsumidor,
           complConsumidor,
           bairroConsumidor,
           sexoConsumidor
      FROM dbo.CONSUMIDOR(NOLOCK)
     WHERE idUsuario = @IdUsuario;
  END
END