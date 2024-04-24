<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="MiPerfil.aspx.cs" Inherits="web_articulos.MiPerfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .validacion {
            color: palevioletred;
            font-size: 12px;
        }
    </style>
    <script>    
        function validar() {
            const txtNombre = document.getElementById("txtNombre");
            const txtApellido = document.getElementById("txtApellido");
            // Mensaje bootstrap:
            if (txtNombre.value == "") {
                txtNombre.classList.add("is-invalid");
                txtNombre.classList.remove("is-valid");
            }
            else {
                txtNombre.classList.add("is-valid");
                txtNombre.classList.remove("is-invalid");
            }
            if (txtApellido.value == "") {
                txtApellido.classList.add("is-invalid");
                txtApellido.classList.remove("is-valid");
            }
            else {
                txtApellido.classList.add("is-valid");
                txtApellido.classList.remove("is-invalid");
            }
            // Validacion:
            if (txtNombre.value == "" || txtApellido.value == "")
                return false;
            else
                return true;
        }
    </script>
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
                <asp:TextBox ID="txtNombre" ClientIDMode="Static" CssClass="form-control" runat="server" />
                <asp:RegularExpressionValidator ErrorMessage="Ingrese un nombre valido." CssClass="validacion" ControlToValidate="txtNombre" ValidationExpression="^(?![\s.]+$)[a-zA-Z\s.]*$" runat="server" />
                <div class="invalid-feedback">Ingrese un nombre.</div>
            </div>
            <div class="mb-3">
                <label class="form-label">Apellido</label>
                <asp:TextBox ID="txtApellido" ClientIDMode="Static" CssClass="form-control" runat="server" />
                <asp:RegularExpressionValidator ErrorMessage="Ingrese un apellido valido." CssClass="validacion" ControlToValidate="txtApellido" ValidationExpression="^(?![\s.]+$)[a-zA-Z\s.]*$" runat="server" />
                <div class="invalid-feedback">Ingrese un apellido.</div>
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
            <asp:Button Text="Guardar" CssClass="btn btn-primary" ID="btnGuardar" OnClick="btnGuardar_Click" OnClientClick="return validar()" runat="server" />
            <a href="/">Regresar</a>
        </div>
    </div>
</asp:Content>
