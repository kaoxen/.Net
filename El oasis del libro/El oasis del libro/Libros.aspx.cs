using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace El_oasis_del_libro
{
    public partial class Libros : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                IdLib.Text = "";

                if (Request.QueryString != null)
                {
                    string advert = Request.QueryString["advert"];
                    IdLib.Text = advert;                   
                }

            }
        }

       


        protected void gridLibros_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            using (OasisLibrosEntities conexion = new OasisLibrosEntities())
            {
                int indiceFila = Convert.ToInt32(e.CommandArgument.ToString());
                int codlib = Convert.ToInt32(gridLibros.Rows[indiceFila].Cells[0].Text);
                if (e.CommandName == "Editar")
                {
                    LIBROS seleccionLibro = conexion.LIBROS.Where(w => w.IdLibro ==codlib).SingleOrDefault();

                    CodigoLibro.Text = seleccionLibro.IdLibro.ToString();
                    NombreLibro.Text = seleccionLibro.NombreLibro;
                    cantidadInicial.Text = seleccionLibro.CantidadInicial.ToString();
                    Precio.Text = seleccionLibro.Precio.ToString();
                    CodigoLibro.Enabled = false;

                }
                if (e.CommandName == "Eliminar")
                {
                    LIBROS misLibros = conexion.LIBROS.Where(w => w.IdLibro == codlib).SingleOrDefault();
                    INVENTARIOS miInvent = conexion.INVENTARIOS.Where(w => w.IdLibro == codlib).SingleOrDefault();
                    CANTIDADVENDIDOS miCant = conexion.CANTIDADVENDIDOS.Where(w => w.IdLibro == codlib).FirstOrDefault();
                    if (miCant == null)
                    {
                        if (misLibros != null)
                        {   if (miInvent != null)
                            {
                                conexion.INVENTARIOS.Remove(miInvent);
                            }
                            conexion.LIBROS.Remove(misLibros);

                            conexion.SaveChanges();
                        }
                    }
                    Response.Redirect("Libros.aspx");
                }
                /*  if (e.CommandName == "Ver")
                  {
                      pendiente traer datos de cantidad 
                  }*/

            }
            
        }

        protected void Registrar_Click(object sender, EventArgs e)
        {
            using (OasisLibrosEntities conexion = new OasisLibrosEntities())
            {
                int IdentL = Convert.ToInt32(CodigoLibro.Text);
                LIBROS validar = conexion.LIBROS.Where(w => w.IdLibro ==IdentL).SingleOrDefault();
                if (validar == null)
                {
                    LIBROS nuevoLibro = new LIBROS();

                    nuevoLibro.IdLibro = Convert.ToInt32(CodigoLibro.Text);
                    nuevoLibro.NombreLibro = NombreLibro.Text;
                    nuevoLibro.CantidadInicial = Convert.ToInt32(cantidadInicial.Text);
                    nuevoLibro.Precio = Convert.ToInt32(Precio.Text);

                    conexion.LIBROS.Add(nuevoLibro);
                    conexion.SaveChanges();

                    INVENTARIOS nuevoIngreso = new INVENTARIOS();

                    nuevoIngreso.IdLibro = nuevoLibro.IdLibro;
                    nuevoIngreso.CantidadInicial = nuevoLibro.CantidadInicial;
                    conexion.INVENTARIOS.Add(nuevoIngreso);
                    conexion.SaveChanges();
                    Response.Redirect("Libros.aspx");

                }else
                {
                    string advert = "El Id del libro ya existe";

                    Response.Redirect("Libros.aspx?advert="+advert);
                }
                
            }
        }

        protected void Guardar_Click(object sender, EventArgs e)
        {   int codlib = Convert.ToInt32(CodigoLibro.Text);
            using (OasisLibrosEntities conexion = new OasisLibrosEntities())
            {
                LIBROS cambioLibro = conexion.LIBROS.Where(w => w.IdLibro == codlib).SingleOrDefault();
                INVENTARIOS miInvent = conexion.INVENTARIOS.Where(w => w.IdLibro == codlib).SingleOrDefault();
                if (cambioLibro != null)
                {
                    cambioLibro.NombreLibro = NombreLibro.Text;
                    cambioLibro.CantidadInicial = Convert.ToInt32(cantidadInicial.Text);
                    cambioLibro.Precio = Convert.ToInt32(Precio.Text);

                    if (miInvent != null)
                    {
                        miInvent.CantidadInicial = Convert.ToInt32(cantidadInicial.Text);

                        
                    }conexion.SaveChanges();
                }
            }
            Response.Redirect("Libros.aspx");
        }
    }
}

