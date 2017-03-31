<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reportes.aspx.cs" Inherits="El_oasis_del_libro.Reportes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style3 {
            height: 23px;
        }
        .auto-style4 {
            height: 199px;
            width: 1019px;
        }
        .auto-style5 {
            color: #FFFFFF;
            text-align: center;
            font-size: x-large;
            background-color: #0033CC;
        }
        .auto-style6 {
            height: 149px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table width=" "100%">
        <tr>
            <td colspan="2">
                <img src="imagenes/oasis titulo.PNG"  runat="server" class="auto-style4"/>
            </td>
        </tr>
        
         <tr>
            <td>
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
             <td>
                 <img src="imagenes/INVENTARIOS.PNG" runat="server" class="auto-style6" />
             </td>
        </tr>
         <tr>
            <td colspan="2" class="auto-style5">
                 <strong>INVENTARIOS LIBROS 
            </strong>  
            </td>
        </tr>
        <tr>
            <td colspan="2" class="auto-style3">
                <asp:Button ID="Button1" runat="server" Text="Libros" OnClick="Button1_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="2">

        <asp:GridView ID="gridInventarios" Width="100%" runat="server" AutoGenerateColumns="False"  Height="246px" OnRowCommand="gridInventarios_RowCommand"  DataSourceID="SqlDataSourceInvent" DataKeyNames="IdInventario"  >
            <Columns>
                <asp:BoundField DataField="IdInventario" HeaderText="IdInventario" InsertVisible="False" ReadOnly="True" SortExpression="IdInventario" />
                <asp:BoundField DataField="IdLibro" HeaderText="IdLibro" SortExpression="IdLibro" />
                <asp:BoundField DataField="CantidadInicial" HeaderText="CantidadInicial" SortExpression="CantidadInicial" />
                <asp:BoundField DataField="CantidadVendido" HeaderText="CantidadVendido" SortExpression="CantidadVendido" />
                <asp:BoundField DataField="CantidadActual" HeaderText="CantidadActual" SortExpression="CantidadActual" />
            </Columns>
                    </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSourceInvent" runat="server" ConnectionString="<%$ ConnectionStrings:OasisLibrosConnectionString %>" SelectCommand="SELECT * FROM [INVENTARIOS]"></asp:SqlDataSource>
    
            </td>
        </tr>
                </table>
    </div>
    </form>
</body>
</html>
