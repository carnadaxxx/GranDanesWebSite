using System.ComponentModel.DataAnnotations;
using GranDanesWebSite.Validations;

namespace GranDanesWebSite.Models
{
    public class PrestamoInModel
    {
        [Required]
        public int ClienteID { get; set; }

        [Required]
        [MinimoPrestamo]
        [Range(0, double.MaxValue, ErrorMessage = "El monto debe ser positivo.")]
        public decimal MontoTotal { get; set; }

        [Required]
        [Range(1, int.MaxValue, ErrorMessage = "El número de cuotas debe ser al menos 1.")]
        public int NumeroCuotas { get; set; }

        [Required]
        [StringLength(50)]
        public string FrecuenciaPago { get; set; }

        [Required]
        [Range(0, 100, ErrorMessage = "La tasa de interés debe estar entre 0 y 100.")]
        public decimal TasaInteres { get; set; }
    }
}
