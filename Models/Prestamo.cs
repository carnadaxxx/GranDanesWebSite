using System;

namespace GranDanesWebSite.Models
{
    public class Prestamo
    {
        public int PrestamoID { get; set; }
        public int ClienteID { get; set; }
        public decimal MontoTotal { get; set; }
        public decimal MontoConIntereses { get; set; }
        public decimal TasaInteres { get; set; }
        public DateTime FechaPrestamo { get; set; }
        public DateTime FechaVencimiento { get; set; }
        public string Estado { get; set; }
        public int NumeroCuotas { get; set; }
        public string FrecuenciaPago { get; set; }
        public string EstadoAprobacion { get; set; }
    }
}
