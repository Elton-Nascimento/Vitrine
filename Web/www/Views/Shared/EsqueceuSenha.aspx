<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Construction/MasterPage.master"
    AutoEventWireup="true" CodeFile="EsqueceuSenha.aspx.cs" Inherits="Views_Shared_EsqueceuSenha" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContCont" runat="Server">
    <asp:Panel ID="Panel2" runat="server" Height="449px">
        <asp:Label ID="Label1" runat="server" Text="Todos os campos abaixo são obrigatórios"
            CssClass="lblaviso" ForeColor="Red"></asp:Label>
        <asp:Panel ID="pnlFormEsqSenha" runat="server" CssClass="pnlformlogin" Height="369px"
            Width="601px">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
            <asp:Panel ID="pnlCatEsqSenha" runat="server" CssClass="pnlesquerda" Height="50px"
                Width="200px">
                <asp:Label ID="lblCatEsqSenha" runat="server" Text="Categoria" CssClass="lblesqsenha"></asp:Label>
                <asp:DropDownList ID="ddlTipoUsuario" runat="server" Width="200px" AutoPostBack="True">
                    <asp:ListItem Value="CO">Consumidor</asp:ListItem>
                    <asp:ListItem Value="LO">Lojista</asp:ListItem>
                </asp:DropDownList>
            </asp:Panel>
            </ContentTemplate>
            </asp:UpdatePanel>
            <asp:Panel ID="pnlPergEsqSenha" runat="server" CssClass="pnldireita" Height="50px"
                Width="300px">
                <asp:Label ID="lblPergunta" runat="server" CssClass="lblesqsenha" Text="Pergunta de Segurança"></asp:Label>
                <asp:DropDownList ID="ddlPergunta" runat="server" Width="260px" DataSourceID="odtsPergunta"
                    DataTextField="DescrPergunta" DataValueField="IdPergunta">
                </asp:DropDownList>
                <asp:ObjectDataSource ID="odtsPergunta" runat="server" SelectMethod="ListarPerguntas"
                    TypeName="WebSite.Data.DBUtils"></asp:ObjectDataSource>
            </asp:Panel>
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
            <asp:Panel ID="pnlDocEsqSenha" runat="server" CssClass="pnlesquerda" Height="50px"
                Width="200px">
                <asp:Label ID="lblDocumento" runat="server" CssClass="lblesqsenha" Text="CPF/CNPJ"></asp:Label>
                <asp:RequiredFieldValidator ID="rfvDocumento" runat="server" ErrorMessage="*" ForeColor="Red"
                    ControlToValidate="txbDocumento"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="ctvDocumento" runat="server" ControlToValidate="txbDocumento"
                    ErrorMessage="*" ForeColor="Red" OnServerValidate="ctvDocumento_ServerValidate"></asp:CustomValidator>
                <asp:TextBox ID="txbDocumento" runat="server" Width="196px"></asp:TextBox>
            </asp:Panel>
            </ContentTemplate>
            </asp:UpdatePanel>
            <asp:Panel ID="pnlRespEsqSenha" runat="server" CssClass="pnldireita" Height="50px"
                Width="300px">
                <asp:Label ID="pnlResposta" runat="server" CssClass="lblesqsenha" Text="Resposta de Segurança"></asp:Label>
                <asp:RequiredFieldValidator ID="rfvResposta" runat="server" ErrorMessage="*" ForeColor="Red"
                    ControlToValidate="txbResposta"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txbResposta" runat="server" Width="256px"></asp:TextBox>
            </asp:Panel>
            <asp:Panel ID="Panel3" runat="server" CssClass="pnlesquerda" Height="50px" Width="350px">
                <asp:Label ID="lblEmail" runat="server" CssClass="lblesqsenha" Text="E-mail"></asp:Label>
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="*" ForeColor="Red"
                    ControlToValidate="txbEmail"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revEmail" runat="server" ErrorMessage="*" ForeColor="Red"
                    ControlToValidate="txbEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                <asp:TextBox ID="txbEmail" runat="server" Width="320px"></asp:TextBox>
            </asp:Panel>
            <asp:Button ID="btnEnviar" runat="server" CssClass="btnesqsenha" Text="Enviar" OnClick="btnEnviar_Click" />
        </asp:Panel>
    </asp:Panel>
    <asp:Panel ID="pnlMessage" runat="server" BackColor="White" Height="125px" 
        BorderColor="#BADAFB" Visible="False" Enabled="false" 
        style="z-index: 9999; position:absolute; top: 1010px; left: 13px; width: 309px;" 
        BorderStyle="Solid">
        <div ID="dvCabecalho" style="height: 22px; background-color: #badafb;">
            <asp:Label ID="lblTitulo" runat="server" Text="Compre da Vitrine" Width="280px" 
                Font-Bold="True"></asp:Label>
            <asp:LinkButton ID="lnkFechar" runat="server" Width="20px" 
                BackColor="#E38B7F" Font-Bold="True" ForeColor="White" 
                style="text-align:center" onclick="lnkFechar_Click">X</asp:LinkButton>
        </div>
        <div style="height: 69px;">
            <asp:Label ID="lblMensagem" runat="server" Font-Size="Medium" style="text-align:center;">Aguarde, dentro de instantes receberá a ativação no e-mail informado!</asp:Label>
        </div>
        <div style="height: 30px; background-color: #f0f0f0; text-align:center">
            <asp:Button ID="btnOk" runat="server" Text="Ok" Height="31px" Width="72px" 
                onclick="btnOk_Click"/>
        </div>
    </asp:Panel>
    <asp:DragPanelExtender ID="pnlMessage_DragPanelExtender" runat="server" 
        DragHandleID="pnlMessage" Enabled="True" TargetControlID="pnlMessage">
    </asp:DragPanelExtender>
</asp:Content>
