<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Carrello.aspx.cs" Inherits="MARIO.Carrello" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="updatePanel" runat="server">
        <ContentTemplate>
            <div class="container m-auto">
                <h3 class="my-3">Carrello</h3>
                <asp:Label ID="lblCarrelloVuoto" runat="server" Text="Carrello vuoto..." Visible="false" CssClass="text-center text-danger fs-3 fw-bold"></asp:Label>
                <asp:Repeater ID="rptCartItemss" runat="server" OnItemDataBound="rptCartItemss_ItemDataBound">
                    <ItemTemplate>
                        <div class="card mb-3">
                            <div class="row g-0">
                                <div class="col-md-3">
                                    <img src='<%# Eval("Immagine") %>' class="img-fluid" alt='<%# Eval("Nome") %>' />
                                </div>
                                <div class="col-md-7">
                                    <div class="card-body">
                                        <h4 class="card-title"><%# Eval("Nome") %></h4>
                                        <p class="card-text fw-bold">Prezzo: <%# Eval("Prezzo") %>€</p>
                                        <asp:DropDownList ID="ddlQuantitaCarrello1" runat="server" CssClass="form-select w-50" AutoPostBack="true"
                                            OnSelectedIndexChanged="DdlQuantitaCarrello1_SelectedIndexChanged"
                                            data-product-id='<%# Eval("ProductId") %>'>
                                            <asp:ListItem Value="1">1</asp:ListItem>
                                            <asp:ListItem Value="2">2</asp:ListItem>
                                            <asp:ListItem Value="3">3</asp:ListItem>
                                            <asp:ListItem Value="4">4</asp:ListItem>
                                            <asp:ListItem Value="5">5</asp:ListItem>
                                            <asp:ListItem Value="6">6</asp:ListItem>
                                            <asp:ListItem Value="7">7</asp:ListItem>
                                            <asp:ListItem Value="8">8</asp:ListItem>
                                            <asp:ListItem Value="9">9</asp:ListItem>
                                            <asp:ListItem Value="10">10</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:Button ID="btnRemoveAllFromCart" runat="server" Text="Rimuovi dal Carrello" CssClass="btn btn-danger mt-2"
                                            CommandName="RemoveAllFromCart" CommandArgument='<%# Eval("ProductId") %>' OnCommand="btnRemoveFromCart_Click" />
                                    </div>
                                </div>
                                <div class="col-md-2 mt-3">
                                    <p class="card-text">Quantità: <%# Eval("Quantita") %> pz. </p>
                                    <p class="card-text">Totale: <%# Eval("TotaleProdotto") %>€</p>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>

                <div class="text-end me-3">
                    <p class="lead fw-bold">Prezzo totale: <span id="totalPriceLabel" runat="server"></span>€</p>
                    <asp:Button ID="btnEmptyCart" runat="server" Text="Svuota Carrello" CssClass="btn btn-secondary" OnClick="btnEmptyCart_Click" />
                    <asp:Button ID="btnCheckout" runat="server" Text="Acquista" CssClass="btn btn-primary" OnClick="btnCheckout_Click" />
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
