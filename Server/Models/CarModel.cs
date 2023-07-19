using System.ComponentModel.DataAnnotations;

namespace CarVerzel.Models;

public class Carro
{
    [Key]
    public int CarId { get; set; }

    [Required]
    public string Modelo { get; set; } = string.Empty;

    [Required]
    public string Marca { get; set; } = string.Empty;

    [Required]
    public decimal Preco { get; set; }

    public string Foto { get; set; } = string.Empty;
}
