using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominio;

namespace negocio
{
    public class MiembroNegocio
    {
        public int insertarNuevo(Miembro nuevo)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("insert into USERS (email, pass, admin) output inserted.id values (@email, @pass, 0)");
                datos.setearParametro("@email", nuevo.Email);
                datos.setearParametro("@pass", nuevo.Pass);
                return datos.ejecutarAccionScalar();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public bool Login(Miembro miembro)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("Select id, email, pass, admin, urlImagenPerfil, nombre, apellido From USERS Where email=@email And pass=@pass");
                datos.setearParametro("@email", miembro.Email);
                datos.setearParametro("@pass", miembro.Pass);
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    miembro.Id = (int)datos.Lector["id"];
                    miembro.Admin = (bool)datos.Lector["admin"];
                    if (!(datos.Lector["urlImagenPerfil"] is DBNull))
                        miembro.ImagenPerfil = (string)datos.Lector["urlImagenPerfil"];
                    if (!(datos.Lector["nombre"] is DBNull))
                        miembro.Nombre = (string)datos.Lector["nombre"];
                    if (!(datos.Lector["apellido"] is DBNull))
                        miembro.Apellido = (string)datos.Lector["apellido"];
                    return true;
                }
                return false;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public void actualizar(Miembro user)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("Update USERS Set urlImagenPerfil = @imagen, nombre = @nombre, apellido = @apellido Where Id = @id");
                datos.setearParametro("@imagen", (object)user.ImagenPerfil ?? DBNull.Value);
                datos.setearParametro("@nombre", user.Nombre);
                datos.setearParametro("@apellido", user.Apellido);
                datos.setearParametro("@id", user.Id);
                datos.ejecutarAccion();

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

    }
}
