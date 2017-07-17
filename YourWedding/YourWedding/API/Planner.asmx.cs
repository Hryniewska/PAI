using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using YourWedding.Models;

namespace YourWedding.API
{
    /// <summary>
    /// Summary description for Planner
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class Planner : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld(string UserName)
        {
            return "Hello, " + UserName;
        }

        [WebMethod]
        public List<Wedding> GetWeddings()
        {
            PlannerService service = new PlannerService();
            return service.GetWeddings();
        }

    }
}
