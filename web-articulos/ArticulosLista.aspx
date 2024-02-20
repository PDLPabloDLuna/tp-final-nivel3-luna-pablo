<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ArticulosLista.aspx.cs" Inherits="web_articulos.ArticulosLista" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:GridView ID="dgvArticulos" CssClass="table" AutoGenerateColumns="false" DataKeyNames="Id"
        OnSelectedIndexChanged="dgvArticulos_SelectedIndexChanged"
        OnPageIndexChanging="dgvArticulos_PageIndexChanging"
        AllowPaging="true" PageSize="5" runat="server">
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
