namespace Satrack.Integracion.SistemaBancario
{
	public interface IDataBaseSettings
	{
		public string SqlServer { get; set; }
	}

	public class DataBaseSettings : IDataBaseSettings
	{
		public string SqlServer { get; set; }
	}
}