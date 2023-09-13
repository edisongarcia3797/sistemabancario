using System;

namespace Satrack.Integracion.SistemaBancario
{
	public static class Tools
	{
		public static string DecodeBase64(string encodedString)
		{
			byte[] decodedBytes;
			string working = encodedString.Replace('-', '+').Replace('_', '/');

			while (working.Length % 3 != 0) { working += '='; }

			try
			{
				decodedBytes = Convert.FromBase64String(working);
				return System.Text.Encoding.UTF8.GetString(decodedBytes);
			}
			catch
			{
				try
				{
					decodedBytes = Convert.FromBase64String(encodedString.Replace('-', '+').Replace('_', '/'));
					return System.Text.Encoding.UTF8.GetString(decodedBytes);
				}
				catch
				{
					try
					{
						decodedBytes = Convert.FromBase64String(encodedString.Replace('-', '+').Replace('_', '/') + "=");
						return System.Text.Encoding.UTF8.GetString(decodedBytes);
					}
					catch
					{
						try
						{
							decodedBytes = Convert.FromBase64String(encodedString.Replace('-', '+').Replace('_', '/') + "==");
							return System.Text.Encoding.UTF8.GetString(decodedBytes);
						}
						catch (Exception ex)
						{
							return "Decode Failed: " + ex.Message;
						}
					}
				}
			}
		}
	}
}
