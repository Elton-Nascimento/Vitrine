<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Construction/MasterPage.master"
    AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Views_Shared_Login" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content3" ContentPlaceHolderID="ContCont" runat="Server">
    <asp:Panel ID="Panel2" runat="server" Height="235px">
        <asp:Panel ID="pnlogin" runat="server" CssClass="pnlformlogin" Height="182px" Width="316px">
            <asp:Label ID="lblEmail" runat="server" Text="E-mail:"></asp:Label>
            <asp:TextBox ID="txbEmail" runat="server" Width="300px"></asp:TextBox>
            <asp:Label ID="Label1" runat="server" Text="Senha:"></asp:Label>
            <asp:TextBox ID="txbSenha" runat="server" Width="300px" TextMode="Password"></asp:TextBox>
            <asp:CheckBox ID="ckbMantenha" runat="server" Font-Size="10px" Text="Mantenha-me Conectado"
                CssClass="ckblogin" />
            <asp:LinkButton ID="lkbEsqueceu" runat="server" CssClass="lkbesqueceu" OnClick="lkbEsqueceu_Click">Esqueceu sua Senha?</asp:LinkButton>
            <asp:Panel ID="pnlBtnEntrar" runat="server" Width="150px" Height="41px" 
                CssClass="pnlBtnEntrar">
                <asp:Button ID="btnEntrar" runat="server" CssClass="botaoRight" Text="Entrar" Height="36px"
                    Width="103px" OnClick="btnEntrar_Click" />
            </asp:Panel>
        </asp:Panel>
    </asp:Panel>
    <asp:Panel ID="pnlMessage" runat="server" BackColor="White" Height="125px" 
        BorderColor="#BADAFB" Visible="False" Enabled="false" 
        style="z-index: 9999; position:absolute; top: 808px; left: 22px; width: 309px;" 
        BorderStyle="Solid">
        <div ID="dvCabecalho" style="height: 22px; background-color: #badafb;">
            <asp:Label ID="lblTitulo" runat="server" Text="Compre da Vitrine" Width="280px" 
                Font-Bold="True"></asp:Label>
            <asp:LinkButton ID="lnkFechar" runat="server" Width="20px" 
                BackColor="#E38B7F" Font-Bold="True" ForeColor="White" 
                style="text-align:center" onclick="lnkFechar_Click">X</asp:LinkButton>
        </div>
        <div style="height: 69px;">
            <asp:Label ID="lblMensagem" runat="server" Font-Size="Medium" style="text-align:center;">Existem produtos no carrinho, deseja transferi-los para você?</asp:Label>
        </div>
        <div style="height: 30px; background-color: #f0f0f0; text-align:center">
            <asp:Button ID="btnSim" runat="server" Text="Sim" Height="31px" Width="72px" 
                onclick="btnSim_Click"/>
            <asp:Button ID="btnNao" runat="server" Text="Não" Height="31px" Width="72px" 
                onclick="btnNao_Click"/>
            <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" Height="31px" Width="72px" 
                onclick="btnCancelar_Click"/>
        </div>
    </asp:Panel>
    <asp:DragPanelExtender ID="pnlMessage_DragPanelExtender" runat="server" 
        DragHandleID="pnlMessage" Enabled="True" TargetControlID="pnlMessage">
    </asp:DragPanelExtender>
</asp:Content>
