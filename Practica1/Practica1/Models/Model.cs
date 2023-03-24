using System;
using System.Collections.Generic;

namespace Practica1
{
    public partial class Model
    {
        public int IdModels { get; set; }
        public int? BrandId { get; set; }
        public string? Name { get; set; }
        public bool? Active { get; set; }

        public virtual Bran? Brand { get; set; }
    }
}
