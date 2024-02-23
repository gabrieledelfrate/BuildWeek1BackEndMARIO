<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="ITuoiOrdini.aspx.cs" Inherits="MARIO.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <div class="container mb-5 pt-5">
            <asp:Button ID="btnGoToHome" runat="server" Text="Home" CssClass="btn btn-info mb-5" PostBackUrl="~/Home.aspx" />
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
</asp:Content>
