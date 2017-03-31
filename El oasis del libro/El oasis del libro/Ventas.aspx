<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ventas.aspx.cs" Inherits="El_oasis_del_libro.Ventas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-weight: bold;
            background-color: #0000FF;
            height: 169px;
            width: 1022px;
        }
        .auto-style2 {
            font-weight: bold;
        }
        .auto-style3 {
            height: 29px;
        }
        .auto-style4 {
            float: left;
            height: 211px;
        }
        .auto-style5 {
            text-align: center;
        }
        .auto-style6 {
            height: 187px;
        }
        .auto-style7 {
            text-align: center;
            font-size: large;
            color: #FFFFFF;
            background-color: #0033CC;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table width=" "100%">
        <tr>
            <td colspan="2">
               <img src="imagenes/oasis titulo.PNG"  runat="server" class="auto-style1"/>
            </td>
        </tr>
        
        <tr>
            <td colspan="2">
                <strong>
                <asp:Menu ID="Menu1" runat="server" BackColor="#B5C7DE" DynamicHorizontalOffset="2" Font-Names="Verdana" Font-Size="Large" ForeColor="#284E98" StaticSubMenuIndent="10px">
                    <DynamicHoverStyle BackColor="#284E98" ForeColor="White" />
                    <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                    <DynamicMenuStyle BackColor="#B5C7DE" />
                    <DynamicSelectedStyle BackColor="#507CD1" />
                    <Items>
                        <asp:MenuItem NavigateUrl="~/Libros.aspx" Text="Libros"></asp:MenuItem>
                        <asp:MenuItem NavigateUrl="~/Ventas.aspx" Text="Ventas" Value="Ventas"></asp:MenuItem>
                        <asp:MenuItem NavigateUrl="~/Clientes.aspx" Text="Clientes" Value="Clientes"></asp:MenuItem>
                        <asp:MenuItem NavigateUrl="~/Reportes.aspx" Text="Reportes" Value="Reportes"></asp:MenuItem>
                    </Items>
                    <StaticHoverStyle BackColor="#284E98" ForeColor="White" />
                    <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                    <StaticSelectedStyle BackColor="#507CD1" />
                </asp:Menu>
                </strong>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="auto-style7">
                <strong>GESTIÓN DE VENTAS  
            </strong>  
            </td>
        </tr>
        <tr>
                <td> 
                    
                    ID LIBRO
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSourceNombreL" DataTextField="NombreLibro" DataValueField="IdLibro">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceNombreL" runat="server" ConnectionString="<%$ ConnectionStrings:OasisLibrosConnectionString %>" SelectCommand="SELECT [IdLibro], [NombreLibro] FROM [LIBROS]"></asp:SqlDataSource>
                </td>
            <td rowspan="5" class="auto-style5">
                <img src="imagenes/CajaR.PNG" runat="server" class="auto-style4" />
            </td>
            </tr>
         <tr>
                <td>ID FACTURA
                    <asp:TextBox ID="IdFactura" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>CANTIDAD
                    <asp:TextBox ID="Cantidad" runat="server"></asp:TextBox>
                </td>
            </tr>
      
      
         <tr>
            <td>
                <strong>
                <asp:Button ID="Registrar" runat="server" Text="REGISTRAR" CssClass="auto-style2" OnClick="Registrar_Click" /> <asp:Button ID="Guardar" runat="server" Text="GUARDAR"  CssClass="auto-style2" OnClick="Guardar_Click" /> 
                </strong>
            </td>
        </tr>
        <tr>
            <td>
                <strong>VENTAS
            </strong>
            </td>
        </tr> 
        <tr> <td colspan="2">
        <asp:GridView ID="gridVentas" Width="100%" runat="server" AutoGenerateColumns="False" OnRowCommand="gridVentas_RowCommand" Height="246px" DataKeyNames="IdCantidadVendido" DataSourceID="SqlDataSourceDetalle" visible="true" >
            <Columns>
                <asp:BoundField DataField="IdCantidadVendido" HeaderText="IdCantidadVendido" ReadOnly="True" SortExpression="IdCantidadVendido" />
                <asp:BoundField DataField="IdFactura" HeaderText="IdFactura" SortExpression="IdFactura" />
                <asp:BoundField DataField="IdLibro" HeaderText="IdLibro" SortExpression="IdLibro" />
                <asp:BoundField DataField="CantidadVendido" HeaderText="CantidadVendido" SortExpression="CantidadVendido" />
                <asp:BoundField DataField="TotalLibro" HeaderText="TotalLibro" SortExpression="TotalLibro" />
                <asp:ButtonField  ButtonType="Button" CommandName ="Editar"  Text="Editar" HeaderText="Editar"  ShowHeader="True" />
               <asp:ButtonField  ButtonType="Button" CommandName ="Eliminar" Text="Eliminar" HeaderText="Eliminar" ShowHeader="True" />
                            
            </Columns>
                    </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceDetalle" runat="server" ConnectionString="<%$ ConnectionStrings:OasisLibrosConnectionString %>" SelectCommand="SELECT * FROM [CANTIDADVENDIDOS]"></asp:SqlDataSource>
 </td> 
            </tr> 
           <tr>
                <td >ID FACTURA <asp:Label ID="IdFac" runat="server" Text="Label"></asp:Label>
                </td>
               <td rowspan="4">
                   <img src="imagenes/Factura.PNG" runat="server" class="auto-style6" />
               </td>
            </tr>
         <tr>
                <td >TOTAL <asp:Label ID="Total" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
        <tr>
                <td  class="auto-style3">ID CLIENTE <asp:TextBox ID="CLIENTE" runat="server"></asp:TextBox>
                </td>
            </tr>
        <tr>
                <td >
                    <asp:Button ID="FACTURAR" runat="server" Text="FACTURAR" OnClick="FACTURAR_Click"/>
                </td>
            </tr>
      
    </table>
    </div>
    </form>
</body>
</html>
