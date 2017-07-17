using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace YourWedding.Models
{
    public class Wedding
    {
        public int Id { get; set; }
        public string Bride { get; set; }
        public string Groom { get; set; }
        public string Place { get; set; } //<- dodaj do lokalnej
        public int Date { get; set; }
    }

    public class Shop
    {
        public int Id { get; set; }
        public string Website { get; set; }
        public string NameShop { get; set; }
        public string AdressShop { get; set; }
    }

    public class Gift
    {
        public int IdShop { get; set; }
        public string NameArticle { get; set; }
        public int Price { get; set; }
        public bool IsReserved { get; set; }
        public int Count { get; set; }
    }

    public class Guest
    {
        public int IdFamily { get; set; }
        public string Name { get; set; }
        public int Age { get; set; }
    }
}