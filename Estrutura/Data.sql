USE [VITRINE]
GO
SET IDENTITY_INSERT [dbo].[CATEGORIA] ON 

GO
INSERT [dbo].[CATEGORIA] ([idCategoria], [descrCategoria], [CategoriaPai]) VALUES (1, N'Computadores', NULL)
GO
INSERT [dbo].[CATEGORIA] ([idCategoria], [descrCategoria], [CategoriaPai]) VALUES (2, N'Monitores', 1)
GO
INSERT [dbo].[CATEGORIA] ([idCategoria], [descrCategoria], [CategoriaPai]) VALUES (3, N'Mouse/Teclado', 1)
GO
INSERT [dbo].[CATEGORIA] ([idCategoria], [descrCategoria], [CategoriaPai]) VALUES (4, N'Drivers', 1)
GO
INSERT [dbo].[CATEGORIA] ([idCategoria], [descrCategoria], [CategoriaPai]) VALUES (5, N'Coolers', 1)
GO
INSERT [dbo].[CATEGORIA] ([idCategoria], [descrCategoria], [CategoriaPai]) VALUES (6, N'Memorias', 1)
GO
INSERT [dbo].[CATEGORIA] ([idCategoria], [descrCategoria], [CategoriaPai]) VALUES (7, N'MotherBoard', 1)
GO
INSERT [dbo].[CATEGORIA] ([idCategoria], [descrCategoria], [CategoriaPai]) VALUES (8, N'Processadores', 1)
GO
INSERT [dbo].[CATEGORIA] ([idCategoria], [descrCategoria], [CategoriaPai]) VALUES (9, N'Placas de video e captura', 1)
GO
INSERT [dbo].[CATEGORIA] ([idCategoria], [descrCategoria], [CategoriaPai]) VALUES (10, N'Armazenamento de Dados', NULL)
GO
INSERT [dbo].[CATEGORIA] ([idCategoria], [descrCategoria], [CategoriaPai]) VALUES (11, N'Cartão de Memoria', 10)
GO
INSERT [dbo].[CATEGORIA] ([idCategoria], [descrCategoria], [CategoriaPai]) VALUES (12, N'Gravadores DVD/CD', 10)
GO
INSERT [dbo].[CATEGORIA] ([idCategoria], [descrCategoria], [CategoriaPai]) VALUES (13, N'Hard Disks', 10)
GO
INSERT [dbo].[CATEGORIA] ([idCategoria], [descrCategoria], [CategoriaPai]) VALUES (15, N'Pen Drivers', 10)
GO
INSERT [dbo].[CATEGORIA] ([idCategoria], [descrCategoria], [CategoriaPai]) VALUES (16, N'SDD', 10)
GO
INSERT [dbo].[CATEGORIA] ([idCategoria], [descrCategoria], [CategoriaPai]) VALUES (17, N'Eletronicos', NULL)
GO
INSERT [dbo].[CATEGORIA] ([idCategoria], [descrCategoria], [CategoriaPai]) VALUES (18, N'Televisões', 17)
GO
INSERT [dbo].[CATEGORIA] ([idCategoria], [descrCategoria], [CategoriaPai]) VALUES (19, N'Filmadoras', 17)
GO
INSERT [dbo].[CATEGORIA] ([idCategoria], [descrCategoria], [CategoriaPai]) VALUES (20, N'GPS', 17)
GO
INSERT [dbo].[CATEGORIA] ([idCategoria], [descrCategoria], [CategoriaPai]) VALUES (21, N'Vídeo-Games', 17)
GO
INSERT [dbo].[CATEGORIA] ([idCategoria], [descrCategoria], [CategoriaPai]) VALUES (22, N'Home Theaters', 17)
GO
INSERT [dbo].[CATEGORIA] ([idCategoria], [descrCategoria], [CategoriaPai]) VALUES (23, N'Eletrodomésticos', NULL)
GO
INSERT [dbo].[CATEGORIA] ([idCategoria], [descrCategoria], [CategoriaPai]) VALUES (24, N'Fogões', 23)
GO
INSERT [dbo].[CATEGORIA] ([idCategoria], [descrCategoria], [CategoriaPai]) VALUES (25, N'Lavadoras', 23)
GO
INSERT [dbo].[CATEGORIA] ([idCategoria], [descrCategoria], [CategoriaPai]) VALUES (26, N'Microondas', 23)
GO
INSERT [dbo].[CATEGORIA] ([idCategoria], [descrCategoria], [CategoriaPai]) VALUES (27, N'Secadora', 23)
GO
INSERT [dbo].[CATEGORIA] ([idCategoria], [descrCategoria], [CategoriaPai]) VALUES (28, N'Refrigeradores', 23)
GO
INSERT [dbo].[CATEGORIA] ([idCategoria], [descrCategoria], [CategoriaPai]) VALUES (29, N'Forno Elétrico', 23)
GO
INSERT [dbo].[CATEGORIA] ([idCategoria], [descrCategoria], [CategoriaPai]) VALUES (30, N'Bebedouros / Purificadores', 23)
GO
INSERT [dbo].[CATEGORIA] ([idCategoria], [descrCategoria], [CategoriaPai]) VALUES (31, N'Lazer', NULL)
GO
INSERT [dbo].[CATEGORIA] ([idCategoria], [descrCategoria], [CategoriaPai]) VALUES (32, N'Piscinas', 31)
GO
INSERT [dbo].[CATEGORIA] ([idCategoria], [descrCategoria], [CategoriaPai]) VALUES (33, N'Churrasqueiras', 31)
GO
INSERT [dbo].[CATEGORIA] ([idCategoria], [descrCategoria], [CategoriaPai]) VALUES (34, N'Bicicletas', 31)
GO
INSERT [dbo].[CATEGORIA] ([idCategoria], [descrCategoria], [CategoriaPai]) VALUES (35, N'Barracas', 31)
GO
INSERT [dbo].[CATEGORIA] ([idCategoria], [descrCategoria], [CategoriaPai]) VALUES (36, N'Ferramentas', NULL)
GO
INSERT [dbo].[CATEGORIA] ([idCategoria], [descrCategoria], [CategoriaPai]) VALUES (37, N'Alicates', 36)
GO
INSERT [dbo].[CATEGORIA] ([idCategoria], [descrCategoria], [CategoriaPai]) VALUES (38, N'Kit de ferramentas', 36)
GO
INSERT [dbo].[CATEGORIA] ([idCategoria], [descrCategoria], [CategoriaPai]) VALUES (39, N'Trena', 36)
GO
INSERT [dbo].[CATEGORIA] ([idCategoria], [descrCategoria], [CategoriaPai]) VALUES (40, N'Spray / Tintas / Verniz', 36)
GO
INSERT [dbo].[CATEGORIA] ([idCategoria], [descrCategoria], [CategoriaPai]) VALUES (41, N'Parafusadeiras', 36)
GO
INSERT [dbo].[CATEGORIA] ([idCategoria], [descrCategoria], [CategoriaPai]) VALUES (42, N'Mangueira', 36)
GO
INSERT [dbo].[CATEGORIA] ([idCategoria], [descrCategoria], [CategoriaPai]) VALUES (43, N'Tênis', NULL)
GO
INSERT [dbo].[CATEGORIA] ([idCategoria], [descrCategoria], [CategoriaPai]) VALUES (44, N'Aventura', 43)
GO
INSERT [dbo].[CATEGORIA] ([idCategoria], [descrCategoria], [CategoriaPai]) VALUES (45, N'Casual', 43)
GO
INSERT [dbo].[CATEGORIA] ([idCategoria], [descrCategoria], [CategoriaPai]) VALUES (46, N'Infantil', 43)
GO
INSERT [dbo].[CATEGORIA] ([idCategoria], [descrCategoria], [CategoriaPai]) VALUES (47, N'Sapatênis', 43)
GO
INSERT [dbo].[CATEGORIA] ([idCategoria], [descrCategoria], [CategoriaPai]) VALUES (48, N'Roupas', NULL)
GO
INSERT [dbo].[CATEGORIA] ([idCategoria], [descrCategoria], [CategoriaPai]) VALUES (49, N'Camisetas', 48)
GO
INSERT [dbo].[CATEGORIA] ([idCategoria], [descrCategoria], [CategoriaPai]) VALUES (50, N'Jaquetas', 48)
GO
INSERT [dbo].[CATEGORIA] ([idCategoria], [descrCategoria], [CategoriaPai]) VALUES (51, N'Calças', 48)
GO
INSERT [dbo].[CATEGORIA] ([idCategoria], [descrCategoria], [CategoriaPai]) VALUES (52, N'Bermudas', 48)
GO
INSERT [dbo].[CATEGORIA] ([idCategoria], [descrCategoria], [CategoriaPai]) VALUES (53, N'Regatas', 48)
GO
INSERT [dbo].[CATEGORIA] ([idCategoria], [descrCategoria], [CategoriaPai]) VALUES (54, N'Vestidos', 48)
GO
INSERT [dbo].[CATEGORIA] ([idCategoria], [descrCategoria], [CategoriaPai]) VALUES (55, N'Agasalhos', 48)
GO
INSERT [dbo].[CATEGORIA] ([idCategoria], [descrCategoria], [CategoriaPai]) VALUES (56, N'Acessórios', NULL)
GO
INSERT [dbo].[CATEGORIA] ([idCategoria], [descrCategoria], [CategoriaPai]) VALUES (57, N'Bonés', 56)
GO
INSERT [dbo].[CATEGORIA] ([idCategoria], [descrCategoria], [CategoriaPai]) VALUES (58, N'Bolsas', 56)
GO
INSERT [dbo].[CATEGORIA] ([idCategoria], [descrCategoria], [CategoriaPai]) VALUES (59, N'Carteiras', 56)
GO
INSERT [dbo].[CATEGORIA] ([idCategoria], [descrCategoria], [CategoriaPai]) VALUES (60, N'Cintos', 56)
GO
INSERT [dbo].[CATEGORIA] ([idCategoria], [descrCategoria], [CategoriaPai]) VALUES (61, N'Mochilas', 56)
GO
INSERT [dbo].[CATEGORIA] ([idCategoria], [descrCategoria], [CategoriaPai]) VALUES (62, N'Relógios', 56)
GO
INSERT [dbo].[CATEGORIA] ([idCategoria], [descrCategoria], [CategoriaPai]) VALUES (63, N'Óculos', 56)
GO
SET IDENTITY_INSERT [dbo].[CATEGORIA] OFF
GO
SET IDENTITY_INSERT [dbo].[PERGUNTA] ON 

