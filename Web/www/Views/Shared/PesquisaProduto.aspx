<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Construction/MasterPage.master" AutoEventWireup="true" CodeFile="PesquisaProduto.aspx.cs" Inherits="Views_Shared_PesquisaProduto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContCont" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    <asp:Panel ID="Panel2" runat="server" CssClass="pnlpesqproduto">
        <asp:GridView ID="grdProduto" runat="server" AllowPaging="True" AutoGenerateColumns="False"
            GridLines="None" Width="696px" AllowSorting="True" 
            HorizontalAlign="Center" DataSourceID="odtsProduto"
            OnRowCommand="grdProduto_RowCommand" PageSize="7" CellPadding="4" 
            ForeColor="#333333" EmptyDataText="Nenum produto encontrado!" 
            ShowHeaderWhenEmpty="True">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:ImageField HeaderText="Foto" NullImageUrl="~/Content/Imagens/SemImagem.gif" DataImageUrlField="localImagem">
                    <ControlStyle Height="95px" Width="90px" />
                </asp:ImageField>
                <asp:TemplateField HeaderText="Descrição" SortExpression="descrProduto">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("descrProduto") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="lkbProduto" runat="server" CausesValidation="False" CommandName="selecionar"
                            CommandArgument='<%# Bind("idProduto")%>'><%# Eval("descrProduto") %></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="valorVenda" HeaderText="Preço" DataFormatString="{0:C2}"
                    SortExpression="valorVenda" />
                <asp:TemplateField HeaderText="Avaliação">
                    <ItemTemplate>
                        <asp:Image ID="imgAprovam" runat="server" ImageUrl="~/Content/Imagens/like.png" />
                        <asp:Label ID="lblAprovam" runat="server" Text='<%# Bind("likeProduto")%>'></asp:Label>
                        <asp:Image ID="imgReprovam" runat="server" ImageUrl="~/Content/Imagens/unlike.png" />
                        <asp:Label ID="lblReprovam" runat="server" Text='<%# Bind("unlikeProduto")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" ForeColor="White" Height="40px" 
                Font-Bold="True" />
            <PagerSettings NextPageText="Proximo &gt;" PreviousPageText="&lt; Anterior" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle Height="70px" BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:ObjectDataSource ID="odtsProduto" runat="server" SelectMethod="PesquisaProduto"
            TypeName="WebSite.Business.ProdutoDAO">
            <SelectParameters>
                <asp:QueryStringParameter ConvertEmptyStringToNull="False" DefaultValue="" 
                    Name="descrProduto" QueryStringField="Descricao" Type="String" />
                <asp:QueryStringParameter DefaultValue="" Name="idCategoria" 
                    QueryStringField="Categoria" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </asp:Panel>
    </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
