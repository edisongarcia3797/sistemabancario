using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Satrack.Integracion.SistemaBancario.Models.Services.SistemaBancario
{
    public class RequestData
    {
        [JsonProperty("identificacionCliente")] public ulong? IdentificacionCliente { get; set; }
    }

    public class ResponseData
    {
        [JsonProperty("mainBalance", Order = 1, DefaultValueHandling = DefaultValueHandling.Ignore)] public ulong? MainBalance { get; set; }
        [JsonProperty("approbationNumber", Order = 2, DefaultValueHandling = DefaultValueHandling.Ignore)] public string ApprobationNumber { get; set; }
        [JsonProperty("errorCode", Order = 3, NullValueHandling = NullValueHandling.Ignore)] public string ErrorCode { get; set; }
        [JsonProperty("errorMsg", Order = 4, NullValueHandling = NullValueHandling.Ignore)] public string ErrorMsg { get; set; }
        [JsonProperty("traceId", Order = 5, NullValueHandling = NullValueHandling.Ignore)] public string TraceId { get; set; }
    }
}

namespace Satrack.Integracion.SistemaBancario.Models.Services.DataBase
{
    [Keyless]
    public class Parametros
    {
        [Column("identificacionCliente", TypeName = "bigint")] public long IdentificacionCliente { get; set; }
    }

    [Keyless]
    public class ClienteProducto
    {
        [Column("nombre", TypeName = "string")] public string NombreCliente { get; set; }
        [Column("numeroProducto", TypeName = "bigint")] public long NumeroProducto { get; set; }
        [Column("producto", TypeName = "string")] public string NombreProducto { get; set; }
        [Column("saldo", TypeName = "numeric")] public double Saldo { get; set; }
    }

    //[Keyless]
    //public class Transaccion 
    //{
    //    [Column("id_TipoProducto", TypeName = "int")] public int IdTipoProducto { get; set; }
    //    [Column("fechaTrasaccion", TypeName = "DateTime")] public DateTime FechaTrasaccion { get; set; }
    //    [Column("id_TipoMovimiento", TypeName = "int")] public int IdTipoMovimiento { get; set; }
    //    [Column("porcentajeInteres", TypeName = "numeric")] public int PorcentajeInteres { get; set; }
    //    [Column("valor", TypeName = "numeric")] public int Valor { get; set; }
    //}
}