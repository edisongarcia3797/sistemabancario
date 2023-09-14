namespace Satrack.Integracion.SistemaBancario
{
	public interface IServiceSettings
	{
		public Interes Interes { get; set; }
    }
	public class ServiceSettings : IServiceSettings
	{
        public Interes Interes { get; set; }
    }

	public class Interes
	{
        public double porcentajeAhorro { get; set; }
        public double porcentajeCDT { get; set; }
    }
}
