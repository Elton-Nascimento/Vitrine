USE VITRINE
GO

IF OBJECT_ID('dbo.sp_TransferenciaPedido', 'P') IS NOT NULL
    DROP PROCEDURE dbo.sp_TransferenciaPedido;
GO

CREATE PROCEDURE dbo.sp_TransferenciaPedido @Acao          VARCHAR(10), --// "Carrinho" transferir produtos para o carrinho, "Compra" efetuar a compra.
                                            @IdUsuario     INT,
                                            @IdPedido      INT
WITH ENCRYPTION AS 
BEGIN
    DECLARE @Consumidor INT;

    SELECT @Consumidor = idConsumidor
      FROM dbo.CONSUMIDOR
     WHERE idUsuario = @IdUsuario;

    IF(@Acao = 'Carrinho')
    BEGIN
        UPDATE dbo.PEDIDO SET idConsumidor  = @Consumidor,
                              guidVisitante = NULL
                        WHERE idPedido = @IdPedido;
    END ELSE
    IF(@Acao = 'Compra')
    BEGIN
        UPDATE dbo.PEDIDO SET idConsumidor = @Consumidor,
                              guidVisitante = NULL,
                              ativoPedido  = 1
                        WHERE idPedido = @IdPedido;

        UPDATE dbo.ITENS_PEDIDO SET sitPedido = 'Aguardando classificação do Lojista.'
                              WHERE idPedido = @IdPedido;
    END
END