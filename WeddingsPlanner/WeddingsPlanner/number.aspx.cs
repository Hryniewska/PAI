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
    public partial class number : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\Pulpit\PAI\WeddingsPlanner\WeddingsPlanner\App_Data\MyDatabase.mdf;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();

            con.Close();
        }



        private String strConnStringY = ConfigurationManager.ConnectionStrings["YourWeddingString"].ConnectionString;
        private String strConnStringW = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        protected void UpdateDatabase(object sender, EventArgs e)
        {
            int allAdded = -2;
            while (allAdded != 0)
            {
                SqlConnection con2 = new SqlConnection(strConnStringY);
                con2.Open();
                SqlCommand cmd2 = new SqlCommand("select GuestId,FamilyId,Name1,Name2,Mail,NumberOfKids,NumberOfTeens FROM Guest");
                DataTable dt2 = GetData(strConnStringY, cmd2);
                con2.Close();


                SqlConnection con = new SqlConnection(strConnStringW);
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "SELECT Bride, Groom, WeddingId FROM Wedding";
                DataTable dt = GetData(strConnStringW, cmd);

                foreach (DataRow dr in dt.Rows)
                {
                    if (dr.Field<string>("Bride") == "Kinga Pąk" && dr.Field<string>("Groom") == "Marcin Wierzba")
                        allAdded = UpdateGuestList(dr, dt2, cmd);

                }

                con.Close();
                Page_Load(sender, e);

                if (allAdded == -2)
                    break;
            }
        }
              
        private int UpdateGuestList(DataRow dr, DataTable dt2, SqlCommand cmd)
        {
            int nAdults = 0;
            int nTeens = 0;
            int nKids = 0;
            foreach (DataRow dr2 in dt2.Rows)
            {
                if (dr2.Field<int?>("NumberOfKids") != null)
                    nKids += dr2.Field<int>("NumberOfKids");

                if (dr2.Field<int?>("NumberOfTeens") != null)
                    nTeens += dr2.Field<int>("NumberOfTeens");

                if (dr2.Field<string>("Name1") != "")
                    nAdults += 1;

                if (dr2.Field<string>("Name2") != "")
                    nAdults += 1;
            }

            cmd.CommandText = "delete from Guest where WeddingId_FK1=@WeddingId_FK1;" +
                                "insert into Guest(WeddingId_FK1,Adults,Teens,Kids) " +
                               "values(@WeddingId_FK1,@Adults,@Teens,@Kids)";

            cmd.Parameters.Add("@Adults", SqlDbType.VarChar).Value = nAdults;
            cmd.Parameters.Add("@Teens", SqlDbType.VarChar).Value = nTeens;
            cmd.Parameters.Add("@Kids", SqlDbType.VarChar).Value = nKids;
            cmd.Parameters.Add("@WeddingId_FK1", SqlDbType.VarChar).Value = dr.Field<int>("WeddingId");
            GetData(strConnStringW, cmd);

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