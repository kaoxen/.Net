using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace El_oasis_del_libro
{
    public partial class Ventas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                Total.Text = "0";
                IdFac.Text = "0";

                if (Request.QueryString != null)
                {

                    int tot = Convert.ToInt32(Request.QueryString["totaltotal"]);
                    int IdF = Convert.ToInt32(Request.QueryString["IdF"]);
                    Total.Text = tot.ToString();
                    IdFac.Text = IdF.ToString();
                }

            }
        }


        protected void gridVentas_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            using (OasisLibrosEntities conexion = new OasisLibrosEntities())
            {
                int indiceFila = Convert.ToInt32(e.CommandArgument.ToString());
                int codven = Convert.ToInt32(gridVentas.Rows[indiceFila].Cells[0].Text);
                if (e.CommandName == "Editar")
                {
                    CANTIDADVENDIDOS seleccionVenta = conexion.CANTIDADVENDIDOS.Where(w => w.IdCantidadVendido == codven).FirstOrDefault();

                    DropDownList1.SelectedValue = seleccionVenta.IdLibro.ToString();
                    IdFactura.Text = seleccionVenta.IdFactura.ToString();
                    Cantidad.Text = seleccionVenta.CantidadVendido.ToString();

                    int totaltotal = Convert.ToInt32(Total.Text);
                    if (totaltotal != 0)
                    {
                        int restar = seleccionVenta.TotalLibro;
                        totaltotal = totaltotal - restar;
                        Total.Text = totaltotal.ToString();
                    }


                }
                if (e.CommandName == "Eliminar")
                {
                    CANTIDADVENDIDOS seleccionVenta = conexion.CANTIDADVENDIDOS.Where(w => w.IdCantidadVendido == codven).FirstOrDefault();
                    if (seleccionVenta != null)
                    {
                        int IdL = seleccionVenta.IdLibro;
                        int cant = seleccionVenta.CantidadVendido;
                        int IdFact = seleccionVenta.IdFactura;
                        
                        INVENTARIOS Restar = conexion.INVENTARIOS.Where(w => w.IdLibro == IdL).SingleOrDefault();


                        int totaltotal =   Convert.ToInt32(Total.Text);
                        if (totaltotal != 0)
                        {
                            int restar = seleccionVenta.TotalLibro;

                            totaltotal = totaltotal-restar;
                        }
                        

                        if (Restar != null)

                        { if (Restar.CantidadVendido !=0) {

                                Restar.CantidadVendido = Restar.CantidadVendido - cant;
                                Restar.CantidadActual = Restar.CantidadActual + cant;
                                conexion.SaveChanges();
                            }
                        }

                        conexion.CANTIDADVENDIDOS.Remove(seleccionVenta);

                        conexion.SaveChanges();
                        
                        int IdF = seleccionVenta.IdFactura;
                      Response.Redirect("Ventas.aspx?totaltotal=" + totaltotal+ "&IdF=" + IdF);

                    }


                
                    /*  if (e.CommandName == "Ver")
                        {
                            pendiente traer datos de cantidad 
                        }*/

                }
            }
        }

        protected void Registrar_Click(object sender, EventArgs e)
        {
            using (OasisLibrosEntities conexion = new OasisLibrosEntities())
            {


                CANTIDADVENDIDOS detalleVenta = new CANTIDADVENDIDOS();
                int codven = Convert.ToInt32(DropDownList1.SelectedValue);
                detalleVenta.IdLibro = codven;
                detalleVenta.CantidadVendido = Convert.ToInt32(Cantidad.Text);
                detalleVenta.IdFactura = Convert.ToInt32(IdFactura.Text);

                LIBROS precioUnidad = conexion.LIBROS.Where(w => w.IdLibro == codven).SingleOrDefault();
                int precio = precioUnidad.Precio;
                int cantidad = precioUnidad.CantidadInicial;
                int total = Convert.ToInt32(Cantidad.Text) * precio;
                detalleVenta.TotalLibro = total;

                INVENTARIOS nuevoInv = conexion.INVENTARIOS.Where(w => w.IdLibro == codven).SingleOrDefault();
                int nuevaventa = Convert.ToInt32(Cantidad.Text);
                if (nuevoInv != null)
                {
                   
                    if (nuevoInv.CantidadVendido == null)
                    {
                        nuevoInv.CantidadVendido = nuevaventa;
                    }
                    else {

                        nuevoInv.CantidadVendido = nuevoInv.CantidadVendido+nuevaventa;


                    }
                    nuevoInv.CantidadActual = nuevoInv.CantidadInicial - nuevoInv.CantidadVendido;
                }

                else {

                    INVENTARIOS nuevoInv2 = new INVENTARIOS();
                    nuevoInv2.IdLibro = codven;
                    nuevoInv2.CantidadInicial = cantidad;
                    nuevoInv2.CantidadVendido = nuevaventa;
                   int cantActual = cantidad - nuevaventa;
                    nuevoInv2.CantidadActual = cantActual;
                    conexion.INVENTARIOS.Add(nuevoInv2);
                }
                    conexion.CANTIDADVENDIDOS.Add(detalleVenta);
                
                conexion.SaveChanges();

                int totaltotal = Convert.ToInt32(Total.Text);
                totaltotal = totaltotal + total;
                int IdF = detalleVenta.IdFactura;
                Response.Redirect("Ventas.aspx?totaltotal="+totaltotal+"&IdF="+IdF);
            }

        }

        protected void Guardar_Click(object sender, EventArgs e)
        {

            using (OasisLibrosEntities conexion = new OasisLibrosEntities())
            {
                int codven = Convert.ToInt32(DropDownList1.SelectedValue);
                CANTIDADVENDIDOS cambioVenta = conexion.CANTIDADVENDIDOS.Where(w => w.IdLibro == codven).FirstOrDefault();
                 int cantanterior = cambioVenta.CantidadVendido;
                int IdF = cambioVenta.IdFactura;
                cambioVenta.IdLibro = codven;
                cambioVenta.CantidadVendido = Convert.ToInt32(Cantidad.Text);
               
                conexion.SaveChanges();
               LIBROS precioUnidad = conexion.LIBROS.Where(w => w.IdLibro == codven).SingleOrDefault();
                int precio = precioUnidad.Precio;
                int total = Convert.ToInt32(Cantidad.Text) * precio;
                cambioVenta.TotalLibro = total;
                cambioVenta.IdFactura = Convert.ToInt32(IdFactura.Text);
                int totaltotal = Convert.ToInt32(Total.Text);
                totaltotal = totaltotal+cambioVenta.TotalLibro;

                conexion.SaveChanges();

                INVENTARIOS nuevoInv = conexion.INVENTARIOS.Where(w => w.IdLibro == codven).SingleOrDefault();

                if (nuevoInv != null)
                {
                    int nuevaventa = Convert.ToInt32(Cantidad.Text);
                    nuevoInv.CantidadVendido = nuevoInv.CantidadVendido-cantanterior;
                    nuevoInv.CantidadVendido = nuevoInv.CantidadVendido+nuevaventa;
                    nuevoInv.CantidadActual = nuevoInv.CantidadInicial - nuevoInv.CantidadVendido;

                }
                conexion.SaveChanges();
                Response.Redirect("Ventas.aspx?totaltotal=" + totaltotal + "&IdF=" + IdF);
                
            }
            }

        protected void FACTURAR_Click(object sender, EventArgs e)
        {
            using (OasisLibrosEntities conexion = new OasisLibrosEntities())
            {
                
               
                VENTAS nuevaVent = new VENTAS();

              int  IdFactura = Convert.ToInt32 (IdFac.Text);
                nuevaVent.IdFactura =IdFactura ;
                nuevaVent.IdCliente = CLIENTE.Text;
                nuevaVent.FechaVenta = System.DateTime.Now;
                nuevaVent.ValorTotal = Convert.ToInt32(Total.Text);

                conexion.VENTAS.Add(nuevaVent);
                conexion.SaveChanges();
                int cod = IdFactura;
                Response.Redirect("Factura.aspx?cod="+cod);
            }
        }

      
    }
    }

