using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections;
using System.IO.Compression;

namespace WeddingsPlanner
{
    public partial class presents : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\Pulpit\PAI\WeddingsPlanner\WeddingsPlanner\App_Data\MyDatabase.mdf;Integrated Security=True");

            con.Open();

            con.Close();
        }

        private String strConnStringY = ConfigurationManager.ConnectionStrings["YourWeddingString"].ConnectionString;
        private String strConnStringW = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        protected void UpdateDatabase(object sender, EventArgs e)
        {
            int allAdded = -1;
            while (allAdded != 0)
            {
                SqlConnection con2 = new SqlConnection(strConnStringY);
                con2.Open();
                SqlCommand cmd2 = new SqlCommand("Select ArticleId,ArticleName,BarCode,ArticlesNumber,ShopName,ShopAdress,Website,Occupied FROM Present");
                DataTable dt2 = GetData(strConnStringY, cmd2);
                con2.Close();


                SqlConnection con = new SqlConnection(strConnStringW);
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "Select ArticleId,ArticleName,BarCode,ArticlesNumber,ShopName,ShopAdress,Website FROM Article";
                DataTable dt = GetData(strConnStringW, cmd);
                allAdded = CheckIfPresent(dt, dt2, cmd);
                con.Close();
            }
            Page_Load(sender, e);
        }

        private int CheckIfPresent(DataTable dt, DataTable dt2, SqlCommand cmd)
        {
            foreach (DataRow dr2 in dt2.Rows)
            {
                int i = 0;
                foreach (DataRow dr in dt.Rows)
                {
                    if (dr.Field<string>("BarCode") == dr2.Field<string>("BarCode"))
                        i = 1;
                }

                if (i == 0)
                {
                    cmd.CommandText = "insert into Article(ArticleName,ShopName,BarCode,ArticlesNumber,ShopAdress,Website) " +
                                       "values(@ArticleName,@ShopName,@BarCode,@ArticlesNumber,@ShopAdress,@Website);" +
                                       "select ArticleId,ArticleName,ShopName,BarCode,ArticlesNumber,ShopAdress,Website from Article";

                    cmd.Parameters.Add("@ArticleName", SqlDbType.VarChar).Value = dr2.Field<string>("ArticleName");
                    cmd.Parameters.Add("@ShopName", SqlDbType.VarChar).Value = dr2.Field<string>("ShopName");
                    cmd.Parameters.Add("@BarCode", SqlDbType.VarChar).Value = dr2.Field<string>("BarCode");

                    cmd.Parameters.Add("@ArticlesNumber", SqlDbType.VarChar).Value = dr2.Field<int>("ArticlesNumber");
                    cmd.Parameters.Add("@ShopAdress", SqlDbType.VarChar).Value = dr2.Field<string>("ShopAdress");
                    cmd.Parameters.Add("@Website", SqlDbType.VarChar).Value = dr2.Field<string>("Website");
                    GetData(strConnStringW, cmd);
                    return -1;
                }
            }
            return 0;
        }

        private DataTable GetData(String strConnString, SqlCommand cmd)
        {
            DataTable dt = new DataTable();
            SqlConnection con = new SqlConnection(strConnString);
            SqlDataAdapter sda = new SqlDataAdapter();
            cmd.CommandType = CommandType.Text;
            cmd.Connection = con;
            con.Open();
            sda.SelectCommand = cmd;
            sda.Fill(dt);
            return dt;
        }

    }
}