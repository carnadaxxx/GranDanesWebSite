using System.Collections.Generic;
using System.Data.SqlClient;
using System.Configuration;
using GranDanesWebSite.Models;
using System.Data;

namespace GranDanesWebSite.Repositories
{
    public class CuotaRepository
    {
        private readonly string _connectionString;

        public CuotaRepository(string connectionString)
        {
            _connectionString = connectionString;
        }

        public List<Cuota> ObtenerCuotasPorPrestamo(int prestamoID)
        {
            List<Cuota> cuotas = new List<Cuota>();

            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                SqlCommand command = new SqlCommand("sp_ObtenerCuotasPorPrestamo", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@PrestamoID", prestamoID);

                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    Cuota cuota = new Cuota
                    {
                        CuotaID = Convert.ToInt32(reader["CuotaID"]),
                        PrestamoID = Convert.ToInt32(reader["PrestamoID"]),
                        NumeroCuota = Convert.ToInt32(reader["NumeroCuota"]),
                        MontoCuota = Convert.ToDecimal(reader["MontoCuota"]),
                        FechaVencimiento = Convert.ToDateTime(reader["FechaVencimiento"]),
                        Estado = reader["Estado"] as string,
                    };
                    cuotas.Add(cuota);
                }

                reader.Close();
            }

            return cuotas;
        }
    }
}
