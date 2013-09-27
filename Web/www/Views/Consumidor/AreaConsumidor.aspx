<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Construction/MasterPage2.master"
    AutoEventWireup="true" CodeFile="AreaConsumidor.aspx.cs" Inherits="Views_Shared_AreaConsumidor" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Consumidor" ContentPlaceHolderID="ContCont" runat="Server">
    <asp:Panel ID="pnlConsumidor" runat="server" Height="650px" CssClass="AreaConsumidor">
        <asp:TabContainer ID="tbcConsumidor" runat="server" ActiveTabIndex="0" Height="586px"
            Width="909px">
            <asp:TabPanel ID="TabPanel1" runat="server" HeaderText="TabPanel1">
                <HeaderTemplate>
                    Histórico
                </HeaderTemplate>
                <ContentTemplate>
                    <asp:Accordion ID="Accordion1" runat="server" ContentCssClass="accordionContent"
                        CssClass="accordion" FramesPerSecond="30" HeaderCssClass="accordionHeader" HeaderSelectedCssClass="accordionHeaderSelected"
                        Height="447px" TransitionDuration="250" Width="879px">
                        <Panes>
                            <asp:AccordionPane ID="acpMeusPedidos" runat="server" ContentCssClass="" HeaderCssClass="1">
                                <Header>
                                    Meus Pedidos</Header>
                                <Content>
                                    <asp:Panel ID="pnlMeusPedidos" runat="server">
                                        <asp:GridView ID="grdPedido" runat="server" AllowPaging="True" 
                                                    AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
                                                    GridLines="None" PageSize="7" 
                                                        EmptyDataText="Nenhum pedido realizado!" 
                                                        ShowHeaderWhenEmpty="True" DataSourceID="odtsPedido">
                                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                    <Columns>
                                                        <asp:BoundField DataField="numPedido" HeaderText="Num. Pedido" 
                                                            SortExpression="numPedido" />
                                                        <asp:TemplateField HeaderText="Imagem" SortExpression="localImagem">
                                                            <ItemTemplate>
                                                                <asp:Image ID="imgProduto" runat="server" AlternateText="Imagem" Height="90px" ImageUrl='<%# Bind("localImagem") %>'
                                                                    Width="90px" />
                                                            </ItemTemplate>
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="descrProduto" HeaderText="Produto" 
                                                            SortExpression="descrProduto">
                                                        <HeaderStyle HorizontalAlign="Left" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="qtdeItem" HeaderText="Qtde" 
                                                            SortExpression="qtdeItem">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="descrPagamento" HeaderText="Forma Pagamento" 
                                                            SortExpression="descrPagamento" />
                                                        <asp:BoundField DataField="qtdeParcela" HeaderText="Parcelas" 
                                                            SortExpression="qtdeParcela">
                                                        <FooterStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="valorItem" HeaderText="Valor" 
                                                            SortExpression="valorItem">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Right" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="dtPedido" HeaderText="Data Pedido" 
                                                            SortExpression="dtPedido">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="sitPedido" HeaderText="Situação" 
                                                            SortExpression="sitPedido" />
                                                        <asp:BoundField DataField="nomeFantasia" HeaderText="Loja" 
                                                            SortExpression="nomeFantasia">
                                                        <FooterStyle HorizontalAlign="Center" />
                                                        <HeaderStyle HorizontalAlign="Left" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                        </asp:BoundField>
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
                                                <asp:ObjectDataSource ID="odtsPedido" runat="server" 
                                                    SelectMethod="ConsultaPedido" TypeName="WebSite.Business.PedidoDAO">
                                                    <SelectParameters>
                                                        <asp:Parameter DefaultValue="Pedido" Name="Modo" Type="String" />
                                                        <asp:Parameter DefaultValue="" Name="guidVisitante" Type="String" />
                                                        <asp:SessionParameter Name="idUsuario" SessionField="idUsuario" Type="Int32" />
                                                    </SelectParameters>
                                                </asp:ObjectDataSource>
                                    </asp:Panel>
                                </Content>
                            </asp:AccordionPane>
                            <asp:AccordionPane ID="acpMinhasCompras" runat="server" ContentCssClass="" HeaderCssClass="">
                                <Header>
                                    Minhas Compras</Header>
                                <Content>
                                    <asp:Panel ID="pnlMinhasCompras" runat="server">
                                        <asp:GridView ID="grdCompra" runat="server" AllowPaging="True" 
                                         AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
                                         GridLines="None" PageSize="7" 
                                             EmptyDataText="Nenhuma compra feita!" 
                                             ShowHeaderWhenEmpty="True" DataSourceID="odtsCompra">
                                         <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                         <Columns>
                                             <asp:TemplateField HeaderText="Imagem" SortExpression="localImagem">
                                                 <ItemTemplate>
                                                     <asp:Image ID="imgProduto" runat="server" AlternateText="Imagem" Height="90px" ImageUrl='<%# Bind("localImagem") %>'
                                                         Width="90px" />
                                                 </ItemTemplate>
                                                 <HeaderStyle HorizontalAlign="Center" />
                                                 <ItemStyle HorizontalAlign="Center" />
                                             </asp:TemplateField>
                                             <asp:BoundField DataField="descrProduto" HeaderText="Produto" 
                                                 SortExpression="descrProduto">
                                             <HeaderStyle HorizontalAlign="Left" />
                                             <ItemStyle HorizontalAlign="Left" />
                                             </asp:BoundField>
                                             <asp:BoundField DataField="qtdeItem" HeaderText="Qtde" 
                                                 SortExpression="qtdeItem">
                                             <HeaderStyle HorizontalAlign="Center" />
                                             <ItemStyle HorizontalAlign="Center" />
                                             </asp:BoundField>
                                             <asp:BoundField DataField="descrPagamento" HeaderText="Forma Pagamento" 
                                                 SortExpression="descrPagamento" />
                                             <asp:BoundField DataField="qtdeParcela" HeaderText="Parcelas" 
                                                 SortExpression="qtdeParcela">
                                             <FooterStyle HorizontalAlign="Center" />
                                             <ItemStyle HorizontalAlign="Center" />
                                             </asp:BoundField>
                                             <asp:BoundField DataField="valorItem" HeaderText="Valor" 
                                                 SortExpression="valorItem">
                                             <HeaderStyle HorizontalAlign="Center" />
                                             <ItemStyle HorizontalAlign="Right" />
                                             </asp:BoundField>
                                             <asp:BoundField DataField="dtPedido" HeaderText="Data Pedido" 
                                                 SortExpression="dtPedido">
                                             <HeaderStyle HorizontalAlign="Center" />
                                             <ItemStyle HorizontalAlign="Center" />
                                             </asp:BoundField>
                                             <asp:BoundField DataField="sitPedido" HeaderText="Situação" 
                                                 SortExpression="sitPedido" />
                                             <asp:BoundField DataField="nomeFantasia" HeaderText="Loja" 
                                                 SortExpression="nomeFantasia">
                                             <FooterStyle HorizontalAlign="Center" />
                                             <HeaderStyle HorizontalAlign="Left" />
                                             <ItemStyle HorizontalAlign="Left" />
                                             </asp:BoundField>
                                             <asp:BoundField DataField="dtPagamento" HeaderText="Data Pagamento" 
                                                 SortExpression="dtPagamento" />
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
                                     <asp:ObjectDataSource ID="odtsCompra" runat="server" 
                                         SelectMethod="ConsultaPedido" TypeName="WebSite.Business.PedidoDAO">
                                         <SelectParameters>
                                             <asp:Parameter DefaultValue="Compra" Name="Modo" Type="String" />
                                             <asp:Parameter DefaultValue="" Name="guidVisitante" Type="String" />
                                             <asp:SessionParameter Name="idUsuario" SessionField="idUsuario" Type="Int32" />
                                         </SelectParameters>
                                     </asp:ObjectDataSource>
                                    </asp:Panel>
                                </Content>
                            </asp:AccordionPane>
                            <asp:AccordionPane ID="acpMeusDesejos" runat="server" ContentCssClass="" HeaderCssClass="">
                                <Header>
                                    Meus Desejos</Header>
                                <Content>
                                    <asp:Panel ID="pnlMeusDesejos" runat="server">
                                        <asp:GridView ID="grdDesejos" runat="server" CellPadding="4" 
                                            DataSourceID="odtsDesejos" ForeColor="#333333" GridLines="None" AutoGenerateColumns="false"
                                            EmptyDataText="Nenhum produto adicionado a lista de Desejos!" ShowHeaderWhenEmpty="True">
                                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                            <Columns>
                                                <asp:TemplateField HeaderText="Imagem" SortExpression="localImagem">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("localImagem") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("localImagem") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="descrProduto" HeaderText="Produto" 
                                                    SortExpression="descrProduto" />
                                                <asp:BoundField DataField="descrCategoria" HeaderText="Categoria" 
                                                    SortExpression="descrCategoria" />
                                                <asp:BoundField DataField="nomeFantasia" HeaderText="Loja" 
                                                    SortExpression="nomeFantasia" />
                                                <asp:BoundField DataField="qtdeEstoque" HeaderText="Qtde Estoque" 
                                                    SortExpression="qtdeEstoque" />
                                                <asp:CheckBoxField DataField="freteGratis" HeaderText="freteGratis" 
                                                    ReadOnly="True" SortExpression="freteGratis" />
                                                <asp:TemplateField HeaderText="likeProduto" SortExpression="likeProduto">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("likeProduto") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("likeProduto") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="unlikeProduto" SortExpression="unlikeProduto">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("unlikeProduto") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("unlikeProduto") %>'></asp:TextBox>
                                                    </EditItemTemplate>
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
                                        <asp:ObjectDataSource ID="odtsDesejos" runat="server" 
                                            SelectMethod="ListaDesejos" TypeName="WebSite.Business.DesejosDAO">
                                            <SelectParameters>
                                                <asp:SessionParameter DefaultValue="0" Name="idConsumidor" 
                                                    SessionField="idConsumidor" Type="Int32" />
                                            </SelectParameters>
                                        </asp:ObjectDataSource>
                                    </asp:Panel>
                                </Content>
                            </asp:AccordionPane>
                        </Panes>
                    </asp:Accordion>
                </ContentTemplate>
            </asp:TabPanel>
            <asp:TabPanel ID="tbpnlDadosdoComprador" runat="server" HeaderText="TabPanel2">
                <HeaderTemplate>
                    Dados do Consumidor
                </HeaderTemplate>
                <ContentTemplate>
                    <asp:Panel ID="pnlAreaConsumidor" runat="server" CssClass="AreaConsumidor" Height="522px">
                        <asp:Panel ID="pnlNome" runat="server" CssClass="pnlEsquerda" Height="50px" Width="397px">
                            <asp:Label ID="lblNome" runat="server" CssClass="lblAreaConsumidor" Height="19px"
                                Text="Nome" Width="39px"></asp:Label><asp:RequiredFieldValidator ID="rfvNome" runat="server"
                                    ControlToValidate="txbNome" CssClass="rfvlabel" ErrorMessage="Digite seu Nome!"
                                    ForeColor="Red" ValidationGroup="dados">*</asp:RequiredFieldValidator><asp:TextBox
                                        ID="txbNome" runat="server" CssClass="txbAreaConsumidorNome" ValidationGroup="dados"></asp:TextBox></asp:Panel>
                        <asp:Panel ID="pnlCPF" runat="server" CssClass="pnlAreaConsumidord" Height="50px"
                            Width="300px" style="float:left;">
                            <asp:Label ID="lblCPF" runat="server" CssClass="lblAreaConsumidor" Height="18px"
                                Text="CPF" Width="201px"></asp:Label><asp:TextBox ID="txbDocumento" runat="server"
                                    CssClass="txbAreaConsumidor" Enabled="False" ValidationGroup="dados" Width="224px"></asp:TextBox><asp:MaskedEditExtender
                                        ID="txbDocumento_MaskedEditExtender" runat="server" CultureAMPMPlaceholder=""
                                        CultureCurrencySymbolPlaceholder="" CultureDateFormat="" CultureDatePlaceholder=""
                                        CultureDecimalPlaceholder="" CultureThousandsPlaceholder="" CultureTimePlaceholder=""
                                        Enabled="True" Mask="999.999.999-99" MaskType="Number" TargetControlID="txbDocumento">
                                    </asp:MaskedEditExtender>
                        </asp:Panel>
                        <asp:Panel ID="pnlDtaNasc" runat="server" CssClass="pnlAreaConsumidore" Height="50px"
                            Width="206px">
                            <asp:Label ID="lblDtaNasc" runat="server" CssClass="lblAreaConsumidor" Height="18px"
                                Text="Data Nascimento" Width="124px"></asp:Label><asp:RequiredFieldValidator ID="rfvDtaNasc"
                                    runat="server" ControlToValidate="txbDtNascimento" CssClass="rfvlabel" EnableClientScript="False"
                                    ErrorMessage="Digite o Nascimento" ForeColor="Red" ValidationGroup="dados">*</asp:RequiredFieldValidator><asp:TextBox
                                        ID="txbDtNascimento" runat="server" CssClass="txbAreaConsumidor" ValidationGroup="dados"
                                        Width="100px"></asp:TextBox><asp:CalendarExtender ID="txbDtNascimento_CalendarExtender"
                                            runat="server" Enabled="True" PopupButtonID="ibtnCalendario" TargetControlID="txbDtNascimento">
                                        </asp:CalendarExtender>
                            <asp:MaskedEditExtender ID="txbDtNascimento_MaskedEditExtender" runat="server" CultureAMPMPlaceholder=""
                                CultureCurrencySymbolPlaceholder="" CultureDateFormat="" CultureDatePlaceholder=""
                                CultureDecimalPlaceholder="" CultureThousandsPlaceholder="" CultureTimePlaceholder=""
                                Enabled="True" Mask="99/99/9999" MaskType="Date" TargetControlID="txbDtNascimento">
                            </asp:MaskedEditExtender>
                            <asp:ImageButton ID="ibtnCalendario" runat="server" CssClass="ibtnCalendario" Height="24px"
                                ImageUrl="~/Content/Imagens/imgCalendario.jpg" ValidationGroup="dados" Width="27px">
                            </asp:ImageButton></asp:Panel>







                            <asp:Panel ID="pnlSexo" runat="server" CssClass="pnlEsquerda" Height="50px" Width="100px">
                            <asp:Label ID="lblSexo" runat="server" CssClass="lblAreaConsumidor" Height="18px"
                                Text="Endereço" Width="69px"></asp:Label>
                                
                          
                                <asp:DropDownList ID="dllSexo" runat="server">
                                    <asp:ListItem Value="M">Masculino</asp:ListItem>
                                    <asp:ListItem Value="F">Feminino</asp:ListItem>
                                </asp:DropDownList>
                                    
                                        
                               </asp:Panel>






                        <asp:Panel ID="pnlTEL" runat="server" CssClass="pnlCENTRO" Height="50px" Width="550px">
                            <asp:Panel ID="pnlCelular" runat="server" CssClass="pnlAreaConsumidorCEL" Height="50px"
                                Width="191px" style="margin:0px">
                                <asp:Label ID="lblCelular" runat="server" CssClass="lblAreaConsumidor" Height="18px"
                                    Text="Celular" Width="51px" ></asp:Label><asp:RequiredFieldValidator ID="rfvCelular"
                                        runat="server" ControlToValidate="txbCelular" CssClass="rfvlabel" ErrorMessage="Digite o Número do Celular"
                                        ForeColor="Red" ValidationGroup="dados">*</asp:RequiredFieldValidator><asp:TextBox
                                            ID="txbCelular" runat="server" CssClass="txbAreaConsumidor" ValidationGroup="dados"
                                            Width="167px"></asp:TextBox><asp:MaskedEditExtender ID="txbCelular_MaskedEditExtender"
                                                runat="server" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder=""
                                                CultureDateFormat="" CultureDatePlaceholder="" 
                                    CultureDecimalPlaceholder="" CultureThousandsPlaceholder=""
                                                CultureTimePlaceholder="" Enabled="True" Mask="(99)999999999" MaskType="Number"
                                                TargetControlID="txbCelular">
                                            </asp:MaskedEditExtender>
                            </asp:Panel>
                            <asp:Panel ID="pnlTelefone" runat="server" Height="50px"
                                Width="297px" style="float:left; margin:0px">
                                <asp:Label ID="lblTelRes" runat="server" CssClass="lblAreaConsumidor" Height="18px"
                                    Text="Telefone" Width="154px"></asp:Label><asp:TextBox ID="txbTelefone" runat="server"
                                        CssClass="txbAreaConsumidor" ValidationGroup="dados" Width="224px"></asp:TextBox><asp:MaskedEditExtender
                                            ID="txbTelefone_MaskedEditExtender" runat="server" CultureAMPMPlaceholder=""
                                            CultureCurrencySymbolPlaceholder="" CultureDateFormat="" CultureDatePlaceholder=""
                                            CultureDecimalPlaceholder="" CultureThousandsPlaceholder="" CultureTimePlaceholder=""
                                            Enabled="True" Mask="(99)9999-9999" MaskType="Number" 
                                    TargetControlID="txbTelefone">
                                        </asp:MaskedEditExtender>
                            </asp:Panel>
                        </asp:Panel>
                        <asp:Panel ID="pnlCEP" runat="server" CssClass="pnlCEP" Height="50px" Width="150px" style="float:left;">
                            <asp:Label ID="lblCEP" runat="server" CssClass="lblAreaConsumidor" Height="18px"
                                Text="CEP" Width="32px"></asp:Label><asp:RequiredFieldValidator ID="rfvCEP" runat="server"
                                    ControlToValidate="txbCEP" CssClass="rfvlabel" ErrorMessage="Digite o CEP" ForeColor="Red"
                                    ValidationGroup="dados" Width="50px">*</asp:RequiredFieldValidator><asp:TextBox ID="txbCEP"
                                        runat="server" CssClass="txbAreaConsumidor" ValidationGroup="dados" Width="100px"></asp:TextBox><asp:MaskedEditExtender
                                            ID="txbCEP_MaskedEditExtender" runat="server" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder=""
                                            CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder=""
                                            CultureTimePlaceholder="" Enabled="True" Mask="99999-999" MaskType="Number" TargetControlID="txbCEP">
                                        </asp:MaskedEditExtender>
                            <asp:ImageButton ID="ibtnBuscaCep" runat="server" CssClass="ibtnCalendario" Height="24px"
                                ImageUrl="~/Content/Imagens/busca_icon.gif" Width="27px" onclick="ibtnBuscaCep_Click">
                            </asp:ImageButton>
                            </asp:Panel>
                        <asp:Panel ID="pnlUF" runat="server" CssClass="pnlEsquerda" Height="50px" Width="96px">
                            <asp:Label ID="lblUF" runat="server" CssClass="lblAreaConsumidor" Height="18px" Text="UF"
                                Width="22px"></asp:Label><asp:RequiredFieldValidator ID="rfvUF" runat="server" ControlToValidate="txbUf"
                                    CssClass="rfvlabel" ErrorMessage="Digite o Estado" ForeColor="Red" ValidationGroup="dados">*</asp:RequiredFieldValidator><asp:TextBox
                                        ID="txbUf" runat="server" CssClass="txbAreaConsumidor" ValidationGroup="dados"
                                        Width="67px"></asp:TextBox></asp:Panel>
                        <asp:Panel ID="pnlCidade" runat="server" CssClass="pnlCidade" Height="50px" Width="290px">
                            <asp:Label ID="lblCidade" runat="server" CssClass="lblAreaConsumidor" Height="18px"
                                Text="Cidade" Width="49px"></asp:Label><asp:RequiredFieldValidator ID="rfvCidade"
                                    runat="server" ControlToValidate="txbCidade" CssClass="rfvlabel" ErrorMessage="Digite a Cidade"
                                    ForeColor="Red" ValidationGroup="dados">*</asp:RequiredFieldValidator><asp:TextBox
                                        ID="txbCidade" runat="server" CssClass="txbAreaConsumidor" ValidationGroup="dados"
                                        Width="278px"></asp:TextBox></asp:Panel>
                                         <asp:Panel ID="pnlBairro" runat="server" CssClass="pnlAreaConsumidord" Height="50px"
                            Width="190px" style="margin-right:130px">
                            <asp:Label ID="lblBairro" runat="server" CssClass="lblAreaConsumidor" Height="19px"
                                Text="Bairro" Width="43px"></asp:Label><asp:RequiredFieldValidator ID="rfvBairro"
                                    runat="server" ControlToValidate="txbBairro" CssClass="rfvlabel" ErrorMessage="Digite o Bairro"
                                    ForeColor="Red" ValidationGroup="dados" Width="50px">*</asp:RequiredFieldValidator><asp:TextBox
                                        ID="txbBairro" runat="server" CssClass="txbAreaConsumidor" ValidationGroup="dados"
                                        Width="172px"></asp:TextBox>
                                        </asp:Panel>

                        <asp:Panel ID="pnlEndereco" runat="server" CssClass="pnlEsquerda" Height="50px" Width="270px">
                            <asp:Label ID="lblEndereco" runat="server" CssClass="lblAreaConsumidor" Height="18px"
                                Text="Endereço" Width="69px"></asp:Label><asp:RequiredFieldValidator ID="rfvEndereco"
                                    runat="server" ControlToValidate="txbEndereco" CssClass="rfvlabel" ErrorMessage="Digite o Endereço"
                                    ForeColor="Red" ValidationGroup="dados">*</asp:RequiredFieldValidator><asp:TextBox
                                        ID="txbEndereco" runat="server" CssClass="txbAreaConsumidor" ValidationGroup="dados"
                                        Width="250px"></asp:TextBox></asp:Panel>
                        <asp:Panel ID="pnlNumero" runat="server" CssClass="pnlDireita" Height="50px" Width="245px" style="float:left;">
                            <asp:Label ID="lblNumero" runat="server" CssClass="lblAreaConsumidor" Height="17px"
                                Text="Número" Width="56px"></asp:Label><asp:RequiredFieldValidator ID="rfvNumero"
                                    runat="server" ControlToValidate="txbNumero" CssClass="rfvlabel" ErrorMessage="Digite o Número"
                                    ForeColor="Red" ValidationGroup="dados">*</asp:RequiredFieldValidator><asp:TextBox
                                        ID="txbNumero" runat="server" CssClass="txbAreaConsumidor" ValidationGroup="dados"
                                        Width="224px"></asp:TextBox>
                         </asp:Panel>
                        <asp:Panel ID="pnlComplemento" runat="server" CssClass="pnlAreaConsumidore" Height="50px"
                            Width="166px">
                            <asp:Label ID="lblComplemento" runat="server" CssClass="lblAreaConsumidor" Height="18px"
                                Text="Complemento" Width="109px"></asp:Label><asp:TextBox ID="txbComplemento" runat="server"
                                    CssClass="txbAreaConsumidor" ValidationGroup="dados"></asp:TextBox></asp:Panel>
                       
                        <asp:Panel ID="pnlBotoes" runat="server" CssClass="pnlBotoesArea" Height="42px" Width="350px">
							<asp:Button ID="btnConfirmaDados" runat="server" CssClass="botaoRight" OnClick="btnConfirmaDados_Click" 
								Text="Confirmar" ValidationGroup="dados" style="margin-right:93px; margin-top:25px;"></asp:Button></asp:Panel>
                        <asp:Panel ID="pnlSumarioDados" runat="server" Height="213px" CssClass="pnlSumarioDadosConsumidor">
                            <asp:ValidationSummary ID="vlsDadosLoja" runat="server" CssClass="vlsTrocaSenha"
                                ForeColor="Red" Height="154px" ValidationGroup="dados" Width="729px"></asp:ValidationSummary>
                        </asp:Panel>
                    </asp:Panel>
                </ContentTemplate>
            </asp:TabPanel>
            <asp:TabPanel ID="tbpnlConfiguracoesdaConta" runat="server" HeaderText="TabPanel3">
                <HeaderTemplate>
                    Configurações da Conta
                </HeaderTemplate>
                <ContentTemplate>
                    <asp:Accordion ID="Accordion2" runat="server" ContentCssClass="accordionContent"
                        CssClass="accordion" FramesPerSecond="30" HeaderCssClass="accordionHeader" HeaderSelectedCssClass="accordionHeaderSelected"
                        Height="595px" TransitionDuration="250" Width="884px">
                        <Panes>
                            <asp:AccordionPane ID="acpTrocarSenha" runat="server" ContentCssClass="" HeaderCssClass="">
                                <Header>
                                    Trocar Senha</Header>
                                <Content>
                                    <asp:Panel ID="pnlTrocaSenha" runat="server" Height="300px" Width="250px">
                                        <asp:Label ID="lblSenhaAtual" runat="server" CssClass="lblTrocaSenha" Text="Senha Atual"></asp:Label><asp:RequiredFieldValidator
                                            ID="rfvSenhaAtual" runat="server" ControlToValidate="txbSenhaAtual" CssClass="rfvlabel"
                                            ErrorMessage="Digite sua Senha!" ForeColor="Red" ValidationGroup="Senha">*</asp:RequiredFieldValidator><asp:TextBox
                                                ID="txbSenhaAtual" runat="server" CssClass="txbTrocaSenha" TextMode="Password"
                                                ValidationGroup="Senha" Width="200px">
                                            </asp:TextBox><asp:Label ID="lblNovaSenha" runat="server" CssClass="lblTrocaSenha"
                                                Text="Nova Senha">
                                            </asp:Label><asp:RequiredFieldValidator ID="rfvNovaSenha" runat="server" ControlToValidate="txbNovaSenha"
                                                CssClass="rfvlabel" ErrorMessage="Digite a Nova Senha!" ForeColor="Red" ValidationGroup="Senha">*</asp:RequiredFieldValidator><asp:TextBox
                                                    ID="txbNovaSenha" runat="server" CssClass="txbTrocaSenha" TextMode="Password"
                                                    ValidationGroup="Senha" Width="200px">
                                                </asp:TextBox><asp:Label ID="lblConfirmarSenha" runat="server" CssClass="lblTrocaSenha"
                                                    Text="Confirmar Nova Senha">
                                                </asp:Label><asp:RequiredFieldValidator ID="rfvConfirmaSenha" runat="server" ControlToValidate="txbSenhaAtual"
                                                    CssClass="rfvlabel" ErrorMessage="Confirme sua Nova Senha!" ForeColor="Red" ValidationGroup="Senha">*</asp:RequiredFieldValidator><asp:CompareValidator
                                                        ID="CompareValidator1" runat="server" ControlToCompare="txbNovaSenha" ControlToValidate="txbConfirmaSenha"
                                                        CssClass="rfvTrocaSenha" ErrorMessage="Senhas Diferentes" Text="*" ForeColor="Red" ValidationGroup="Senha"></asp:CompareValidator><asp:TextBox
                                                            ID="txbConfirmaSenha" runat="server" CssClass="txbTrocaSenha" TextMode="Password"
                                                            ValidationGroup="Senha" Width="200px">
                                                        </asp:TextBox><asp:Button ID="btnConfirmarSenha" runat="server" CssClass="botaoRight"
                                                            OnClick="btnConfirmarSenha_Click" Text="Confirmar" ValidationGroup="Senha" />
                                                            
                                                            <asp:Panel ID="pnlTrocaSenhaConsumidor" runat="server" CssClass="pnlTrocaSenhaConsumidor">
                                                            <asp:ValidationSummary
                                                                ID="vdsTrocaSenha" runat="server" CssClass="vdsTrocaSenha" DisplayMode="BulletList"
                                                                ForeColor="Red" ValidationGroup="Senha" />
                                                            </asp:Panel>
                                    </asp:Panel>
                                </Content>
                            </asp:AccordionPane>
                            <asp:AccordionPane ID="acpTrocarPergunta" runat="server" ContentCssClass="" HeaderCssClass="">
                                <Header>
                                    Trocar Pergunta de Segurança</Header>
                                <Content>
                                    <asp:Panel ID="pnlTrocaPergunta" runat="server" Height="300px" Width="250px">
                                        <asp:Label ID="lblNovaPergunta" runat="server" CssClass="lblTrocaSenha" Text="Pergunta"></asp:Label><asp:RequiredFieldValidator
                                            ID="rfvPergunta" runat="server" ControlToValidate="ddlPergunta" CssClass="rfvlabel"
                                            ErrorMessage="Escolha a Pergunta" ForeColor="Red" ValidationGroup="Pergunta">*</asp:RequiredFieldValidator><asp:DropDownList
                                                ID="ddlPergunta" runat="server" CssClass="txbTrocaSenha" DataSourceID="odtsPergunta"
                                                DataTextField="DescrPergunta" DataValueField="IdPergunta" ValidationGroup="Pergunta"
                                                Width="200px">
                                            </asp:DropDownList>
                                        <asp:ObjectDataSource ID="odtsPergunta" runat="server" SelectMethod="ListarPerguntas"
                                            TypeName="WebSite.Data.DBUtils"></asp:ObjectDataSource>
                                        <asp:Label ID="lblResposta" runat="server" CssClass="lblTrocaSenha" Text="Resposta Chave"></asp:Label><asp:RequiredFieldValidator
                                            ID="rfvResposta" runat="server" ControlToValidate="txbResposta" CssClass="rfvlabel"
                                            ErrorMessage="Digite sua Resposta" ForeColor="Red" ValidationGroup="Pergunta">*</asp:RequiredFieldValidator><asp:TextBox
                                                ID="txbResposta" runat="server" CssClass="txbTrocaSenha" ValidationGroup="Pergunta"
                                                Width="200px">
                                            </asp:TextBox>
												<asp:Button ID="btnConfirmarPergunta" runat="server" CssClass="botaoRight" OnClick="btnConfirmarPergunta_Click"
                                                    Text="Confirmar" ValidationGroup="Pergunta" /><asp:ValidationSummary ID="vlsTrocaPergunta"
                                                    runat="server" CssClass="vlsTrocaSenha" DisplayMode="List" ForeColor="Red" ValidationGroup="Pergunta" />
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
