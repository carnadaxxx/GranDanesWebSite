using GranDanesWebSite.Repository;
using Microsoft.AspNetCore.Authentication.Cookies;

var builder = WebApplication.CreateBuilder(args);

// Agregar servicios de autenticaci�n y autorizaci�n
builder.Services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme).AddCookie(
    options => {
        options.LoginPath = "/Account/Login";
    });

builder.Services.AddAuthorization();

// Agregar servicios al contenedor
builder.Services.AddControllersWithViews();

// Agregar el repositorio como un servicio
builder.Services.AddScoped<ClienteRepository>(
    provider => new ClienteRepository(builder.Configuration.GetConnectionString("ConnectionString")));

var app = builder.Build();

// Configurar el pipeline de solicitudes HTTP
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthentication();
app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.MapControllerRoute(
    name: "htmx",
    pattern: "{controller=Htmx}/{action=Index}/{id?}");

app.MapControllerRoute(
    name: "account",
    pattern: "{controller=Account}/{action=Login}/{id?}");

app.Run();
