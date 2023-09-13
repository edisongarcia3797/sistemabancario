namespace Satrack.Integracion.SistemaBancario
{
	public interface IProxySettings
	{
		public string AuthType { get; set; }
		public string AuthUser { get; set; }
		public string AuthPass { get; set; }
		public string Scope { get; set; }
		public string Token { get; set; }
	}

	public class ProxySettings : IProxySettings
	{
		public string AuthType { get; set; }
		public string AuthUser { get; set; }
		public string AuthPass { get; set; }
		public string Scope { get; set; }
		public string Token { get; set; }
	}
}
