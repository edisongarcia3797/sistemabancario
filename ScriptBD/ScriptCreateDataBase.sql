USE [SISTEMABANCARIO]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 13/09/2023 7:13:22 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[identificacionCliente] [bigint] NOT NULL,
	[nombre] [varchar](200) NOT NULL,
	[id_TipoCliente] [int] NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClienteProducto]    Script Date: 13/09/2023 7:13:22 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClienteProducto](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[identificacionCliente] [bigint] NOT NULL,
	[id_TipoProducto] [int] NOT NULL,
	[saldo] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_ClienteProducto] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RepresentanteLegal]    Script Date: 13/09/2023 7:13:22 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RepresentanteLegal](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[identificacionRepresentante] [bigint] NOT NULL,
	[nombre] [varchar](200) NOT NULL,
	[celular] [varchar](50) NOT NULL,
	[identificacionCliente] [bigint] NOT NULL,
 CONSTRAINT [PK_RepresentanteLegal] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoCliente]    Script Date: 13/09/2023 7:13:22 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoCliente](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_TipoCliente] [int] NOT NULL,
	[Tipo] [varchar](20) NOT NULL,
 CONSTRAINT [PK_TipoCliente] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoMovimiento]    Script Date: 13/09/2023 7:13:22 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoMovimiento](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_TipoMovimiento] [int] NOT NULL,
	[Movimiento] [varchar](20) NOT NULL,
 CONSTRAINT [PK_TipoMovimiento] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoProducto]    Script Date: 13/09/2023 7:13:22 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoProducto](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_TipoProducto] [int] NOT NULL,
	[Producto] [varchar](10) NOT NULL,
 CONSTRAINT [PK_ProductoFinanciero] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaccion]    Script Date: 13/09/2023 7:13:22 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaccion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[identificacionCliente] [bigint] NOT NULL,
	[id_TipoProducto] [int] NOT NULL,
	[fechaTrasaccion] [datetime] NOT NULL,
	[id_TipoMovimiento] [int] NOT NULL,
	[porcentajeInteres] [numeric](18, 0) NOT NULL,
	[valor] [numeric](18, 0) NOT NULL,
	[saldo] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_Transaccion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cliente] ON 

INSERT [dbo].[Cliente] ([id], [identificacionCliente], [nombre], [id_TipoCliente]) VALUES (1, 15373797, N'Edison García', 1)
INSERT [dbo].[Cliente] ([id], [identificacionCliente], [nombre], [id_TipoCliente]) VALUES (2, 85452157, N'Violeta Parra', 1)
INSERT [dbo].[Cliente] ([id], [identificacionCliente], [nombre], [id_TipoCliente]) VALUES (3, 14587245, N'Facundo Cabral', 2)
INSERT [dbo].[Cliente] ([id], [identificacionCliente], [nombre], [id_TipoCliente]) VALUES (4, 78454785, N'Silvio Rodriguez', 1)
INSERT [dbo].[Cliente] ([id], [identificacionCliente], [nombre], [id_TipoCliente]) VALUES (5, 96584575, N'Mercedes Sosa', 1)
INSERT [dbo].[Cliente] ([id], [identificacionCliente], [nombre], [id_TipoCliente]) VALUES (6, 95442127, N'Pablo Milanés', 2)
INSERT [dbo].[Cliente] ([id], [identificacionCliente], [nombre], [id_TipoCliente]) VALUES (8, 95211211, N'Victor Jara', 2)
SET IDENTITY_INSERT [dbo].[Cliente] OFF
GO
SET IDENTITY_INSERT [dbo].[RepresentanteLegal] ON 

INSERT [dbo].[RepresentanteLegal] ([id], [identificacionRepresentante], [nombre], [celular], [identificacionCliente]) VALUES (1, 11111222, N'Carlos Cantor Colombiano', N'3125485212', 14587245)
INSERT [dbo].[RepresentanteLegal] ([id], [identificacionRepresentante], [nombre], [celular], [identificacionCliente]) VALUES (2, 22222331, N'María Cantora Chilena', N'3152414141', 95442127)
INSERT [dbo].[RepresentanteLegal] ([id], [identificacionRepresentante], [nombre], [celular], [identificacionCliente]) VALUES (3, 54545452, N'Darío Poeta Ecuatoriano', N'3165847845', 95211211)
SET IDENTITY_INSERT [dbo].[RepresentanteLegal] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoCliente] ON 

