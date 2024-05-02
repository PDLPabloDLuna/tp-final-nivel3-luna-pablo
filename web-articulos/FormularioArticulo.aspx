<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="FormularioArticulo.aspx.cs" Inherits="web_articulos.FormularioArticulo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .validacion {
            color: darkred;
            font-size: 12px;
        }
    </style>
    <script>    
        function validar() {
            const txtCodigo = document.getElementById("txtCodigo");
            const txtNombre = document.getElementById("txtNombre");

            if (txtCodigo.value == "") {
                txtCodigo.classList.add("is-invalid");
                txtCodigo.classList.remove("is-valid");
            }
            else {
                txtCodigo.classList.add("is-valid");
                txtCodigo.classList.remove("is-invalid");
            }
            if (txtNombre.value == "") {
                txtNombre.classList.add("is-invalid");
                txtNombre.classList.remove("is-valid");
            }
            else {
                txtNombre.classList.add("is-valid");
                txtNombre.classList.remove("is-invalid");
            }

            if (txtCodigo.value == "" || txtNombre.value == "")
                return false;
            else
                return true;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <div style="margin-bottom: 14px;">
        <asp:Label ID="lblTitulo" Text="Agregar un articulo" Font-Size="20" runat="server" />
    </div>
    <div class="row">

        <div class="col-5">
            <div class="mb-3">
                <label for="txtId" class="form-label">Id </label>
                <asp:TextBox runat="server" ID="txtId" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label for="txtCodigo" class="form-label">Código del artículo: </label>
                <asp:TextBox runat="server" ID="txtCodigo" CssClass="form-control" ClientIDMode="Static" MaxLength="8" />
                <div class="invalid-feedback">Ingrese un código.</div>
            </div>
            <div class="mb-3">
                <label for="txtNombre" class="form-label">Nombre: </label>
                <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" ClientIDMode="Static" />
                <div class="invalid-feedback">Ingrese un nombre.</div>
            </div>
            <div class="mb-3">
                <label for="ddlMarca" class="form-label">Marca: </label>
                <asp:DropDownList runat="server" ID="ddlMarca" CssClass="form-select"></asp:DropDownList>
            </div>
            <div class="mb-3">
                <label for="ddlCategoría" class="form-label">Categoría: </label>
                <asp:DropDownList runat="server" ID="ddlCategoria" CssClass="form-select"></asp:DropDownList>
            </div>
            <div class="mb-3">
                <label for="txtPrecio" class="form-label">Precio: </label>
                <asp:TextBox runat="server" ID="txtPrecio" CssClass="form-control" />
                <asp:RangeValidator ErrorMessage="Por favor ingrese el dato con formato correcto" Type="Currency" MinimumValue="0" MaximumValue="10000000" ControlToValidate="txtPrecio" CssClass="validacion" runat="server" />
                <asp:RequiredFieldValidator ErrorMessage="Ingrese un precio..." ControlToValidate="txtPrecio" CssClass="validacion" runat="server" />
            </div>
            <div class="mb-3" style="margin-top: 30px;">
                <asp:Button Text="Aceptar" ID="btnAceptar" CssClass="btn btn-primary" OnClick="btnAceptar_Click" OnClientClick="return validar()" runat="server" />
                <a href="ArticulosLista.aspx">Cancelar</a>
            </div>
        </div>

        <div class="col-5">

            <div class="mb-3">
                <label for="txtDescripcion" class="form-label">Descripción: </label>
                <asp:TextBox runat="server" ID="txtDescripcion" TextMode="MultiLine" CssClass="form-control" MaxLength="150"/>
            </div>

            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="mb-3">
                        <label for="txtImagenUrl" class="form-label">Url Imagen: </label>
                        <asp:TextBox runat="server" ID="txtImagenUrl" CssClass="form-control" AutoPostBack="true" OnTextChanged="txtImagenUrl_TextChanged" />
                    </div>
                    <asp:Image ImageUrl="https://www.pulsecarshalton.co.uk/wp-content/uploads/2016/08/jk-placeholder-image.jpg"
                        runat="server" ID="imgArticulo" Height="300" />
                </ContentTemplate>
            </asp:UpdatePanel>

        </div>

        <div class="row">
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <div class="col-6">
                        <div class="mb-3">
                            <asp:Button Text="Eliminar" ID="btnEliminar" CssClass="btn btn-danger" OnClick="btnEliminar_Click" runat="server" />
                        </div>
                        <%if (ConfirmarEliminacion)
                            { %>
                        <div class="mb-3">
                            <asp:CheckBox Text="Confirma Eliminación" ID="chkConfirmaEliminacion" runat="server" />
                            <asp:Button Text="Eliminar" ID="btnConfirmaEliminar" CssClass="btn btn-outline-danger" OnClick="btnConfirmaEliminar_Click" runat="server" />
                        </div>
                        <% } %>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>

    </div>
</asp:Content>
