using GranDanesWebSite.Models;
using System.Data;
using System.Data.SqlClient;

namespace GranDanesWebSite.Repository
{
    public class ClienteRepository
    {
        private readonly string _connectionString;

        public ClienteRepository(string connectionString)
        {
            _connectionString = connectionString;
        }

        public Cliente ObtenerClientePorID(int clienteID)
        {
            Cliente cliente = null;

            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                SqlCommand command = new SqlCommand("SELECT * FROM Clientes WHERE ClienteID = @ClienteID", connection);
                command.Parameters.AddWithValue("@ClienteID", clienteID);
                command.CommandType = CommandType.Text; connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                if (reader.Read())
                {
                    cliente = new Cliente
                    {
                        ClienteID = Convert.ToInt32(reader["ClienteID"]),
                        Nombre = reader["Nombre"].ToString(),
                        Apellido = reader["Apellido"].ToString(),
                        Email = reader["Email"].ToString(),
                        Telefono = reader["Telefono"].ToString(),
                        Direccion = reader["Direccion"].ToString(),
                        FechaRegistro = reader["FechaRegistro"] != DBNull.Value ? Convert.ToDateTime(reader["FechaRegistro"]) : (DateTime?)null,
                        Visible = reader["Visible"] != DBNull.Value ? Convert.ToBoolean(reader["Visible"]) : (bool?)null,
                        Contraseña = reader["Contraseña"].ToString(),
                        UltimoAcceso = reader["UltimoAcceso"] != DBNull.Value ? Convert.ToDateTime(reader["UltimoAcceso"]) : (DateTime?)null
                    };
                }
                reader.Close();
            }
            return cliente;
        }

        public void ActualizarCliente(Cliente cliente)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                SqlCommand command = new SqlCommand("sp_ModificarCliente", connection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.AddWithValue("@ClienteID", cliente.ClienteID);
                command.Parameters.AddWithValue("@Nombre", cliente.Nombre);
                command.Parameters.AddWithValue("@Apellido", cliente.Apellido);
                command.Parameters.AddWithValue("@Email", cliente.Email);
                command.Parameters.AddWithValue("@Telefono", cliente.Telefono);
                command.Parameters.AddWithValue("@Direccion", cliente.Direccion);
                command.Parameters.AddWithValue("@Contraseña", cliente.Contraseña);

                connection.Open();
                command.ExecuteNonQuery();
            }
        }

        public List<Prestamo> ObtenerPrestamosPendientesPorCliente(int clienteID)
        {
            List<Prestamo> prestamos = new List<Prestamo>();

            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                SqlCommand command = new SqlCommand("sp_ObtenerPrestamosPendientesPorCliente", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@ClienteID", clienteID);

                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    Prestamo prestamo = new Prestamo
                    {
                        PrestamoID = Convert.ToInt32(reader["PrestamoID"]),
                        ClienteID = Convert.ToInt32(reader["ClienteID"]),
                        MontoTotal = Convert.ToDecimal(reader["MontoTotal"]),
                        MontoConIntereses = Convert.ToDecimal(reader["MontoConIntereses"]),
                        TasaInteres = Convert.ToDecimal(reader["TasaInteres"]),
                        FechaPrestamo = Convert.ToDateTime(reader["FechaPrestamo"]),
                        FechaVencimiento = Convert.ToDateTime(reader["FechaVencimiento"]),
                        Estado = reader["Estado"].ToString(),
                        NumeroCuotas = Convert.ToInt32(reader["NumeroCuotas"]),
                        FrecuenciaPago = reader["FrecuenciaPago"].ToString(),
                        EstadoAprobacion = reader["EstadoAprobacion"].ToString()
                    };
                    prestamos.Add(prestamo);
                }

                reader.Close();
            }

            return prestamos;
        }

        public (bool EsValido, int? ClienteID) ValidarCliente(string email, string contraseña)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                SqlCommand command = new SqlCommand("sp_ValidarClienteWeb", connection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.AddWithValue("@Email", email);
                command.Parameters.AddWithValue("@Contraseña", contraseña);

                connection.Open();
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        bool esValido = (bool)reader["EsValido"];
                        int? clienteID = reader["ClienteID"] as int?;
                        return (esValido, clienteID);
                    }
                    else
                    {
                        return (false, null);
                    }
                }
            }
        }
    }
}
