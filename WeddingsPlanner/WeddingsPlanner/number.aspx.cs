using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;

namespace WeddingsPlanner
{
    public partial class number : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\Pulpit\PAI\WeddingsPlanner\WeddingsPlanner\App_Data\MyDatabase.mdf;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();

            con.Close();
        }
    }
}