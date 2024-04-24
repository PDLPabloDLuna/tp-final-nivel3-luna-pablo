<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="web_articulos.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <h2>¡BIENVENIDOS! </h2>

    <div class="col-6">
        <div class="mb-3">
            <asp:Label Text="Filtrar por nombre" CssClass="form-label" runat="server" />
            <asp:TextBox ID="txtFiltro" CssClass="form-control" AutoPostBack="true" OnTextChanged="txtFiltro_TextChanged" runat="server" />
            <asp:Button Text="Limpiar Filtro" ID="btnLimpiarFiltro" OnClick="btnLimpiarFiltro_Click" CssClass="btn btn-success btn-sm" runat="server" />
        </div>
    </div>


    <div class="row row-cols-1 row-cols-md-5 g-4">

        <asp:Repeater runat="server" ID="repRepeater">
            <ItemTemplate>
                <div class="col">
                    <div class="card">
                        <img src="<%#Eval("UrlImagen") %>" class="card-img-top" alt="..." width="400">
                        <div class="card-body">
                            <h5 class="card-title"><%#Eval("Nombre") %></h5>
                            <p class="card-text"><%#Eval("Descripcion") %></p>
                            <p><%#Eval("Precio","{0:c}")%></p>
                            <a href="DetalleArticulo.aspx?id=<%#Eval("Id")%>">Ver Detalle</a>

                            <%  if (negocio.Seguridad.sesionActiva(Session["miembro"]))
                                { %>
                            <a href="Default.aspx?id=<%#Eval("Id")%>" class="btn btn-primary">Añadir a Favoritos</a>
                            <% } %>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>

    </div>

</asp:Content>
