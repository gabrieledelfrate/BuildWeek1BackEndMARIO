<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StoricoOrdini.aspx.cs" Inherits="MARIO.StoricoOrdini" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
     <title>Storico Ordini</title>
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
     <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
     <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
     <link rel="icon" type="image/x-icon" href="/Images/piccol.ico" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mb-5 pt-5">
            <asp:Button ID="btnGoToHome" runat="server" Text="Home" CssClass="btn btn-info mb-5" PostBackUrl="~/Home.aspx" />
             <asp:Button ID="btnGoBackOffice" runat="server" Text="Torna a BackOffice" CssClass="btn btn-info mb-5" PostBackUrl="~/BackOffice.aspx" />
            <h1>Storico Ordini</h1>
            <asp:GridView ID="GridViewStoricoOrdini" runat="server" AutoGenerateColumns="False" GridLines="Both">
                <Columns>
                    <asp:BoundField DataField="idcarrello" HeaderText="Id Carrello" SortExpression="IdCarrello" ReadOnly="True" ItemStyle-HorizontalAlign="Center" />
                    <asp:BoundField DataField="elenco_id_prodotti" HeaderText="Elenco Id Prodotti" SortExpression="ElencoIdProdotti" ReadOnly="True" ItemStyle-HorizontalAlign="Center"/>
                    <asp:BoundField DataField="userid" HeaderText="User Id" SortExpression="UserId" ReadOnly="True" ItemStyle-HorizontalAlign="Center"/>
                    <asp:BoundField DataField="prezzototale" HeaderText="Prezzo Totale" SortExpression="PrezzoTotale" ReadOnly="True" ItemStyle-HorizontalAlign="Center"/>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>