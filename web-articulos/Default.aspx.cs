using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;

namespace web_articulos
{
    public partial class Default : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                Favorito favNuevo = new Favorito();
                FavoritoNegocio negocio = new FavoritoNegocio();
                favNuevo.IdUser = ((Miembro)Session["miembro"]).Id;
                string idArt = Request.QueryString["id"].ToString();
                favNuevo.IdArticulo = int.Parse(idArt);

                if (negocio.esFav(favNuevo))
                {
                    Session.Add("error", "La entrada de favorito ya existe");
                    Response.Redirect("Error.aspx");
                }
                else
                    negocio.agregarFav(favNuevo);
            }

            if (!IsPostBack)
            {
                ArticuloNegocio negocio = new ArticuloNegocio();
                Session.Add("ListaHome", negocio.listar());
                repRepeater.DataSource = Session["ListaHome"];
                repRepeater.DataBind();
            }
        }

        protected void txtFiltro_TextChanged(object sender, EventArgs e)
        {
            List<Articulo> lista = (List<Articulo>)Session["listaHome"];
            List<Articulo> listaFiltrada = lista.FindAll(x => x.Nombre.ToUpper().Contains(txtFiltro.Text.ToUpper()));
            repRepeater.DataSource = listaFiltrada;
            repRepeater.DataBind();
        }

        protected void btnLimpiarFiltro_Click(object sender, EventArgs e)
        {
            txtFiltro.Text = "";
            repRepeater.DataSource = (List<Articulo>)Session["ListaHome"];
            repRepeater.DataBind();
        }
    }
}