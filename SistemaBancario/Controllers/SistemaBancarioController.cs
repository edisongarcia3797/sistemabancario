using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.OutputCaching;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using System;
using System.Linq;
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
        [HttpGet]
        [OutputCache(Duration = 1000)]
        public async Task<IActionResult> QueryProducts([FromBody] Models.Proxy.RequestData requestData)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    var productos = await this.serviciosSistemaBancario.QueryProducts(new Models.Services.SistemaBancario.RequestData { IdentificacionCliente = (long)requestData.IdentificacionCliente });

                    if (productos.Any())
                        return Ok(GetResponse(true, string.Format("Transacción exitosa para el cliente: {0}", requestData.IdentificacionCliente), productos));
                    else
                        return NotFound(GetResponse(false, string.Format("No hay resultado en la consulta de productos para el cliente: {0}", requestData.IdentificacionCliente), null));
                }
                catch (Exception ex)
                {
                    logger.LogError("[SistemaBancario] {ex.Message}", ex.Message);
                    return StatusCode(StatusCodes.Status500InternalServerError, GetResponse(false, string.Format("Error en la transacción para el cliente {0}", requestData.IdentificacionCliente), null));
                }
            }
            else return BadRequest(ModelState);
        }

        [BasicAuthorize("edisongarcia.com")]
        [HttpPost]
        public async Task<IActionResult> OpenProducts([FromBody] Models.Proxy.RequestOpenProduct requestData)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    Models.Services.SistemaBancario.RequestOpenProduct requestOpenProduct = new()
                    {
                        IdentificacionCliente = (long)requestData.IdentificacionCliente,
                        NumeroProducto = (long)requestData.NumeroProducto,
                        TipoProducto = (int)requestData.TipoProducto,
                        Saldo = requestData.Saldo,
                    };

                    if (await this.serviciosSistemaBancario.OpenProducts(requestOpenProduct))
                        return Ok(GetResponse(true, string.Format("El producto se ha creado exitosamente para el cliente: {0}", requestData.IdentificacionCliente), null));
                    else
                        return StatusCode(StatusCodes.Status400BadRequest, GetResponse(false, string.Format("Error al crear el producto para el cliente {0}", requestData.IdentificacionCliente), null));
                }
                catch (Exception ex)
                {
                    logger.LogError("[SistemaBancario] {ex.Message}", ex.Message);
                    return StatusCode(StatusCodes.Status500InternalServerError, GetResponse(false, string.Format("Error en la transacción para el cliente {0}", requestData.IdentificacionCliente), null));
                }
            }
            else
            {
                return BadRequest(ModelState);
            }
        }

        private Models.Proxy.ResponseData GetResponse(bool response, string messageDetail, object data)
        {
            Models.Proxy.ResponseData responseData = new()
            {
                Message = response ? "success" : "failed",
                MessageDetail = messageDetail,
                Data = data
            };
            return responseData;
        }
    }
}