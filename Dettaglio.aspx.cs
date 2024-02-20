using MARIO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static MARIO.Home;

namespace MARIO
{
    public partial class Dettaglio : System.Web.UI.Page
    {
        private string ProductID;
        protected void Page_Load(object sender, EventArgs e)
        {
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
                    txtPrice.InnerText = dataReader["prezzo"].ToString() + "€";
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
                int quantita = int.Parse(ddlQuantita.SelectedValue); 
                List<int> products;

                if (Session["idprodotto"] == null)
                {
                    products = new List<int>();
                }
                else
                {
                    products = (List<int>)Session["idprodotto"];
                }

                for (int i = 0; i < quantita; i++)
                {
                    products.Add(prodID);
                }

                Session["idprodotto"] = products;

            }
            catch (Exception ex)
            {
                Response.Write("Si è verificato un errore: " + ex.Message);
            }
        }
    

        protected void ddlQuantita_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                int quantitaSelezionata = int.Parse(ddlQuantita.SelectedValue);
                btnAddCart_Click(sender, e);
            }
            catch (Exception ex)
            {
                Response.Write("Si è verificato un errore: " + ex.Message);
            }
        }
    }
}


