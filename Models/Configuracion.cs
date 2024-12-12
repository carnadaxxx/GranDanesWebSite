using System.ComponentModel.DataAnnotations;

namespace GranDanesWebSite.Models
{
    public class Configuracion
    {
        [Key]
        public int ID { get; set; }

        [Required]
        [StringLength(100)]
        public string ConfigKey { get; set; }

        [Required]
        [StringLength(255)]
        public string ConfigValue { get; set; }

        [StringLength(255)]
        public string ConfigDescription { get; set; }
    }
}
