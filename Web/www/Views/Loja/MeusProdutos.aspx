<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Construction/MasterPage2.master" AutoEventWireup="true" CodeFile="MeusProdutos.aspx.cs" Inherits="Views_Loja_MeusProdutos" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContCont" Runat="Server">
    <asp:Panel ID="pnlProdutos" runat="server">
        <asp:Label ID="lblNomeProduto" runat="server" Text="Nome do Produto" 
            CssClass="lblNomeProdutoMeusProdutos"></asp:Label>
        <asp:TextBox ID="txbNomeProduto" runat="server" 
            CssClass="txbNomeProdutoMeusProdutos" Width="175px"></asp:TextBox>
        <asp:Label ID="lblCategoria" runat="server" CssClass="lblCategoriaMeusProdutos" 
            Text="Categoria"></asp:Label>
        <asp:DropDownList ID="ddlCategoria" runat="server" Width="150px" 
            DataTextField="descrCategoria" DataValueField="idCategoria">
            <asp:ListItem>--</asp:ListItem>
        </asp:DropDownList>
        <asp:Button ID="btnPesquisar" runat="server" Text="Pesquisar" 
            onclick="btnPesquisar_Click" />
        <asp:Button ID="btnNovo" runat="server" CssClass="btnNovoMeusProdutos" 
            Text="Novo" onclick="btnNovo_Click" />
        <asp:Panel ID="pnlGrid" runat="server" CssClass="pnlGridMeusProdutos" 
            Width="817px">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="grdMeusProdutos" runat="server" AllowPaging="True" 
                        AllowSorting="True" AutoGenerateColumns="False" CssClass="grdMeusProdutos" 
                        CellPadding="4" ForeColor="#333333" 
                        GridLines="None" onrowcommand="grdMeusProdutos_RowCommand" 
                        EmptyDataText="Nenhum produto cadastrado!" ShowHeaderWhenEmpty="True">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="descrProduto" HeaderText="Produto" 
                                SortExpression="descrProduto">
                            <HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="descrCategoria" HeaderText="Categoria" 
                                SortExpression="descrCategoria">
                            <HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="qtdeEstoque" HeaderText="Estoque" 
                                SortExpression="qtdeEstoque">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField DataField="valorVenda" DataFormatString="{0:c}" 
                                HeaderText="Preço" SortExpression="valorVenda" />
                            <asp:TemplateField HeaderText="Like" SortExpression="likeProduto">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("likeProduto") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("likeProduto") %>'></asp:Label>
                                    <asp:Image ID="unlikeProduto" runat="server" ImageUrl="~/Content/Imagens/like.png" />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Unlike" SortExpression="unlikeProduto">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("unlikeProduto") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("unlikeProduto") %>'></asp:Label>
                                    <asp:Image ID="unlikeProduto" runat="server" ImageUrl="~/Content/Imagens/unlike.png" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CheckBoxField DataField="ativoProduto" HeaderText="Ativação Produto" 
                                SortExpression="ativoProduto" Text="Ativo"/>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Image ID="Image2" runat="server" ImageUrl="~/Content/Imagens/folder.png" />
                                    <asp:LinkButton ID="lkbGrdMeusProdutos" runat="server" CommandArgument='<%# Eval("idProduto") %>' 
                                    CommandName='Editar'>Editar</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle ForeColor="White" Wrap="True" BackColor="#5D7B9D" 
                            Font-Bold="True" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>
    </asp:Panel>
</asp:Content>

