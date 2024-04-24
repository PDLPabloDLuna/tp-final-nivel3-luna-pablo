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
    public partial class Master : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!(Page is Login || Page is Default || Page is Registro || Page is Error || Page is DetalleArticulo))
            {
                if (!Seguridad.sesionActiva(Session["miembro"]))
                    Response.Redirect("Login.aspx", false);
            }
            if (Seguridad.sesionActiva(Session["miembro"]))
            {
                Miembro user = (Miembro)Session["miembro"];
                lblUser.Text = user.Email;
                if (!string.IsNullOrEmpty(user.ImagenPerfil))
                    imgAvatar.ImageUrl = "~/Images/" + user.ImagenPerfil + "?v=" + DateTime.Now.Ticks.ToString();
            }
        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }
    }
}