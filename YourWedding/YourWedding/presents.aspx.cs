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
    public partial class presents : System.Web.UI.Page
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
            string strQuery = "select ArticleId,ArticleName,BarCode,ArticlesNumber,ShopName,ShopAdress,Website,Occupied" +
                               " from Present";
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
            string ArticleId = ((TextBox)GridView1.FooterRow.FindControl("txtArticleId")).Text;
            string ArticleName = ((TextBox)GridView1.FooterRow.FindControl("txtArticleName")).Text;
            string ShopName = ((TextBox)GridView1.FooterRow.FindControl("txtShopName")).Text;
            string BarCode = ((TextBox)GridView1.FooterRow.FindControl("txtBarCode")).Text;

            string ArticlesNumber = ((TextBox)GridView1.FooterRow.FindControl("txtArticlesNumber")).Text;
            string ShopAdress = ((TextBox)GridView1.FooterRow.FindControl("txtShopAdress")).Text;
            string Website = ((TextBox)GridView1.FooterRow.FindControl("txtWebsite")).Text;
            string Occupied = ((TextBox)GridView1.FooterRow.FindControl("txtOccupied")).Text;


            SqlConnection con = new SqlConnection(strConnString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SET IDENTITY_INSERT Present ON;" +
                "insert into Present(ArticleId,ArticleName,ShopName,BarCode,ArticlesNumber,ShopAdress,Website,Occupied) " +
            "values(@ArticleId,@ArticleName,@ShopName,@BarCode,@ArticlesNumber,@ShopAdress,@Website,@Occupied);" +
            "SET IDENTITY_INSERT Present OFF;" +
             "select ArticleId,ArticleName,ShopName,BarCode,ArticlesNumber,ShopAdress,Website,Occupied from Present";


            cmd.Parameters.Add("@ArticleId", SqlDbType.VarChar).Value = ArticleId;
            cmd.Parameters.Add("@ArticleName", SqlDbType.VarChar).Value = ArticleName;
            cmd.Parameters.Add("@ShopName", SqlDbType.VarChar).Value = ShopName;
            cmd.Parameters.Add("@BarCode", SqlDbType.VarChar).Value = BarCode;

            cmd.Parameters.Add("@ArticlesNumber", SqlDbType.VarChar).Value = ArticlesNumber;
            cmd.Parameters.Add("@ShopAdress", SqlDbType.VarChar).Value = ShopAdress;
            cmd.Parameters.Add("@Website", SqlDbType.VarChar).Value = Website;
            cmd.Parameters.Add("@Occupied", SqlDbType.VarChar).Value = Occupied;


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
                "delete from  Present where " +
            "ArticleId=@ArticleId;" +
             "SET IDENTITY_INSERT Present OFF;" +
             "select ArticleId,ArticleName,ShopName,BarCode,ArticlesNumber,ShopAdress,Website,Occupied from Present";
            cmd.Parameters.Add("@ArticleId", SqlDbType.VarChar).Value = lnkRemove.CommandArgument;
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
            string ArticleId = ((Label)GridView1.Rows[e.RowIndex].FindControl("lblArticleId")).Text;
            string ArticleName = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtArticleName")).Text;
            string ShopName = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtShopName")).Text;
            string BarCode = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtBarCode")).Text;

            string ArticlesNumber = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtArticlesNumber")).Text;
            string ShopAdress = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtShopAdress")).Text;
            string Website = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtWebsite")).Text;
            string Occupied = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtOccupied")).Text;


            SqlConnection con = new SqlConnection(strConnString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SET IDENTITY_INSERT Present ON;" +
                "delete from  Present where ArticleId=@ArticleId;" +
                "insert into Present(ArticleId,ArticleName,ShopName,BarCode,ArticlesNumber,ShopAdress,Website,Occupied) " +
                "values(@ArticleId,@ArticleName,@ShopName,@BarCode,@ArticlesNumber,@ShopAdress,@Website,@Occupied);" +
                "SET IDENTITY_INSERT Present OFF;" +
                "select ArticleId,ArticleName,BarCode,ArticlesNumber,ShopName,ShopAdress,Website,Occupied from Present";


            cmd.Parameters.Add("@ArticleId", SqlDbType.VarChar).Value = ArticleId;
            cmd.Parameters.Add("@ArticleName", SqlDbType.VarChar).Value = ArticleName;
            cmd.Parameters.Add("@ShopName", SqlDbType.VarChar).Value = ShopName;
            cmd.Parameters.Add("@BarCode", SqlDbType.VarChar).Value = BarCode;

            cmd.Parameters.Add("@ArticlesNumber", SqlDbType.VarChar).Value = ArticlesNumber;
            cmd.Parameters.Add("@ShopAdress", SqlDbType.VarChar).Value = ShopAdress;
            cmd.Parameters.Add("@Website", SqlDbType.VarChar).Value = Website;
            cmd.Parameters.Add("@Occupied", SqlDbType.VarChar).Value = Occupied;



            GridView1.EditIndex = -1;
            GridView1.DataSource = GetData(cmd);
            GridView1.DataBind();
        }
    }
}