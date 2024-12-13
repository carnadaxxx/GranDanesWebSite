using GranDanesWebSite.Models;
using GranDanesWebSite.Repositories;
using GranDanesWebSite.Repository;
using Microsoft.AspNetCore.Mvc;

namespace GranDanesWebSite.Controllers
{
    public class HtmxController : Controller
    {
        private readonly ClienteRepository _clienteRepository;
        private readonly CuotaRepository _cuotaRepository;
        private readonly PrestamoRepository _prestamoRepository;
        private readonly ConfiguracionRepository _configuracionRepository;

        public HtmxController(
            ClienteRepository clienteRepository, 
            CuotaRepository cuotaRepository, 
            PrestamoRepository prestamoRepository,
            ConfiguracionRepository configuracionRepository
            )
        {
            _clienteRepository = clienteRepository;
            _cuotaRepository = cuotaRepository;
            _prestamoRepository = prestamoRepository;
            _configuracionRepository = configuracionRepository;
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

            return PartialView(prestamosPendientes);

        }


        [HttpGet]
        public IActionResult VerCoutasPorPrestamos(int id) {
        
            var cuotas = _cuotaRepository.ObtenerCuotasPorPrestamo(id);

            return PartialView(cuotas);
        
        }


        [HttpGet]
        public IActionResult SolicitarPrestamo(int id)
        {
            // Obtener la tasa de interés por defecto desde la configuración
            string tasaPorDefectoString = _configuracionRepository.ObtenerConfiguracion("TasaInteresPorDefecto");
            string numeroCoutasPorDefecto = _configuracionRepository.ObtenerConfiguracion("NumeroDeCuotasPorDefecto");

            if (decimal.TryParse(tasaPorDefectoString, out decimal tasaPorDefecto) && int.TryParse(numeroCoutasPorDefecto, out int numeroPagosPorDefecto))
            {
                var model = new PrestamoInModel
                {
                    ClienteID = id,
                    TasaInteres = tasaPorDefecto,
                    NumeroCuotas = numeroPagosPorDefecto
                };
                return PartialView(model);
            }
            else
            {
                // Manejo de error en caso de que no se pueda convertir la tasa de interés a decimal
                ModelState.AddModelError(string.Empty, "No se pudo obtener la tasa de interés por defecto.");
                return PartialView(new PrestamoInModel { ClienteID = id });
            }
        }


        [HttpPost]
        public IActionResult SolicitarPrestamo(int id, PrestamoInModel model)
        {
            {
                if (ModelState.IsValid) { 
                    _prestamoRepository.CrearPrestamo(model);

                    ViewBag.Message = "Préstamo solicitado con éxito.";

                    Response.Headers["HX-Trigger"] = "detalleClienteChange";
                    return StatusCode(204); // No Content

                } else
                {
                    // Obtener la tasa de interés por defecto desde la configuración
                    string tasaPorDefectoString = _configuracionRepository.ObtenerConfiguracion("TasaInteresPorDefecto"); 
                    string numeroCuotasPorDefectoString = _configuracionRepository.ObtenerConfiguracion("NumeroDeCuotasPorDefecto"); 
                    
                    if (decimal.TryParse(tasaPorDefectoString, out decimal tasaPorDefecto) && int.TryParse(numeroCuotasPorDefectoString, out int numeroCuotasPorDefecto)) 
                    {
                        model.ClienteID = id;
                        model.TasaInteres = tasaPorDefecto; 
                        model.NumeroCuotas = numeroCuotasPorDefecto; 
                    } 
                    return PartialView(model);

                }

            }
        }
    }
}