<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Construction/MasterPage2.master"
    AutoEventWireup="true" CodeFile="AreaLoja.aspx.cs" Inherits="Views_Loja_AreaLoja" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContCont" runat="Server">
    <asp:Panel ID="pnlAreaLoja" runat="server" Height="714px" CssClass="AreaLoja">
        <asp:TabContainer ID="tbcLojista" runat="server" ActiveTabIndex="0" Height="675px"
            Width="947px">
            <asp:TabPanel ID="TabPanel1" runat="server" HeaderText="TabPanel1">
                <HeaderTemplate>
                    Loja
                </HeaderTemplate>
                <ContentTemplate>
                    <asp:Panel ID="pnlLojaCima" runat="server" Height="308px" Width="919px">
                        <asp:Panel ID="pnlProdutos" runat="server" CssClass="ibtnLojaE" Height="278px" Width="445px"
                            Style="margin-top: 40px;">
                            <asp:ImageButton ID="ibtnProdutos" runat="server" ImageUrl="~/Content/Imagens/Produtos.jpg"
                                ImageAlign="AbsMiddle" CssClass="imgLojas" OnClick="ibtnProdutos_Click" />
                            <asp:Label ID="lblProdutos" runat="server" Text="Produtos" CssClass="lblLojas"></asp:Label>
                            <asp:GridView runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4"
                                EmptyDataText="Nenhuma Compra Encontrada!" GridLines="None" PageSize="7" ShowHeaderWhenEmpty="True"
                                ForeColor="#333333" Width="911px" ID="grdVendas" DataSourceID="odtsVenda">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
                                <Columns>
                                    <asp:BoundField DataField="numPedido" HeaderText="Número do Pedido" />
                                    <asp:BoundField DataField="dtPedido" HeaderText="Data do Pedido" />
                                    <asp:BoundField DataField="sitPedido" HeaderText="Situaçao do Pedido" />
                                    <asp:BoundField DataField="descrProduto" HeaderText="Produto" />
                                    <asp:BoundField DataField="emailUsuario" HeaderText="Email Consumidor" />
                                    <asp:BoundField DataField="dtPagamento" HeaderText="Data do Pagamento" />
                                    <asp:BoundField DataField="valorItem" HeaderText="Valor Venda" />
                                    <asp:BoundField DataField="qtdeItem" HeaderText="Qtde Produto" >
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton4" runat="server" CausesValidation="False" CommandName="Edit"
                                                Text="Editar"></asp:LinkButton>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:LinkButton ID="lnkEditar0" runat="server" CausesValidation="True" CommandName="Alterar"
                                                Text="Alterar"></asp:LinkButton>
                                            &nbsp;<asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Cancel"
                                                Text="Cancelar"></asp:LinkButton>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EditRowStyle BackColor="#999999"></EditRowStyle>
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></FooterStyle>
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></HeaderStyle>
                                <PagerStyle HorizontalAlign="Center" BackColor="#284775" ForeColor="White"></PagerStyle>
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333"></RowStyle>
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>
                                <SortedAscendingCellStyle BackColor="#E9E7E2"></SortedAscendingCellStyle>
                                <SortedAscendingHeaderStyle BackColor="#506C8C"></SortedAscendingHeaderStyle>
                                <SortedDescendingCellStyle BackColor="#FFFDF8"></SortedDescendingCellStyle>
                                <SortedDescendingHeaderStyle BackColor="#6F8DAE"></SortedDescendingHeaderStyle>
                            </asp:GridView>
                            <asp:ObjectDataSource ID="odtsVenda" runat="server" SelectMethod="ConsultaPedido"
                                TypeName="WebSite.Business.PedidoDAO">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="Venda" Name="Modo" Type="String" />
                                    <asp:Parameter DefaultValue="" Name="guidVisitante" Type="String" />
                                    <asp:SessionParameter Name="idUsuario" SessionField="idUsuario" Type="Int32" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                        </asp:Panel>
                    </asp:Panel>
                </ContentTemplate>
            </asp:TabPanel>
            <asp:TabPanel ID="TabPanel2" runat="server" HeaderText="TabPanel2">
                <HeaderTemplate>
                    Dados&nbsp;da Loja
                </HeaderTemplate>
                <ContentTemplate>
                    <asp:Panel ID="pnlDadosComerciante" runat="server" Height="550px" Width="921px">
                        <asp:Panel ID="pnlBannerLoja" runat="server" CssClass="pnlAreaLoja" Height="147px"
                            Width="476px">
                            <asp:Label ID="lblBannerLoja" runat="server" CssClass="lblPanels" Text="Banner"></asp:Label>
                            <asp:Image ID="imgBanner" CssClass="imgLoja" runat="server" Height="81px" Width="440px"
                                ImageUrl="~/Content/Imagens/BannerPadrao.jpg" />
                            <asp:FileUpload ID="fplBanner" runat="server" Width="300px" Style="float: left;" />
                            <asp:ImageButton ID="ibtnBanner" runat="server" Height="25px" ImageUrl="~/Content/Imagens/refresh.png"
                                OnClick="ibtnBanner_Click" Style="float: left;" />
                        </asp:Panel>
                        <asp:Panel ID="pnlLogoLoja" runat="server" CssClass="pnlAreaLoja" Height="147px"
                            Width="439px">
                            <asp:Label ID="lblLogoLoja" runat="server" CssClass="lblPanels" Text="Logotipo"></asp:Label>
                            <asp:Image ID="imgLogo" runat="server" CssClass="imgLoja" Height="81px" Width="101px"
                                ImageUrl="~/Content/Imagens/logoPadraoLoja.jpg" />
                            <asp:FileUpload ID="fplLogo" runat="server" Width="300px" Style="float: left;" />
                            <asp:ImageButton ID="ibtnLogo" runat="server" Height="25px" ImageUrl="~/Content/Imagens/refresh.png"
                                OnClick="ibtnLogo_Click" />
                        </asp:Panel>
                        <asp:Panel ID="pnlRazaoLoja" runat="server" CssClass="pnlAreaLoja" Height="50px"
                            Width="387px">
                            <asp:Label ID="lblRazaoLoja" runat="server" CssClass="lblPanels" Text="Razão Social"
                                Height="19px" Width="95px"></asp:Label>
                            <asp:TextBox ID="txbRazao" runat="server" Width="371px" CssClass="txbAreaConsumidor"
                                ValidationGroup="DadosLoja"></asp:TextBox>
                        </asp:Panel>
                        <asp:Panel ID="pnlCnpjLoja" runat="server" CssClass="pnlAreaLoja" Height="50px" Width="210px">
                            <asp:Label ID="lblCnpjLoja" runat="server" CssClass="lblPanels" Text="CNPJ"></asp:Label>
                            <asp:TextBox ID="txbCnpj" runat="server" CssClass="txbAreaConsumidor" Enabled="False"
                                Width="182px" Style="margin-top: 7px;"></asp:TextBox>
                        </asp:Panel>
                        <asp:Panel ID="pnlFantasiaLoja" runat="server" CssClass="pnlAreaLoja" Height="50px"
                            Width="386px">
                            <asp:Label ID="lblFantasiaLoja" runat="server" CssClass="lblPanels" Text="Nome Fantasia"
                                Height="19px" Width="110px"></asp:Label>
                            <asp:TextBox ID="txbNomeFantasia" CssClass="txbAreaConsumidor" runat="server" Width="371px"
                                ValidationGroup="DadosLoja"></asp:TextBox>
                        </asp:Panel>
                        <asp:Panel ID="pnlSite" runat="server" CssClass="pnlAreaLoja" Height="50px" Width="400px">
                            <asp:Label ID="lblSite" runat="server" CssClass="lblPanels" Text="Site" Width="475px"
                                Height="18px"></asp:Label>
                            <asp:TextBox ID="txbSite" runat="server" CssClass="txbAreaConsumidor" ValidationGroup="DadosLoja"
                                Width="250px" Style="margin-top: 5px;"></asp:TextBox>
                        </asp:Panel>
                        <asp:Panel ID="pnlBairro" runat="server" CssClass="pnlAreaBairroR" Height="51px"
                            Width="327px" Style="float: right; margin-right: 72px;">
                            <asp:Label ID="lblBairro" runat="server" CssClass="lblPanels" Height="18px" Text="Bairro"
                                Width="45px"></asp:Label>
                            <asp:RequiredFieldValidator ID="rfvBairro" runat="server" ControlToValidate="txbBairro"
                                CssClass="rfvlabel" ErrorMessage="Digite o Bairro" ForeColor="Red" ValidationGroup="DadosLoja">*</asp:RequiredFieldValidator>
                            <asp:TextBox ID="txbBairro" runat="server" CssClass="txbAreaConsumidor" ValidationGroup="DadosLoja"
                                Width="270px"></asp:TextBox>
                        </asp:Panel>
                        <asp:Panel ID="pnlCidade" runat="server" CssClass="pnlAreaE" Height="50px" Width="215px"
                            Style="float: right;">
                            <asp:Label ID="lblCidade" runat="server" CssClass="lblPanels" Text="Cidade" Height="18px"
                                Width="55px"></asp:Label>
                            <asp:RequiredFieldValidator ID="rfvCidade" runat="server" ControlToValidate="txbCidade"
                                CssClass="rfvlabel" ErrorMessage="Digite a Cidade" ForeColor="Red" ValidationGroup="DadosLoja">*</asp:RequiredFieldValidator>
                            <asp:TextBox ID="txbCidade" runat="server" CssClass="txbAreaConsumidor" ValidationGroup="DadosLoja"
                                Width="200px"></asp:TextBox>
                        </asp:Panel>
                        <asp:Panel ID="pnlCEP" runat="server" CssClass="pnlLojaD" Height="50px" Width="252px"
                            Style="float: left;">
                            <asp:Label ID="lblCEP" runat="server" CssClass="lblPanels" Height="16px" Text="CEP"
                                Width="37px"></asp:Label>
                            <asp:RequiredFieldValidator ID="rfvCEP" runat="server" ControlToValidate="txbCEP"
                                CssClass="rfvlabel" ErrorMessage="Digite o CEP" ForeColor="Red" ValidationGroup="DadosLoja"
                                Width="200px">*</asp:RequiredFieldValidator>
                            <asp:TextBox ID="txbCEP" runat="server" CssClass="txbAreaConsumidor" ValidationGroup="DadosLoja"
                                Width="173px"></asp:TextBox>
                            <asp:MaskedEditExtender ID="txbCEP_MaskedEditExtender" runat="server" CultureAMPMPlaceholder=""
                                CultureCurrencySymbolPlaceholder="" CultureDateFormat="" CultureDatePlaceholder=""
                                CultureDecimalPlaceholder="" CultureThousandsPlaceholder="" CultureTimePlaceholder=""
                                Enabled="True" Mask="99999-999" MaskType="Number" TargetControlID="txbCEP">
                            </asp:MaskedEditExtender>
                            <asp:ImageButton ID="ibtnBuscaCep" runat="server" CssClass="ibtnCalendario" Height="27px"
                                ImageUrl="~/Content/Imagens/busca_icon.gif" Width="24px" OnClick="ibtnBuscaCep_Click" />
                        </asp:Panel>
                        <asp:Panel ID="pnlUF" runat="server" CssClass="pnlAreaE" Height="50px" Width="50px">
                            <asp:Label ID="lblUF" runat="server" CssClass="lblPanels" Height="18px" Text="UF"
                                Width="21px"></asp:Label>
                            <asp:RequiredFieldValidator ID="rfvUF" runat="server" ControlToValidate="txbUf" CssClass="rfvlabel"
                                ErrorMessage="Digite o Estado" ForeColor="Red" ValidationGroup="DadosLoja" Height="18px">*</asp:RequiredFieldValidator>
                            <asp:TextBox ID="txbUf" runat="server" CssClass="txbAreaConsumidor" ValidationGroup="DadosLoja"
                                Width="35px"></asp:TextBox>
                        </asp:Panel>
                        <asp:Panel ID="pnlEndereco" runat="server" CssClass="pnlAreaEnderecoE" Height="50px"
                            Width="268px" Style="float: left;">
                            <asp:Label ID="lblEndereco" runat="server" CssClass="lblPanels" Height="17px" Text="Endereço"
                                Width="69px"></asp:Label>
                            <asp:RequiredFieldValidator ID="rfvEndereco" runat="server" ControlToValidate="txbEndereco"
                                CssClass="rfvlabel" ErrorMessage="Digite o Endereço" ForeColor="Red" ValidationGroup="DadosLoja"
                                Height="18px" Width="18px">*</asp:RequiredFieldValidator>
                            <asp:TextBox ID="txbEndereco" runat="server" CssClass="txbAreaConsumidor" ValidationGroup="DadosLoja"
                                Width="250px"></asp:TextBox>
                        </asp:Panel>
                        <asp:Panel ID="pnlNumero" runat="server" CssClass="pnlAreaE" Height="50px" Width="180px"
                            Style="margin-top: 6px;">
                            <asp:Label ID="lblNumero" runat="server" CssClass="lblPanels" Height="17px" Text="Número"
                                Width="59px"></asp:Label>
                            <asp:RequiredFieldValidator ID="rfvNumero" runat="server" ControlToValidate="txbNumero"
                                CssClass="rfvlabel" ErrorMessage="Digite o Número" ForeColor="Red" ValidationGroup="DadosLoja">*</asp:RequiredFieldValidator>
                            <asp:TextBox ID="txbNumero" runat="server" CssClass="txbAreaConsumidor" ValidationGroup="DadosLoja"
                                Width="144px"></asp:TextBox>
                        </asp:Panel>
                        <asp:Panel ID="pnlComplemento" runat="server" CssClass="pnlAreaE" Height="50px" Width="139px">
                            <asp:Label ID="lblComplemento" runat="server" CssClass="lblPanels" Height="18px"
                                Text="Complemento" Width="109px"></asp:Label>
                            <asp:TextBox ID="txbComplemento" runat="server" CssClass="txbAreaConsumidor" ValidationGroup="DadosLoja"
                                Width="115px"></asp:TextBox>
                        </asp:Panel>
                        <asp:Panel ID="pnlTelefone" runat="server" CssClass="pnlAreaLoja" Height="50px" Width="200px"
                            Style="margin-top: 6px;">
                            <asp:Label ID="lblTelefone" runat="server" CssClass="lblPanels" Height="17px" Text="Telefone"
                                Width="68px"></asp:Label>
                            <asp:RequiredFieldValidator ID="rfvFone" runat="server" ControlToValidate="txbFone"
                                CssClass="rfvlabel" ErrorMessage="Digite o Telefone" ForeColor="Red" ValidationGroup="DadosLoja">*</asp:RequiredFieldValidator>
                            <asp:TextBox ID="txbFone" runat="server" CssClass="txbAreaConsumidor" ValidationGroup="DadosLoja"></asp:TextBox>
                            <asp:MaskedEditExtender ID="txbFone_MaskedEditExtender" runat="server" CultureAMPMPlaceholder=""
                                CultureCurrencySymbolPlaceholder="" CultureDateFormat="" CultureDatePlaceholder=""
                                CultureDecimalPlaceholder="" CultureThousandsPlaceholder="" CultureTimePlaceholder=""
                                Enabled="True" Mask="(99)999999999" MaskType="Number" TargetControlID="txbFone">
                            </asp:MaskedEditExtender>
                        </asp:Panel>
                        <asp:Panel ID="pnlBotoes" runat="server" CssClass="pnlBotoesArea" Height="49px" Width="408px">
                            <asp:Button ID="btnConfirmaDados" runat="server" Text="Confirmar" OnClick="btnConfirmaDados_Click"
                                CssClass="botaoRight" Style="margin-right: 118px; margin-top: 30px;" />
                        </asp:Panel>
                        <asp:Panel ID="Panel1" runat="server" CssClass="pnlAreaConsumidore">
                            <asp:ValidationSummary ID="vlsDadosLoja" runat="server" CssClass="vdsTrocaSenha"
                                Height="206px" ValidationGroup="DadosLoja" Width="340px" />
                        </asp:Panel>
                    </asp:Panel>
                </ContentTemplate>
            </asp:TabPanel>
            <asp:TabPanel ID="tbpnlConfiguracoesdaConta" runat="server" HeaderText="TabPanel3">
                <HeaderTemplate>
                    Configurações da Conta
                </HeaderTemplate>
                <ContentTemplate>
                    <asp:Accordion ID="Accordion2" runat="server" CssClass="accordion" HeaderCssClass="accordionHeader"
                        HeaderSelectedCssClass="accordionHeaderSelected" ContentCssClass="accordionContent"
                        Height="595px" Width="724px" FramesPerSecond="30" TransitionDuration="250">
                        <Panes>
                            <asp:AccordionPane ID="acpTrocarSenha" runat="server" ContentCssClass="" HeaderCssClass="">
                                <Header>
                                    Trocar Senha</Header>
                                <Content>
                                    <asp:Panel ID="pnlTrocaSenha" runat="server" Height="300px" Width="250px">
                                        <asp:Label ID="lblSenhaAtual" runat="server" Text="Senha Atual" CssClass="lblTrocaSenha"></asp:Label>
                                        <asp:RequiredFieldValidator ID="rfvSenhaAtual" runat="server" ErrorMessage="Digite sua Senha!"
                                            ForeColor="Red" ControlToValidate="txbSenhaAtual" ValidationGroup="Senha" CssClass="rfvlabel">*</asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txbSenhaAtual" runat="server" TextMode="Password" CssClass="txbTrocaSenha"
                                            ValidationGroup="Senha" Width="200px">
                                        </asp:TextBox>
                                        <asp:Label ID="lblNovaSenha" runat="server" Text="Nova Senha" CssClass="lblTrocaSenha">
                                        </asp:Label>
                                        <asp:RequiredFieldValidator ID="rfvNovaSenha" runat="server" ErrorMessage="Digite a Nova Senha!"
                                            ForeColor="Red" ControlToValidate="txbNovaSenha" ValidationGroup="Senha" CssClass="rfvlabel">*</asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txbNovaSenha" runat="server" TextMode="Password" CssClass="txbTrocaSenha"
                                            ValidationGroup="Senha" Width="200px">
                                        </asp:TextBox>
                                        <asp:Label ID="lblConfirmarSenha" runat="server" Text="Confirmar Nova Senha" CssClass="lblTrocaSenha">
                                        </asp:Label>
                                        <asp:RequiredFieldValidator ID="rfvConfirmaSenha" runat="server" ErrorMessage="Confirme sua Nova Senha!"
                                            ForeColor="Red" ControlToValidate="txbSenhaAtual" ValidationGroup="Senha" CssClass="rfvlabel">*</asp:RequiredFieldValidator>
                                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="As Senhas estão diferentes"
                                            ForeColor="Red" ControlToCompare="txbNovaSenha" ControlToValidate="txbConfirmaSenha"
                                            ValidationGroup="Senha" CssClass="rfvTrocaSenha" Text="*"></asp:CompareValidator>
                                        <asp:TextBox ID="txbConfirmaSenha" runat="server" TextMode="Password" CssClass="txbTrocaSenha"
                                            ValidationGroup="Senha" Width="200px">
                                        </asp:TextBox>
                                        <asp:Button ID="btnConfirmarSenha" runat="server" Text="Confirmar" CssClass="botaoRight"
                                            ValidationGroup="Senha" OnClick="btnConfirmarSenha_Click" />
                                        <asp:Panel ID="pnlSumarioSenhaLoja" runat="server" CssClass="pnlSumarioSenhaLoja">
                                            <asp:ValidationSummary ID="vdsTrocaSenha" runat="server" ForeColor="Red" CssClass="vdsTrocaSenha"
                                                DisplayMode="BulletList" ValidationGroup="Senha" />
                                        </asp:Panel>
                                    </asp:Panel>
                                </Content>
                            </asp:AccordionPane>
                            <asp:AccordionPane ID="acpTrocarPergunta" runat="server" ContentCssClass="" HeaderCssClass="">
                                <Header>
                                    Trocar Pergunta de Segurança</Header>
                                <Content>
                                    <asp:Panel ID="pnlTrocaPergunta" runat="server" Height="300px" Width="250px">
                                        <asp:Label ID="lblNovaPergunta" runat="server" Text="Pergunta" CssClass="lblTrocaSenha"></asp:Label>
                                        <asp:RequiredFieldValidator ID="rfvPergunta" runat="server" ErrorMessage="Escolha a Pergunta"
                                            ForeColor="Red" ControlToValidate="ddlPergunta" ValidationGroup="Pergunta" CssClass="rfvlabel">*</asp:RequiredFieldValidator>
                                        <asp:DropDownList ID="ddlPergunta" runat="server" CssClass="txbTrocaSenha" Width="200px"
                                            ValidationGroup="Pergunta" DataSourceID="odtsPergunta" DataTextField="DescrPergunta"
                                            DataValueField="IdPergunta">
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="odtsPergunta" runat="server" SelectMethod="ListarPerguntas"
                                            TypeName="WebSite.Data.DBUtils"></asp:ObjectDataSource>
                                        <asp:Label ID="lblResposta" runat="server" Text="Resposta Chave" CssClass="lblTrocaSenha"></asp:Label>
                                        <asp:RequiredFieldValidator ID="rfvResposta" runat="server" ErrorMessage="Digite sua Resposta"
                                            ForeColor="Red" ControlToValidate="txbResposta" ValidationGroup="Pergunta" CssClass="rfvlabel">*</asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txbResposta" runat="server" CssClass="txbTrocaSenha" ValidationGroup="Pergunta"
                                            Width="200px">
                                        </asp:TextBox>
                                        <asp:Button ID="btnConfirmarPergunta" runat="server" Text="Confirmar" CssClass="botaoRight"
                                            ValidationGroup="Pergunta" OnClick="btnConfirmarPergunta_Click" />
                                        <asp:ValidationSummary ID="vlsTrocaPergunta" runat="server" ValidationGroup="Pergunta"
                                            ForeColor="Red" CssClass="vdsTrocaSenha" DisplayMode="List" />
                                    </asp:Panel>
                                </Content>
                            </asp:AccordionPane>
                        </Panes>
                    </asp:Accordion>
                </ContentTemplate>
            </asp:TabPanel>
        </asp:TabContainer>
    </asp:Panel>
</asp:Content>
