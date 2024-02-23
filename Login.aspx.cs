using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MARIO
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblErrorMessage.Text = "";
            }
        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            if (username == "admin" && password == "admin")
            {
                Session["UserID"] = username;
                Session["IsAdmin"] = true; 
                Response.Redirect("BackOffice.aspx");
            }
            else
            {
                string connectionString = ConfigurationManager.ConnectionStrings["Collegamento"].ConnectionString;
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "SELECT COUNT(*) FROM Cliente WHERE email = @Email AND password = @Password";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@Email", username);
                    cmd.Parameters.AddWithValue("@Password", password);

                    try
                    {
                        con.Open();
                        int count = (int)cmd.ExecuteScalar();
                        if (count > 0)
                        {
                            Session["UserID"] = username;
                            Response.Redirect("Home.aspx");
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Credenziali errate. Se non hai un account, registrati prima.');", true);
                        }
                    }
                    catch (Exception ex)
                    {
                        lblErrorMessage.Text = "Errore durante il login: " + ex.Message;
                    }
                }
            }
        }

        protected void BtnRegistrati_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registrazione.aspx");
        }
    }
}