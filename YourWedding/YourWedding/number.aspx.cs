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


namespace YourWedding
{
    public partial class number : System.Web.UI.Page
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
            string strQuery = "select GuestId,FamilyId,Name1,Name2,Mail,NumberOfKids,NumberOfTeens" +
                               " from Guest";
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
            string GuestId = ((TextBox)GridView1.FooterRow.FindControl("txtGuestId")).Text;
            string FamilyId = ((TextBox)GridView1.FooterRow.FindControl("txtFamilyId")).Text;
            string Name1 = ((TextBox)GridView1.FooterRow.FindControl("txtName1")).Text;
            string Name2 = ((TextBox)GridView1.FooterRow.FindControl("txtName2")).Text;

            string Mail = ((TextBox)GridView1.FooterRow.FindControl("txtMail")).Text;
            string NumberOfKids = ((TextBox)GridView1.FooterRow.FindControl("txtNumberOfKids")).Text;
            string NumberOfTeens = ((TextBox)GridView1.FooterRow.FindControl("txtNumberOfTeens")).Text;


            SqlConnection con = new SqlConnection(strConnString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SET IDENTITY_INSERT Guest ON;" +
                "insert into Guest(GuestId,FamilyId,Name1,Name2,Mail,NumberOfKids,NumberOfTeens) " +
            "values(@GuestId,@FamilyId,@Name1,@Name2,@Mail,@NumberOfKids,@NumberOfTeens);" +
            "SET IDENTITY_INSERT Guest OFF;" +
             "select GuestId,FamilyId,Name1,Name2,Mail,NumberOfKids,NumberOfTeens from Guest";

            cmd.Parameters.Add("@GuestId", SqlDbType.VarChar).Value = GuestId;
            cmd.Parameters.Add("@FamilyId", SqlDbType.VarChar).Value = FamilyId;
            cmd.Parameters.Add("@Name1", SqlDbType.VarChar).Value = Name1;
            cmd.Parameters.Add("@Name2", SqlDbType.VarChar).Value = Name2;

            cmd.Parameters.Add("@Mail", SqlDbType.VarChar).Value = Mail;
            cmd.Parameters.Add("@NumberOfKids", SqlDbType.VarChar).Value = NumberOfKids;
            cmd.Parameters.Add("@NumberOfTeens", SqlDbType.VarChar).Value = NumberOfTeens;



            GridView1.DataSource = GetData(cmd);
            GridView1.DataBind();
        }

        protected void DeleteCustomer(object sender, EventArgs e)
        {
            LinkButton lnkRemove = (LinkButton)sender;
            SqlConnection con = new SqlConnection(strConnString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SET IDENTITY_INSERT Present ON;" +
                "delete from  Guest where " +
            "GuestId=@GuestId;" +
             "SET IDENTITY_INSERT Present OFF;" +
             "select GuestId,FamilyId,Name1,Name2,Mail,NumberOfKids,NumberOfTeens from Guest";
            cmd.Parameters.Add("@GuestId", SqlDbType.VarChar).Value = lnkRemove.CommandArgument;
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
            string GuestId = ((Label)GridView1.Rows[e.RowIndex].FindControl("lblGuestId")).Text;
            string FamilyId = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtFamilyId")).Text;
            string Name1 = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtName1")).Text;
            string Name2 = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtName2")).Text;

            string Mail = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtMail")).Text;
            string NumberOfKids = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtNumberOfKids")).Text;
            string NumberOfTeens = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtNumberOfTeens")).Text;


            SqlConnection con = new SqlConnection(strConnString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SET IDENTITY_INSERT Guest ON;" +
               "delete from  Guest where GuestId=@GuestId;" +
                "insert into Guest(GuestId,FamilyId, Name1, Name2, Mail, NumberOfKids, NumberOfTeens) " +
            "values(@GuestId,@FamilyId,@Name1,@Name2,@Mail,@NumberOfKids,@NumberOfTeens);" +
                "SET IDENTITY_INSERT Guest OFF;" +
                "select GuestId,FamilyId,Name1,Name2,Mail,NumberOfKids,NumberOfTeens from Guest";

            cmd.Parameters.Add("@GuestId", SqlDbType.VarChar).Value = GuestId;
            cmd.Parameters.Add("@FamilyId", SqlDbType.VarChar).Value = FamilyId;
            cmd.Parameters.Add("@Name1", SqlDbType.VarChar).Value = Name1;
            cmd.Parameters.Add("@Name2", SqlDbType.VarChar).Value = Name2;

            cmd.Parameters.Add("@Mail", SqlDbType.VarChar).Value = Mail;
            cmd.Parameters.Add("@NumberOfKids", SqlDbType.VarChar).Value = NumberOfKids;
            cmd.Parameters.Add("@NumberOfTeens", SqlDbType.VarChar).Value = NumberOfTeens;


            GridView1.EditIndex = -1;
            GridView1.DataSource = GetData(cmd);
            GridView1.DataBind();
        }
    }
}