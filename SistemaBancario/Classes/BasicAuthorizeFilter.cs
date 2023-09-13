using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.Extensions.Options;
using Newtonsoft.Json.Linq;
using System;
using System.Text;

namespace Satrack.Integracion.SistemaBancario
{
	public class BasicAuthorizeFilter : IAuthorizationFilter
	{
		private readonly string realm;
		private readonly IProxySettings proxySettings;

		public BasicAuthorizeFilter(IOptions<ProxySettings> proxySettings, string realm = null)
		{
			this.realm = realm;
			this.proxySettings = proxySettings.Value;
		}

		public void OnAuthorization(AuthorizationFilterContext context)
		{
			string authHeader = context.HttpContext.Request.Headers["Authorization"];

			if (authHeader != null && authHeader.StartsWith(proxySettings.AuthType + " "))
			{
				switch (proxySettings.AuthType)
				{
					case "None":
						return;
					case "Basic":
						var encodedUsernamePassword = authHeader.Split(' ', 2, StringSplitOptions.RemoveEmptyEntries)[1]?.Trim();
						var decodedUsernamePassword = Encoding.UTF8.GetString(Convert.FromBase64String(encodedUsernamePassword));
						var username = decodedUsernamePassword.Split(':', 2)[0];
						var password = decodedUsernamePassword.Split(':', 2)[1];
						if (IsAuthorized(username, password)) return;
						break;
					case "Bearer":
						var bearerToken = authHeader.Split(' ', 2, StringSplitOptions.RemoveEmptyEntries)[1]?.Trim();
						if (proxySettings.Token != null && IsAuthorized(bearerToken)) return;
						else if (IsAuthorized(bearerToken, true)) return;
						break;
					default:
						break;
				}
			}

			context.HttpContext.Response.Headers["WWW-Authenticate"] = proxySettings.AuthType;
			if (!string.IsNullOrWhiteSpace(realm))
				context.HttpContext.Response.Headers["WWW-Authenticate"] += $" realm=\"{realm}\"";
			context.Result = new UnauthorizedResult();
		}

		private bool IsAuthorized(string username, string password)
		{
			try
			{
				string userName = proxySettings.AuthUser;
				string passWord = proxySettings.AuthPass;
				return username.Equals(userName, StringComparison.InvariantCultureIgnoreCase) && password.Equals(passWord);
			}
			catch { return false; }
		}

		private bool IsAuthorized(string bearer)
		{
			try
			{
				string bearerToken = proxySettings.Token;
				return bearer.Equals(bearerToken);
			}
			catch { return false; }
		}

		private bool IsAuthorized(string jwt, bool useScope)
		{
			bool isValid = !useScope;

			try
			{
				string authScope = proxySettings.Scope;
				string[] jwtParts = jwt.Split('.');
				string payload = Tools.DecodeBase64(jwtParts[1]);
				JObject jsonPayload = JObject.Parse(payload);

				foreach (var scope in jsonPayload["scope"])
				{
					if (authScope.Equals(scope.ToString())) { isValid = true; break; }
				}
				return isValid;
			}
			catch { return false; }
		}
	}
}
