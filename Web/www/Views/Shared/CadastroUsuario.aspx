<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Construction/MasterPage.master"
    AutoEventWireup="true" CodeFile="CadastroUsuario.aspx.cs" Inherits="Views_Shared_CadastroUsuario" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content3" ContentPlaceHolderID="ContCont" runat="Server">
    <asp:Panel ID="Panel3" runat="server" Height="531px">
        <asp:Label ID="Label1" runat="server" Text="Todos os campos abaixo são obrigatórios"
            CssClass="lblaviso" ForeColor="Red"></asp:Label>
        <asp:Panel ID="pnlCadastro" runat="server" CssClass="pnlformlogin" Height="412px"
            Width="588px">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
            <asp:Panel ID="pnlCategoria" runat="server" CssClass="pnlesquerda" Height="50px"
                Width="200px">
                <asp:Label ID="lblCategoria" runat="server" Text="Categoria" CssClass="lblcadastro"></asp:Label>
                <asp:DropDownList ID="ddlTipoUsuario" runat="server" Width="200px" OnSelectedIndexChanged="ddlTipoUsuario_SelectedIndexChanged"
                    AutoPostBack="True">
                    <asp:ListItem Value="F">Consumidor</asp:ListItem>
                    <asp:ListItem Value="J">Lojista</asp:ListItem>
                </asp:DropDownList>
            </asp:Panel>
            </ContentTemplate>
            </asp:UpdatePanel>
            <asp:Panel ID="pnlPergunta" runat="server" CssClass="pnldireita" Width="300px" Height="50px">
                <asp:Label ID="lblPergunta" runat="server" CssClass="lblcadastro" Text="Pergunta de Segurança"></asp:Label>
                <asp:DropDownList ID="ddlPergunta" runat="server" Width="260px" DataSourceID="odtsPergunta"
                    DataTextField="DescrPergunta" DataValueField="IdPergunta">
                </asp:DropDownList>
                <asp:ObjectDataSource ID="odtsPergunta" runat="server" SelectMethod="ListarPerguntas"
                    TypeName="WebSite.Data.DBUtils"></asp:ObjectDataSource>
            </asp:Panel>
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
            <asp:Panel ID="pnlDocumento" runat="server" CssClass="pnlesquerda" Height="50px"
                Width="200px">
                <asp:Label ID="lblDocumento" runat="server" CssClass="lblcadastro" Text="CPF/CNPJ"></asp:Label>
                <asp:RequiredFieldValidator ID="rfvDocumento" runat="server" ControlToValidate="txbDocumento"
                    ErrorMessage="Digite seu CPF" ForeColor="Red">*</asp:RequiredFieldValidator>
                <asp:CustomValidator ID="ctvDocumento" runat="server" ErrorMessage="*" ForeColor="Red"
                    ControlToValidate="txbDocumento" OnServerValidate="ctvDocumento_ServerValidate"></asp:CustomValidator>
                <asp:TextBox ID="txbDocumento" runat="server" Width="196px" MaxLength="15"></asp:TextBox>
            </asp:Panel>
            </ContentTemplate>
            </asp:UpdatePanel>
            <asp:Panel ID="pnlResposta" runat="server" CssClass="pnldireita" Height="50px" Width="300px">
                <asp:Label ID="lblResposta" runat="server" CssClass="lblcadastro" Text="Resposta de Segurança"></asp:Label>
                <asp:RequiredFieldValidator ID="rfvResposta" runat="server" ControlToValidate="txbResposta"
                    ErrorMessage="Escreva a resposta de segurança" ForeColor="Red">*</asp:RequiredFieldValidator>
                <asp:TextBox ID="txbResposta" runat="server" Width="256px" MaxLength="70"></asp:TextBox>
            </asp:Panel>
            <asp:Panel ID="pnlEmail" runat="server" CssClass="pnlesquerda" Height="50px" Width="350px">
                <asp:Label ID="lblEmail" runat="server" CssClass="lblcadastro" Text="E-mail"></asp:Label>
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txbEmail"
                    ErrorMessage="Digite seu E-mail" ForeColor="Red">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txbEmail"
                    ErrorMessage="*" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                <asp:TextBox ID="txbEmail" runat="server" Width="320px" MaxLength="70"></asp:TextBox>
            </asp:Panel>
            <asp:Panel ID="pnlSenha" runat="server" CssClass="pnlesquerda" Height="50px" Width="200px">
                <asp:Label ID="lblSenha" runat="server" CssClass="lblcadastro" Text="Senha"></asp:Label>

                <asp:CustomValidator ID="ctvSenha" runat="server" ControlToValidate="txbSenha" ErrorMessage="Minimo 8 Carac."
                    Font-Size="10pt" ForeColor="Red" OnServerValidate="ctvSenha_ServerValidate">*</asp:CustomValidator>
                <asp:TextBox ID="txbSenha" runat="server" TextMode="Password" Width="196px" MaxLength="20"></asp:TextBox>
                <asp:PasswordStrength ID="txbSenha_PasswordStrength" runat="server" Enabled="True"
                    MinimumLowerCaseCharacters="1" MinimumNumericCharacters="1" MinimumSymbolCharacters="1"
                    MinimumUpperCaseCharacters="1" PreferredPasswordLength="8" 
                    TargetControlID="txbSenha" DisplayPosition="RightSide" 
                    PrefixText="Força da Senha: " StrengthIndicatorType="Text" 
                    HelpHandlePosition="RightSide">
                </asp:PasswordStrength>
            </asp:Panel>
            <asp:Panel ID="pnlConfirma" runat="server" CssClass="pnlsenha" Height="50px" Width="300px">
                <asp:Label ID="lblConfirma" runat="server" CssClass="lblcadastro" Text="Confirmar Senha"></asp:Label>
                <asp:CompareValidator ID="cpvConfirmar" runat="server" ControlToCompare="txbSenha"
                    ControlToValidate="txbConfirmar" ErrorMessage="*" ForeColor="Red"></asp:CompareValidator>
                <asp:TextBox ID="txbConfirmar" runat="server" TextMode="Password" Width="256px"></asp:TextBox>
            </asp:Panel>
            <asp:Button ID="btnEnviar" runat="server" CssClass="botaoRight" Text="Enviar" OnClick="btnEnviar_Click" />
        </asp:Panel>
    </asp:Panel>
    <asp:Panel ID="pnlMessage" runat="server" BackColor="White" Height="125px" 
        BorderColor="#BADAFB" Visible="False" Enabled="false" 
        style="z-index: 9999; position:absolute; top: 1379px; left: 10px; width: 309px;" 
        BorderStyle="Solid">
        <div ID="dvCabecalho" style="height: 22px; background-color: #badafb;">
            <asp:Label ID="lblTitulo" runat="server" Text="Compre da Vitrine" Width="280px" 
                Font-Bold="True"></asp:Label>
            <asp:LinkButton ID="lnkFechar" runat="server" Width="20px" 
                BackColor="#E38B7F" Font-Bold="True" ForeColor="White" 
                style="text-align:center" onclick="lnkFechar_Click">X</asp:LinkButton>
        </div>
        <div style="height: 69px">
            <asp:Label ID="lblMensagem" runat="server" Font-Size="Medium" style="text-align:center">Aguarde a confirmação da conta no seu e-mail! <br>Obrigado!</asp:Label>
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
