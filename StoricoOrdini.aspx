<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StoricoOrdini.aspx.cs" Inherits="MARIO.StoricoOrdini" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Storico Ordini</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Storico Ordini</h1>
            <asp:GridView ID="GridViewStoricoOrdini" runat="server" AutoGenerateColumns="False" GridLines="Both">
                <Columns>
                    <asp:BoundField DataField="idcarrello" HeaderText="Id Carrello" SortExpression="IdCarrello" />
                    <asp:BoundField DataField="elenco_id_prodotti" HeaderText="Elenco Id Prodotti" SortExpression="ElencoIdProdotti" />
                    <asp:BoundField DataField="userid" HeaderText="User Id" SortExpression="UserId" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
