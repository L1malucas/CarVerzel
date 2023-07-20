using Microsoft.AspNetCore.Mvc;
using CarVerzel.Services;
using CarVerzel.Admin;
using CarVerzel.Repository;

namespace CarVerzel.Controllers
{
    [Route("api/admin")]
    [ApiController]
    public class AdminController : ControllerBase
    {
        [HttpPost("login")]
        public IActionResult Login(Adm model)
        {
            var admin = AdminRepository.Get(model.Username, model.Password);
            if (admin == null)
                return NotFound(new
                {
                    message = "Usuário ou senha inválidos!"
                });

            // Se tudo estiver correto, gere o token
            var token = TokenService.GenerateToken(admin);
            // Oculte a senha
            admin.Password = "";

            return Ok(new
            {
                admin,
                token
            });
        }
    }
}
