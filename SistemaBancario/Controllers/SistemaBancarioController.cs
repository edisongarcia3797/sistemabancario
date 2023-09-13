using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using System;
using System.Linq;
using System.Threading.Tasks;

namespace Satrack.Integracion.SistemaBancario.Controllers
{
	[Route("[controller]")]
	[ApiController]
	public class SistemaBancarioController : ControllerBase
	{
		private readonly ILogger<SistemaBancarioController> logger;

		public SistemaBancarioController(ILogger<SistemaBancarioController> logger)
		{
			this.logger = logger;
		}

		[BasicAuthorize("edisongarcia.com")]
		[HttpPost]
		public async Task<IActionResult> PostAsync([FromBody] Models.Proxy.RequestData requestData)
		{
			if (ModelState.IsValid)
			{
				Models.Proxy.ResponseData responseData;
				try
				{
					responseData = new Models.Proxy.ResponseData
					{
						Response = true,
						Message = "Success",
						MessageDetail = string.Format("Transacción exitosa para el cliente {0}", requestData.DocumentNumber),
						TraceId = requestData.TraceId
					};
					return Ok(responseData);
				}
				catch (Exception ex)
				{
					Console.Error.WriteLine(ex.Message);
					responseData = new Models.Proxy.ResponseData
					{
						Response = false,
						Message = "failed",
						MessageDetail = string.Format("Error en la transacción para el cliente {0}", requestData.DocumentNumber),
						TraceId = requestData.TraceId
					};
					return StatusCode(StatusCodes.Status500InternalServerError, responseData);
				}
			}
			else
			{
				return BadRequest(ModelState);
			}
		}
	}
}