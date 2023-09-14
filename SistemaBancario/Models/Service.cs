using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Satrack.Integracion.SistemaBancario.Models.Services.SistemaBancario
{
    public class RequestData
    {
        [JsonProperty("identificacionCliente")] public long? IdentificacionCliente { get; set; }
    }

    public class RespuestaClienteProductos
    {
        [JsonProperty("nombre", Order = 1)] public string NombreCliente { get; set; }
        [JsonProperty("numeroProducto", Order = 2)] public long NumeroProducto { get; set; }
        [JsonProperty("producto", Order = 3)] public string NombreProducto { get; set; }
        [JsonProperty("saldo", Order = 3)] public double Saldo { get; set; }
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
    public class ClienteProductos
    {
        [Column("nombres", TypeName = "string")] public string NombreCliente { get; set; }
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