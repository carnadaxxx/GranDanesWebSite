using System;
using System.ComponentModel.DataAnnotations;
using GranDanesWebSite.Repositories;

namespace GranDanesWebSite.Validations
{
    public class MinimoPrestamoAttribute : ValidationAttribute
    {
        // Cadena de conexión copiada directamente del appsettings.json
        private const string connectionString = "Server=172.31.224.1\\mssql-db,5533;Initial Catalog=DeudasDB;User Id=sa;Password=Estr3lla_xxx000;Encrypt=False;TrustServerCertificate=True";

        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            // Crear una instancia del repositorio directamente
            var configuracionRepository = new ConfiguracionRepository(connectionString);

            string montoMinimoPrestamoString = configuracionRepository.ObtenerConfiguracion("MontoMinimoPrestamo");

            if (decimal.TryParse(montoMinimoPrestamoString, out decimal montoMinimoPrestamo))
            {
                if (value is decimal montoTotal && montoTotal < montoMinimoPrestamo)
                {
                    return new ValidationResult($"El monto del préstamo no puede ser menor a {montoMinimoPrestamo}");
                }

                return ValidationResult.Success;
            }
            else
            {
                return new ValidationResult("No se pudo obtener el monto mínimo del préstamo.");
            }
        }
    }
}
