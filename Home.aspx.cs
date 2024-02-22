using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace MARIO
{
    public partial class Home : System.Web.UI.Page
    {
        public class DBConn
        {
            public static SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Collegamento"].ConnectionString);
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            try
            {
                DBConn.conn.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM Prodotti", DBConn.conn);
                SqlDataReader dataReader = cmd.ExecuteReader();
                string content = "";

                if (dataReader.HasRows)
                {
                    while (dataReader.Read())
                    {
                        content += $@" <div class=""card col-6 col-md-4 col-lg-3 ms-4 mb-3"">
                        <img class=""card-img-top h-100 w-100"" alt=""{dataReader["nome"]}"" src=""{dataReader["immagine"]}""/>
                        <div class=""card-body"">
                        <h5 class=""card-title mb-3"">{dataReader["nome"]}</h5>
                        </div>
                        <div class=""card-footer d-flex align-items-baseline justify-content-around"">
                        <h4 class=""card-text d-flex"">{dataReader["prezzo"]}€</h4>
                        <a href=""Dettaglio.aspx?product={dataReader["idprodotto"]}"" class=""btn btn-primary"">Dettagli</a>
                        </div>
                        </div>";

                    }
                    dataReader.Close();

                }
                contentHtml.InnerHtml = content;
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
    }
}