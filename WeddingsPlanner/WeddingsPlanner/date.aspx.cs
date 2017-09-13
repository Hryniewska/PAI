using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Http;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections;
using System.IO.Compression;
using WeddingsPlanner.Models;
using Newtonsoft.Json;
using System.Net;
using System.IO;
using System.Runtime.Serialization.Json;
using System.Text;
using System.Net.Http.Headers;
using System.Threading.Tasks;
//Dlaczego Microsofty zdecydował się na asynchronicznego POSTa?

namespace WeddingsPlanner
{
    public partial class date : System.Web.UI.Page
    {
        private String strConnString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                BindWeddingsToGrid();
            }
        }
        private void BindWeddingsToGrid()
        {
            String weddings = this.GET("http://localhost:8804/api/Weddings");
            List<Wedding> weddingList = JsonConvert.DeserializeObject<List<Wedding>>(weddings);
            System.Diagnostics.Debug.WriteLine(weddingList);
            System.Diagnostics.Debug.WriteLine(weddingList.Count);
            DataTable table = new DataTable();
            table.Columns.Add("WeddingId");
            table.Columns.Add("Bride");
            table.Columns.Add("Groom");
            table.Columns.Add("Place");
            table.Columns.Add("Date");
            foreach (var wedding in weddingList)
            {
                DataRow row = table.NewRow();
                row["WeddingId"] = wedding.WeddingId;
                row["Bride"] = wedding.Bride;
                row["Groom"] = wedding.Groom;
                row["Place"] = wedding.Place;
                row["Date"] = wedding.Date;
                table.Rows.Add(row);
            }
            System.Diagnostics.Debug.WriteLine("wprowadzamy taki table:{0}", table);
            GridView1.EditIndex = -1;
            GridView1.DataSource = table;
            GridView1.DataBind();
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

        protected async void AddNewCustomer(object sender, EventArgs e)
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

            //Wedding wedding = new Wedding();
            //wedding.Bride=Bride;
            //wedding.Place = Place;
            //wedding.Groom=Groom;
            //wedding.Place=Place;
            //wedding.Date= DateTime.ParseExact(Date, "yyyy-MM-dd HH:mm:ss,fff",
            //                           System.Globalization.CultureInfo.InvariantCulture);
            //wedding.WeddingId = Int32.Parse(WeddingId);

            //var myContent = JsonConvert.SerializeObject(wedding);
            //var buffer = System.Text.Encoding.UTF8.GetBytes(myContent);
            //var byteContent = new ByteArrayContent(buffer);
            //byteContent.Headers.ContentType = new MediaTypeHeaderValue("application/json");
            ////HttpClient client = new HttpClient();
            ////client.Po
            ////var result = client.PostAsync("http://localhost:8804/api/Weddings", byteContent).Result;
            //sendFinallyPost(byteContent);


            //GridView1.DataSource = table;
            //GridView1.DataBind();
        }
        //public async Task sendFinallyPost(ByteArrayContent byteContent)
        //{
        //    HttpClient client = new HttpClient();

        //    var result = client.PostAsync("http://localhost:8804/api/Weddings", byteContent).Result;
        //}


        public String GET(String url)
        {
            string html = string.Empty;

            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
            request.AutomaticDecompression = DecompressionMethods.GZip;

            using (HttpWebResponse response = (HttpWebResponse)request.GetResponse())
            using (Stream stream = response.GetResponseStream())
            using (StreamReader reader = new StreamReader(stream))
            {
                html = reader.ReadToEnd();
            }
            System.Diagnostics.Debug.WriteLine("koniec click");
            System.Diagnostics.Debug.WriteLine(html);
            return html;
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
            String weddings = this.GET("http://localhost:8804/api/Weddings");
            List<Wedding> weddingList = JsonConvert.DeserializeObject<List<Wedding>>(weddings);
            //DeserializeObject<Wedding>(weddings);
            System.Diagnostics.Debug.WriteLine(weddingList);
            System.Diagnostics.Debug.WriteLine(weddingList.Count);
            DataTable table = new DataTable();
            table.Columns.Add("WeddingId");
            table.Columns.Add("Bride");
            table.Columns.Add("Groom");
            table.Columns.Add("Place");
            foreach (var wedding in weddingList)
            {
                DataRow row = table.NewRow();
                row["WeddingId"] = wedding.WeddingId;
                row["Bride"] = wedding.Bride;
                row["Groom"] = wedding.Groom;
                row["Place"] = wedding.Place;
            }

   

            GridView1.EditIndex = -1;
            GridView1.DataSource = table;
            GridView1.DataBind();
        }
    }
}