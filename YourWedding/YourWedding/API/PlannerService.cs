using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using YourWedding.Models;

namespace YourWedding.API
{
    public class PlannerService
    {
        public List<Wedding> GetWeddings()
        {
            List<Wedding> result = new List<Wedding>();
            result.Add(new Wedding() { Bride = "Kinga", Groom = "Marcin", Date = 245, Id = 1, Place = "Lodź" });
            result.Add(new Wedding() { Bride = "Kinga2", Groom = "Marcin2", Date = 246, Id = 2, Place = "Lodź" });
            result.Add(new Wedding() { Bride = "Kinga3", Groom = "Marcin3", Date = 242, Id = 3, Place = "Łódź" });
            return result;
        }
    }
}