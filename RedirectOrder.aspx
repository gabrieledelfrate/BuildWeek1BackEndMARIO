<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="RedirectOrder.aspx.cs" Inherits="MARIO.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="ml-auto text-center mt-5">
    <h2 class="text-info">Acquisto effettuato con successo!</h2>
    <h4 class="text-info">Il tuo ordine è stato registrato correttamente nel sistema.</h4>
    
    <div class="d-flex align-items-center justify-content-center">
        <h4 class="text-info">Per vedere il riepilogo dell'ordine clicca</h4>
        <a href="ITuoiOrdini.aspx" class="ml-2 mb-2" style="font-size: 25px;">qui.</a>
    </div>

    <div class="d-flex align-items-center justify-content-center">
        <h4 class="text-info">Oppure torna alla</h4>
        <a href="Home.aspx" class="ml-2 mb-2" style="font-size: 25px;">Home</a>
    </div>
</div>

</asp:Content>
