//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace El_oasis_del_libro
{
    using System;
    using System.Collections.Generic;
    
    public partial class LIBROS
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public LIBROS()
        {
            this.CANTIDADVENDIDOS = new HashSet<CANTIDADVENDIDOS>();
            this.INVENTARIOS = new HashSet<INVENTARIOS>();
        }
    
        public int IdLibro { get; set; }
        public string NombreLibro { get; set; }
        public int CantidadInicial { get; set; }
        public int Precio { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CANTIDADVENDIDOS> CANTIDADVENDIDOS { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<INVENTARIOS> INVENTARIOS { get; set; }
    }
}
