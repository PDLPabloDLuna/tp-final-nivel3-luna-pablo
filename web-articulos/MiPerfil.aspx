<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="MiPerfil.aspx.cs" Inherits="web_articulos.MiPerfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Mi Perfil </h2>
    <div class="row">
        <div class="col-md-4">
            <div class="mb-3">
                <label class="form-label">Email</label>
                <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" />
            </div>
            <div class="mb-3">
                <label class="form-label">Nombre</label>
                <asp:TextBox ID="txtNombre" CssClass="form-control" runat="server" />
            </div>
            <div class="mb-3">
                <label class="form-label">Apellido</label>
                <asp:TextBox ID="txtApellido" CssClass="form-control" runat="server" />
            </div>

        </div>
        <div class="col-md-4">
            <div class="mb-3">
                <label class="form-label">Imagen Perfil</label>
                <input type="file" id="txtImagen" class="form-control" runat="server" />
            </div>
            <asp:Image ID="imgNuevoPerfil" ImageUrl="https://editorial.unc.edu.ar/wp-content/uploads/sites/33/2022/09/placeholder.png" CssClass="img-fluid mb-3" runat="server" />
        </div>

    </div>
    <div class="row">
        <div class="col-md-4">
            <asp:Button Text="Guardar" CssClass="btn btn-primary" ID="btnGuardar" OnClick="btnGuardar_Click" runat="server" />
            <a href="/">Regresar</a>
        </div>
    </div>
</asp:Content>
