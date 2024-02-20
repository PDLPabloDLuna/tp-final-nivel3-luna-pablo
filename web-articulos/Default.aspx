<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="web_articulos.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>¡BIENVENIDOS! </h2>
    <p>Un mensaje de bienvenida.</p>

    <div class="row row-cols-1 row-cols-md-5 g-4">

        <asp:Repeater runat="server" ID="repRepeater">
            <ItemTemplate>
                <div class="col">
                    <div class="card">
                        <img src="<%#Eval("UrlImagen") %>" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title"><%#Eval("Nombre") %></h5>
                            <p class="card-text"><%#Eval("Descripcion") %></p>
                            <p><%#Eval("Precio","{0:c}")%></p>
                            <a href="DetalleArticulo.aspx?id=<%#Eval("Id")%>" class="btn btn-outline-info">Ver Detalle</a>
                            <%--<asp:Button Text="Ejemplo" runat="server" CommandArgument='<%#Eval("Id") %>' CommandName="PokemonId" OnClick="Unnamed_Click" CssClass="btn btn-primary" />--%>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>

    </div>

</asp:Content>
