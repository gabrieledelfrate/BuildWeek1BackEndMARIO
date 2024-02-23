<%@ Page Title="" EnableEventValidation="true" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Carrello.aspx.cs" Inherits="MARIO.Carrello" %>

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
                                        <p class="card-text font-weight-bold">Prezzo: <%# Eval("Prezzo") %>&euro;</p>
                                        <div class="d-flex">
                                        <asp:DropDownList ID="ddlQuantitaCarrello1" runat="server" CssClass="form-select w-25 dropCart" AutoPostBack="true"
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
                                        <asp:Button ID="btnRemoveAllFromCart" runat="server" Text="Rimuovi" CssClass="btn btn-danger mb-1 mx-2"
                                            CommandName="RemoveAllFromCart" CommandArgument='<%# Eval("ProductId") %>' OnCommand="btnRemoveFromCart_Click" />
                                            </div>
                                    </div>
                                </div>
                                <div class="col-md-2 mt-3">
                                    <p class="card-text">Quantita': <%# Eval("Quantita") %> pz. </p>
                                    <p class="card-text">Totale: <%# Eval("TotaleProdotto") %>&euro;</p>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>

                <div class="d-flex justify-content-end align-items-center">
                    <h5 class="mr-2">Prezzo totale: </h5>
                    <h5 id="totalPriceLabel" runat="server"></h5>
                    <h5 class="mr-2">&euro; </h5>
                </div>
                <div class="d-flex justify-content-end align-items-center mt-3">
                                         <asp:Button ID="btnAcquista" runat="server" Text="Acquista" CssClass="btn btn-info mr-2" OnClick="btnCheckout_Click" AutoPostBack="true" />
                     <asp:Button ID="btnEmptyCart" runat="server" Text="Svuota Carrello" CssClass="btn btn-secondary" OnClick="btnEmptyCart_Click" />

                </div>
            </div>
            <div id="myToast" class="toast align-items-center text-white bg-success" data-delay="4000" role="alert" aria-live="assertive" aria-atomic="true">
                <div class="d-flex">
                    <div class="toast-body">
                        <span id="toastMessage"></span>
                    </div>
                    <button type="button" class="btn-close me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <script>
        function showToast(message) {
            var toast = new bootstrap.Toast(document.getElementById('myToast'));
            document.getElementById('toastMessage').innerText = message;
            toast.show();
        }

        function showEmptyCartToast() {
            showToast('Carrello svuotato');
        }

        function showCheckoutToast() {
            showToast('Acquisto effettuato');
        }
    </script>

</asp:Content>

