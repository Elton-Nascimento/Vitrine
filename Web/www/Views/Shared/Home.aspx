<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Construction/MasterPage.master"
    AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Views_Shared_Home" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ContCont" runat="server">
    <asp:Panel ID="Panel3" runat="server">
        <asp:Repeater ID="rptProdutosAleatorios" runat="server" DataSourceID="odtsProdutoAleatorio">
            <ItemTemplate>
                <div class="dv-cont-left">

                        <asp:LinkButton ID="lkbDesc" runat="server" CssClass="tit-cont-left" OnClick="lnkDetalhes_Click" CommandArgument='<%# Eval("idProduto")%>' Text='<%# Eval("descrProduto") %>' ></asp:LinkButton>
                    <asp:ImageButton ID="imgHome" runat="server" ImageUrl='<%# Eval("localImagem")%>' CssClass="ima-cont-left" />
                    <span class="cifr-cont-left">R$ </span><span class="prec-cont-left">
                        <%# String.Format("{0:F}", Eval("valorVenda")) %></span><div class="subdv-cont-left">
                            <ul>
                                <li><asp:LinkButton ID="lnkDetalhes" runat="server" CssClass="detail" OnClick="lnkDetalhes_Click" CommandArgument='<%# Eval("idProduto")%>'>Detalhes</asp:LinkButton></li>
                            </ul>
                        </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <asp:ObjectDataSource ID="odtsProdutoAleatorio" runat="server" SelectMethod="ProdutoAleatorios"
            TypeName="WebSite.Business.ProdutoDAO"></asp:ObjectDataSource>
    </asp:Panel>
</asp:Content>
