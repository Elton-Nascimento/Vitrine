<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Construction/MasterPage2.master"
    AutoEventWireup="true" CodeFile="CadastroProduto.aspx.cs" Inherits="Views_Loja_CadastroProduto" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContCont" runat="Server">
    <asp:Panel ID="pnlCadastroDeProdutos" runat="server">
        <asp:Wizard ID="wzProduto" runat="server" DisplaySideBar="False"
            StartNextButtonText="Próximo" StepPreviousButtonText="Anterior" CancelButtonText="Cancelar"
            FinishCompleteButtonText="Finalizar" FinishPreviousButtonText="Anterior" ActiveStepIndex="0"
            OnNextButtonClick="wzProduto_NextButtonClick" StepNextButtonText="Próximo" 
            OnFinishButtonClick="wzProduto_FinishButtonClick">
            <StartNextButtonStyle CssClass="botao" />
            <StepNextButtonStyle CssClass="botao" />
            <StepPreviousButtonStyle CssClass="botao" />
            <WizardSteps>
                <asp:WizardStep ID="wzsDados" runat="server" Title="Dados" StepType="Start">
                    <div class="content">
                        <asp:Panel ID="pnlDadosdoProduto" runat="server" CssClass="pnlProduto" Height="386px">
                            <asp:Panel ID="Panel1" runat="server" Height="57px" Width="417px" CssClass="pnlDadosProdutos">
                                <asp:Label ID="Label1" runat="server" Text="Descrição" CssClass="lblProdutos" Width="69px"></asp:Label>
                                <asp:RequiredFieldValidator ID="rfvDescricao" runat="server" ErrorMessage="Escreva a Descrição"
                                    ControlToValidate="txbDescricao" ForeColor="Red">*</asp:RequiredFieldValidator>
                                <asp:TextBox ID="txbDescricao" runat="server" Width="400px" CssClass="txbProdutos"></asp:TextBox>
                            </asp:Panel>
                            <asp:Panel ID="Panel2" runat="server" Height="55px" Width="417px" CssClass="pnlDadosProdutos">
                                <asp:Panel ID="Panel6" runat="server" CssClass="pnlPE">
                                    <asp:Label ID="Label2" runat="server" Text="Categoria" CssClass="lblProdutos" Width="66px"></asp:Label>
                                    <asp:CustomValidator ID="ctvCategoria" runat="server" ControlToValidate="ddlCategoria"
                                        ErrorMessage="Selecione uma Categoria" ForeColor="Red">*</asp:CustomValidator>
                                    <asp:DropDownList ID="ddlCategoria" runat="server" Width="147px" 
                                        CssClass="txbProdutos" AutoPostBack="True" DataSourceID="odtsCategoria" 
                                        DataTextField="descrCategoria" DataValueField="idCategoria">
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="odtsCategoria" runat="server" 
                                        SelectMethod="ListarCategorias" TypeName="WebSite.Data.DBUtils">
                                    </asp:ObjectDataSource>
                                </asp:Panel>
                                <asp:Panel ID="Panel7" runat="server" CssClass="pnlPD">
                                    <asp:Label ID="Label7" runat="server" Text="Valor Custo" CssClass="lblProdutos" Width="75px"></asp:Label>
                                    <asp:RequiredFieldValidator ID="rfvCusto" runat="server" ErrorMessage="Digite o Valor de Custo"
                                        ControlToValidate="txbCusto" ForeColor="Red">*</asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txbCusto" runat="server" CssClass="txbProdutos"></asp:TextBox>
                                </asp:Panel>
                            </asp:Panel>
                            <asp:Panel ID="Panel3" runat="server" Height="61px" Width="417px" CssClass="pnlDadosProdutos">
                                <asp:Panel ID="Panel8" runat="server" CssClass="pnlPE" Height="51px" Width="163px">
                                    <asp:Label ID="Label5" runat="server" Text="Qtde Estoque" CssClass="lblProdutos"
                                        Width="91px"></asp:Label>
                                    <asp:RequiredFieldValidator ID="rfvQtde" runat="server" ErrorMessage="Quantidade Mínima = 1"
                                        ForeColor="Red" ControlToValidate="txbQtde">*</asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txbQtde" runat="server" CssClass="txbProdutos">1</asp:TextBox>
                                </asp:Panel>
                                <asp:Panel ID="Panel9" runat="server" CssClass="pnlPD" Height="52px">
                                    <asp:Label ID="Label3" runat="server" Text="Valor Venda" CssClass="lblProdutos" Width="81px"></asp:Label>
                                    <asp:RequiredFieldValidator ID="rfvValor" runat="server" ControlToValidate="txbVenda"
                                        ErrorMessage="Digite o Valor de Venda" ForeColor="Red">*</asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txbVenda" runat="server" CssClass="txbProdutos"></asp:TextBox>
                                </asp:Panel>
                            </asp:Panel>
                            <asp:Panel ID="Panel4" runat="server" Height="62px" Width="417px" CssClass="pnlDadosProdutos">
                                <asp:CheckBoxList ID="cblOutros" runat="server" CssClass="lblProdutos">
                                    <asp:ListItem Value="0">Frete Grátis</asp:ListItem>
                                    <asp:ListItem Selected="True" Value="1">Ativo</asp:ListItem>
                                </asp:CheckBoxList>
                            </asp:Panel>
                            <asp:Panel ID="Panel5" runat="server" Height="78px" Width="417px" CssClass="pnlDadosProdutos">
                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" Height="74px" ForeColor="Red" />
                            </asp:Panel>
                        </asp:Panel>
                    </div>
                </asp:WizardStep>
                <asp:WizardStep ID="wzsImagens" runat="server" Title="Imagens">
                    <div class="content">
                        <asp:Panel ID="pnlImagem" runat="server">
                            <asp:Panel ID="Panel10" runat="server" CssClass="pnlImgSelecionar" Width="921px"
                                 Style="margin-left: 0px">
                                <asp:GridView ID="grdImagens" runat="server" CellPadding="4" ForeColor="#333333"
                                    GridLines="None" PageSize="4" AutoGenerateColumns="False" Width="445px" DataSourceID="odtsImagens"
                                    DataKeyNames="idImagem,localImagem" OnRowCommand="grdImagens_RowCommand" Height="304px"
                                    CssClass="grdImagens" 
                                    OnSelectedIndexChanged="grdImagens_SelectedIndexChanged">
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    <Columns>
                                        <asp:BoundField DataField="partImagem" ReadOnly="True" HeaderText="Prioridade">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="Imagem">
                                            <ItemTemplate>
                                                <asp:Image ID="Image2" runat="server" Height="94px" Width="102px" ImageUrl='<%# Bind("localImagem") %>'/>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="nomeImagem" HeaderText="Nome" />
                                        <asp:CommandField ShowSelectButton="True" />
                                    </Columns>
                                    <EditRowStyle BackColor="#999999" />
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                </asp:GridView>
                                <asp:ObjectDataSource ID="odtsImagens" runat="server" 
                                    SelectMethod="ConsultaImagens" TypeName="WebSite.Business.ImagensDAO">
                                    <SelectParameters>
                                        <asp:SessionParameter DefaultValue="0" Name="idProduto" 
                                            SessionField="idProduto" Type="Int32" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                                <asp:Panel ID="pnlImagemsDireita" runat="server" CssClass="cont" Height="521px" 
                                    Width="459px">
                                    <asp:Panel ID="pnlImagemMostrar" runat="server" Height="297px" Width="412px">
                                        <asp:Image ID="imgProduto" runat="server" Height="270px" Width="353px" />
                                    </asp:Panel>
                                    <asp:Panel ID="pnlimgBotoes" runat="server" Height="53px" Width="469px" 
                                        CssClass="rfvlabel">
                                        <asp:Panel ID="pnlbtnfileupload" runat="server" Width="288px" CssClass="pnlfloatLeft">
                                            <asp:FileUpload ID="fplImagemProduto" runat="server" CssClass="botao" 
                                                Style="margin-left: 0px;" Width="286px" />
                                            
                                        </asp:Panel>
                                        <asp:Panel ID="pnlRefresh" runat="server" Width="57px" CssClass="pnlfloatLeft" 
                                            style="margin-left: 16px">
                                            <asp:ImageButton ID="ibtnRefresh" runat="server" 
                                                ImageUrl="~/Content/Imagens/refresh.png" CssClass="ibtnRefresh" 
                                                OnClick="ibtnRefresh_Click" />
                                        </asp:Panel>
                                        <asp:Panel ID="pnlbtnOK" runat="server" Height="48px" Width="59px" 
                                            CssClass="pnlfloatLeft" style="margin-left: 16px">
                                            <asp:Button ID="btnEditar" runat="server" Text="Editar" CssClass="botao" 
                                                Style="margin-left: 0px;" OnClick="btnEditar_Click" />
                                        </asp:Panel>
                                    </asp:Panel>
                                </asp:Panel>
                            </asp:Panel>
                        </asp:Panel>
                    </div>
                </asp:WizardStep>
                <asp:WizardStep ID="wzsPagamento" runat="server" Title="Pagamento" StepType="Finish">
                    <div class="content">
                        <asp:Panel ID="pnlPagamento" runat="server">
                            <asp:Panel ID="Panel12" runat="server">
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <asp:Panel ID="pnlGridPrimeiro" runat="server" style="float:left; margin-left:130px;">
                                            <asp:GridView ID="grdBandeira" runat="server" CellPadding="4" ForeColor="#333333"
                                                GridLines="None" AutoGenerateColumns="False" Width="219px" Height="74px" DataSourceID="odtsBandeira"
                                                OnDataBound="grdBandeira_DataBound" DataKeyNames="idPagamento">
                                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                <Columns>
                                                    <asp:TemplateField>
                                                        <HeaderTemplate>
                                                            <asp:CheckBox ID="ckbTodos" runat="server" OnCheckedChanged="checkedAll_Changed"
                                                                AutoPostBack="True" />
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="ckbItem" runat="server" OnCheckedChanged="CheckedItem_Changed"
                                                                AutoPostBack="True" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Bandeira">
                                                        <ItemTemplate>
                                                            <asp:Image ID="imgBandeira" runat="server" ImageUrl='<%# Bind("imagemPagamento") %>' Width="32px" Height="32px" />
                                                            <asp:Label ID="lnbDescricao" runat="server" Text='<%# Bind("descrPagamento") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <EditRowStyle BackColor="#999999" />
                                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                            </asp:GridView>
                                        </asp:Panel>
                                        <asp:Panel ID="pnlInserirCadastroProdutos" runat="server" CssClass="pnlInserirCadastroProdutos" style="float:left;">
                                            <asp:Button ID="btnInserir" runat="server" Text="Inserir" OnClick="btnInserir_Click" />
                                        </asp:Panel>
                                        <asp:ObjectDataSource ID="odtsBandeira" runat="server" SelectMethod="ConsultarPagamento"
                                            TypeName="WebSite.Data.DBUtils">
                                            <SelectParameters>
                                                <asp:SessionParameter DefaultValue="" Name="idProduto" SessionField="idProduto" Type="Int32" />
                                            </SelectParameters>
                                        </asp:ObjectDataSource>
                                        <asp:Panel ID="pnlGridSegundo" CssClass="grdSegundoFormasPagamento" runat="server"
                                            Width="406px" style="Float:left;">
                                            <asp:GridView ID="grdProduto_Pagamento" runat="server" AutoGenerateColumns="False"
                                                CellPadding="4" ForeColor="#333333" GridLines="None" DataSourceID="odtFormaPagamento"
                                                AllowPaging="True" ShowHeaderWhenEmpty="True" OnDataBinding="grdProduto_Pagamento_DataBinding"
                                                OnRowCommand="grdProduto_Pagamento_RowCommand" PageSize="7" Width="437px" 
                                                DataKeyNames="idProduto">
                                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Bandeira">
                                                        <ItemTemplate>
                                                            <asp:Image ID="Imagem1" runat="server" ImageUrl='<%# Bind("imagemPagamento") %>' Width="32px" Height="32px" />
                                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("descrPagamento") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Qtde Parcela">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txbQtde" runat="server" Text='<%# Bind("qtdeParcela") %>' Width="35px"></asp:TextBox>
                                                            <asp:NumericUpDownExtender ID="txbQtde_NumericUpDownExtender" runat="server" Enabled="True"
                                                                Maximum="1.7976931348623157E+308" Minimum="0" RefValues="" ServiceDownMethod=""
                                                                ServiceDownPath="" ServiceUpMethod="" Tag="" TargetButtonDownID="" TargetButtonUpID=""
                                                                TargetControlID="txbQtde" Width="70">
                                                            </asp:NumericUpDownExtender>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblQtde" runat="server" Text='<%# Bind("qtdeParcela") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="(%) Juros">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txbJuros" runat="server" Text='<%# Bind("jurosParcela") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblJuros" runat="server" Text='<%# Bind("jurosParcela") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Right" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField ShowHeader="False">
                                                        <EditItemTemplate>
                                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Alterar"
                                                                Text="Alterar" CommandArgument='<%# Eval("idProdPag") %>'></asp:LinkButton>
                                                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                                                                Text="Cancelar"></asp:LinkButton>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit"
                                                                Text="Editar"></asp:LinkButton>
                                                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Deletar"
                                                                Text="Excluir" CommandArgument='<%# Eval("idProdPag") %>'></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <EditRowStyle BackColor="#999999" />
                                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                            </asp:GridView>
                                        </asp:Panel>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                                <asp:ObjectDataSource ID="odtFormaPagamento" runat="server" SelectMethod="ConsultaProd_Pag"
                                    TypeName="WebSite.Business.Prod_PagDAO">
                                    <SelectParameters>
                                        <asp:SessionParameter DefaultValue="0" Name="idProduto" 
                                            SessionField="idProduto" Type="Int32" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                            </asp:Panel>
                        </asp:Panel>
                    </div>
                </asp:WizardStep>
            </WizardSteps>
            <CancelButtonStyle CssClass="botao" />
            <FinishCompleteButtonStyle CssClass="botao" />
            <FinishPreviousButtonStyle CssClass="botao" />
            <HeaderTemplate>
                <ul id="wizHeader">
                    <asp:Repeater ID="SideBarList" runat="server">
                        <ItemTemplate>
                            <li><a class="<%# GetClassForWizardStep(Container.DataItem) %>" title="<%#Eval("Name")%>">
                                <%# Eval("Name")%></a></li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </HeaderTemplate>
        </asp:Wizard>
    </asp:Panel>
    <asp:Panel ID="pnlMessage" runat="server" BackColor="White" Height="125px" 
        BorderColor="#BADAFB" Visible="False" Enabled="false" 
        style="z-index: 9999; position:absolute; top: 1144px; left: 13px; width: 309px;" 
        BorderStyle="Solid">
        <div ID="dvCabecalho" style="height: 22px; background-color: #badafb;">
            <asp:Label ID="lblTitulo" runat="server" Text="Compre da Vitrine" Width="280px" 
                Font-Bold="True"></asp:Label>
        </div>
        <div style="height: 69px;">
            <asp:Label ID="lblMensagem" runat="server" Font-Size="Medium" style="text-align:center;">Deseja confirmar o cadastro do produto?</asp:Label>
        </div>
        <div style="height: 30px; background-color: #f0f0f0; text-align:center">
            <asp:Button ID="btnSim" runat="server" Text="Sim" Height="31px" Width="72px" 
                onclick="btnSim_Click"/>
            <asp:Button ID="btnNao" runat="server" Text="Não" Height="31px" Width="72px" 
                onclick="btnNao_Click"/>
        </div>
    </asp:Panel>
    <asp:DragPanelExtender ID="pnlMessage_DragPanelExtender" runat="server" 
        DragHandleID="pnlMessage" Enabled="True" TargetControlID="pnlMessage">
    </asp:DragPanelExtender>
</asp:Content>
