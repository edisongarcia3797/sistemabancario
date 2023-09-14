using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.OutputCaching;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using System;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;

namespace Satrack.Integracion.SistemaBancario.Controllers
{
	[Route("[controller]/[Action]")]
    [ApiController]
	public class SistemaBancarioController : ControllerBase
	{
        private readonly IServiciosSistemaBancario serviciosSistemaBancario;
        private readonly ILogger<SistemaBancarioController> logger;

        public SistemaBancarioController(IServiceSettings serviceSettings, DbContextOptions<SistemaBancarioContext> dbContextOptions, ILogger<SistemaBancarioController> logger)
		{
            this.serviciosSistemaBancario = new ServiciosSistemaBancario(serviceSettings, dbContextOptions, logger);
            this.logger = logger;
		}

        [BasicAuthorize("edisongarcia.com")]
        [HttpPost]
		public async Task<IActionResult> AbrirProducto([FromBody] Models.Proxy.RequestData requestData)
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
						MessageDetail = string.Format("Transacción exitosa para el cliente {0}", requestData.IdentificacionCliente)
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
						MessageDetail = string.Format("Error en la transacción para el cliente {0}", requestData.IdentificacionCliente)
					};
					return StatusCode(StatusCodes.Status500InternalServerError, responseData);
				}
			}
			else
			{
				return BadRequest(ModelState);
			}
		}

        [BasicAuthorize("edisongarcia.com")]
        [HttpPost]
        public async Task<IActionResult> DepositoRetiroo([FromBody] Models.Proxy.RequestData requestData)
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
                        MessageDetail = string.Format("Transacción exitosa para el cliente {0}", requestData.IdentificacionCliente)
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
                        MessageDetail = string.Format("Error en la transacción para el cliente {0}", requestData.IdentificacionCliente)
                    };
                    return StatusCode(StatusCodes.Status500InternalServerError, responseData);
                }
            }
            else
            {
                return BadRequest(ModelState);
            }
        }

        [BasicAuthorize("edisongarcia.com")]
        [HttpPost]
        public async Task<IActionResult> Cancelacion([FromBody] Models.Proxy.RequestData requestData)
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
                        MessageDetail = string.Format("Transacción exitosa para el cliente {0}", requestData.IdentificacionCliente)
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
                        MessageDetail = string.Format("Error en la transacción para el cliente {0}", requestData.IdentificacionCliente)
                    };
                    return StatusCode(StatusCodes.Status500InternalServerError, responseData);
                }
            }
            else
            {
                return BadRequest(ModelState);
            }
        }

        [BasicAuthorize("edisongarcia.com")]
        [HttpPost]
        public async Task<IActionResult> CalcularInteres([FromBody] Models.Proxy.RequestData requestData)
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
                        MessageDetail = string.Format("Transacción exitosa para el cliente {0}", requestData.IdentificacionCliente)
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
                        MessageDetail = string.Format("Error en la transacción para el cliente {0}", requestData.IdentificacionCliente)
                    };
                    return StatusCode(StatusCodes.Status500InternalServerError, responseData);
                }
            }
            else
            {
                return BadRequest(ModelState);
            }
        }

        [BasicAuthorize("edisongarcia.com")]
        [HttpGet]
        [OutputCache(Duration = 1000)]
        public async Task<IActionResult> ConsultarProductos([FromBody] Models.Proxy.RequestData requestData)
        {
            if (ModelState.IsValid)
            {
                Models.Proxy.ResponseData responseData;

                try
                {
                    var result = await this.serviciosSistemaBancario.ConsultarProductos(new Models.Services.SistemaBancario.RequestData { IdentificacionCliente = requestData.IdentificacionCliente });
                    responseData = new Models.Proxy.ResponseData
                    {
                        Response = true,
                        Message = "Success",
                        MessageDetail = string.Format("Transacción exitosa para el cliente {0}", requestData.IdentificacionCliente)
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
                        MessageDetail = string.Format("Error en la transacción para el cliente {0}", requestData.IdentificacionCliente)
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