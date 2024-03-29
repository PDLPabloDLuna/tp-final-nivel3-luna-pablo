using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominio;

namespace negocio
{
    public class FavoritoNegocio
    {
        public void agregarFav(Favorito nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("insert into Favoritos(IdUser, IdArticulo) values (@user, @art)");
                datos.setearParametro("@user", nuevo.IdUser);
                datos.setearParametro("@art", nuevo.IdArticulo);

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

        public List<Articulo> listar(string id)
        {
            List<Articulo> lista = new List<Articulo>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("select A.Id, Nombre, M.Descripcion Marca, C.Descripcion Categoria, Precio, IdMarca, IdCategoria from Articulos A, Favoritos F, Marcas M, Categorias C where F.IdUser = @id AND F.IdArticulo = A.Id AND idMarca = M.Id AND IdCategoria = C.Id");
                datos.setearParametro("@id", id);
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Articulo aux = new Articulo();
                    aux.Id = (int)datos.Lector["Id"];
                    aux.Nombre = (string)datos.Lector["Nombre"];
                    aux.Precio = (decimal)datos.Lector["Precio"];

                    aux.NombreMarca = new Marca();
                    aux.NombreMarca.Id = (int)datos.Lector["IdMarca"];
                    aux.NombreMarca.Descripcion = (string)datos.Lector["Marca"];
                    aux.TipoCat = new Categoria();
                    aux.TipoCat.Id = (int)datos.Lector["IdCategoria"];
                    aux.TipoCat.Descripcion = (string)datos.Lector["Categoria"];

                    lista.Add(aux);
                }
                return lista;
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

        public void eliminarFav(string idUser, string idArt)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("delete from FAVORITOS where idUser = @idUser AND idArticulo = @idArt");
                datos.setearParametro("@idUser", idUser);
                datos.setearParametro("@idArt", idArt);
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

        public bool esFav(Favorito favNuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("Select idUser, idArticulo from FAVORITOS Where idUser = @idUser And idArticulo = @idArt");
                datos.setearParametro("@idUser", favNuevo.IdUser);
                datos.setearParametro("@idArt", favNuevo.IdArticulo);
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                    return true;
                else
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
    }
}
