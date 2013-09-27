<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Construction/MasterPage2.master"
    AutoEventWireup="true" CodeFile="Sobre.aspx.cs" Inherits="Views_Shared_Sobre" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContCont" runat="Server">
    <asp:Panel ID="pnlGeralSobre" runat="server" Width="950px" Height="488px" 
        CssClass="pnlGeralSobre">
        <asp:Panel ID="pnlSobreCima" runat="server" Height="390px" Width="890px" CssClass="pnlSobreCima">
            <asp:Panel ID="pnlSobreCVTitulo" runat="server">
                <asp:Panel ID="pnlImagemSobre" runat="server">
                    <asp:Image ID="imgSobreNos" runat="server" CssClass="imgSobreNos" ImageUrl="~/Content/Imagens/sobreNos.png" />
                </asp:Panel>
                <asp:Panel ID="pnlSobreCVTituloTexto" runat="server">
                    <asp:Label ID="lblSobreCVTitulo" runat="server" Text="Grupo Compre da Vitrine" CssClass="lblSobreCVTitulo"></asp:Label>
                </asp:Panel>
            </asp:Panel>
            <asp:Panel ID="pnlSobreCVTexto" runat="server" CssClass="pnlSobreCVTitulo">
                <asp:Label ID="Label3" runat="server" CssClass="lblSobreCV" Text="O Grupo Compre da Vitrine Surgiu do Projeto dos 
                alunos Rafael Urataki, Elton Garbin e Gabriel Fernandes, do Curso Técnico de Informática para Intenet 
                do Centro Paula Sousa Massuyuki Kawano de Tupã no ano de 2011/2012, foi escolhido esse nome para desenvolver
                o projeto de conclusão de curso durante as reunioes do grupo. "></asp:Label>
            </asp:Panel>
            <asp:Panel ID="Panel1" runat="server" CssClass="pnlSobreCVTitulo" >
                <asp:Label ID="Label1" runat="server" CssClass="lblSobreCV" Text="o site consiste em vender os produtos cadastrados por lojistas 
                da região de Tupã."></asp:Label>
            </asp:Panel>
            <asp:Panel ID="Panel2" runat="server" CssClass="pnlSobreCVTitulo">
                <asp:Label ID="Label2" runat="server" CssClass="lblSobreCV" Text="o Vendedor usa o site para vender seus produtos na internet, 
                uma vez que é cadastrado, seus produtos aparecem disponíveis para compras para os usuários do site 
                Compre da Vitrine."></asp:Label>
            </asp:Panel>
            <asp:Panel ID="Panel3" runat="server" CssClass="pnlSobreCVTitulo">
                <asp:Label ID="Label4" runat="server" CssClass="lblSobreCV"
                Text="Preços e Entregas, ficam a critério dos lojistas."></asp:Label>
            </asp:Panel>
            <asp:Panel ID="Panel4" runat="server" CssClass="pnlSobreCVTitulo">
                <asp:Label ID="Label5" runat="server" Text="nosso site está cada dia mais visitado e
                agradecemos muito por isso à vocês Clientes!" CssClass="lblSobreCV"></asp:Label>
            </asp:Panel>
        </asp:Panel>
    </asp:Panel>
</asp:Content>
