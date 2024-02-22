using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace MARIO
{
    public partial class Carrello : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
                BindCartItems();
                UpdateDropdownSelection();
            }
        }
        private void BindCartItems()
        {
            if (Session["idprodotto"] != null)
            {
                List<int> cartItems = (List<int>)Session["idprodotto"];
                List<CartItem> items = GetCartItems(cartItems);
                rptCartItemss.DataSource = items;
                rptCartItemss.DataBind();
                decimal totalPrice = items.Sum(item => item.TotaleProdotto);
                totalPriceLabel.InnerText = totalPrice.ToString("0.00");
            }
        }
        private List<CartItem> GetCartItems(List<int> productIds)
        {
            List<CartItem> cartItems = new List<CartItem>();
            CultureInfo italianCulture = new CultureInfo("it-IT");

            foreach (int productId in productIds.Distinct())
            {
                if (Session["ProductInfo_" + productId] != null)
                {
                    CartItem cartItem = (CartItem)Session["ProductInfo_" + productId];
                    cartItem.Quantita = productIds.Count(item => item == productId);
                    cartItem.Prezzo = decimal.Parse(cartItem.Prezzo.ToString("0.00", italianCulture), italianCulture);
                    cartItem.TotaleProdotto = cartItem.Prezzo * cartItem.Quantita;
                    cartItems.Add(cartItem);
                }
            }
            return cartItems;
        }
        private void UpdateDropdownSelection()
        {
            if (Session["idprodotto"] != null)
            {
                List<int> cartItems = (List<int>)Session["idprodotto"];

                foreach (RepeaterItem item in rptCartItemss.Items)
                {
                    DropDownList ddlQuantitaCarrello1 = (DropDownList)item.FindControl("ddlQuantitaCarrello1");

                    if (ddlQuantitaCarrello1 != null)
                    {
                        if (item.DataItem != null)
                        {
                            int productId = ((CartItem)item.DataItem).ProductId;
                            string cookieName = "QuantitaSelezionata_" + productId;

                            if (Request.Cookies[cookieName] != null)
                            {
                                string quantitaSelezionataValue = Request.Cookies[cookieName].Value;
                                int quantitaSelezionata;

                                if (int.TryParse(quantitaSelezionataValue, out quantitaSelezionata))
                                {
                                    ddlQuantitaCarrello1.SelectedValue = quantitaSelezionata.ToString();
                                }
                            }
                        }
                    }
                }
            }
        }
        protected void DdlQuantitaCarrello1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddlQuantitaCarrello = (DropDownList)sender;
            int productId = Convert.ToInt32(ddlQuantitaCarrello.Attributes["data-product-id"]);
            int newQuantity = Convert.ToInt32(ddlQuantitaCarrello.SelectedValue);
            UpdateCartItemQuantity(productId, newQuantity);
            BindCartItems();
        }
        protected void rptCartItemss_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DropDownList ddlQuantitaCarrello1 = (DropDownList)e.Item.FindControl("ddlQuantitaCarrello1");

                if (ddlQuantitaCarrello1 != null)
                {
                    int productId = ((CartItem)e.Item.DataItem).ProductId;

                    if (Request.Cookies["QuantitaSelezionata_" + productId] != null)
                    {
                        string quantitaSelezionataValue = Request.Cookies["QuantitaSelezionata_" + productId].Value;
                        int quantitaSelezionata;

                        if (int.TryParse(quantitaSelezionataValue, out quantitaSelezionata))
                        {
                            ddlQuantitaCarrello1.SelectedValue = quantitaSelezionata.ToString();
                        }
                    }
                    ddlQuantitaCarrello1.SelectedValue = ((CartItem)e.Item.DataItem).Quantita.ToString();
                }
            }
        }

        private void UpdateCartItemQuantity(int productId, int newQuantity)
        {
            if (Session["idprodotto"] != null)
            {
                List<int> productIds = (List<int>)Session["idprodotto"];
                productIds.RemoveAll(id => id == productId);
                productIds.AddRange(Enumerable.Repeat(productId, newQuantity));
                Session["idprodotto"] = productIds;
                BindCartItems();
            }
        }

        protected void btnRemoveFromCart_Click(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "RemoveFromCart" || e.CommandName == "RemoveAllFromCart")
            {
                List<int> cartProductIds = (List<int>)Session["idprodotto"];

                if (cartProductIds != null && e.CommandArgument != null)
                {
                    int productIdToRemove = Convert.ToInt32(e.CommandArgument);
                    if (e.CommandName == "RemoveFromCart")
                    {                        
                        cartProductIds.Remove(productIdToRemove);
                    }
                    else if (e.CommandName == "RemoveAllFromCart")
                    {                       
                        cartProductIds.RemoveAll(id => id == productIdToRemove);
                    }
                    Session["idprodotto"] = cartProductIds;
                    BindCartItems();
                }
            }
        }
        protected void btnEmptyCart_Click(object sender, EventArgs e)
        {
            Session["idprodotto"] = null;
            BindCartItems();
            Response.Redirect("Carrello.aspx");
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {            
            Session["idprodotto"] = null;
            BindCartItems();
        }
        public class CartItem
        {
            public int ProductId { get; set; }
            public string Nome { get; set; }
            public decimal Prezzo { get; set; }
            public string Immagine { get; set; }
            public int Quantita { get; set; }
            public decimal TotaleProdotto { get; set; }
        }
    }
}