GO
INSERT [dbo].[PERGUNTA] ([idPergunta], [descrPergunta]) VALUES (1, N'Qual o nome da sua mãe?')
GO
INSERT [dbo].[PERGUNTA] ([idPergunta], [descrPergunta]) VALUES (2, N'Qual sua comida favorita?')
GO
INSERT [dbo].[PERGUNTA] ([idPergunta], [descrPergunta]) VALUES (3, N'Qual estado nasci?')
GO
INSERT [dbo].[PERGUNTA] ([idPergunta], [descrPergunta]) VALUES (4, N'Qual meu primeiro amigo de infancia?')
GO
INSERT [dbo].[PERGUNTA] ([idPergunta], [descrPergunta]) VALUES (5, N'Qual a primeira escola onde estudei?')
GO
INSERT [dbo].[PERGUNTA] ([idPergunta], [descrPergunta]) VALUES (6, N'Qual o nome do meu animal de estimação?')
GO
SET IDENTITY_INSERT [dbo].[PERGUNTA] OFF
GO
SET IDENTITY_INSERT [dbo].[USUARIO] ON 

GO
INSERT [dbo].[USUARIO] ([idUsuario], [idPergunta], [respostaUsuario], [tipoUsuario], [docUsuario], [emailUsuario], [senhaUsuario], [guidUsuario], [dtUsuario], [ativoUsuario]) VALUES (1, 2, N'Graviola', N'J', N'47543889000117', N'infomaniacos@gmail.com', N'123456', N'5788EE2A-B6D8-4E05-B433-DD3B735E8758', CAST(0x0000A10F016C69D7 AS DateTime), 1)
GO
INSERT [dbo].[USUARIO] ([idUsuario], [idPergunta], [respostaUsuario], [tipoUsuario], [docUsuario], [emailUsuario], [senhaUsuario], [guidUsuario], [dtUsuario], [ativoUsuario]) VALUES (2, 4, N'Daniela', N'J', N'76183320000196', N'atendimento.rt@gmail.com', N'123456', N'927C188B-39B8-4E37-BE3B-D82F2A5B2343', CAST(0x0000A0E3016CD758 AS DateTime), 1)
GO
INSERT [dbo].[USUARIO] ([idUsuario], [idPergunta], [respostaUsuario], [tipoUsuario], [docUsuario], [emailUsuario], [senhaUsuario], [guidUsuario], [dtUsuario], [ativoUsuario]) VALUES (3, 3, N'Rio de Janeiro', N'J', N'51971614000151', N'chat.roupasecia@hotmail.com', N'123456', N'BE1FDC3D-A47E-4D5B-B3F8-CB91FE3734DE', CAST(0x0000A0E5016E2A03 AS DateTime), 0)
GO
INSERT [dbo].[USUARIO] ([idUsuario], [idPergunta], [respostaUsuario], [tipoUsuario], [docUsuario], [emailUsuario], [senhaUsuario], [guidUsuario], [dtUsuario], [ativoUsuario]) VALUES (4, 3, N'Pernambuco', N'J', N'53033243000192', N'ferramentas@gmail.com', N'123456', N'98086756-E9E4-4334-A6D1-406647614DBC', CAST(0x0000A10F016E7DF2 AS DateTime), 1)
GO
INSERT [dbo].[USUARIO] ([idUsuario], [idPergunta], [respostaUsuario], [tipoUsuario], [docUsuario], [emailUsuario], [senhaUsuario], [guidUsuario], [dtUsuario], [ativoUsuario]) VALUES (6, 2, N'Macarrão', N'F', N'94133544560', N'rjne92@yahoo.com.br', N'123456', N'F9AF9E79-8E81-4C32-8FF4-CEA93C54B9C3', CAST(0x0000A0F801682BCE AS DateTime), 1)
GO
INSERT [dbo].[USUARIO] ([idUsuario], [idPergunta], [respostaUsuario], [tipoUsuario], [docUsuario], [emailUsuario], [senhaUsuario], [guidUsuario], [dtUsuario], [ativoUsuario]) VALUES (7, 1, N'Silvia', N'F', N'23562446209', N'ferinformatica@infofer.com', N'123456', N'6F72954D-8E9D-44EE-A894-C235FA0CA59C', CAST(0x0000A0EF016695D3 AS DateTime), 1)
GO
INSERT [dbo].[USUARIO] ([idUsuario], [idPergunta], [respostaUsuario], [tipoUsuario], [docUsuario], [emailUsuario], [senhaUsuario], [guidUsuario], [dtUsuario], [ativoUsuario]) VALUES (8, 6, N'Thor', N'F', N'89376475402', N'renatodsilva@hotmail.com', N'123456', N'81E91B88-D680-48B1-8AFC-B66E9963FD96', CAST(0x0000A0E50166F674 AS DateTime), 1)
GO
INSERT [dbo].[USUARIO] ([idUsuario], [idPergunta], [respostaUsuario], [tipoUsuario], [docUsuario], [emailUsuario], [senhaUsuario], [guidUsuario], [dtUsuario], [ativoUsuario]) VALUES (9, 5, N'E.E. Mario de Andrade', N'F', N'79359148180', N'jessica_moreira@live.com', N'123456', N'4B60C03D-A9EA-4CF1-9268-C94C3382035C', CAST(0x0000A0F901677E42 AS DateTime), 0)
GO
INSERT [dbo].[USUARIO] ([idUsuario], [idPergunta], [respostaUsuario], [tipoUsuario], [docUsuario], [emailUsuario], [senhaUsuario], [guidUsuario], [dtUsuario], [ativoUsuario]) VALUES (10, 3, N'Amazonas', N'F', N'22371274330', N'mariasilvasantos@gmail.com', N'123456', N'AF8D0DDD-5EEA-4EED-BFF3-4E727454F6F0', CAST(0x0000A0F80167E25F AS DateTime), 1)
GO
INSERT [dbo].[USUARIO] ([idUsuario], [idPergunta], [respostaUsuario], [tipoUsuario], [docUsuario], [emailUsuario], [senhaUsuario], [guidUsuario], [dtUsuario], [ativoUsuario]) VALUES (11, 4, N'Rodrigo', N'F', N'73771492300', N'heloisa.silveira@terra.com.br', N'123456', N'5F65D6F8-FB25-4561-A76D-B3CB4560D617', CAST(0x0000A0EE01689918 AS DateTime), 1)
GO
INSERT [dbo].[USUARIO] ([idUsuario], [idPergunta], [respostaUsuario], [tipoUsuario], [docUsuario], [emailUsuario], [senhaUsuario], [guidUsuario], [dtUsuario], [ativoUsuario]) VALUES (12, 3, N'SP', N'F', N'23816514200', N'gabrielxfds@gmail.com', N'123456', N'c05537a0-72b2-4133-bbff-635265347cc1', CAST(0x0000A115016C0230 AS DateTime), 1)
GO
INSERT [dbo].[USUARIO] ([idUsuario], [idPergunta], [respostaUsuario], [tipoUsuario], [docUsuario], [emailUsuario], [senhaUsuario], [guidUsuario], [dtUsuario], [ativoUsuario]) VALUES (13, 3, N'sp', N'F', N'40268807884', N'eltongarbin@gmail.com', N'123456', N'd8b671fc-f44a-41f9-80df-575171fd3e8e', CAST(0x0000A116014F0502 AS DateTime), 0)
GO
INSERT [dbo].[USUARIO] ([idUsuario], [idPergunta], [respostaUsuario], [tipoUsuario], [docUsuario], [emailUsuario], [senhaUsuario], [guidUsuario], [dtUsuario], [ativoUsuario]) VALUES (14, 3, N'SP', N'J', N'88385531000190', N'empresa@sac.com', N'123456', N'cb265727-3549-4833-9033-74a027c44328', CAST(0x0000A1160150366E AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[USUARIO] OFF
GO
SET IDENTITY_INSERT [dbo].[LOJA] ON 

GO
INSERT [dbo].[LOJA] ([idLoja], [idUsuario], [bannerLoja], [logoLoja], [razaoSocial], [nomeFantasia], [foneLoja], [siteLoja], [cepLoja], [ufLoja], [cidLoja], [enderLoja], [numLoja], [complLoja], [bairroLoja]) VALUES (10, 1, N'~/Content/Imagens/BannerPadrao.jpg', N'~/Content/Imagens/logoPadraoLoja.jpg', N'Infomaniacos Informatica SA', N'Infomaniacos Informatica LTDA', N'34912588', N'www.informaniacos.com.br', N'17601430', N'SP', N'Tupã', N'Rua Caingangs', 587, N'', N'Vila Naibra')
GO
INSERT [dbo].[LOJA] ([idLoja], [idUsuario], [bannerLoja], [logoLoja], [razaoSocial], [nomeFantasia], [foneLoja], [siteLoja], [cepLoja], [ufLoja], [cidLoja], [enderLoja], [numLoja], [complLoja], [bairroLoja]) VALUES (11, 2, N'~/Content/Imagens/BannerPadrao.jpg', N'~/Content/Imagens/logoPadraoLoja.jpg', N'Roupas Tupã', N'Roupas Tupã', N'34412549', NULL, N'17601-000', N'SP', N'Tupã', N'Av. Tamoios', 777, NULL, N'Centro')
GO
INSERT [dbo].[LOJA] ([idLoja], [idUsuario], [bannerLoja], [logoLoja], [razaoSocial], [nomeFantasia], [foneLoja], [siteLoja], [cepLoja], [ufLoja], [cidLoja], [enderLoja], [numLoja], [complLoja], [bairroLoja]) VALUES (12, 3, N'~/Content/Imagens/BannerPadrao.jpg', N'~/Content/Imagens/logoPadraoLoja.jpg', N'Roupas e CIA', N'Roupas & Cia', N'34042259', NULL, N'17603-430', N'SP', N'Tupã', N'Rua Bruno Zoner', 550, NULL, N'Conjunto Habitacional Cinqüentenário')
GO
INSERT [dbo].[LOJA] ([idLoja], [idUsuario], [bannerLoja], [logoLoja], [razaoSocial], [nomeFantasia], [foneLoja], [siteLoja], [cepLoja], [ufLoja], [cidLoja], [enderLoja], [numLoja], [complLoja], [bairroLoja]) VALUES (13, 4, N'~/Content/Imagens/BannerPadrao.jpg', N'~/Content/Imagens/logoPadraoLoja.jpg', N'Ferragens e Ferramentas Bolao', N'Ferragens & Ferramentas Bolao', N'34912581', NULL, N'17605-240', N'SP', N'Tupã', N'Av. Brasílio Machado Neto', 958, NULL, N'Jardim América')
GO
SET IDENTITY_INSERT [dbo].[LOJA] OFF
GO
SET IDENTITY_INSERT [dbo].[PRODUTO] ON 

GO
INSERT [dbo].[PRODUTO] ([idProduto], [idLoja], [idCategoria], [descrProduto], [qtdeEstoque], [valorCusto], [valorVenda], [freteGratis], [likeProduto], [unlikeProduto], [ativoProduto]) VALUES (1, 10, 19, N'Camera Profissional', 1, 1500.0000, 2550.0000, 0, 1, 0, 1)
GO
INSERT [dbo].[PRODUTO] ([idProduto], [idLoja], [idCategoria], [descrProduto], [qtdeEstoque], [valorCusto], [valorVenda], [freteGratis], [likeProduto], [unlikeProduto], [ativoProduto]) VALUES (2, 10, 1, N'Camera Profissional', 1, 1500.0000, 2550.0000, 0, 1, 0, 1)
GO
INSERT [dbo].[PRODUTO] ([idProduto], [idLoja], [idCategoria], [descrProduto], [qtdeEstoque], [valorCusto], [valorVenda], [freteGratis], [likeProduto], [unlikeProduto], [ativoProduto]) VALUES (3, 10, 1, N'Notebook', 1, 1000.0000, 1500.0000, 0, 1, 0, 1)
GO
INSERT [dbo].[PRODUTO] ([idProduto], [idLoja], [idCategoria], [descrProduto], [qtdeEstoque], [valorCusto], [valorVenda], [freteGratis], [likeProduto], [unlikeProduto], [ativoProduto]) VALUES (4, 10, 3, N'Teclado', 10, 20.0000, 25.0000, 1, 1, 0, 1)
GO
SET IDENTITY_INSERT [dbo].[PRODUTO] OFF
GO
SET IDENTITY_INSERT [dbo].[CONSUMIDOR] ON 

GO
INSERT [dbo].[CONSUMIDOR] ([idConsumidor], [idUsuario], [nomeConsumidor], [dtNascimento], [telConsumidor], [celConsumidor], [cepConsumidor], [ufConsumidor], [cidConsumidor], [enderConsumidor], [numConsumidor], [complConsumidor], [bairroConsumidor], [sexoConsumidor]) VALUES (1, 6, N'Regeane', CAST(0x000080FE00000000 AS DateTime), N'1434415648', N'14966154890', N'17603120', N'SP', N'Tupã', N'Rua David Caran', 110, N'', N'Vila Tupã Mirim I', NULL)
GO
INSERT [dbo].[CONSUMIDOR] ([idConsumidor], [idUsuario], [nomeConsumidor], [dtNascimento], [telConsumidor], [celConsumidor], [cepConsumidor], [ufConsumidor], [cidConsumidor], [enderConsumidor], [numConsumidor], [complConsumidor], [bairroConsumidor], [sexoConsumidor]) VALUES (2, 11, N'Eltonn', CAST(0x000086B300000000 AS DateTime), N'1434415648', N'14966154890', N'17603120', N'SP', N'Tupã', N'Rua David Caran', 110, N'A', N'Vila Tupã Mirim I', N'M ')
GO
INSERT [dbo].[CONSUMIDOR] ([idConsumidor], [idUsuario], [nomeConsumidor], [dtNascimento], [telConsumidor], [celConsumidor], [cepConsumidor], [ufConsumidor], [cidConsumidor], [enderConsumidor], [numConsumidor], [complConsumidor], [bairroConsumidor], [sexoConsumidor]) VALUES (3, 12, N'Gabriel Freitas', CAST(0x000080FE00000000 AS DateTime), N'1434415847', N'14966133030', N'17603120', N'SP', N'Tupã', N'Rua David Caran', 110, N'', N'Vila Tupã Mirim I', N'5 ')
GO
SET IDENTITY_INSERT [dbo].[CONSUMIDOR] OFF
GO
SET IDENTITY_INSERT [dbo].[DESEJOS] ON 

GO
INSERT [dbo].[DESEJOS] ([idDesejo], [idConsumidor], [idProduto]) VALUES (1, 2, 3)
GO
SET IDENTITY_INSERT [dbo].[DESEJOS] OFF
GO
SET IDENTITY_INSERT [dbo].[PEDIDO] ON 

GO
INSERT [dbo].[PEDIDO] ([idPedido], [idConsumidor], [numPedido], [dtPedido], [guidVisitante], [ativoPedido]) VALUES (3, 2, N'e59b4741-fab5-4e58-9f55-d15fb46aedae', CAST(0x0000A1170142A02E AS DateTime), NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[PEDIDO] OFF
GO
SET IDENTITY_INSERT [dbo].[PAGAMENTO] ON 

GO
INSERT [dbo].[PAGAMENTO] ([idPagamento], [descrPagamento], [imagemPagamento]) VALUES (1, N'Á Combinar', N'~/Content/Imagens/Combinar.jpg')
GO
INSERT [dbo].[PAGAMENTO] ([idPagamento], [descrPagamento], [imagemPagamento]) VALUES (2, N'American Express', N'~/Content/Imagens/American.png')
GO
INSERT [dbo].[PAGAMENTO] ([idPagamento], [descrPagamento], [imagemPagamento]) VALUES (3, N'Master Card', N'~/Content/Imagens/Mastercard.png')
GO
INSERT [dbo].[PAGAMENTO] ([idPagamento], [descrPagamento], [imagemPagamento]) VALUES (4, N'Cred Card', N'~/Content/Imagens/Credicard.png')
GO
INSERT [dbo].[PAGAMENTO] ([idPagamento], [descrPagamento], [imagemPagamento]) VALUES (5, N'Visa', N'~/Content/Imagens/Visa.png')
GO
INSERT [dbo].[PAGAMENTO] ([idPagamento], [descrPagamento], [imagemPagamento]) VALUES (6, N'Boleto', N'~/Content/Imagens/boleto.png')
GO
INSERT [dbo].[PAGAMENTO] ([idPagamento], [descrPagamento], [imagemPagamento]) VALUES (7, N'Bradesco Débito', N'~/Content/Imagens/Bradesco.png')
GO
INSERT [dbo].[PAGAMENTO] ([idPagamento], [descrPagamento], [imagemPagamento]) VALUES (8, N'Itau Débito', N'~/Content/Imagens/itau.png')
GO
SET IDENTITY_INSERT [dbo].[PAGAMENTO] OFF
GO
SET IDENTITY_INSERT [dbo].[PRODUTO_PAGAMENTO] ON 

GO
INSERT [dbo].[PRODUTO_PAGAMENTO] ([idProdPag], [idProduto], [idPagamento], [qtdeParcela], [jurosParcela]) VALUES (1, 1, 1, 1, 0)
GO
INSERT [dbo].[PRODUTO_PAGAMENTO] ([idProdPag], [idProduto], [idPagamento], [qtdeParcela], [jurosParcela]) VALUES (2, 2, 1, 1, 0)
GO
INSERT [dbo].[PRODUTO_PAGAMENTO] ([idProdPag], [idProduto], [idPagamento], [qtdeParcela], [jurosParcela]) VALUES (3, 3, 1, 1, 0)
GO
INSERT [dbo].[PRODUTO_PAGAMENTO] ([idProdPag], [idProduto], [idPagamento], [qtdeParcela], [jurosParcela]) VALUES (4, 4, 1, 1, 0)
GO
INSERT [dbo].[PRODUTO_PAGAMENTO] ([idProdPag], [idProduto], [idPagamento], [qtdeParcela], [jurosParcela]) VALUES (5, 4, 3, 6, 3)
GO
INSERT [dbo].[PRODUTO_PAGAMENTO] ([idProdPag], [idProduto], [idPagamento], [qtdeParcela], [jurosParcela]) VALUES (7, 4, 6, 1, 2)
GO
INSERT [dbo].[PRODUTO_PAGAMENTO] ([idProdPag], [idProduto], [idPagamento], [qtdeParcela], [jurosParcela]) VALUES (8, 4, 2, 12, 5)
GO
SET IDENTITY_INSERT [dbo].[PRODUTO_PAGAMENTO] OFF
GO
SET IDENTITY_INSERT [dbo].[ITENS_PEDIDO] ON 

GO
INSERT [dbo].[ITENS_PEDIDO] ([idItem], [idPedido], [idProduto], [valorItem], [qtdeItem], [sitPedido], [pago], [dtPagamento], [qtdeParcela], [idProdPag]) VALUES (3, 3, 4, 102.0000, 4, N'Aguardando classificação do Lojista.', 0, NULL, 1, 7)
GO
SET IDENTITY_INSERT [dbo].[ITENS_PEDIDO] OFF
GO
SET IDENTITY_INSERT [dbo].[IMAGENS] ON 

GO
INSERT [dbo].[IMAGENS] ([idImagem], [idProduto], [nomeImagem], [localImagem], [partImagem]) VALUES (1, 1, N'Produto', N'~/Content/Imagens/SemImagem.gif', 1)
GO
INSERT [dbo].[IMAGENS] ([idImagem], [idProduto], [nomeImagem], [localImagem], [partImagem]) VALUES (2, 1, N'Produto', N'~/Content/Imagens/SemImagem.gif', 2)
GO
INSERT [dbo].[IMAGENS] ([idImagem], [idProduto], [nomeImagem], [localImagem], [partImagem]) VALUES (3, 1, N'Produto', N'~/Content/Imagens/SemImagem.gif', 3)
GO
INSERT [dbo].[IMAGENS] ([idImagem], [idProduto], [nomeImagem], [localImagem], [partImagem]) VALUES (4, 1, N'Produto', N'~/Content/Imagens/SemImagem.gif', 4)
GO
INSERT [dbo].[IMAGENS] ([idImagem], [idProduto], [nomeImagem], [localImagem], [partImagem]) VALUES (5, 2, N'Lighthouse', N'~/Content/Imagens/SemImagem.gif', 1)
GO
INSERT [dbo].[IMAGENS] ([idImagem], [idProduto], [nomeImagem], [localImagem], [partImagem]) VALUES (6, 2, N'Produto', N'~/Content/Imagens/SemImagem.gif', 2)
GO
INSERT [dbo].[IMAGENS] ([idImagem], [idProduto], [nomeImagem], [localImagem], [partImagem]) VALUES (7, 2, N'Produto', N'~/Content/Imagens/SemImagem.gif', 3)
GO
INSERT [dbo].[IMAGENS] ([idImagem], [idProduto], [nomeImagem], [localImagem], [partImagem]) VALUES (8, 2, N'Produto', N'~/Content/Imagens/SemImagem.gif', 4)
GO
INSERT [dbo].[IMAGENS] ([idImagem], [idProduto], [nomeImagem], [localImagem], [partImagem]) VALUES (9, 3, N'Produto', N'~/Content/Imagens/SemImagem.gif', 1)
GO
INSERT [dbo].[IMAGENS] ([idImagem], [idProduto], [nomeImagem], [localImagem], [partImagem]) VALUES (10, 3, N'Produto', N'~/Content/Imagens/SemImagem.gif', 2)
GO
INSERT [dbo].[IMAGENS] ([idImagem], [idProduto], [nomeImagem], [localImagem], [partImagem]) VALUES (11, 3, N'Produto', N'~/Content/Imagens/SemImagem.gif', 3)
GO
INSERT [dbo].[IMAGENS] ([idImagem], [idProduto], [nomeImagem], [localImagem], [partImagem]) VALUES (12, 3, N'Produto', N'~/Content/Imagens/SemImagem.gif', 4)
GO
INSERT [dbo].[IMAGENS] ([idImagem], [idProduto], [nomeImagem], [localImagem], [partImagem]) VALUES (13, 4, N'Desert.jpg', N'~/Content/Imagens/Loja/Produtos/Desert.jpg', 1)
GO
INSERT [dbo].[IMAGENS] ([idImagem], [idProduto], [nomeImagem], [localImagem], [partImagem]) VALUES (14, 4, N'Chrysanthemum.jpg', N'~/Content/Imagens/Loja/Produtos/Chrysanthemum.jpg', 2)
GO
INSERT [dbo].[IMAGENS] ([idImagem], [idProduto], [nomeImagem], [localImagem], [partImagem]) VALUES (15, 4, N'Produto', N'~/Content/Imagens/SemImagem.gif', 3)
GO
INSERT [dbo].[IMAGENS] ([idImagem], [idProduto], [nomeImagem], [localImagem], [partImagem]) VALUES (16, 4, N'Produto', N'~/Content/Imagens/SemImagem.gif', 4)
GO
SET IDENTITY_INSERT [dbo].[IMAGENS] OFF
GO
