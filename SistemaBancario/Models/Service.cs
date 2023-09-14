using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Satrack.Integracion.SistemaBancario.Models.Services.SistemaBancario
{
    public class RequestData
    {
        [JsonProperty("identificacionCliente")] public long IdentificacionCliente { get; set; }
        [JsonProperty("numeroProducto")] public long NumeroProducto { get; set; }
        [JsonProperty("saldo")] public double Saldo { get; set; }
    }

    public class ResponseQueryProducts : RequestData
    {
        [JsonProperty("nombre")] public string NombreCliente { get; set; }
        [JsonProperty("tipoCliente")] public string TipoCliente { get; set; }
        [JsonProperty("producto")] public string NombreProducto { get; set; }
    }

    public class RequestOpenProduct : RequestData
    {
        [JsonProperty("tipoProducto")] public int TipoProducto { get; set; }
    }
    public class RequestTransaction : RequestData
    {
        [JsonProperty("tipoMovimiento")] public int TipoMovimiento { get; set; }
        [JsonProperty("valor")] public double Valor { get; set; }
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
        [Column("nombre", TypeName = "string")] public string NombreCliente { get; set; }
        [Column("tipoCliente", TypeName = "string")] public string TipoCliente { get; set; }
        [Column("numeroProducto", TypeName = "bigint")] public long NumeroProducto { get; set; }
        [Column("producto", TypeName = "string")] public string NombreProducto { get; set; }
        [Column("saldo", TypeName = "numeric")] public double Saldo { get; set; }
    }

    public class ClienteProducto
    {
        [Key][Column("id", TypeName = "int")] public int Id { get; set; }
        [Column("numeroProducto", TypeName = "bigint")] public long NumeroProducto { get; set; }
        [Column("identificacionCliente", TypeName = "bigint")] public long IdentificacionCliente { get; set; }
        [Column("id_TipoProducto", TypeName = "int")] public int IdTipoProducto { get; set; }
        [Column("saldo", TypeName = "numeric")] public double Saldo { get; set; }
    }

    public class Transaccion
    {
        [Key][Column("id", TypeName = "int")] public int Id { get; set; }
        [Column("numeroProducto", TypeName = "bigint")] public long NumeroProducto { get; set; }
        [Column("fechaTrasaccion", TypeName = "DateTime")] public DateTime FechaTrasaccion { get; set; }
        [Column("id_TipoMovimiento", TypeName = "int")] public int IdTipoMovimiento { get; set; }
        [Column("porcentajeInteres", TypeName = "numeric")] public double PorcentajeInteres { get; set; }
        [Column("valor", TypeName = "numeric")] public double Valor { get; set; }
        [Column("saldo", TypeName = "numeric")] public double Saldo { get; set; }
    }
}