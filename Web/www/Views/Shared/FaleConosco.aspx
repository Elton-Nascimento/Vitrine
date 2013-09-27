<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Construction/MasterPage.master" AutoEventWireup="true"
    CodeFile="FaleConosco.aspx.cs" Inherits="Views_Shared_FaleConosco" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContCont" runat="Server">
    <asp:Panel ID="pnlConteudoFaleConosco" runat="server" Height="501px">
        <asp:Label ID="lblFaleConosco" runat="server" Text="Fale Conosco" CssClass="lblFaleConosco"
            Font-Size="15pt"></asp:Label>
        <asp:Label ID="lblMsgFaleConosco" runat="server" CssClass="lblMsgFaleConosco" Text="Entre em contato conosco atravez do formulário abaixo para que possamos melhor atende-lo"></asp:Label>
        <asp:Panel ID="pnlFormFaleConosco" runat="server" CssClass="pnlFormFaleConosco" Height="341px"
            Width="597px">
            <asp:Panel ID="Panel2" runat="server" Height="52px" Width="300px" CssClass="pnlsFaleConosco">
                <asp:Label ID="lblNomeFaleConosco" runat="server" Text="Nome" Width="300px"></asp:Label>
                <asp:TextBox ID="txbNomeFaleConosco" runat="server" Height="22px" Width="250px"></asp:TextBox>
            </asp:Panel>
            <asp:Panel ID="pnlEmailFaleConosco" runat="server" Height="52px" Width="300px" CssClass="pnlsFaleConosco">
                <asp:Label ID="lblEmailFaleConosco" runat="server" Text="Email" Width="300px"></asp:Label>
                <asp:TextBox ID="txbEmailFaleConosco" runat="server" Height="22px" Width="250px"></asp:TextBox>
            </asp:Panel>
            <asp:Panel ID="pnlAssuntoFaleConosco" runat="server" CssClass="pnlsFaleConosco" Height="52px"
                Width="300px">
                <asp:Label ID="lblAssuntoFaleConosco" runat="server" Text="Assunto" Width="300px"></asp:Label>
                <asp:TextBox ID="txbAssuntoFaleConosco" runat="server" Height="22px" Width="250px"></asp:TextBox>
            </asp:Panel>
            <asp:Panel ID="pnlMensagemFaleConosco" runat="server" CssClass="pnlMensagemFaleConosco"
                Height="152px" Width="271px">
            </asp:Panel>
        </asp:Panel>
    </asp:Panel>
</asp:Content>
