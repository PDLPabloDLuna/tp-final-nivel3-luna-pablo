using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocio;
using dominio;

namespace web_articulos
{
    public partial class ProductosLista : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ArticuloNegocio negocio = new ArticuloNegocio();
                Session.Add("listaProductos", negocio.listar());
                dgvProductos.DataSource = Session["listaProductos"];
                dgvProductos.DataBind();
            }
        }

        protected void dgvProductos_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void dgvProductos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvProductos.PageIndex = e.NewPageIndex;
            dgvProductos.DataSource = Session["listaProductos"];
            dgvProductos.DataBind();
        }
    }
}