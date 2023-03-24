using System;
using System.Collections.Generic;

namespace Practica1
{
    public partial class Bran
    {
        public Bran()
        {
            Models = new HashSet<Model>();
        }

        public int IdBrands { get; set; }
        public string? Name { get; set; }
        public bool? Active { get; set; }

        public virtual ICollection<Model> Models { get; set; }
    }
}
