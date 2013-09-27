USE VITRINE
GO

IF OBJECT_ID('dbo.sp_ManutencaoUsuario', 'P') IS NOT NULL
    DROP PROCEDURE dbo.sp_ManutencaoUsuario;
GO

CREATE PROCEDURE dbo.sp_ManutencaoUsuario @Acao            CHAR(1),--"I" para Insert, "U" para Update
                                          @IdUsuario       INT, 
                                          @IdPergunta      INT,
                                          @RespostaUsuario VARCHAR(70),
                                          @TipoUsuario     CHAR(1)     = NULL,
                                          @DocUsuario      VARCHAR(15) = NULL,
                                          @EmailUsuario    VARCHAR(70) = NULL,
                                          @SenhaUsuario    VARCHAR(20),
                                          @GuidUsuario     VARCHAR(50),
                                          @AtivoUsuario    BIT
WITH ENCRYPTION AS
BEGIN
  IF (@Acao = 'I')
  BEGIN
    INSERT INTO dbo.USUARIO(idPergunta,
                            respostaUsuario,
                            tipoUsuario,
                            docUsuario,
                            emailUsuario,
                            senhaUsuario,
                            guidUsuario,
                            ativoUsuario)
                     VALUES(@IdPergunta,     
                            @RespostaUsuario,
                            @TipoUsuario,    
                            @DocUsuario,     
                            @EmailUsuario,   
                            @SenhaUsuario,   
                            @GuidUsuario,
                            @AtivoUsuario);
  END ELSE
  IF (@Acao = 'U')
  BEGIN
    UPDATE dbo.USUARIO
       SET idPergunta      = @IdPergunta,   
           respostaUsuario = @RespostaUsuario,
           senhaUsuario    = @SenhaUsuario,   
           ativoUsuario    = @AtivoUsuario
     WHERE idUsuario       = @IdUsuario;
  END
END