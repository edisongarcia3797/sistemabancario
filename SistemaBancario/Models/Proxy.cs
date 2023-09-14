using Newtonsoft.Json;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Satrack.Integracion.SistemaBancario.Models.Proxy
{
    public class RequestData
    {
        [Required][JsonProperty("identificacionCliente", Order = 1)] public long? IdentificacionCliente { get; set; }
    }

    public class RequestOpenProduct : RequestData
    {
        [Required][JsonProperty("numeroProducto", Order = 2)] public long? NumeroProducto { get; set; }
        [Required][JsonProperty("tipoProducto", Order = 3)][Range(1, 3, ErrorMessage = "Ingreso solo los tipos de productos permitidos: 1= Ahorros,2 = Corriente o 3 = CDT")] public int? TipoProducto { get; set; }
        [JsonProperty("saldo", Order = 4)] public double Saldo { get; set; }
    }

    public class ResponseData
    {
        [JsonProperty("message", Order = 2)] public string Message { get; set; }
        [JsonProperty("messageDetail", Order = 3)] public string MessageDetail { get; set; }
        [JsonProperty("data", Order = 4, NullValueHandling = NullValueHandling.Ignore)] public object Data { get; set; }
    }
}