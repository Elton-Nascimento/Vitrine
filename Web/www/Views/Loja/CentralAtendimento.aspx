<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Construction/MasterPage2.master" AutoEventWireup="true" CodeFile="CentralAtendimento.aspx.cs" Inherits="Views_Loja_CentralAtendimento" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContCont" runat="Server">
    <asp:Panel ID="Panel1" runat="server" Height="314px">
        <asp:Panel ID="Panel2" runat="server" Height="47px">
            <asp:Label ID="Label1" runat="server" Text="Nome" CssClass="lblSAC"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" CssClass="txbSAC" Width="552px"></asp:TextBox>
        </asp:Panel>
        <asp:Panel ID="Panel3" runat="server" Height="77px">
            <asp:Label ID="Label2" runat="server" Text="Assunto" CssClass="lblSAC"></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server" CssClass="txbSAC" Width="552px"></asp:TextBox>
        </asp:Panel>
        <asp:Panel ID="Panel4" runat="server" Height="77px">
            <asp:Label ID="Label3" runat="server" Text="Descrição" CssClass="lblSAC"></asp:Label>
            <textarea id="TextArea1" cols="20" rows="2"></textarea>
        </asp:Panel>
    </asp:Panel>
</asp:Content>
