using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WeddingsPlanner.Models
{
    public class Wedding
    {
        public int WeddingId { get; set; }
        public string Bride { get; set; }
        public string Groom { get; set; }
        public string Place { get; set; }
        public Nullable<System.DateTime> Date { get; set; }
    }
}