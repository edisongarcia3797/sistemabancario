using Microsoft.AspNetCore.Mvc;
using System;

namespace Satrack.Integracion.SistemaBancario
{
	[AttributeUsage(AttributeTargets.Class | AttributeTargets.Method)]
	public class BasicAuthorizeAttribute : TypeFilterAttribute
	{
		public BasicAuthorizeAttribute(string realm = null) : base(typeof(BasicAuthorizeFilter))
		{
			Arguments = new object[] { realm };
		}
	}
}
