<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="web_articulos.Error" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>ERROR!</h1>
    <asp:Label Text="Mensaje de error" ID="lblMensaje" runat="server" />
    <hr />
    <a href="javascript:history.go(-1);">Volver</a>
</asp:Content>
