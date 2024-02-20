<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BackOffice.aspx.cs" Inherits="MARIO.BackOffice" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Backoffice</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Backoffice - Lista Prodotti</h2>
            <asp:GridView ID="GridViewProducts" runat="server" AutoGenerateColumns="False" DataKeyNames="idprodotto" OnRowEditing="GridViewProducts_RowEditing">
                <Columns>
                    <asp:BoundField DataField="idprodotto" HeaderText="ID Prodotto" ReadOnly="True" />
                    <asp:BoundField DataField="nome" HeaderText="Nome Prodotto" />
                    <asp:BoundField DataField="descrizione" HeaderText="Descrizione" />
                    <asp:TemplateField HeaderText="Immagine">
                        <ItemTemplate>
                            <asp:Image ID="immagine" runat="server" ImageUrl='<%# Eval("ImagePath") %>' Width="100" Height="100" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Operazioni">
                        <ItemTemplate>
                            <asp:Button ID="btnEdit" runat="server" Text="Modifica" CommandName="Edit" />
                            <asp:Button runat="server" CommandName="Delete" CommandArgument='<%# Eval("idprodotto") %>'
                            CssClass="btn btn-danger w-75 ms-2" Text="Elimina" OnClientClick="return confirm('Sei sicuro di voler eliminare questo elemento?');" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>

        <asp:SqlDataSource ID="PiccolDB" runat="server" connectionString="Server=192.168.1.6,1433;Database=Piccol; User Id=sa"
            SelectCommand="SELECT idprodotto, nome, descrizione, immagine FROM Prodotti"
            DeleteCommand="DELETE FROM Prodotti WHERE idprodotto = @idprodotto">
            <DeleteParameters>
                <asp:Parameter Name="idprodotto" Type="int" />
            </DeleteParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>