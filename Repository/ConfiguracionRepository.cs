using GranDanesWebSite.Models;
using System.Data.SqlClient;

namespace GranDanesWebSite.Repositories
{
    public class ConfiguracionRepository
    {
        private readonly string _connectionString;

        public ConfiguracionRepository(string connectionString)
        {
            _connectionString = connectionString;
        }

        public string ObtenerConfiguracion(string configKey)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                SqlCommand command = new SqlCommand("sp_ObtenerConfiguracion", connection);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@ConfigKey", configKey);

                connection.Open();
                object result = command.ExecuteScalar();
                return result?.ToString();
            }
        }
    }
}
