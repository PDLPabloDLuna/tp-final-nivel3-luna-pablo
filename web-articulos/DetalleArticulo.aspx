<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="DetalleArticulo.aspx.cs" Inherits="web_articulos.DetalleArticulo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h4>Detalles </h4>
    <hr />
    <div class="row">
        <div class="col-6">
            <div class="mb-3">
                <label for="txtCodigo" class="form-label" style="font-weight: bold">Código de artículo: </label>
                <asp:TextBox runat="server" ID="txtCodigo" CssClass="form-control" ReadOnly="true" />
            </div>
            <div class="mb-3">
                <label for="txtNombre" class="form-label" style="font-weight: bold">Nombre: </label>
                <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" ReadOnly="true" />
            </div>
            <div class="mb-3">
                <label for="txtDescripcion" class="form-label" style="font-weight: bold">Descripción: </label>
                <asp:TextBox runat="server" ID="txtDescripcion" TextMode="MultiLine" CssClass="form-control" ReadOnly="true" />
            </div>
            <div class="mb-3">
                <label for="txtMarca" class="form-label" style="font-weight: bold">Marca: </label>
                <asp:TextBox runat="server" ID="txtMarca" CssClass="form-control" ReadOnly="true" />
            </div>
            <div class="mb-3">
                <label for="txtCategoria" class="form-label" style="font-weight: bold">Categoría: </label>
                <asp:TextBox runat="server" ID="txtCategoria" CssClass="form-control" ReadOnly="true" />
            </div>
            <div class="mb-3">
                <a href="Default.aspx" class="btn btn-primary btn-sm">Volver</a>
            </div>
        </div>

        <div class="col-6" >
            <asp:Image ImageUrl="https://www.pulsecarshalton.co.uk/wp-content/uploads/2016/08/jk-placeholder-image.jpg" runat="server" ID="imgArticulo" Height="500px"/>
            <div class="mb-3">
                <asp:Label Text="Precio???" ID="lblPrecio" runat="server" Font-Bold="true" ReadOnly="true" />
            </div>
        </div>
    </div>
</asp:Content>
