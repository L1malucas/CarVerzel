using CarVerzel.Models;
using Microsoft.EntityFrameworkCore;

namespace CarVerzel.Data
{
    public class CarVerzelContext : DbContext
    {
        public CarVerzelContext(DbContextOptions<CarVerzelContext> options) : base(options)
        {
            Database.EnsureCreated();
        }

        public DbSet<Carro> Carros { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Carro>(entity =>
            {
                entity.Property(e => e.Preco)
                    .HasColumnType("decimal(10, 2)");
            });
        }
    }
}
