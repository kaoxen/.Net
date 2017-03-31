<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Libros.aspx.cs" Inherits="El_oasis_del_libro.Libros" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style2 {
            font-weight: bold;
        }
        .auto-style3 {
            height: 164px;
            width: 1027px;
        }
        .auto-style4 {
            text-align: center;
            color: #FFFFFF;
            font-size: large;
            background-color: #003399;
        }
        .auto-style6 {
            text-align: center;
        }
        .auto-style7 {
            text-align: center;
            height: 226px;
            width: 390px;
            float: right;
        }
        .auto-style8 {
            width: 444px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table width=" "100%">
        <tr>
            <td colspan="2">
                <img src="imagenes/oasis titulo.PNG"  runat="server" class="auto-style3"/>
            </td>
        </tr>
      
         <tr>
            <td  colspan="2" class="auto-style6">
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
         <tr >
            <td colspan="2" class="auto-style4">
                <p>  <strong>GESTIÓN DE LIBROS  </strong>  </p>
             
            </td>
        </tr>
         <tr>
                <td class="auto-style8">CODIGO LIBRO 
                    <asp:TextBox ID="CodigoLibro" runat="server"></asp:TextBox>
                </td> <td rowspan="5">
                    <img src="~/imagenes/lib.PNG"  runat="server" class="auto-style7"/>
                      </td>
            </tr>
        <tr>
                <td class="auto-style8">NOMBRE LIBRO 
                    <asp:TextBox ID="NombreLibro" runat="server"></asp:TextBox>
                </td>
            </tr>
         <tr>
                <td class="auto-style8">CANTIDAD INICIAL
                    <asp:TextBox ID="cantidadInicial" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">PRECIO
                    <asp:TextBox ID="Precio" runat="server"></asp:TextBox>
                </td>
            </tr>
         <tr>
            <td class="auto-style8">
               
                <asp:Button ID="Registrar" runat="server" Text="REGISTRAR" CssClass="auto-style2" OnClick="Registrar_Click" /> <asp:Button ID="Guardar" runat="server" Text="GUARDAR"  CssClass="auto-style2" OnClick="Guardar_Click" /> 
              
            </td>
        </tr>
        <tr >
            <td colspan="2" >
                <asp:Label ID="IdLib" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
       
        <tr> <td colspan="2" >
        <asp:GridView ID="gridLibros" Width="100%" runat="server" AutoGenerateColumns="False" OnRowCommand="gridLibros_RowCommand" Height="246px" DataKeyNames="IdLibro" DataSourceID="SqlDataSource1"  >
                        <Columns>
                            <asp:BoundField DataField="IdLibro" HeaderText="IdLibro" ReadOnly="True" SortExpression="IdLibro" />
                            <asp:BoundField DataField="NombreLibro" HeaderText="NombreLibro" SortExpression="NombreLibro" />
                            <asp:BoundField DataField="CantidadInicial" HeaderText="CantidadInicial" SortExpression="CantidadInicial" />
                            <asp:BoundField DataField="Precio" HeaderText="Precio" SortExpression="Precio" />
                            <asp:ButtonField  ButtonType="Button" CommandName ="Editar"  Text="Editar" HeaderText="Editar"  ShowHeader="True" />
                            <asp:ButtonField  ButtonType="Button" CommandName ="Eliminar" Text="Eliminar" HeaderText="Eliminar" ShowHeader="True" />
                               </Columns>
                    </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OasisLibrosConnectionString %>" SelectCommand="SELECT * FROM [LIBROS]"></asp:SqlDataSource>
 </td> 
            </tr> 
            </table>
    </div>
    </form>
</body>
</html>
