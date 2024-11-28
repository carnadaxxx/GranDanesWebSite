using GranDanesWebApp.Models.Entidades;
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
            
            if (cliente == null) { 
                return NotFound();
            }

            return View(cliente);
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

            return View(model);
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

            return View(model);
        }

    }
}