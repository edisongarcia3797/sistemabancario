using Microsoft.EntityFrameworkCore;

namespace Satrack.Integracion.SistemaBancario
{
	public class SistemaBancarioContext : DbContext
	{
		private readonly string ConnectionString;

		public SistemaBancarioContext(string connectionString) { this.ConnectionString = connectionString; }
		public SistemaBancarioContext(DbContextOptions<SistemaBancarioContext> options) : base(options) { }
		//public virtual DbSet<Models.Services.DataBase.Transaccion> Transaccion { get; set; }
        public virtual DbSet<Models.Services.DataBase.ClienteProductos> ClienteProductos { get; set; }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
		{
			if (!optionsBuilder.IsConfigured)
			{
				optionsBuilder.UseSqlServer(ConnectionString);
				base.OnConfiguring(optionsBuilder);
			}
		}
	}
}