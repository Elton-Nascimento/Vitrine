<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Construction/MasterPage2.master"
    AutoEventWireup="true" CodeFile="FinalizaCompra.aspx.cs" Inherits="Views_Shared_FinalizaCompra" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContCont" runat="Server">
    <asp:Panel ID="pnlFinalizaCompra" runat="server" Height="414px">
        <asp:Panel ID="pnlgrid" runat="server">
        <asp:GridView ID="grdCarrinho" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" CellPadding="4" 
            DataKeyNames="idPedido,idItem" ForeColor="#333333" 
            GridLines="None" PageSize="7" ShowFooter="True" 
                EmptyDataText="Adicione produtos ao seu carrinho de Compras!" 
                ShowHeaderWhenEmpty="True" style=" margin-left:auto; margin-right:auto;" 
                onrowcommand="grdCarrinho_RowCommand" 
                onrowdatabound="grdCarrinho_RowDataBound">
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
                    SortExpression="valorItem" DataFormatString="{0:C}">
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="dtPedido" HeaderText="Data Pedido" 
                    SortExpression="dtPedido">
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="nomeFantasia" FooterText="Total" HeaderText="Loja" 
                    SortExpression="nomeFantasia">
                <FooterStyle HorizontalAlign="Right" />
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:TemplateField FooterText="0.00" ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="lkbExcluir" runat="server" CausesValidation="False" 
                            CommandName="Excluir" CommandArgument='<%# Eval("idItem")%>' Text="Excluir"></asp:LinkButton>
                    </ItemTemplate>
                    <FooterStyle HorizontalAlign="Right" />
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
        <asp:Panel ID="pnlBotoesCompras" runat="server" CssClass="pnlbotoesCompras" 
            Height="76px" style="margin-left: 2px">
            <asp:Panel ID="Panel1" runat="server" Width="302px" 
                CssClass="pnlfloatleft" style="margin-left: 0px; float:right; margin-right:80px;">
                <asp:Button ID="btnLimpaCarrinho" runat="server" Text="Limpar Carrinho" 
                    CssClass="botao" style="font: bold 14px calibri; margin-right: 150px;" 
                    onclick="btnLimpaCarrinho_Click"/>
            </asp:Panel>
            <asp:Panel ID="pnlContComprando" runat="server" Width="318px" 
                CssClass="pnlfloatleft">
                <asp:Button ID="btnContComprando" runat="server" Text="Voltar às Compras" 
                    CssClass="botao" style="font: bold 14px calibri; float:left" 
                    onclick="btnContComprando_Click"/>
            </asp:Panel>
            <asp:Panel ID="pnlFinaCompras" runat="server" Width="214px" 
                CssClass="pnlLogoLoja">
                <asp:Button ID="btnFinaCompras" runat="server" Text="Finalizar Compras" 
                    CssClass="botao" style="font: bold 14px calibri; float:left;" 
                    onclick="btnFinaCompras_Click" />
            </asp:Panel>
        </asp:Panel>
    </asp:Panel>
    <asp:Panel ID="pnlMessage" runat="server" BackColor="White" Height="125px" 
        BorderColor="#BADAFB" Visible="False" Enabled="false" 
        style="z-index: 9999; position:absolute; top: 1316px; left: 17px; width: 309px;" 
        BorderStyle="Solid">
        <div ID="dvCabecalho" style="height: 22px; background-color: #badafb;">
            <asp:Label ID="lblTitulo" runat="server" Text="Compre da Vitrine" Width="280px" 
                Font-Bold="True"></asp:Label>
        </div>
        <div style="height: 69px;">
            <asp:Label ID="lblMensagem" runat="server" Font-Size="Medium" style="text-align:center;">Deseja confirmar a compra desses produtos?</asp:Label>
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
