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
        private readonly IOutputCacheStore outputCacheStore;
        private readonly ILogger<SistemaBancarioController> logger;

        public SistemaBancarioController(IServiceSettings serviceSettings, DbContextOptions<SistemaBancarioContext> dbContextOptions, IOutputCacheStore outputCacheStore, ILogger<SistemaBancarioController> logger)
        {
            this.serviciosSistemaBancario = new ServiciosSistemaBancario(serviceSettings, dbContextOptions, logger);
            this.outputCacheStore = outputCacheStore;
            this.logger = logger;
        }

        [BasicAuthorize("edisongarcia.com")]
        [HttpGet]
        [OutputCache(PolicyName = "clienteProducto")]
        public async Task<IActionResult> QueryProducts([FromBody] Models.Proxy.RequestData requestData)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    Models.Services.SistemaBancario.RequestData requestService = new()
                    {
                        IdentificacionCliente = requestData.IdentificacionCliente
                    };

                    var productos = await this.serviciosSistemaBancario.QueryProducts(requestService);

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
                        IdentificacionCliente = requestData.IdentificacionCliente,
                        NumeroProducto = (long)requestData.NumeroProducto,
                        TipoProducto = (int)requestData.TipoProducto,
                        Saldo = requestData.Saldo,
                    };

                    var tuple = await this.serviciosSistemaBancario.OpenProducts(requestOpenProduct);

                    if (tuple.response)
                    {
                        await this.outputCacheStore.EvictByTagAsync("clienteProducto", default);
                        return Ok(GetResponse(true, string.Format("El producto se ha creado exitosamente para el cliente: {0}", requestData.IdentificacionCliente), null));
                    }
                    else return StatusCode(StatusCodes.Status400BadRequest, GetResponse(false, string.Format("Error al crear el producto para el cliente {0}. -> {1}", requestData.IdentificacionCliente, tuple.message), null));
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

        [BasicAuthorize("edisongarcia.com")]
        [HttpPost]
        public async Task<IActionResult> Transaction([FromBody] Models.Proxy.RequestTransaction requestData)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    Models.Services.SistemaBancario.RequestTransaction requestTransaction = new()
                    {
                        NumeroProducto = (long)requestData.NumeroProducto,
                        TipoMovimiento = (int)requestData.TipoMovimiento,
                        Valor = requestData.Valor
                    };

                    var tuple = await this.serviciosSistemaBancario.Transaction(requestTransaction);

                    if (tuple.response)
                        return Ok(GetResponse(true, string.Format("Transacción exitosa para el producto: {0}", requestData.NumeroProducto), null));
                    else
                        return StatusCode(StatusCodes.Status400BadRequest, GetResponse(false, string.Format("Error en la transacción para el producto: {0}. -> {1}", requestData.NumeroProducto, tuple.message), null));
                }
                catch (Exception ex)
                {
                    logger.LogError("[SistemaBancario] {ex.Message}", ex.Message);
                    return StatusCode(StatusCodes.Status500InternalServerError, GetResponse(false, string.Format("Error en la transacción para el producto: {0}", requestData.NumeroProducto), null));
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