INSERT [dbo].[TipoCliente] ([id], [id_TipoCliente], [Tipo]) VALUES (1, 1, N'Persona   ')
INSERT [dbo].[TipoCliente] ([id], [id_TipoCliente], [Tipo]) VALUES (5, 2, N'Empresarial')
SET IDENTITY_INSERT [dbo].[TipoCliente] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoMovimiento] ON 

INSERT [dbo].[TipoMovimiento] ([id], [id_TipoMovimiento], [Movimiento]) VALUES (1, 1, N'Depósito')
INSERT [dbo].[TipoMovimiento] ([id], [id_TipoMovimiento], [Movimiento]) VALUES (3, 2, N'Retiro')
INSERT [dbo].[TipoMovimiento] ([id], [id_TipoMovimiento], [Movimiento]) VALUES (4, 3, N'Abono interés')
INSERT [dbo].[TipoMovimiento] ([id], [id_TipoMovimiento], [Movimiento]) VALUES (5, 4, N'Cancelación')
SET IDENTITY_INSERT [dbo].[TipoMovimiento] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoProducto] ON 

INSERT [dbo].[TipoProducto] ([id], [id_TipoProducto], [Producto]) VALUES (1, 1, N'Ahorros')
INSERT [dbo].[TipoProducto] ([id], [id_TipoProducto], [Producto]) VALUES (2, 2, N'Corriente')
INSERT [dbo].[TipoProducto] ([id], [id_TipoProducto], [Producto]) VALUES (3, 3, N'CDT')
SET IDENTITY_INSERT [dbo].[TipoProducto] OFF
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_TipoCliente] FOREIGN KEY([id_TipoCliente])
REFERENCES [dbo].[TipoCliente] ([id_TipoCliente])
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [FK_Cliente_TipoCliente]
GO
ALTER TABLE [dbo].[ClienteProducto]  WITH CHECK ADD  CONSTRAINT [FK_ClienteProducto_Cliente] FOREIGN KEY([identificacionCliente])
REFERENCES [dbo].[Cliente] ([identificacionCliente])
GO
ALTER TABLE [dbo].[ClienteProducto] CHECK CONSTRAINT [FK_ClienteProducto_Cliente]
GO
ALTER TABLE [dbo].[ClienteProducto]  WITH CHECK ADD  CONSTRAINT [FK_ClienteProducto_TipoProducto] FOREIGN KEY([id_TipoProducto])
REFERENCES [dbo].[TipoProducto] ([id_TipoProducto])
GO
ALTER TABLE [dbo].[ClienteProducto] CHECK CONSTRAINT [FK_ClienteProducto_TipoProducto]
GO
ALTER TABLE [dbo].[RepresentanteLegal]  WITH CHECK ADD  CONSTRAINT [FK_RepresentanteLegal_Cliente] FOREIGN KEY([identificacionCliente])
REFERENCES [dbo].[Cliente] ([identificacionCliente])
GO
ALTER TABLE [dbo].[RepresentanteLegal] CHECK CONSTRAINT [FK_RepresentanteLegal_Cliente]
GO
ALTER TABLE [dbo].[Transaccion]  WITH CHECK ADD  CONSTRAINT [FK_Transaccion_Cliente] FOREIGN KEY([identificacionCliente])
REFERENCES [dbo].[Cliente] ([identificacionCliente])
GO
ALTER TABLE [dbo].[Transaccion] CHECK CONSTRAINT [FK_Transaccion_Cliente]
GO
ALTER TABLE [dbo].[Transaccion]  WITH CHECK ADD  CONSTRAINT [FK_Transaccion_TipoMovimiento] FOREIGN KEY([id_TipoMovimiento])
REFERENCES [dbo].[TipoMovimiento] ([id_TipoMovimiento])
GO
ALTER TABLE [dbo].[Transaccion] CHECK CONSTRAINT [FK_Transaccion_TipoMovimiento]
GO
ALTER TABLE [dbo].[Transaccion]  WITH CHECK ADD  CONSTRAINT [FK_Transaccion_TipoProducto] FOREIGN KEY([id_TipoProducto])
REFERENCES [dbo].[TipoProducto] ([id_TipoProducto])
GO
ALTER TABLE [dbo].[Transaccion] CHECK CONSTRAINT [FK_Transaccion_TipoProducto]
GO
ALTER TABLE [dbo].[ClienteProducto]  WITH CHECK ADD  CONSTRAINT [CHK_saldo] CHECK  (([id_TipoProducto]=(3) AND [saldo]>(0) OR [id_TipoProducto]=(1) AND [saldo]>=(0) OR [id_TipoProducto]=(2) AND [saldo]>=(0)))
GO
ALTER TABLE [dbo].[ClienteProducto] CHECK CONSTRAINT [CHK_saldo]
GO
