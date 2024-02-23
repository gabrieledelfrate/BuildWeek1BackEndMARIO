using MARIO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static MARIO.Carrello;
using static MARIO.Home;

namespace MARIO
{
    public partial class Dettaglio : System.Web.UI.Page
    {
        private string ProductID;
        protected void Page_Load(object sender, EventArgs e)

        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                Session["QuantitaSelezionata"] = 1; 
            }

            if (Request.QueryString["product"] == null)
            {
                Response.Redirect("Home.aspx");
            }
            ProductID = Request.QueryString["product"].ToString();

            try
            {
                DBConn.conn.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM Prodotti WHERE idprodotto=@ID", DBConn.conn);
                cmd.Parameters.AddWithValue("@ID", ProductID);
                SqlDataReader dataReader = cmd.ExecuteReader();

                if (dataReader.HasRows)
                {
                    dataReader.Read();
                    ttlProduct.InnerText = dataReader["nome"].ToString();
                    img.Src = dataReader["immagine"].ToString();
                    txtDescription.InnerText = dataReader["descrizione"].ToString();
                    decimal prezzo = Convert.ToDecimal(dataReader["prezzo"], CultureInfo.InvariantCulture);
                    txtPrice.InnerText = prezzo.ToString("0.00", CultureInfo.InvariantCulture) + "€";
                    dataReader.Close();
                }                
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
            finally
            {
                if (DBConn.conn.State == ConnectionState.Open)
                {
                    DBConn.conn.Close();
                }
            }
        }
        protected void btnAddCart_Click(object sender, EventArgs e)
        {
            try
            {
                int prodID = int.Parse(ProductID);
                

                List<int> products;

                if (Session["idprodotto"] == null)
                {
                    products = new List<int>();
                }
                else
                {
                    products = (List<int>)Session["idprodotto"];
                }

                if (!products.Contains(prodID))
                {
                    int quantita = Session["QuantitaSelezionata"] != null ? (int)Session["QuantitaSelezionata"] : 1;

                    for (int i = 0; i < quantita; i++)
                    {
                        products.Add(prodID);

                        CartItem cartItem = new CartItem
                        {
                            ProductId = prodID,
                            Nome = ttlProduct.InnerText,
                            Prezzo = decimal.Parse(txtPrice.InnerText.Replace("€", ""), CultureInfo.InvariantCulture),
                            Immagine = img.Src
                        };
                        Session["ProductInfo_" + prodID] = cartItem;
                    }

                    Session["idprodotto"] = products;

                    int quantitaSelezionata = int.Parse(ddlQuantita.SelectedValue);
                    HttpCookie quantitaCookie = new HttpCookie("QuantitaSelezionata_" + ProductID, quantitaSelezionata.ToString());
                    quantitaCookie.Expires = DateTime.Now.AddMinutes(45);
                    Response.Cookies.Add(quantitaCookie);

                    int cartCount = (Session["CartCount"] != null) ? (int)Session["CartCount"] : 0;
                    cartCount++;
                    Session["CartCount"] = cartCount;

                    ((MARIO.MasterPage)Master).UpdateCartCount();

                    ScriptManager.RegisterStartupScript(this, GetType(), "showSuccessToast", "$('.toast-success').toast('show');", true);
                }
                else
                {                    
                    ScriptManager.RegisterStartupScript(this, GetType(), "showInfoToast", "$('.toast-info').toast('show');", true);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showErrorToast", "$('.toast-error').toast('show');", true);
                Response.Write("Si è verificato un errore: " + ex.Message);
            }
        }
        protected void ddlQuantita_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                int quantitaSelezionata = int.Parse(ddlQuantita.SelectedValue);
                Session["QuantitaSelezionata"] = quantitaSelezionata;

            }
            catch (Exception ex)
            {
                Response.Write("Si è verificato un errore: " + ex.Message);
            }
        }
    }
}