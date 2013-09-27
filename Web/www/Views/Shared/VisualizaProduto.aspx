<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Construction/MasterPage.master"
    AutoEventWireup="true" CodeFile="VisualizaProduto.aspx.cs" Inherits="Views_Shared_VisualizaProduto" ValidateRequest="false"%>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContCont" runat="Server">
    <asp:Panel ID="pnlVisualizaProduto" runat="server">
        <asp:Panel ID="pnlImagensVisualiza" runat="server" Height="406px" Width="349px" CssClass="pnlImagensVisualiza">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" CssClass="imgPrincipalVisualiza"
                Height="100px" Width="100px">
                <ContentTemplate>
                    <asp:Panel ID="ImagemPrincipal" runat="server" CssClass="imageRow">
                        <div class="set">
                            <div class="single">
                                <!--<a href="../../Content/Imagens/SemImagem.gif" rel="lightbox[plants]" title="imagem 1">-->
                                    <asp:HyperLink ID="hplBox" runat="server" NavigateUrl="../../Content/Imagens/SemImagem.gif" rel="lightbox[plants]" title="Imagem1"> 
                                        <asp:Image ID="imgPrincipal" runat="server" CssClass="imgGrande" ImageUrl='<%# Eval("localImagem")%>' />
                                    </asp:HyperLink>
                                <!--</a>-->
                            </div>
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="pnlImgPequenas" runat="server" CssClass="pnlImgPequenas" Height="16px"
                        Width="287px">
                        <asp:Repeater ID="rptImgProduto" runat="server" 
                            DataSourceID="odtsImagensProduto" onitemcommand="rptImgProduto_ItemCommand">
                            <ItemTemplate>
                                <asp:ImageButton ID="imgPequena1" runat="server" CssClass="imgPequena1" Height="50px"
                                    Width="50px" rel="lightbox[plants]" ImageUrl='<%# Eval("localImagem")%>' CommandName="Selecionar"
                                    CommandArgument='<%# Eval("localImagem")%>' />
                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:ObjectDataSource ID="odtsImagensProduto" runat="server" SelectMethod="ConsultaImagens"
                            TypeName="WebSite.Business.ImagensDAO">
                            <SelectParameters>
                                <asp:SessionParameter DefaultValue="" Name="idProduto" SessionField="idProduto" Type="Int32" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </asp:Panel>
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>
        <asp:Panel ID="pnlFormularioVisualiza" runat="server" Height="435px" Width="411px"
            CssClass="pnlFormularioVisualiza">
            <asp:Panel ID="pnlZoomImagem" runat="server">
                <asp:Label ID="lblDescricao" runat="server" CssClass="lblDescVisualiza" Text="Descrição do Produto"></asp:Label>
                <asp:Panel ID="pnlDetProd" runat="server" Height="73px" Width="188px" CssClass="pnlLogoLoja">
                    <asp:Panel ID="pnlQtdVisualiza" runat="server" CssClass="pnlQtdVisualiza" Height="50px" Width="104px">
                        <asp:Label ID="Label66" runat="server" CssClass="lblBlock" Text="Quantidade" 
                            Height="19px"></asp:Label>
                        <asp:DropDownList ID="ddlQtde" runat="server" Width="100px" AutoPostBack="True" 
                           onselectedindexchanged="ddlQtde_SelectedIndexChanged">
                        </asp:DropDownList>
                    </asp:Panel>
                    <asp:Panel ID="pnlValorVisualiza" runat="server" CssClass="pnlValorVisualiza" Height="48px"
                        Width="164px" Style="margin-right: 4px">
                        <asp:Label ID="Label6" runat="server" Text="Valor Total:" CssClass="lblBlock" Height="16px"
                            Width="163px"></asp:Label>
                        <asp:Label ID="lblValorTotal" runat="server" CssClass="lblValorProdutoVisualiza"
                            Text="R$ 215.000,00"></asp:Label>
                    </asp:Panel>
                    <asp:Panel ID="pnlParcelasVisualiza" runat="server" Height="17px" Width="160px" 
                        CssClass="pnlParcelasVisualiza">
                        <asp:Label ID="Label19" runat="server" Text="Quantidade de Parcelas:" CssClass="lblBlock"
                            Width="164px"></asp:Label>
                        <asp:DropDownList ID="ddlQtdeParcelas" runat="server" Width="41px" AutoPostBack="True">
                        </asp:DropDownList>
                        <asp:Label ID="lblSeparador" runat="server" CssClass="lblSeparador" Height="16px"
                            Text="X" Style="margin-bottom: 8px;"></asp:Label>
                        <asp:Label ID="lblValorParcela" runat="server" CssClass="lblParcelasVisualiza" 
                            Text=""></asp:Label>
                    </asp:Panel>
                    <asp:Panel ID="pnlParcelas" runat="server" CssClass="pnlParcelas" Height="25px" Width="164px" >
                        <a href="../../Content/Imagens/SemImagem.gif" rel="lightbox[plants]" title="imagem 1">
                            <asp:HiddenField ID="hfdValorVenda" runat="server" />
                        </a>
                    </asp:Panel>
                </asp:Panel>
                <asp:Panel ID="pnlPagamentoVisualiza" runat="server" CssClass="pnlPagamentoVisualiza" Height="235px"
                    Width="223px">
                    <asp:Label ID="lblPagamentoVizualiza" runat="server" CssClass="lblBlock" Text="Formas de Pagamento"></asp:Label>
                    <asp:GridView ID="grdPagamento" runat="server" AutoGenerateColumns="False" GridLines="None"
                        DataSourceID="odtsPagamento" OnRowDataBound="grdPagamento_RowDataBound" 
                        DataKeyNames="idProdPag">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:RadioButton ID="rbPagamento" runat="server" AutoPostBack="true" 
                                        oncheckedchanged="rbPagamento_CheckedChanged" GroupName="pagamento" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Image ID="imgPagamento" runat="server" Width="32px" Height="20px" ImageUrl='<%# Bind("imagemPagamento") %>'/>
                                    <asp:Label ID="lblDescricao" runat="server" Text='<%# Bind("descrPagamento") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:ObjectDataSource ID="odtsPagamento" runat="server" 
                        SelectMethod="ConsultaProd_Pag" TypeName="WebSite.Business.Prod_PagDAO">
                        <SelectParameters>
                            <asp:SessionParameter DefaultValue="" Name="idProduto" SessionField="idProduto" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </asp:Panel>
                <asp:Panel ID="pnlBotaoComprar" runat="server" CssClass="pnlBotoes" Height="30px"
                    Width="105px">
                    <asp:ImageButton ID="ibtnAddCarrinho" runat="server" CssClass="ibtnCarrinho" Width="100px"
                        ImageUrl="~/Content/Imagens/Adicionar_Carrinho.png" 
                        Style="margin-left: 40px" onclick="ibtnAddCarrinho_Click" />
                </asp:Panel>
                <asp:Panel ID="pnlAddFavoritos" runat="server" CssClass="pnlBotoes" Height="30px"
                    Width="135px">
                    <asp:ImageButton ID="ibtnAddFavoritos" runat="server" CssClass="ibtnFavorito" Width="100px"
                        ImageUrl="~/Content/Imagens/Nao_Adicionar_Favoritos.png" 
                        onclick="ibtnAddFavoritos_Click" Enabled="False" />
                </asp:Panel>
            </asp:Panel>
        </asp:Panel>
        <asp:Accordion ID="AcordionDetalhesProduto" runat="server" CssClass="accordionDetalhesProduto"
            HeaderCssClass="accordionHeaderProdutos" HeaderSelectedCssClass="accordionHeaderSelectedProdutos"
            ContentCssClass="accordionContentProdutos" Height="432px" Width="724px" FramesPerSecond="30"
            TransitionDuration="250">
            <Panes>
                <asp:AccordionPane ID="acpDetalhesProduto" runat="server" ContentCssClass="" HeaderCssClass="">
                    <Header>
                        Detalhes do Produto
                    </Header>
                    <Content>
                        <asp:Panel ID="pnlDetalhesProduto" runat="server">
                            <asp:Panel ID="pnlEsquerdaProduto" runat="server" CssClass="pnlEsquerdaProduto" Width="450px">
                            <asp:Panel ID="pnlCategoria" runat="server">
                                <asp:Label ID="Label1" runat="server" Text="Categoria:" CssClass="lblRSDL"></asp:Label>
                                <asp:Label ID="lblCategoria" runat="server" Text="" CssClass="lblDetalhesLoja"></asp:Label>
                            </asp:Panel>
                                <asp:Panel ID="pnlProduto" runat="server">
                                    <asp:Label ID="Label2" runat="server" Text="Produto:" CssClass="lblRSDL"></asp:Label>
                                    <asp:Label ID="lblProduto" runat="server" Text="" CssClass="lblDetalhesLoja"></asp:Label>
                                </asp:Panel>
                                <asp:Panel ID="pnlQuantidade" runat="server">
                                    <asp:Label ID="Label3" runat="server" Text="Qtde Disponível:" CssClass="lblRSDL"></asp:Label>
                                    <asp:Label ID="lblQtde" runat="server" Text="" CssClass="lblDetalhesLoja"></asp:Label>
                                </asp:Panel>
                                <asp:Panel ID="pnlValor" runat="server">
                                    <asp:Label ID="Label4" runat="server" Text="Valor(Un):" CssClass="lblRSDL"></asp:Label>
                                    <asp:Label ID="lblValor" runat="server" Text="" CssClass="lblDetalhesLoja"></asp:Label>
                                </asp:Panel>
                                <asp:Panel ID="pnlFrete" runat="server">
                                    <asp:Label ID="Label5" runat="server" Text="Frete Grátis?" CssClass="lblRSDL"></asp:Label>
                                    <asp:Label ID="lblFreteGratis" runat="server" Text="" CssClass="lblDetalhesLoja"></asp:Label>
                                </asp:Panel>
                            </asp:Panel>
                            <asp:Panel ID="pnlDireitaProduto" runat="server" CssClass="pnlDireitaProduto">
                                <asp:Image ID="imgUnlike" runat="server" ImageUrl="~/Content/Imagens/unlike.png" />
                                <asp:Label ID="lblUnLike" runat="server" Text=""></asp:Label>
                                <asp:Image ID="imglike" runat="server" ImageUrl="~/Content/Imagens/like.png" />
                                <asp:Label ID="Label7" runat="server" Text=""></asp:Label>
                            </asp:Panel>
                        </asp:Panel>
                    </Content>
                </asp:AccordionPane>
                <asp:AccordionPane ID="acpDetalhesLoja" runat="server" ContentCssClass="" HeaderCssClass="">
                    <Header>
                        Detalhes da Loja
                    </Header>
                    <Content>
                        <asp:Panel ID="pnlDetalhesLoja" runat="server">
                            <asp:Image ID="imgLogo" runat="server" Width="75px" Height="60px" />
                            <asp:Panel ID="pnlRS" runat="server">
                                <asp:Label ID="Label8" runat="server" Text="Razão Social:" CssClass="lblRSDL"></asp:Label>
                                <asp:Label ID="lblRazao" runat="server" Text="" CssClass="lblDetalhesLoja"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Panel1" runat="server">
                                <asp:Label ID="Label9" runat="server" Text="Nome Fantasia:" CssClass="lblRSDL"></asp:Label>
                                <asp:Label ID="lblFantasia" runat="server" Text="" CssClass="lblDetalhesLoja"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Panel2" runat="server">
                                <asp:Label ID="Label10" runat="server" Text="Contato:" CssClass="lblRSDL"></asp:Label>
                                <asp:Label ID="lblContato" runat="server" Text="" CssClass="lblDetalhesLoja"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Panel3" runat="server">
                                <asp:Label ID="Label11" runat="server" Text="Site:" CssClass="lblRSDL"></asp:Label>
                                <asp:Label ID="lblSite" runat="server" Text="" CssClass="lblDetalhesLoja"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Panel4" runat="server">
                                <asp:Label ID="Label12" runat="server" Text="Cep:" CssClass="lblRSDL"></asp:Label>
                                <asp:Label ID="lblCep" runat="server" Text="" CssClass="lblDetalhesLoja"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Panel5" runat="server">
                                <asp:Label ID="Label14" runat="server" Text="Estado:" CssClass="lblRSDL"></asp:Label>
                                <asp:Label ID="lblEstado" runat="server" Text="" CssClass="lblDetalhesLoja"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Panel6" runat="server">
                                <asp:Label ID="Label13" runat="server" Text="Cidade:" CssClass="lblRSDL"></asp:Label>
                                <asp:Label ID="lblCidade" runat="server" Text="" CssClass="lblDetalhesLoja"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Panel7" runat="server">
                                <asp:Label ID="Label18" runat="server" Text="Bairro:" CssClass="lblRSDL"></asp:Label>
                                <asp:Label ID="lblBairro" runat="server" Text="" CssClass="lblDetalhesLoja"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Panel8" runat="server">
                                <asp:Label ID="Label15" runat="server" Text="Endereço:" CssClass="lblRSDL"></asp:Label>
                                <asp:Label ID="lblEndereco" runat="server" Text="" CssClass="lblDetalhesLoja"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Panel9" runat="server">
                                <asp:Label ID="Label16" runat="server" Text="Número:" CssClass="lblRSDL"></asp:Label>
                                <asp:Label ID="lblNumero" runat="server" Text="" CssClass="lblDetalhesLoja"></asp:Label>
                            </asp:Panel>
                            <asp:Panel ID="Panel10" runat="server">
                                <asp:Label ID="Label17" runat="server" Text="Complemento:" CssClass="lblRSDL"></asp:Label>
                                <asp:Label ID="lblComplemento" runat="server" Text="" CssClass="lblDetalhesLoja"></asp:Label>
                            </asp:Panel>
                        </asp:Panel>
                    </Content>
                </asp:AccordionPane>
            </Panes>
        </asp:Accordion>
    </asp:Panel>
    <script type="text/javascript" src="../../Scripts/jquery-1.8.1.min.js"></script>
    <script type="text/javascript" src="../../Scripts/jquery-ui-1.8.18.custom.min.js"></script>
    <script type="text/javascript" src="../../Scripts/jquery.smooth-scroll.min.js"></script>
    <script type="text/javascript" src="../../Scripts/lightbox.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            $('a').smoothScroll({
                speed: 1000,
                easing: 'easeInOutCubic'
            });

            $('.showOlderChanges').on('click', function (e) {
                $('.changelog .old').slideDown('slow');
                $(this).fadeOut();
                e.preventDefault();
            })
        });

        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-2196019-1']);
        _gaq.push(['_trackPageview']);

        (function () {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();

    </script>
</asp:Content>
