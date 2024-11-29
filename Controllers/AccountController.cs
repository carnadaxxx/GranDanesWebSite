using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using GranDanesWebSite.Models;
using GranDanesWebSite.Repository;

namespace GranDanesWebSite.Controllers
{
    public class AccountController : Controller
    {
        private readonly ClienteRepository _clienteRepository;

        public AccountController(ClienteRepository clienteRepository)
        {
            _clienteRepository = clienteRepository ?? throw new ArgumentNullException(nameof(clienteRepository));
        }

        [HttpGet]
        public IActionResult Login()
        {
            return View(new LoginViewModel());
        }

        [HttpPost]
        public IActionResult Login(LoginViewModel model)
        {
            if (ModelState.IsValid)
            {
                bool esValido = _clienteRepository.ValidarCliente(model.Email, model.Contraseña);

                if (esValido)
                {
                    var claims = new List<Claim>
                    {
                        new Claim(ClaimTypes.Name, model.Email)
                    };

                    var claimsIdentity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
                    var authProperties = new AuthenticationProperties
                    {
                        IsPersistent = true
                    };

                    HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, new ClaimsPrincipal(claimsIdentity), authProperties).Wait();

                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    ModelState.AddModelError(string.Empty, "Correo electrónico o contraseña incorrectos.");
                }
            }

            return View(model);
        }

        [HttpPost]
        public IActionResult Logout()
        {
            HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme).Wait();
            return RedirectToAction("Login", "Account");
        }
    }
}
