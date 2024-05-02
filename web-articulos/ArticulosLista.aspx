<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ArticulosLista.aspx.cs" Inherits="web_articulos.ArticulosLista" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-5">
            <div class="mb-3">
                <asp:Label Text="Filtrar" CssClass="form-label" runat="server" />
                <asp:TextBox ID="txtFiltro" CssClass="form-control" AutoPostBack="true" OnTextChanged="txtFiltro_TextChanged" runat="server" />
            </div>
        </div>
        <div class="col-3" style="display: flex; flex-direction: column; justify-content: flex-end">
            <div class="mb-3">
                <asp:Button Text="Limpiar Filtro" ID="btnLimpiarFiltro" CssClass="btn btn-success" OnClick="btnLimpiarFiltro_Click" runat="server" />
                <asp:CheckBox Text="Filtro Avanzado" ID="chkAvanzado" AutoPostBack="true" OnCheckedChanged="chkAvanzado_CheckedChanged" runat="server" />
            </div>
        </div>

        <%if (FiltroAvanzado)
            {%>
        <div class="row">
            <div class="col-4">
                <div class="mb-3">
                    <asp:Label Text="Campo" ID="lblCampo" runat="server" />
                    <asp:DropDownList ID="ddlCampo" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlCampo_SelectedIndexChanged" runat="server">
                        <asp:ListItem Text="Nombre" />
                        <asp:ListItem Text="Categoría" />
                        <asp:ListItem Text="Precio" />
                    </asp:DropDownList>
                </div>
            </div>
            <div class="col-4">
                <div class="mb-3">
                    <asp:Label Text="Criterio" runat="server" />
                    <asp:DropDownList ID="ddlCriterio" CssClass="form-control" runat="server"></asp:DropDownList>
                </div>
            </div>
            <div class="col-4">
                <div class="mb-3">
                    <asp:Label Text="Filtro" runat="server" />
                    <asp:TextBox ID="txtFiltroAvanzado" CssClass="form-control" runat="server" />
                    <div style="margin-top: 6px; text-align:right">
                        <asp:Button Text="Buscar" ID="btnBuscar" CssClass="btn btn-primary" OnClick="btnBuscar_Click" runat="server" />
                    </div>
                </div>
            </div>

        </div>

        <% } %>
    </div>

    <asp:GridView ID="dgvArticulos" CssClass="table table-dark table-striped" AutoGenerateColumns="false" DataKeyNames="Id"
        OnSelectedIndexChanged="dgvArticulos_SelectedIndexChanged"
        OnPageIndexChanging="dgvArticulos_PageIndexChanging"
        AllowPaging="true" PageSize="8" runat="server">
        <Columns>
            <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
            <asp:BoundField HeaderText="Marca" DataField="NombreMarca.Descripcion" />
            <asp:BoundField HeaderText="Categoría" DataField="TipoCat.Descripcion" />
            <asp:BoundField HeaderText="Precio" DataField="Precio" ItemStyle-Font-Bold="true" DataFormatString="{0:C2}" />
            <asp:CommandField HeaderText="Acción" ShowSelectButton="true" SelectText="✍ Editar" />
        </Columns>
    </asp:GridView>

    <a href="FormularioArticulo.aspx" class="btn btn-primary">Agregar</a>
</asp:Content>
