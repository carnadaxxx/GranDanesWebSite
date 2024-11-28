namespace GranDanesWebApp.Models.Entidades
{
    public class Cliente
    {

        public int ClienteID { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string Email { get; set; }
        public string Telefono { get; set; }
        public string Direccion { get; set; }
        public DateTime? FechaRegistro { get; set; }
        public bool? Visible { get; set; }
        public string Contraseña { get; set; }
        public DateTime? UltimoAcceso { get; set; }

    }

}
