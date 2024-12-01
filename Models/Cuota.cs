using System;

namespace GranDanesWebSite.Models
{
    public class Cuota
    {
        public int CuotaID { get; set; }
        public int PrestamoID { get; set; }
        public int NumeroCuota { get; set; }
        public decimal MontoCuota { get; set; }
        public DateTime FechaVencimiento { get; set; }
        public string Estado { get; set; }
        public DateTime? FechaPago { get; set; }
    }
}
