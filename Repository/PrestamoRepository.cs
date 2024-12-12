using GranDanesWebSite.Models;
using System.Data.SqlClient;

namespace GranDanesWebSite.Repositories
{
    public class PrestamoRepository
    {

        private readonly string _connectionString;


        public PrestamoRepository(string connectionString) { 
        
            _connectionString = connectionString;

        }
        public void CrearPrestamo(PrestamoInModel prestamo)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                SqlCommand command = new SqlCommand("sp_CrearPrestamoConCuotas", connection);
                command.CommandType = System.Data.CommandType.StoredProcedure;

                // Asignación de parámetros
                command.Parameters.AddWithValue("@ClienteID", prestamo.ClienteID);
                command.Parameters.AddWithValue("@MontoTotal", prestamo.MontoTotal);
                command.Parameters.AddWithValue("@NumeroCuotas", prestamo.NumeroCuotas);
                command.Parameters.AddWithValue("@FrecuenciaPago", prestamo.FrecuenciaPago); // Parámetro faltante agregado
                command.Parameters.AddWithValue("@TasaInteres", prestamo.TasaInteres);

                // Apertura de la conexión y ejecución del comando
                connection.Open();
                command.ExecuteNonQuery();
            }
        }

    }
}
