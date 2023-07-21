using Microsoft.AspNetCore.Mvc;
using CarVerzel.Data;
using CarVerzel.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Authorization;

namespace CarVerzel.Controllers;

[Route("api/carros")]
[ApiController]
public class CarrosController : ControllerBase
{
    private readonly CarVerzelContext _context;

    public CarrosController(CarVerzelContext context)
    {
        _context = context;
    }

    [HttpGet]
    public ActionResult<IEnumerable<Carro>> GetCarros()
    {
        return _context.Carros!.ToList();
    }

    [HttpGet("{id}")]
    public ActionResult<Carro> GetCarro(int id)
    {
        var carro = _context.Carros!.Find(id);

        if (carro == null)
        {
            return NotFound();
        }

        return carro;
    }

    [HttpGet("preco")]
    public async Task<ActionResult<IEnumerable<Carro>>> GetCarrosOrdenadosPorPreco()
    {
        var carrosOrdenados = await _context.Carros!.OrderBy(c => c.Preco).ToListAsync();
        return carrosOrdenados;
    }

    [HttpPost]
    [Authorize(Roles = "admin")]
    public ActionResult<Carro> PostCarro(Carro carro)
    {
        _context.Carros!.Add(carro);
        _context.SaveChanges();

        return CreatedAtAction(nameof(GetCarro), new { id = carro.CarId }, carro);
    }

    [HttpPut("{id}")]
    [Authorize(Roles = "admin")]
    public IActionResult PutCarro(int id, Carro carro)
    {
        if (id != carro.CarId)
        {
            return BadRequest();
        }

        _context.Entry(carro).State = EntityState.Modified;
        _context.SaveChanges();

        return NoContent();
    }

    [HttpDelete("{id}")]
    [Authorize(Roles = "admin")]
    public IActionResult DeleteCarro(int id)
    {
        var carro = _context.Carros!.Find(id);

        if (carro == null)
        {
            return NotFound();
        }

        _context.Carros.Remove(carro);
        _context.SaveChanges();

        return NoContent();
    }
}
