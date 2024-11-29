using GranDanesWebSite.Models;
using GranDanesWebSite.Repository;
using Microsoft.AspNetCore.Mvc;

namespace GranDanesWebSite.Controllers
{
    public class HtmxController : Controller
    {
        private readonly ClienteRepository _clienteRepository;
        public HtmxController(ClienteRepository clienteRepository)
        {
            _clienteRepository = clienteRepository;
        }

        public IActionResult DetallesCliente(int id)
        {
            var cliente = _clienteRepository.ObtenerClientePorID(id);

            if (cliente == null)
            {
                return NotFound();
            }

            return PartialView(cliente);
        }


        [HttpGet]
        public IActionResult ModificarCliente(int id)
        {
            var cliente = _clienteRepository.ObtenerClientePorID(id);

            if (cliente == null)
            {
                return NotFound();
            }

            var model = new ClienteViewModel
            {
                ClienteID = cliente.ClienteID,
                Nombre = cliente.Nombre,
                Apellido = cliente.Apellido,
                Email = cliente.Email,
                Telefono = cliente.Telefono,
                Direccion = cliente.Direccion
            };

            return PartialView(model);
        }



        [HttpPost]
        public IActionResult ModificarCliente(int id, ClienteViewModel model)
        {
            if (ModelState.IsValid)
            {
                var cliente = _clienteRepository.ObtenerClientePorID(id);

                if (cliente == null)
                {
                    return NotFound();
                }

                cliente.ClienteID = id;
                cliente.Nombre = model.Nombre;
                cliente.Apellido = model.Apellido;
                cliente.Email = model.Email;
                cliente.Telefono = model.Telefono;
                cliente.Direccion = model.Direccion;

                if (!string.IsNullOrEmpty(model.NuevaContraseña))
                {
                    cliente.Contraseña = model.NuevaContraseña;
                }

                _clienteRepository.ActualizarCliente(cliente);
                Response.Headers["HX-Trigger"] = "detalleClienteChange";
                return StatusCode(204); // No Content
            }

            return PartialView(model);
        }

        [HttpGet]
        public IActionResult PrestamosPendientesPorCliente(int id)
        {
            var prestamosPendientes = _clienteRepository.ObtenerPrestamosPendientesPorCliente(id);

            //if (prestamosPendientes == null || prestamosPendientes.Count == 0)
            //{ return NotFound("No se encontraron préstamos pendientes para este cliente."); }

            return PartialView(prestamosPendientes);

        }
    }
}