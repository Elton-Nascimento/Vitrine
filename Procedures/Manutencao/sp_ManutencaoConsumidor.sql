USE VITRINE
GO

IF OBJECT_ID('dbo.sp_ManutencaoConsumidor', 'P') IS NOT NULL
    DROP PROCEDURE dbo.sp_ManutencaoConsumidor;
GO

CREATE PROCEDURE dbo.sp_ManutencaoConsumidor @Acao             CHAR(1),--"I" para Insert, "U" para Update
				                             @IdConsumidor     INT,
									         @IdUsuario        INT,
									         @NomeConsumidor   VARCHAR(150),
									         @DtNascimento     DATETIME,
									         @TelConsumidor    VARCHAR(12),
									         @CelConsumidor    VARCHAR(12),
									         @CepConsumidor    VARCHAR(10),
									         @UfConsumidor     CHAR(2),
									         @CidConsumidor    VARCHAR(150),
									         @EnderConsumidor  VARCHAR(120),
									         @NumConsumidor    INT,
									         @ComplConsumidor  VARCHAR(15),
                                             @BairroConsumidor VARCHAR(80),
                                             @SexoConsumidor   CHAR(2)
WITH ENCRYPTION AS 
BEGIN  
  IF (@Acao = 'I')
  BEGIN
    INSERT INTO dbo.CONSUMIDOR(idUsuario,
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
                               sexoConsumidor)
                        VALUES(@IdUsuario,
                               @NomeConsumidor,
                               @DtNascimento,    
                               @TelConsumidor,   
                               @CelConsumidor,   
                               @CepConsumidor,   
                               @UfConsumidor,    
                               @CidConsumidor,   
                               @EnderConsumidor, 
                               @NumConsumidor,   
                               @ComplConsumidor, 
                               @BairroConsumidor,
                               @SexoConsumidor);
  END ELSE
  IF (@Acao = 'U')
  BEGIN
	UPDATE dbo.CONSUMIDOR
	   SET nomeConsumidor = @NomeConsumidor,  
         dtNascimento     = @DtNascimento,    
         telConsumidor    = @TelConsumidor,   
         celConsumidor    = @CelConsumidor,   
         cepConsumidor    = @CepConsumidor,   
         ufConsumidor     = @UfConsumidor,    
         cidConsumidor    = @CidConsumidor,   
         enderConsumidor  = @EnderConsumidor, 
         numConsumidor    = @NumConsumidor,   
         complConsumidor  = @ComplConsumidor, 
         bairroConsumidor = @BairroConsumidor,
         sexoConsumidor   = @SexoConsumidor
	 WHERE IdConsumidor   = @IdConsumidor
  END  
END