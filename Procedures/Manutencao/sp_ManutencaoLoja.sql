USE VITRINE
GO

IF OBJECT_ID('dbo.sp_ManutencaoLoja', 'P') IS NOT NULL
    DROP PROCEDURE dbo.sp_ManutencaoLoja;
GO

CREATE PROCEDURE dbo.sp_ManutencaoLoja @Acao         CHAR(1),--"I" para Insert, "U" para Update
									   @IdLoja       INT,
									   @IdUsuario    INT,
									   @BannerLoja   VARCHAR(150),
									   @LogoLoja	 VARCHAR(150),
									   @RazaoSocial  VARCHAR(150),
									   @NomeFantasia VARCHAR(150),
									   @FoneLoja	 VARCHAR(12),
									   @SiteLoja	 VARCHAR(70),
									   @CepLoja	     VARCHAR(12),
									   @UfLoja		 CHAR(2),
									   @CidLoja	     VARCHAR(150),
									   @EnderLoja	 VARCHAR(120),
									   @NumLoja	     INT,
									   @ComplLoja	 VARCHAR(15),
									   @BairroLoja	 VARCHAR(80)
WITH ENCRYPTION AS 
BEGIN  
  IF (@Acao = 'I')
  BEGIN
    INSERT INTO dbo.LOJA(
                         idUsuario,
           				 bannerLoja,
           				 logoLoja,
           				 razaoSocial,
           				 nomeFantasia,
           				 foneLoja,
           				 siteLoja,
           				 cepLoja,
           				 ufLoja,
           				 cidLoja,
           				 enderLoja,
           				 numLoja,
           				 complLoja,
           				 bairroLoja
                         )
                  VALUES(
                         @IdUsuario,
           				 @BannerLoja,
           				 @LogoLoja,
           				 @RazaoSocial,
           				 @NomeFantasia,
           				 @FoneLoja,
           				 @SiteLoja,
           				 @CepLoja,
           				 @UfLoja,
           				 @CidLoja,
           				 @EnderLoja,
           				 @NumLoja,
           				 @ComplLoja,
           				 @BairroLoja
                        );
  END ELSE
  IF (@Acao = 'U')
  BEGIN
	UPDATE dbo.LOJA
	   SET idUsuario    = @IdUsuario,
		   bannerLoja   = @BannerLoja,
		   logoLoja     = @LogoLoja,
		   razaoSocial  = @RazaoSocial,
		   nomeFantasia = @NomeFantasia,
		   foneLoja     = @FoneLoja,
		   siteLoja     = @SiteLoja,
		   cepLoja      = @CepLoja,
		   ufLoja       = @UfLoja,
		   cidLoja      = @CidLoja,
		   enderLoja    = @EnderLoja,
		   numLoja      = @NumLoja,
		   complLoja    = @ComplLoja,
		   bairroLoja   = @BairroLoja
	 WHERE IdLoja = @IdLoja
  END  
END