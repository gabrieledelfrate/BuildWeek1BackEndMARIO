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
    public partial class Registrazione : System.Web.UI.Page
    {
        protected void BtnSave_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            string connectionString = ConfigurationManager.ConnectionStrings["Collegamento"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string checkQuery = "SELECT COUNT(*) FROM Cliente WHERE email = @Email";
                SqlCommand checkCmd = new SqlCommand(checkQuery, con);
                checkCmd.Parameters.AddWithValue("@Email", email);

                try
                {
                    con.Open();
                    int emailCount = (int)checkCmd.ExecuteScalar();
                    if (emailCount > 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Questo indirizzo email è già stato registrato. Si prega di utilizzare un altro indirizzo email." + "');", true);
                        return;
                    }
                    else
                    {
                        string insertQuery = "INSERT INTO Cliente (email, password) VALUES (@Email, @Password)";
                        SqlCommand insertCmd = new SqlCommand(insertQuery, con);
                        insertCmd.Parameters.AddWithValue("@Email", email);
                        insertCmd.Parameters.AddWithValue("@Password", password);
                        insertCmd.ExecuteNonQuery();
                        ScriptManager.RegisterStartupScript(this, GetType(), "showRegistrationSuccessToast", "$('.toast-registration-success').toast('show');", true);
                    }
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showRegistrationErrorToast", "$('.toast-registration-error').toast('show');", true);
                    Response.Write("Errore durante l'inserimento dei dati: " + ex.Message);
                }
            }
            ScriptManager.RegisterStartupScript(this, GetType(), "RedirectScript", "setTimeout(function(){ window.location.href = 'Login.aspx'; }, 2000);", true);
        }
    }
}