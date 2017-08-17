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
    public partial class date : System.Web.UI.Page
    {
        private String strConnString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(strConnString);
            con.Open();
            if (!IsPostBack)
            {
                BindData();
            }
            con.Close();
        }

        private void BindData()
        {
            string strQuery = "select WeddingId,Bride,Groom,Place,Date from Wedding";
            SqlCommand cmd = new SqlCommand(strQuery);
            GridView1.DataSource = GetData(cmd);
            GridView1.DataBind();
        }

        private DataTable GetData(SqlCommand cmd)
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
        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            BindData();
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }

        protected void AddNewCustomer(object sender, EventArgs e)
        {
            string WeddingId = ((TextBox)GridView1.FooterRow.FindControl("txtWeddingId")).Text;
            string Bride = ((TextBox)GridView1.FooterRow.FindControl("txtBride")).Text;
            string Groom = ((TextBox)GridView1.FooterRow.FindControl("txtGroom")).Text;
            string Place = ((TextBox)GridView1.FooterRow.FindControl("txtPlace")).Text;
            string Date = ((TextBox)GridView1.FooterRow.FindControl("txtDate")).Text;


            SqlConnection con = new SqlConnection(strConnString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SET IDENTITY_INSERT Wedding ON;" +
                "insert into Wedding(WeddingId,Bride,Groom,Place,Date) " +
            "values(@WeddingId,@Bride,@Groom,@Place,@Date);" +
            "SET IDENTITY_INSERT Wedding OFF;" +
             "select WeddingId,Bride,Groom,Place,Date from Wedding";


            cmd.Parameters.Add("@WeddingId", SqlDbType.VarChar).Value = WeddingId;
            cmd.Parameters.Add("@Bride", SqlDbType.VarChar).Value = Bride;
            cmd.Parameters.Add("@Groom", SqlDbType.VarChar).Value = Groom;
            cmd.Parameters.Add("@Place", SqlDbType.VarChar).Value = Place;
            cmd.Parameters.Add("@Date", SqlDbType.VarChar).Value = Date;

            GridView1.DataSource = GetData(cmd);
            GridView1.DataBind();
        }

        protected void DeleteCustomer(object sender, EventArgs e)
        {
            LinkButton lnkRemove = (LinkButton)sender;
            SqlConnection con = new SqlConnection(strConnString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SET IDENTITY_INSERT Wedding ON;" +
                "delete from Wedding where " +
            "WeddingId=@WeddingId;" +
             "SET IDENTITY_INSERT Wedding OFF;" +
             "select WeddingId,Bride,Groom,Place,Date from Wedding";
            cmd.Parameters.Add("@WeddingId", SqlDbType.VarChar).Value = lnkRemove.CommandArgument;
            GridView1.DataSource = GetData(cmd);
            GridView1.DataBind();
        }
        protected void EditCustomer(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            BindData();
        }
        protected void CancelEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            BindData();
        }
        protected void UpdateCustomer(object sender, GridViewUpdateEventArgs e)
        {
            string WeddingId = ((Label)GridView1.Rows[e.RowIndex].FindControl("lblWeddingId")).Text;
            string Bride = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtBride")).Text;
            string Groom = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtGroom")).Text;
            string Place = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtPlace")).Text;
            string Date = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtDate")).Text;


            SqlConnection con = new SqlConnection(strConnString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SET IDENTITY_INSERT Wedding ON;" +
                "delete from  Wedding where WeddingId=@WeddingId;" +
                 "insert into Wedding(WeddingId,Bride,Groom,Place,Date) " +
            "values(@WeddingId,@Bride,@Groom,@Place,@Date);" +
                "SET IDENTITY_INSERT Wedding OFF;" +
                "select WeddingId,Bride,Groom,Place,Date from Wedding";

            cmd.Parameters.Add("@WeddingId", SqlDbType.VarChar).Value = WeddingId;
            cmd.Parameters.Add("@Bride", SqlDbType.VarChar).Value = Bride;
            cmd.Parameters.Add("@Groom", SqlDbType.VarChar).Value = Groom;
            cmd.Parameters.Add("@Place", SqlDbType.VarChar).Value = Place;
            cmd.Parameters.Add("@Date", SqlDbType.VarChar).Value = Date;


            GridView1.EditIndex = -1;
            GridView1.DataSource = GetData(cmd);
            GridView1.DataBind();
        }
    }
}