<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Favoritos.aspx.cs" Inherits="web_articulos.Favoritos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Lista de mis Favoritos</h2>

    <asp:GridView ID="dgvFavoritos" CssClass="table" AutoGenerateColumns="false" DataKeyNames="Id" OnSelectedIndexChanged="dgvFavoritos_SelectedIndexChanged" 
        OnPageIndexChanging="dgvFavoritos_PageIndexChanging"
        AllowPaging="true" PageSize="5" runat="server">
        <Columns>
            <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
            <asp:BoundField HeaderText="Marca" DataField="NombreMarca.Descripcion" />
            <asp:BoundField HeaderText="Categoría" DataField="TipoCat.Descripcion" />
            <asp:BoundField HeaderText="Precio" DataField="Precio" ItemStyle-Font-Bold="true" DataFormatString="{0:C2}" />
            <asp:CommandField HeaderText="Acción" ShowSelectButton="true" SelectText="✍ Eliminar favorito" />
        </Columns>
    </asp:GridView>

</asp:Content>
