<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ProductosLista.aspx.cs" Inherits="web_articulos.ProductosLista" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="dgvProductos" DataKeyNames="Id" CssClass="table" AutoGenerateColumns="false"
        OnSelectedIndexChanged="dgvProductos_SelectedIndexChanged" OnPageIndexChanging="dgvProductos_PageIndexChanging"
        AllowPaging="true" PageSize="5" runat="server">
        <Columns>
            <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
            <asp:BoundField HeaderText="Marca" DataField="NombreMarca.Descripcion" />
            <asp:BoundField HeaderText="Precio" DataField="Precio" ItemStyle-Font-Bold="true" DataFormatString="{0:C2}"/>
        </Columns>
    </asp:GridView>
    <a href="FormularioProducto.aspx" class="btn btn-primary">Agregar</a>
</asp:Content>
