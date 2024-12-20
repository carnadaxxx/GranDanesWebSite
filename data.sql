USE [master]
GO
/****** Object:  Database [DeudasDB]    Script Date: 12/12/2024 23:42:12 ******/
CREATE DATABASE [DeudasDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DeudasDB', FILENAME = N'/var/opt/mssql/data/DeudasDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DeudasDB_log', FILENAME = N'/var/opt/mssql/data/DeudasDB_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DeudasDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DeudasDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DeudasDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DeudasDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DeudasDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DeudasDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DeudasDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [DeudasDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DeudasDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DeudasDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DeudasDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DeudasDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DeudasDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DeudasDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DeudasDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DeudasDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DeudasDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DeudasDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DeudasDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DeudasDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DeudasDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DeudasDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DeudasDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DeudasDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DeudasDB] SET RECOVERY FULL 
GO
ALTER DATABASE [DeudasDB] SET  MULTI_USER 
GO
ALTER DATABASE [DeudasDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DeudasDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DeudasDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DeudasDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DeudasDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DeudasDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DeudasDB', N'ON'
GO
ALTER DATABASE [DeudasDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [DeudasDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DeudasDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 12/12/2024 23:42:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClienteRoles]    Script Date: 12/12/2024 23:42:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClienteRoles](
	[ClienteID] [int] NOT NULL,
	[RolID] [int] NOT NULL,
	[FechaAsignacion] [datetime] NULL,
 CONSTRAINT [PK_ClienteRoles] PRIMARY KEY CLUSTERED 
(
	[ClienteID] ASC,
	[RolID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 12/12/2024 23:42:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[ClienteID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Apellido] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](150) NOT NULL,
	[Telefono] [nvarchar](20) NULL,
	[Direccion] [nvarchar](255) NULL,
	[FechaRegistro] [date] NULL,
	[Visible] [bit] NULL,
	[Contraseña] [nvarchar](255) NOT NULL,
	[UltimoAcceso] [datetime] NULL,
	[RutaImagen] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ClienteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Configuracion]    Script Date: 12/12/2024 23:42:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Configuracion](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ConfigKey] [nvarchar](100) NOT NULL,
	[ConfigValue] [nvarchar](255) NOT NULL,
	[ConfigDescription] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cuotas]    Script Date: 12/12/2024 23:42:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cuotas](
	[CuotaID] [int] IDENTITY(1,1) NOT NULL,
	[PrestamoID] [int] NOT NULL,
	[NumeroCuota] [int] NOT NULL,
	[MontoCuota] [decimal](18, 2) NOT NULL,
	[FechaVencimiento] [date] NOT NULL,
	[Estado] [nvarchar](50) NULL,
	[FechaPago] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[CuotaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prestamos]    Script Date: 12/12/2024 23:42:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prestamos](
	[PrestamoID] [int] IDENTITY(1,1) NOT NULL,
	[ClienteID] [int] NOT NULL,
	[MontoTotal] [decimal](18, 2) NOT NULL,
	[MontoConIntereses] [decimal](18, 2) NOT NULL,
	[TasaInteres] [decimal](5, 2) NOT NULL,
	[FechaPrestamo] [date] NOT NULL,
	[FechaVencimiento] [date] NOT NULL,
	[Estado] [nvarchar](50) NOT NULL,
	[NumeroCuotas] [int] NOT NULL,
	[FrecuenciaPago] [nvarchar](50) NOT NULL,
	[EstadoAprobacion] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[PrestamoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 12/12/2024 23:42:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RolID] [int] IDENTITY(1,1) NOT NULL,
	[NombreRol] [nvarchar](50) NOT NULL,
	[Descripcion] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[RolID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ClienteRoles] ([ClienteID], [RolID], [FechaAsignacion]) VALUES (1, 1, CAST(N'2024-10-30T20:17:01.580' AS DateTime))
INSERT [dbo].[ClienteRoles] ([ClienteID], [RolID], [FechaAsignacion]) VALUES (2, 2, CAST(N'2024-10-30T20:17:01.580' AS DateTime))
INSERT [dbo].[ClienteRoles] ([ClienteID], [RolID], [FechaAsignacion]) VALUES (3, 2, CAST(N'2024-10-30T20:17:01.580' AS DateTime))
INSERT [dbo].[ClienteRoles] ([ClienteID], [RolID], [FechaAsignacion]) VALUES (3, 3, CAST(N'2024-10-30T20:17:01.580' AS DateTime))
INSERT [dbo].[ClienteRoles] ([ClienteID], [RolID], [FechaAsignacion]) VALUES (4, 1, CAST(N'2024-10-31T19:39:41.583' AS DateTime))
INSERT [dbo].[ClienteRoles] ([ClienteID], [RolID], [FechaAsignacion]) VALUES (4, 2, CAST(N'2024-10-31T19:39:41.583' AS DateTime))
INSERT [dbo].[ClienteRoles] ([ClienteID], [RolID], [FechaAsignacion]) VALUES (5, 2, CAST(N'2024-10-31T20:49:08.247' AS DateTime))
INSERT [dbo].[ClienteRoles] ([ClienteID], [RolID], [FechaAsignacion]) VALUES (6, 2, CAST(N'2024-10-31T20:52:56.510' AS DateTime))
INSERT [dbo].[ClienteRoles] ([ClienteID], [RolID], [FechaAsignacion]) VALUES (1004, 2, CAST(N'2024-11-01T20:50:36.843' AS DateTime))
INSERT [dbo].[ClienteRoles] ([ClienteID], [RolID], [FechaAsignacion]) VALUES (2004, 2, CAST(N'2024-11-03T23:38:45.033' AS DateTime))
INSERT [dbo].[ClienteRoles] ([ClienteID], [RolID], [FechaAsignacion]) VALUES (2005, 2, CAST(N'2024-11-03T23:42:52.237' AS DateTime))
INSERT [dbo].[ClienteRoles] ([ClienteID], [RolID], [FechaAsignacion]) VALUES (2006, 2, CAST(N'2024-11-04T00:00:43.947' AS DateTime))
INSERT [dbo].[ClienteRoles] ([ClienteID], [RolID], [FechaAsignacion]) VALUES (2007, 2, CAST(N'2024-11-04T00:02:41.840' AS DateTime))
INSERT [dbo].[ClienteRoles] ([ClienteID], [RolID], [FechaAsignacion]) VALUES (2008, 2, CAST(N'2024-11-04T00:11:31.343' AS DateTime))
INSERT [dbo].[ClienteRoles] ([ClienteID], [RolID], [FechaAsignacion]) VALUES (2009, 2, CAST(N'2024-11-04T00:17:32.090' AS DateTime))
INSERT [dbo].[ClienteRoles] ([ClienteID], [RolID], [FechaAsignacion]) VALUES (2010, 2, CAST(N'2024-11-07T00:34:33.897' AS DateTime))
INSERT [dbo].[ClienteRoles] ([ClienteID], [RolID], [FechaAsignacion]) VALUES (3010, 2, CAST(N'2024-11-07T21:42:36.973' AS DateTime))
INSERT [dbo].[ClienteRoles] ([ClienteID], [RolID], [FechaAsignacion]) VALUES (4010, 2, CAST(N'2024-12-05T23:08:57.460' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Clientes] ON 

INSERT [dbo].[Clientes] ([ClienteID], [Nombre], [Apellido], [Email], [Telefono], [Direccion], [FechaRegistro], [Visible], [Contraseña], [UltimoAcceso], [RutaImagen]) VALUES (1, N'Juan', N'Perez', N'juan.perez@email.com', N'555-1234', N'Calle Falsa 123', CAST(N'2024-10-30' AS Date), 1, N'password', CAST(N'2024-12-09T02:30:14.160' AS DateTime), NULL)
INSERT [dbo].[Clientes] ([ClienteID], [Nombre], [Apellido], [Email], [Telefono], [Direccion], [FechaRegistro], [Visible], [Contraseña], [UltimoAcceso], [RutaImagen]) VALUES (2, N'Ana', N'Garcia', N'ana.garcia@email.com', N'555-5678', N'Avenida Siempre Viva 742', CAST(N'2024-10-30' AS Date), 1, N'password', CAST(N'2024-12-13T04:29:52.110' AS DateTime), NULL)
INSERT [dbo].[Clientes] ([ClienteID], [Nombre], [Apellido], [Email], [Telefono], [Direccion], [FechaRegistro], [Visible], [Contraseña], [UltimoAcceso], [RutaImagen]) VALUES (3, N'Luis', N'Martinez', N'luis.martinez@email.com', N'555-9101', N'Boulevard Central 456', CAST(N'2024-10-30' AS Date), 1, N'password', CAST(N'2024-11-22T17:36:33.487' AS DateTime), NULL)
INSERT [dbo].[Clientes] ([ClienteID], [Nombre], [Apellido], [Email], [Telefono], [Direccion], [FechaRegistro], [Visible], [Contraseña], [UltimoAcceso], [RutaImagen]) VALUES (4, N'Wilson ', N'Coronado', N'wilson.coronado@email.com', N'952177674', N'Leticia 466', CAST(N'2024-10-31' AS Date), 1, N'password', CAST(N'2024-11-07T15:35:38.290' AS DateTime), NULL)
INSERT [dbo].[Clientes] ([ClienteID], [Nombre], [Apellido], [Email], [Telefono], [Direccion], [FechaRegistro], [Visible], [Contraseña], [UltimoAcceso], [RutaImagen]) VALUES (5, N'Fernando', N'Alvarez', N'fernando.alvarez@email.com', N'963258741', N'Santa ines 536', CAST(N'2024-10-31' AS Date), 1, N'password', NULL, NULL)
INSERT [dbo].[Clientes] ([ClienteID], [Nombre], [Apellido], [Email], [Telefono], [Direccion], [FechaRegistro], [Visible], [Contraseña], [UltimoAcceso], [RutaImagen]) VALUES (6, N'Carlos', N'Sanchez', N'carlos.sanchez@email.com', N'952654789', N'Sin Dirección Conocida', CAST(N'2024-10-31' AS Date), 1, N'password', NULL, NULL)
INSERT [dbo].[Clientes] ([ClienteID], [Nombre], [Apellido], [Email], [Telefono], [Direccion], [FechaRegistro], [Visible], [Contraseña], [UltimoAcceso], [RutaImagen]) VALUES (1004, N'Domingo', N'Peron', N'domingo.peron@email.com', N'987456321', N'No definido', CAST(N'2024-11-01' AS Date), 1, N'password', NULL, NULL)
INSERT [dbo].[Clientes] ([ClienteID], [Nombre], [Apellido], [Email], [Telefono], [Direccion], [FechaRegistro], [Visible], [Contraseña], [UltimoAcceso], [RutaImagen]) VALUES (2004, N'Luis', N'Perez', N'luis.perez@email.com', N'98741159', N'No definido', CAST(N'2024-11-03' AS Date), 1, N'password', NULL, NULL)
INSERT [dbo].[Clientes] ([ClienteID], [Nombre], [Apellido], [Email], [Telefono], [Direccion], [FechaRegistro], [Visible], [Contraseña], [UltimoAcceso], [RutaImagen]) VALUES (2005, N'Walter', N'Ramirez', N'walter.ramirez@email.com', N'753159654', N'No definida', CAST(N'2024-11-03' AS Date), 1, N'password', NULL, NULL)
INSERT [dbo].[Clientes] ([ClienteID], [Nombre], [Apellido], [Email], [Telefono], [Direccion], [FechaRegistro], [Visible], [Contraseña], [UltimoAcceso], [RutaImagen]) VALUES (2006, N'Jorge', N'Pizarro', N'jorge.pizzaro@email.com', N'963214785', N'No definida', CAST(N'2024-11-04' AS Date), 1, N'password', NULL, NULL)
INSERT [dbo].[Clientes] ([ClienteID], [Nombre], [Apellido], [Email], [Telefono], [Direccion], [FechaRegistro], [Visible], [Contraseña], [UltimoAcceso], [RutaImagen]) VALUES (2007, N'Fernando', N'Aguinaga', N'fernando.aguinaga@email.com', N'785478547', N'No definida', CAST(N'2024-11-04' AS Date), 1, N'password', NULL, NULL)
INSERT [dbo].[Clientes] ([ClienteID], [Nombre], [Apellido], [Email], [Telefono], [Direccion], [FechaRegistro], [Visible], [Contraseña], [UltimoAcceso], [RutaImagen]) VALUES (2008, N'Alberto', N'Sanchez', N'alverto.sanchez@email.com', N'741254587', N'No definida', CAST(N'2024-11-04' AS Date), 1, N'password', NULL, NULL)
INSERT [dbo].[Clientes] ([ClienteID], [Nombre], [Apellido], [Email], [Telefono], [Direccion], [FechaRegistro], [Visible], [Contraseña], [UltimoAcceso], [RutaImagen]) VALUES (2009, N'Maira', N'Perez', N'maria.perez@gmail.com', N'201050', N'No definida', CAST(N'2024-11-04' AS Date), 1, N'password', NULL, NULL)
INSERT [dbo].[Clientes] ([ClienteID], [Nombre], [Apellido], [Email], [Telefono], [Direccion], [FechaRegistro], [Visible], [Contraseña], [UltimoAcceso], [RutaImagen]) VALUES (2010, N'Paula', N'Carrasco', N'paula.carrasco@email.com', N'874-698-654', N'No definida', CAST(N'2024-11-07' AS Date), 1, N'password', NULL, NULL)
INSERT [dbo].[Clientes] ([ClienteID], [Nombre], [Apellido], [Email], [Telefono], [Direccion], [FechaRegistro], [Visible], [Contraseña], [UltimoAcceso], [RutaImagen]) VALUES (3010, N'Maria', N'Salazar', N'maria.salazar@email.com', N'956478524', N'No registra', CAST(N'2024-11-07' AS Date), 1, N'password', NULL, NULL)
INSERT [dbo].[Clientes] ([ClienteID], [Nombre], [Apellido], [Email], [Telefono], [Direccion], [FechaRegistro], [Visible], [Contraseña], [UltimoAcceso], [RutaImagen]) VALUES (4010, N'Maria', N'Perez', N'maria.perez@email.com', N'963-789', N'sin registrar', CAST(N'2024-12-05' AS Date), 1, N'password', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Clientes] OFF
GO
SET IDENTITY_INSERT [dbo].[Configuracion] ON 

INSERT [dbo].[Configuracion] ([ID], [ConfigKey], [ConfigValue], [ConfigDescription]) VALUES (1, N'MontoMinimoPrestamo', N'100', N'Este es el monto minimo por prestasmo menos de esto y saldra un error en la validación')
INSERT [dbo].[Configuracion] ([ID], [ConfigKey], [ConfigValue], [ConfigDescription]) VALUES (2, N'TasaInteresPorDefecto', N'10', N'Esta es la tasa de interes por defecto si no se especifica entonces esta es la que va')
INSERT [dbo].[Configuracion] ([ID], [ConfigKey], [ConfigValue], [ConfigDescription]) VALUES (3, N'NumeroDeCuotasPorDefecto', N'5', N'Este es el numero de cuotas por defecto si no se espesifica este sera el numero por defecto')
INSERT [dbo].[Configuracion] ([ID], [ConfigKey], [ConfigValue], [ConfigDescription]) VALUES (4, N'NumeroPrestamosSinPagarPorCliente', N'3', N'Si el cliente tiene este numero de prestamos sin pagar entonces no se le permite crear otro hasta que pague')
INSERT [dbo].[Configuracion] ([ID], [ConfigKey], [ConfigValue], [ConfigDescription]) VALUES (1002, N'PassWordByDefault', N'password', N'Esta es la contraseña por defecto ')
SET IDENTITY_INSERT [dbo].[Configuracion] OFF
GO
SET IDENTITY_INSERT [dbo].[Cuotas] ON 

INSERT [dbo].[Cuotas] ([CuotaID], [PrestamoID], [NumeroCuota], [MontoCuota], [FechaVencimiento], [Estado], [FechaPago]) VALUES (1, 1, 1, CAST(110.00 AS Decimal(18, 2)), CAST(N'2024-11-06' AS Date), N'Cancelada', NULL)
INSERT [dbo].[Cuotas] ([CuotaID], [PrestamoID], [NumeroCuota], [MontoCuota], [FechaVencimiento], [Estado], [FechaPago]) VALUES (2, 1, 2, CAST(110.00 AS Decimal(18, 2)), CAST(N'2024-12-06' AS Date), N'Cancelada', NULL)
INSERT [dbo].[Cuotas] ([CuotaID], [PrestamoID], [NumeroCuota], [MontoCuota], [FechaVencimiento], [Estado], [FechaPago]) VALUES (3, 1, 3, CAST(110.00 AS Decimal(18, 2)), CAST(N'2025-01-05' AS Date), N'Cancelada', CAST(N'2024-11-07' AS Date))
INSERT [dbo].[Cuotas] ([CuotaID], [PrestamoID], [NumeroCuota], [MontoCuota], [FechaVencimiento], [Estado], [FechaPago]) VALUES (4, 1, 4, CAST(110.00 AS Decimal(18, 2)), CAST(N'2025-02-04' AS Date), N'Cancelada', CAST(N'2024-11-07' AS Date))
INSERT [dbo].[Cuotas] ([CuotaID], [PrestamoID], [NumeroCuota], [MontoCuota], [FechaVencimiento], [Estado], [FechaPago]) VALUES (5, 1, 5, CAST(110.00 AS Decimal(18, 2)), CAST(N'2025-03-06' AS Date), N'Cancelada', CAST(N'2024-11-07' AS Date))
INSERT [dbo].[Cuotas] ([CuotaID], [PrestamoID], [NumeroCuota], [MontoCuota], [FechaVencimiento], [Estado], [FechaPago]) VALUES (6, 2, 1, CAST(110.00 AS Decimal(18, 2)), CAST(N'2024-11-06' AS Date), N'Cancelada', CAST(N'2024-11-07' AS Date))
INSERT [dbo].[Cuotas] ([CuotaID], [PrestamoID], [NumeroCuota], [MontoCuota], [FechaVencimiento], [Estado], [FechaPago]) VALUES (7, 2, 2, CAST(110.00 AS Decimal(18, 2)), CAST(N'2024-12-06' AS Date), N'Cancelada', CAST(N'2024-11-07' AS Date))
INSERT [dbo].[Cuotas] ([CuotaID], [PrestamoID], [NumeroCuota], [MontoCuota], [FechaVencimiento], [Estado], [FechaPago]) VALUES (8, 2, 3, CAST(110.00 AS Decimal(18, 2)), CAST(N'2025-01-05' AS Date), N'Cancelada', CAST(N'2024-11-07' AS Date))
INSERT [dbo].[Cuotas] ([CuotaID], [PrestamoID], [NumeroCuota], [MontoCuota], [FechaVencimiento], [Estado], [FechaPago]) VALUES (9, 2, 4, CAST(110.00 AS Decimal(18, 2)), CAST(N'2025-02-04' AS Date), N'Pendiente', NULL)
INSERT [dbo].[Cuotas] ([CuotaID], [PrestamoID], [NumeroCuota], [MontoCuota], [FechaVencimiento], [Estado], [FechaPago]) VALUES (10, 2, 5, CAST(110.00 AS Decimal(18, 2)), CAST(N'2025-03-06' AS Date), N'Pendiente', NULL)
INSERT [dbo].[Cuotas] ([CuotaID], [PrestamoID], [NumeroCuota], [MontoCuota], [FechaVencimiento], [Estado], [FechaPago]) VALUES (1002, 1002, 1, CAST(99.00 AS Decimal(18, 2)), CAST(N'2024-11-06' AS Date), N'Cancelada', CAST(N'2024-11-07' AS Date))
INSERT [dbo].[Cuotas] ([CuotaID], [PrestamoID], [NumeroCuota], [MontoCuota], [FechaVencimiento], [Estado], [FechaPago]) VALUES (1003, 1002, 2, CAST(99.00 AS Decimal(18, 2)), CAST(N'2024-12-06' AS Date), N'Cancelada', CAST(N'2024-11-07' AS Date))
INSERT [dbo].[Cuotas] ([CuotaID], [PrestamoID], [NumeroCuota], [MontoCuota], [FechaVencimiento], [Estado], [FechaPago]) VALUES (1004, 1002, 3, CAST(99.00 AS Decimal(18, 2)), CAST(N'2025-01-05' AS Date), N'Cancelada', CAST(N'2024-11-07' AS Date))
INSERT [dbo].[Cuotas] ([CuotaID], [PrestamoID], [NumeroCuota], [MontoCuota], [FechaVencimiento], [Estado], [FechaPago]) VALUES (1005, 1002, 4, CAST(99.00 AS Decimal(18, 2)), CAST(N'2025-02-04' AS Date), N'Cancelada', CAST(N'2024-11-07' AS Date))
INSERT [dbo].[Cuotas] ([CuotaID], [PrestamoID], [NumeroCuota], [MontoCuota], [FechaVencimiento], [Estado], [FechaPago]) VALUES (1006, 1002, 5, CAST(99.00 AS Decimal(18, 2)), CAST(N'2025-03-06' AS Date), N'Cancelada', CAST(N'2024-11-07' AS Date))
INSERT [dbo].[Cuotas] ([CuotaID], [PrestamoID], [NumeroCuota], [MontoCuota], [FechaVencimiento], [Estado], [FechaPago]) VALUES (1007, 1003, 1, CAST(19.17 AS Decimal(18, 2)), CAST(N'2024-11-07' AS Date), N'Cancelada', CAST(N'2024-11-07' AS Date))
INSERT [dbo].[Cuotas] ([CuotaID], [PrestamoID], [NumeroCuota], [MontoCuota], [FechaVencimiento], [Estado], [FechaPago]) VALUES (1008, 1003, 2, CAST(19.17 AS Decimal(18, 2)), CAST(N'2024-12-07' AS Date), N'Cancelada', CAST(N'2024-11-07' AS Date))
INSERT [dbo].[Cuotas] ([CuotaID], [PrestamoID], [NumeroCuota], [MontoCuota], [FechaVencimiento], [Estado], [FechaPago]) VALUES (1009, 1003, 3, CAST(19.17 AS Decimal(18, 2)), CAST(N'2025-01-06' AS Date), N'Cancelada', CAST(N'2024-11-07' AS Date))
INSERT [dbo].[Cuotas] ([CuotaID], [PrestamoID], [NumeroCuota], [MontoCuota], [FechaVencimiento], [Estado], [FechaPago]) VALUES (1010, 1003, 4, CAST(19.17 AS Decimal(18, 2)), CAST(N'2025-02-05' AS Date), N'Cancelada', CAST(N'2024-11-07' AS Date))
INSERT [dbo].[Cuotas] ([CuotaID], [PrestamoID], [NumeroCuota], [MontoCuota], [FechaVencimiento], [Estado], [FechaPago]) VALUES (1011, 1003, 5, CAST(19.17 AS Decimal(18, 2)), CAST(N'2025-03-07' AS Date), N'Cancelada', CAST(N'2024-11-07' AS Date))
INSERT [dbo].[Cuotas] ([CuotaID], [PrestamoID], [NumeroCuota], [MontoCuota], [FechaVencimiento], [Estado], [FechaPago]) VALUES (1012, 1003, 6, CAST(19.17 AS Decimal(18, 2)), CAST(N'2025-04-06' AS Date), N'Cancelada', CAST(N'2024-11-07' AS Date))
INSERT [dbo].[Cuotas] ([CuotaID], [PrestamoID], [NumeroCuota], [MontoCuota], [FechaVencimiento], [Estado], [FechaPago]) VALUES (1013, 1004, 1, CAST(138.60 AS Decimal(18, 2)), CAST(N'2024-11-07' AS Date), N'Cancelada', CAST(N'2024-11-07' AS Date))
INSERT [dbo].[Cuotas] ([CuotaID], [PrestamoID], [NumeroCuota], [MontoCuota], [FechaVencimiento], [Estado], [FechaPago]) VALUES (1014, 1004, 2, CAST(138.60 AS Decimal(18, 2)), CAST(N'2024-12-07' AS Date), N'Cancelada', CAST(N'2024-11-07' AS Date))
INSERT [dbo].[Cuotas] ([CuotaID], [PrestamoID], [NumeroCuota], [MontoCuota], [FechaVencimiento], [Estado], [FechaPago]) VALUES (1015, 1004, 3, CAST(138.60 AS Decimal(18, 2)), CAST(N'2025-01-06' AS Date), N'Cancelada', CAST(N'2024-11-07' AS Date))
INSERT [dbo].[Cuotas] ([CuotaID], [PrestamoID], [NumeroCuota], [MontoCuota], [FechaVencimiento], [Estado], [FechaPago]) VALUES (1016, 1004, 4, CAST(138.60 AS Decimal(18, 2)), CAST(N'2025-02-05' AS Date), N'Cancelada', CAST(N'2024-11-07' AS Date))
INSERT [dbo].[Cuotas] ([CuotaID], [PrestamoID], [NumeroCuota], [MontoCuota], [FechaVencimiento], [Estado], [FechaPago]) VALUES (1017, 1004, 5, CAST(138.60 AS Decimal(18, 2)), CAST(N'2025-03-07' AS Date), N'Cancelada', CAST(N'2024-11-07' AS Date))
INSERT [dbo].[Cuotas] ([CuotaID], [PrestamoID], [NumeroCuota], [MontoCuota], [FechaVencimiento], [Estado], [FechaPago]) VALUES (2002, 2002, 1, CAST(73.33 AS Decimal(18, 2)), CAST(N'2024-11-07' AS Date), N'Cancelada', CAST(N'2024-11-07' AS Date))
INSERT [dbo].[Cuotas] ([CuotaID], [PrestamoID], [NumeroCuota], [MontoCuota], [FechaVencimiento], [Estado], [FechaPago]) VALUES (2003, 2002, 2, CAST(73.33 AS Decimal(18, 2)), CAST(N'2024-12-07' AS Date), N'Cancelada', CAST(N'2024-11-07' AS Date))
INSERT [dbo].[Cuotas] ([CuotaID], [PrestamoID], [NumeroCuota], [MontoCuota], [FechaVencimiento], [Estado], [FechaPago]) VALUES (2004, 2002, 3, CAST(73.33 AS Decimal(18, 2)), CAST(N'2025-01-06' AS Date), N'Cancelada', CAST(N'2024-11-07' AS Date))
INSERT [dbo].[Cuotas] ([CuotaID], [PrestamoID], [NumeroCuota], [MontoCuota], [FechaVencimiento], [Estado], [FechaPago]) VALUES (3002, 3002, 1, CAST(110.00 AS Decimal(18, 2)), CAST(N'2024-11-07' AS Date), N'Pendiente', NULL)
INSERT [dbo].[Cuotas] ([CuotaID], [PrestamoID], [NumeroCuota], [MontoCuota], [FechaVencimiento], [Estado], [FechaPago]) VALUES (3003, 3002, 2, CAST(110.00 AS Decimal(18, 2)), CAST(N'2024-12-07' AS Date), N'Pendiente', NULL)
INSERT [dbo].[Cuotas] ([CuotaID], [PrestamoID], [NumeroCuota], [MontoCuota], [FechaVencimiento], [Estado], [FechaPago]) VALUES (3004, 3002, 3, CAST(110.00 AS Decimal(18, 2)), CAST(N'2025-01-06' AS Date), N'Pendiente', NULL)
INSERT [dbo].[Cuotas] ([CuotaID], [PrestamoID], [NumeroCuota], [MontoCuota], [FechaVencimiento], [Estado], [FechaPago]) VALUES (3005, 3002, 4, CAST(110.00 AS Decimal(18, 2)), CAST(N'2025-02-05' AS Date), N'Pendiente', NULL)
INSERT [dbo].[Cuotas] ([CuotaID], [PrestamoID], [NumeroCuota], [MontoCuota], [FechaVencimiento], [Estado], [FechaPago]) VALUES (3006, 3002, 5, CAST(110.00 AS Decimal(18, 2)), CAST(N'2025-03-07' AS Date), N'Pendiente', NULL)
INSERT [dbo].[Cuotas] ([CuotaID], [PrestamoID], [NumeroCuota], [MontoCuota], [FechaVencimiento], [Estado], [FechaPago]) VALUES (4002, 4002, 1, CAST(96.00 AS Decimal(18, 2)), CAST(N'2024-11-07' AS Date), N'Cancelada', CAST(N'2024-11-07' AS Date))
INSERT [dbo].[Cuotas] ([CuotaID], [PrestamoID], [NumeroCuota], [MontoCuota], [FechaVencimiento], [Estado], [FechaPago]) VALUES (4003, 4002, 2, CAST(96.00 AS Decimal(18, 2)), CAST(N'2024-12-07' AS Date), N'Cancelada', CAST(N'2024-11-07' AS Date))
INSERT [dbo].[Cuotas] ([CuotaID], [PrestamoID], [NumeroCuota], [MontoCuota], [FechaVencimiento], [Estado], [FechaPago]) VALUES (4004, 4002, 3, CAST(96.00 AS Decimal(18, 2)), CAST(N'2025-01-06' AS Date), N'Cancelada', CAST(N'2024-11-07' AS Date))
INSERT [dbo].[Cuotas] ([CuotaID], [PrestamoID], [NumeroCuota], [MontoCuota], [FechaVencimiento], [Estado], [FechaPago]) VALUES (4005, 4002, 4, CAST(96.00 AS Decimal(18, 2)), CAST(N'2025-02-05' AS Date), N'Cancelada', CAST(N'2024-11-07' AS Date))
INSERT [dbo].[Cuotas] ([CuotaID], [PrestamoID], [NumeroCuota], [MontoCuota], [FechaVencimiento], [Estado], [FechaPago]) VALUES (4006, 4002, 5, CAST(96.00 AS Decimal(18, 2)), CAST(N'2025-03-07' AS Date), N'Cancelada', CAST(N'2024-11-07' AS Date))
INSERT [dbo].[Cuotas] ([CuotaID], [PrestamoID], [NumeroCuota], [MontoCuota], [FechaVencimiento], [Estado], [FechaPago]) VALUES (5002, 5002, 1, CAST(60.50 AS Decimal(18, 2)), CAST(N'2024-12-10' AS Date), N'Pendiente', NULL)
INSERT [dbo].[Cuotas] ([CuotaID], [PrestamoID], [NumeroCuota], [MontoCuota], [FechaVencimiento], [Estado], [FechaPago]) VALUES (5003, 5002, 2, CAST(60.50 AS Decimal(18, 2)), CAST(N'2025-01-09' AS Date), N'Pendiente', NULL)
INSERT [dbo].[Cuotas] ([CuotaID], [PrestamoID], [NumeroCuota], [MontoCuota], [FechaVencimiento], [Estado], [FechaPago]) VALUES (5004, 5002, 3, CAST(60.50 AS Decimal(18, 2)), CAST(N'2025-02-08' AS Date), N'Pendiente', NULL)
INSERT [dbo].[Cuotas] ([CuotaID], [PrestamoID], [NumeroCuota], [MontoCuota], [FechaVencimiento], [Estado], [FechaPago]) VALUES (5005, 5002, 4, CAST(60.50 AS Decimal(18, 2)), CAST(N'2025-03-10' AS Date), N'Pendiente', NULL)
INSERT [dbo].[Cuotas] ([CuotaID], [PrestamoID], [NumeroCuota], [MontoCuota], [FechaVencimiento], [Estado], [FechaPago]) VALUES (5006, 5002, 5, CAST(60.50 AS Decimal(18, 2)), CAST(N'2025-04-09' AS Date), N'Pendiente', NULL)
INSERT [dbo].[Cuotas] ([CuotaID], [PrestamoID], [NumeroCuota], [MontoCuota], [FechaVencimiento], [Estado], [FechaPago]) VALUES (5007, 5002, 6, CAST(60.50 AS Decimal(18, 2)), CAST(N'2025-05-09' AS Date), N'Pendiente', NULL)
INSERT [dbo].[Cuotas] ([CuotaID], [PrestamoID], [NumeroCuota], [MontoCuota], [FechaVencimiento], [Estado], [FechaPago]) VALUES (5008, 5002, 7, CAST(60.50 AS Decimal(18, 2)), CAST(N'2025-06-08' AS Date), N'Pendiente', NULL)
INSERT [dbo].[Cuotas] ([CuotaID], [PrestamoID], [NumeroCuota], [MontoCuota], [FechaVencimiento], [Estado], [FechaPago]) VALUES (5009, 5002, 8, CAST(60.50 AS Decimal(18, 2)), CAST(N'2025-07-08' AS Date), N'Pendiente', NULL)
INSERT [dbo].[Cuotas] ([CuotaID], [PrestamoID], [NumeroCuota], [MontoCuota], [FechaVencimiento], [Estado], [FechaPago]) VALUES (5010, 5002, 9, CAST(60.50 AS Decimal(18, 2)), CAST(N'2025-08-07' AS Date), N'Pendiente', NULL)
INSERT [dbo].[Cuotas] ([CuotaID], [PrestamoID], [NumeroCuota], [MontoCuota], [FechaVencimiento], [Estado], [FechaPago]) VALUES (5011, 5002, 10, CAST(60.50 AS Decimal(18, 2)), CAST(N'2025-09-06' AS Date), N'Pendiente', NULL)
INSERT [dbo].[Cuotas] ([CuotaID], [PrestamoID], [NumeroCuota], [MontoCuota], [FechaVencimiento], [Estado], [FechaPago]) VALUES (6002, 6002, 1, CAST(118.80 AS Decimal(18, 2)), CAST(N'2024-12-13' AS Date), N'Pendiente', NULL)
INSERT [dbo].[Cuotas] ([CuotaID], [PrestamoID], [NumeroCuota], [MontoCuota], [FechaVencimiento], [Estado], [FechaPago]) VALUES (6003, 6002, 2, CAST(118.80 AS Decimal(18, 2)), CAST(N'2025-01-12' AS Date), N'Pendiente', NULL)
INSERT [dbo].[Cuotas] ([CuotaID], [PrestamoID], [NumeroCuota], [MontoCuota], [FechaVencimiento], [Estado], [FechaPago]) VALUES (6004, 6002, 3, CAST(118.80 AS Decimal(18, 2)), CAST(N'2025-02-11' AS Date), N'Pendiente', NULL)
INSERT [dbo].[Cuotas] ([CuotaID], [PrestamoID], [NumeroCuota], [MontoCuota], [FechaVencimiento], [Estado], [FechaPago]) VALUES (6005, 6002, 4, CAST(118.80 AS Decimal(18, 2)), CAST(N'2025-03-13' AS Date), N'Pendiente', NULL)
INSERT [dbo].[Cuotas] ([CuotaID], [PrestamoID], [NumeroCuota], [MontoCuota], [FechaVencimiento], [Estado], [FechaPago]) VALUES (6006, 6002, 5, CAST(118.80 AS Decimal(18, 2)), CAST(N'2025-04-12' AS Date), N'Pendiente', NULL)
INSERT [dbo].[Cuotas] ([CuotaID], [PrestamoID], [NumeroCuota], [MontoCuota], [FechaVencimiento], [Estado], [FechaPago]) VALUES (6007, 6003, 1, CAST(112.20 AS Decimal(18, 2)), CAST(N'2024-12-13' AS Date), N'Pendiente', NULL)
INSERT [dbo].[Cuotas] ([CuotaID], [PrestamoID], [NumeroCuota], [MontoCuota], [FechaVencimiento], [Estado], [FechaPago]) VALUES (6008, 6003, 2, CAST(112.20 AS Decimal(18, 2)), CAST(N'2025-01-12' AS Date), N'Pendiente', NULL)
INSERT [dbo].[Cuotas] ([CuotaID], [PrestamoID], [NumeroCuota], [MontoCuota], [FechaVencimiento], [Estado], [FechaPago]) VALUES (6009, 6003, 3, CAST(112.20 AS Decimal(18, 2)), CAST(N'2025-02-11' AS Date), N'Pendiente', NULL)
INSERT [dbo].[Cuotas] ([CuotaID], [PrestamoID], [NumeroCuota], [MontoCuota], [FechaVencimiento], [Estado], [FechaPago]) VALUES (6010, 6003, 4, CAST(112.20 AS Decimal(18, 2)), CAST(N'2025-03-13' AS Date), N'Pendiente', NULL)
INSERT [dbo].[Cuotas] ([CuotaID], [PrestamoID], [NumeroCuota], [MontoCuota], [FechaVencimiento], [Estado], [FechaPago]) VALUES (6011, 6003, 5, CAST(112.20 AS Decimal(18, 2)), CAST(N'2025-04-12' AS Date), N'Pendiente', NULL)
SET IDENTITY_INSERT [dbo].[Cuotas] OFF
GO
SET IDENTITY_INSERT [dbo].[Prestamos] ON 

INSERT [dbo].[Prestamos] ([PrestamoID], [ClienteID], [MontoTotal], [MontoConIntereses], [TasaInteres], [FechaPrestamo], [FechaVencimiento], [Estado], [NumeroCuotas], [FrecuenciaPago], [EstadoAprobacion]) VALUES (1, 2, CAST(500.00 AS Decimal(18, 2)), CAST(550.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(N'2024-11-06' AS Date), CAST(N'2025-04-05' AS Date), N'Pagado', 5, N'Mensual', N'pendiente')
INSERT [dbo].[Prestamos] ([PrestamoID], [ClienteID], [MontoTotal], [MontoConIntereses], [TasaInteres], [FechaPrestamo], [FechaVencimiento], [Estado], [NumeroCuotas], [FrecuenciaPago], [EstadoAprobacion]) VALUES (2, 2, CAST(500.00 AS Decimal(18, 2)), CAST(550.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(N'2024-11-06' AS Date), CAST(N'2025-04-05' AS Date), N'Pendiente', 5, N'Mensual', N'pendiente')
INSERT [dbo].[Prestamos] ([PrestamoID], [ClienteID], [MontoTotal], [MontoConIntereses], [TasaInteres], [FechaPrestamo], [FechaVencimiento], [Estado], [NumeroCuotas], [FrecuenciaPago], [EstadoAprobacion]) VALUES (1002, 4, CAST(450.00 AS Decimal(18, 2)), CAST(495.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(N'2024-11-06' AS Date), CAST(N'2025-04-05' AS Date), N'Pagado', 5, N'Mensual', N'pendiente')
INSERT [dbo].[Prestamos] ([PrestamoID], [ClienteID], [MontoTotal], [MontoConIntereses], [TasaInteres], [FechaPrestamo], [FechaVencimiento], [Estado], [NumeroCuotas], [FrecuenciaPago], [EstadoAprobacion]) VALUES (1003, 4, CAST(100.00 AS Decimal(18, 2)), CAST(115.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(5, 2)), CAST(N'2024-11-07' AS Date), CAST(N'2025-05-06' AS Date), N'Pagado', 6, N'Mensual', N'aprobado')
INSERT [dbo].[Prestamos] ([PrestamoID], [ClienteID], [MontoTotal], [MontoConIntereses], [TasaInteres], [FechaPrestamo], [FechaVencimiento], [Estado], [NumeroCuotas], [FrecuenciaPago], [EstadoAprobacion]) VALUES (1004, 1, CAST(630.00 AS Decimal(18, 2)), CAST(693.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(N'2024-11-07' AS Date), CAST(N'2025-04-06' AS Date), N'Pagado', 5, N'Mensual', N'pendiente')
INSERT [dbo].[Prestamos] ([PrestamoID], [ClienteID], [MontoTotal], [MontoConIntereses], [TasaInteres], [FechaPrestamo], [FechaVencimiento], [Estado], [NumeroCuotas], [FrecuenciaPago], [EstadoAprobacion]) VALUES (2002, 4, CAST(200.00 AS Decimal(18, 2)), CAST(220.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(N'2024-11-07' AS Date), CAST(N'2025-02-05' AS Date), N'Pendiente', 3, N'Mensual', N'pendiente')
INSERT [dbo].[Prestamos] ([PrestamoID], [ClienteID], [MontoTotal], [MontoConIntereses], [TasaInteres], [FechaPrestamo], [FechaVencimiento], [Estado], [NumeroCuotas], [FrecuenciaPago], [EstadoAprobacion]) VALUES (3002, 2, CAST(500.00 AS Decimal(18, 2)), CAST(550.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(N'2024-11-07' AS Date), CAST(N'2025-04-06' AS Date), N'Pendiente', 5, N'Mensual', N'pendiente')
INSERT [dbo].[Prestamos] ([PrestamoID], [ClienteID], [MontoTotal], [MontoConIntereses], [TasaInteres], [FechaPrestamo], [FechaVencimiento], [Estado], [NumeroCuotas], [FrecuenciaPago], [EstadoAprobacion]) VALUES (4002, 3010, CAST(400.00 AS Decimal(18, 2)), CAST(480.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(5, 2)), CAST(N'2024-11-07' AS Date), CAST(N'2025-04-06' AS Date), N'Pagado', 5, N'Mensual', N'pendiente')
INSERT [dbo].[Prestamos] ([PrestamoID], [ClienteID], [MontoTotal], [MontoConIntereses], [TasaInteres], [FechaPrestamo], [FechaVencimiento], [Estado], [NumeroCuotas], [FrecuenciaPago], [EstadoAprobacion]) VALUES (5002, 2, CAST(550.00 AS Decimal(18, 2)), CAST(605.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(N'2024-12-10' AS Date), CAST(N'2025-10-06' AS Date), N'Pendiente', 10, N'Mensual', N'pendiente')
INSERT [dbo].[Prestamos] ([PrestamoID], [ClienteID], [MontoTotal], [MontoConIntereses], [TasaInteres], [FechaPrestamo], [FechaVencimiento], [Estado], [NumeroCuotas], [FrecuenciaPago], [EstadoAprobacion]) VALUES (6002, 2, CAST(540.00 AS Decimal(18, 2)), CAST(594.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(N'2024-12-13' AS Date), CAST(N'2025-05-12' AS Date), N'Pendiente', 5, N'Mensual', N'pendiente')
INSERT [dbo].[Prestamos] ([PrestamoID], [ClienteID], [MontoTotal], [MontoConIntereses], [TasaInteres], [FechaPrestamo], [FechaVencimiento], [Estado], [NumeroCuotas], [FrecuenciaPago], [EstadoAprobacion]) VALUES (6003, 2, CAST(510.00 AS Decimal(18, 2)), CAST(561.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(5, 2)), CAST(N'2024-12-13' AS Date), CAST(N'2025-05-12' AS Date), N'Pendiente', 5, N'Mensual', N'pendiente')
SET IDENTITY_INSERT [dbo].[Prestamos] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RolID], [NombreRol], [Descripcion]) VALUES (1, N'Administrador', N'Acceso completo al sistema')
INSERT [dbo].[Roles] ([RolID], [NombreRol], [Descripcion]) VALUES (2, N'Usuario', N'Acceso básico al sistema')
INSERT [dbo].[Roles] ([RolID], [NombreRol], [Descripcion]) VALUES (3, N'Supervisor', N'Acceso a reportes y supervisión')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Clientes__A9D10534778702D4]    Script Date: 12/12/2024 23:42:13 ******/
ALTER TABLE [dbo].[Clientes] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Roles__4F0B537FE33BDB47]    Script Date: 12/12/2024 23:42:13 ******/
ALTER TABLE [dbo].[Roles] ADD UNIQUE NONCLUSTERED 
(
	[NombreRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ClienteRoles] ADD  DEFAULT (getdate()) FOR [FechaAsignacion]
GO
ALTER TABLE [dbo].[Clientes] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[Clientes] ADD  DEFAULT ((1)) FOR [Visible]
GO
ALTER TABLE [dbo].[Cuotas] ADD  DEFAULT ('Pendiente') FOR [Estado]
GO
ALTER TABLE [dbo].[Prestamos] ADD  CONSTRAINT [DF_Prestamos_FechaPrestamo]  DEFAULT (getdate()) FOR [FechaPrestamo]
GO
ALTER TABLE [dbo].[ClienteRoles]  WITH CHECK ADD  CONSTRAINT [FK_ClienteRoles_Clientes] FOREIGN KEY([ClienteID])
REFERENCES [dbo].[Clientes] ([ClienteID])
GO
ALTER TABLE [dbo].[ClienteRoles] CHECK CONSTRAINT [FK_ClienteRoles_Clientes]
GO
ALTER TABLE [dbo].[ClienteRoles]  WITH CHECK ADD  CONSTRAINT [FK_ClienteRoles_Roles] FOREIGN KEY([RolID])
REFERENCES [dbo].[Roles] ([RolID])
GO
ALTER TABLE [dbo].[ClienteRoles] CHECK CONSTRAINT [FK_ClienteRoles_Roles]
GO
ALTER TABLE [dbo].[Cuotas]  WITH CHECK ADD  CONSTRAINT [FK_Cuota_Prestamo] FOREIGN KEY([PrestamoID])
REFERENCES [dbo].[Prestamos] ([PrestamoID])
GO
ALTER TABLE [dbo].[Cuotas] CHECK CONSTRAINT [FK_Cuota_Prestamo]
GO
ALTER TABLE [dbo].[Prestamos]  WITH CHECK ADD  CONSTRAINT [FK_Prestamo_Cliente] FOREIGN KEY([ClienteID])
REFERENCES [dbo].[Clientes] ([ClienteID])
GO
ALTER TABLE [dbo].[Prestamos] CHECK CONSTRAINT [FK_Prestamo_Cliente]
GO
/****** Object:  StoredProcedure [dbo].[sp_ActualizarUltimoAcceso]    Script Date: 12/12/2024 23:42:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ActualizarUltimoAcceso]
    @ClienteID INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Actualizar el campo UltimoAcceso con la fecha y hora actuales
    UPDATE Clientes
    SET UltimoAcceso = GETDATE()
    WHERE ClienteID = @ClienteID;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_AprobarPrestamo]    Script Date: 12/12/2024 23:42:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AprobarPrestamo]
    @PrestamoID INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Prestamos
    SET EstadoAprobacion = 'aprobado'
    WHERE PrestamoID = @PrestamoID;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AsignarRolACliente]    Script Date: 12/12/2024 23:42:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AsignarRolACliente]
    @ClienteID INT,
    @RolID INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Insertar el rol al cliente en la tabla intermedia ClienteRoles
    IF NOT EXISTS (SELECT 1 FROM ClienteRoles WHERE ClienteID = @ClienteID AND RolID = @RolID)
    BEGIN
        INSERT INTO ClienteRoles (ClienteID, RolID)
        VALUES (@ClienteID, @RolID)
    END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CrearCliente]    Script Date: 12/12/2024 23:42:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--- Procedimiento para crear clientes
CREATE PROCEDURE [dbo].[sp_CrearCliente]
    @Nombre NVARCHAR(100),
    @Apellido NVARCHAR(100),
    @Email NVARCHAR(150),
    @Telefono NVARCHAR(20) = NULL,
    @Direccion NVARCHAR(255) = NULL,
    @Visible BIT = 1,
    @Contraseña NVARCHAR(255),
    @UltimoAcceso DATETIME = NULL
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Clientes (Nombre, Apellido, Email, Telefono, Direccion, FechaRegistro, Visible, Contraseña, UltimoAcceso)
    VALUES (@Nombre, @Apellido, @Email, @Telefono, @Direccion, GETDATE(), @Visible, @Contraseña, @UltimoAcceso);

    -- Retorna el ID del cliente recién insertado
    SELECT SCOPE_IDENTITY() AS ClienteID;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_CrearConfiguracion]    Script Date: 12/12/2024 23:42:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CrearConfiguracion]
    @ConfigKey NVARCHAR(100),
    @ConfigValue NVARCHAR(255),
    @ConfigDescription NVARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Configuracion (ConfigKey, ConfigValue, ConfigDescription)
    VALUES (@ConfigKey, @ConfigValue, @ConfigDescription);
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CrearPrestamoConCuotas]    Script Date: 12/12/2024 23:42:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CrearPrestamoConCuotas]
    @ClienteID INT,
    @MontoTotal DECIMAL(18, 2),
    @NumeroCuotas INT,
    @FrecuenciaPago NVARCHAR(50),
    @TasaInteres DECIMAL(5, 2)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @PrestamoID INT;
    DECLARE @MontoConIntereses DECIMAL(18, 2);
    DECLARE @MontoCuota DECIMAL(18, 2);
    DECLARE @FechaVencimientoCuota DATE;
    DECLARE @IncrementoDias INT;
	DECLARE @FechaInicio DATE;  -- Declarar la variable de tipo DATE
	SET @FechaInicio = GETDATE();  -- Asignar la fecha actual a la variable


    -- Calcular el monto total a pagar con intereses
    SET @MontoConIntereses = @MontoTotal * (1 + @TasaInteres / 100);

    -- Calcular el monto de cada cuota
    SET @MontoCuota = @MontoConIntereses / @NumeroCuotas;

    -- Determinar el incremento de días según la frecuencia de pago
    SET @IncrementoDias = CASE 
                            WHEN @FrecuenciaPago = 'Mensual' THEN 30
                            WHEN @FrecuenciaPago = 'Quincenal' THEN 15
                            ELSE 30 -- Valor predeterminado si la frecuencia no es reconocida
                          END;

    -- Insertar el préstamo en la tabla de Prestamos
    INSERT INTO Prestamos (ClienteID, MontoTotal, MontoConIntereses, TasaInteres, FechaPrestamo, FechaVencimiento, Estado, NumeroCuotas, FrecuenciaPago, EstadoAprobacion)
    VALUES (@ClienteID, @MontoTotal, @MontoConIntereses, @TasaInteres, @FechaInicio, DATEADD(DAY, @IncrementoDias * @NumeroCuotas, @FechaInicio), 'Pendiente', @NumeroCuotas, @FrecuenciaPago, 'pendiente');

    -- Obtener el ID del préstamo recién insertado
    SET @PrestamoID = SCOPE_IDENTITY();

    -- Generar y registrar cada cuota
    SET @FechaVencimientoCuota = @FechaInicio;

    DECLARE @Contador INT = 1;
    WHILE @Contador <= @NumeroCuotas
    BEGIN
        -- Insertar cada cuota en la tabla Cuotas
        INSERT INTO Cuotas (PrestamoID, NumeroCuota, MontoCuota, FechaVencimiento, Estado)
        VALUES (@PrestamoID, @Contador, @MontoCuota, @FechaVencimientoCuota, 'Pendiente');

        -- Calcular la fecha de vencimiento de la siguiente cuota
        SET @FechaVencimientoCuota = DATEADD(DAY, @IncrementoDias, @FechaVencimientoCuota);

        -- Incrementar el contador
        SET @Contador = @Contador + 1;
    END;

    -- Devolver el ID del préstamo creado
    SELECT @PrestamoID AS PrestamoID;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_DenegarPrestamo]    Script Date: 12/12/2024 23:42:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DenegarPrestamo]
    @PrestamoID INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Prestamos
    SET EstadoAprobacion = 'denegado'
    WHERE PrestamoID = @PrestamoID;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ListarClientes]    Script Date: 12/12/2024 23:42:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Procedimiento para listar clientes
CREATE PROCEDURE [dbo].[sp_ListarClientes]
AS
BEGIN
    SELECT ClienteID, Nombre, Apellido, Email, Telefono, Direccion, FechaRegistro, Visible, UltimoAcceso
    FROM Clientes
    WHERE Visible = 1; -- Solo devuelve clientes activos
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ListarClientesPorNombre]    Script Date: 12/12/2024 23:42:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ListarClientesPorNombre]
    @Nombre NVARCHAR(150)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT ClienteID, Nombre, Apellido, Email, Telefono, Direccion
    FROM Clientes
    WHERE (Nombre LIKE '%' + @Nombre + '%' OR @Nombre = '')
      AND Visible = 1; -- Filtrar solo clientes visibles
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ListarConfiguraciones]    Script Date: 12/12/2024 23:42:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ListarConfiguraciones]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT ID, ConfigKey, ConfigValue, ConfigDescription
    FROM Configuracion;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ListarPrestamosPorCliente]    Script Date: 12/12/2024 23:42:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ListarPrestamosPorCliente]
    @ClienteID INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        PrestamoID,
        ClienteID,
        MontoTotal,
        MontoConIntereses,
        TasaInteres,
        FechaPrestamo,
        FechaVencimiento,
        Estado
    FROM 
        Prestamos
    WHERE 
        ClienteID = @ClienteID
    ORDER BY 
        FechaPrestamo DESC;  -- Opcional: Ordenar los préstamos por la fecha de creación, del más reciente al más antiguo.
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_ListarRoles]    Script Date: 12/12/2024 23:42:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ListarRoles]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT RolID, NombreRol, Descripcion
    FROM Roles;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_MarcarCuotaComoCancelada]    Script Date: 12/12/2024 23:42:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_MarcarCuotaComoCancelada]
    @CuotaID INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Actualizar la cuota y marcarla como cancelada
    UPDATE Cuotas
    SET Estado = 'Cancelada', FechaPago = GETDATE()
    WHERE CuotaID = @CuotaID;

    -- Guardar el resultado de @@ROWCOUNT inmediatamente después de la actualización
    DECLARE @Resultado INT = @@ROWCOUNT;

    -- Verificar si la cuota fue actualizada
    IF @Resultado > 0
    BEGIN
        -- Obtener el IdPrestamo de la cuota
        DECLARE @IdPrestamo INT;
        SELECT @IdPrestamo = PrestamoID FROM Cuotas WHERE CuotaID = @CuotaID;

        -- Calcular el monto total de las cuotas canceladas para el préstamo
        DECLARE @MontoPagado DECIMAL(18, 2);
        SELECT @MontoPagado = SUM(MontoCuota) FROM Cuotas WHERE PrestamoID = @IdPrestamo AND Estado = 'Cancelada';

        -- Obtener el monto total con intereses del préstamo
        DECLARE @MontoConIntereses DECIMAL(18, 2);
        SELECT @MontoConIntereses = MontoConIntereses FROM Prestamos WHERE PrestamoID = @IdPrestamo;

        -- Si el monto pagado es igual o mayor al monto con intereses, cambiar el estado del préstamo a "Pagado"
        IF @MontoPagado >= @MontoConIntereses
        BEGIN
            UPDATE Prestamos
            SET Estado = 'Pagado'
            WHERE PrestamoID = @IdPrestamo;
        END
    END

    -- Devolver el resultado guardado anteriormente
    SELECT @Resultado AS Resultado;
END;

GO
/****** Object:  StoredProcedure [dbo].[sp_ModificarCliente]    Script Date: 12/12/2024 23:42:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ModificarCliente]
    @ClienteID INT,
    @Nombre NVARCHAR(100),
    @Apellido NVARCHAR(100),
    @Email NVARCHAR(150),
    @Telefono NVARCHAR(20),
    @Direccion NVARCHAR(255),
    @Contraseña NVARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        IF EXISTS (SELECT 1 FROM Clientes WHERE ClienteID = @ClienteID)
        BEGIN
            UPDATE Clientes
            SET 
                Nombre = CASE WHEN Nombre != @Nombre THEN @Nombre ELSE Nombre END,
                Apellido = CASE WHEN Apellido != @Apellido THEN @Apellido ELSE Apellido END,
                Email = CASE WHEN Email != @Email THEN @Email ELSE Email END,
                Telefono = CASE WHEN Telefono != @Telefono THEN @Telefono ELSE Telefono END,
                Direccion = CASE WHEN Direccion != @Direccion THEN @Direccion ELSE Direccion END,
                Contraseña = CASE WHEN Contraseña != @Contraseña THEN @Contraseña ELSE Contraseña END
            WHERE ClienteID = @ClienteID;
        END
        ELSE
        BEGIN
            RAISERROR ('Cliente no encontrado.', 16, 1);
        END
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT 
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ModificarClienteConRoles]    Script Date: 12/12/2024 23:42:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ModificarClienteConRoles]
    @ClienteID INT,
    @Nombre NVARCHAR(100),
    @Apellido NVARCHAR(100),
    @Email NVARCHAR(150),
    @Telefono NVARCHAR(20),
    @Direccion NVARCHAR(255),
    @Visible BIT,
    @Contraseña NVARCHAR(255),
    @RolesAgregar NVARCHAR(MAX),   -- Nombres de roles para agregar, separados por comas (ej. 'Admin,Usuario')
    @RolesQuitar NVARCHAR(MAX)     -- Nombres de roles para quitar, separados por comas (ej. 'Moderador,Supervisor')
AS
BEGIN
    SET NOCOUNT ON;

    -- Actualizar los datos del cliente
    UPDATE Clientes
    SET Nombre = @Nombre,
        Apellido = @Apellido,
        Email = @Email,
        Telefono = @Telefono,
        Direccion = @Direccion,
        Visible = @Visible,
        Contraseña = @Contraseña
    WHERE ClienteID = @ClienteID;

    -- Agregar roles al cliente
    IF @RolesAgregar IS NOT NULL AND LEN(@RolesAgregar) > 0
    BEGIN
        DECLARE @RolNombre NVARCHAR(100)
        DECLARE @RolID INT
        DECLARE @RolesCursorAgregar CURSOR
        SET @RolesCursorAgregar = CURSOR FOR
            SELECT value FROM STRING_SPLIT(@RolesAgregar, ',')

        OPEN @RolesCursorAgregar
        FETCH NEXT FROM @RolesCursorAgregar INTO @RolNombre

        WHILE @@FETCH_STATUS = 0
        BEGIN
            SELECT @RolID = RolID FROM Roles WHERE NombreRol = @RolNombre
            IF @RolID IS NOT NULL AND NOT EXISTS (SELECT 1 FROM ClienteRoles WHERE ClienteID = @ClienteID AND RolID = @RolID)
            BEGIN
                INSERT INTO ClienteRoles (ClienteID, RolID)
                VALUES (@ClienteID, @RolID)
            END
            FETCH NEXT FROM @RolesCursorAgregar INTO @RolNombre
        END

        CLOSE @RolesCursorAgregar
        DEALLOCATE @RolesCursorAgregar
    END

    -- Quitar roles del cliente
    IF @RolesQuitar IS NOT NULL AND LEN(@RolesQuitar) > 0
    BEGIN
        DECLARE @RolesCursorQuitar CURSOR
        SET @RolesCursorQuitar = CURSOR FOR
            SELECT value FROM STRING_SPLIT(@RolesQuitar, ',')

        OPEN @RolesCursorQuitar
        FETCH NEXT FROM @RolesCursorQuitar INTO @RolNombre

        WHILE @@FETCH_STATUS = 0
        BEGIN
            SELECT @RolID = RolID FROM Roles WHERE NombreRol = @RolNombre
            IF @RolID IS NOT NULL
            BEGIN
                DELETE FROM ClienteRoles
                WHERE ClienteID = @ClienteID AND RolID = @RolID
            END
            FETCH NEXT FROM @RolesCursorQuitar INTO @RolNombre
        END

        CLOSE @RolesCursorQuitar
        DEALLOCATE @RolesCursorQuitar
    END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerClientePorID]    Script Date: 12/12/2024 23:42:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Crear o modificar el procedimiento almacenado
CREATE PROCEDURE [dbo].[sp_ObtenerClientePorID]
    @ClienteID INT
AS
BEGIN
SET NOCOUNT ON;

    -- Validar que se proporcione un ID válido
    IF @ClienteID IS NULL
    BEGIN
        THROW 50001, 'Debe proporcionar un ClienteID para realizar la búsqueda.', 1;
    END

    -- Obtener los datos del cliente por ID
    SELECT 
        c.ClienteID,
        c.Nombre,
        c.Apellido,
        c.Email,
		c.Contraseña,
        c.Telefono,
        c.Direccion,
        c.FechaRegistro,
        c.Visible,
        c.UltimoAcceso,
        STRING_AGG(r.NombreRol, ', ') AS Roles -- Agrupar roles en una sola columna
    FROM 
        Clientes c
    LEFT JOIN 
        ClienteRoles cr ON c.ClienteID = cr.ClienteID
    LEFT JOIN 
        Roles r ON cr.RolID = r.RolID
    WHERE 
        c.ClienteID = @ClienteID
    GROUP BY 
        c.ClienteID, c.Nombre, c.Apellido, c.Email, c.Telefono, 
        c.Direccion, c.FechaRegistro, c.Visible, c.UltimoAcceso, c.Contraseña;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerConfiguracion]    Script Date: 12/12/2024 23:42:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ObtenerConfiguracion]
    @ConfigKey NVARCHAR(50) -- Parámetro de entrada para la clave de configuración
AS
BEGIN
    SET NOCOUNT ON;

    -- Retornar el ConfigValue correspondiente al ConfigKey proporcionado
    SELECT ConfigValue
    FROM Configuracion
    WHERE ConfigKey = @ConfigKey;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerCuotasPorPrestamo]    Script Date: 12/12/2024 23:42:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ObtenerCuotasPorPrestamo]
    @PrestamoID INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        CuotaID,
        PrestamoID,
        NumeroCuota,
        MontoCuota,
        FechaVencimiento,
        Estado
    FROM 
        Cuotas
    WHERE 
        PrestamoID = @PrestamoID
    ORDER BY 
        NumeroCuota;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerDetallePrestamo]    Script Date: 12/12/2024 23:42:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ObtenerDetallePrestamo]
    @PrestamoID INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        p.PrestamoID,
        p.ClienteID,
        c.Nombre AS ClienteNombre,
        p.MontoTotal,
        p.MontoConIntereses,
        p.TasaInteres,
        p.NumeroCuotas,
        p.FrecuenciaPago,
        p.FechaPrestamo,
        p.FechaVencimiento,
        p.Estado,
        c.Apellido AS ClienteApellido,
		p.EstadoAprobacion
    FROM 
        Prestamos p
    INNER JOIN 
        Clientes c ON p.ClienteID = c.ClienteID
    WHERE 
        p.PrestamoID = @PrestamoID;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerIdPrestamoPorCuota]    Script Date: 12/12/2024 23:42:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ObtenerIdPrestamoPorCuota]
    @CuotaID INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Seleccionar el IdPrestamo de la tabla Cuotas dado el IdCuota
    SELECT PrestamoID
    FROM Cuotas
    WHERE CuotaID = @CuotaID;

    -- Si no se encuentra el registro, puedes manejarlo como un valor NULL
    IF @@ROWCOUNT = 0
    BEGIN
        SELECT NULL AS IdPrestamo; -- Retorna NULL si no se encuentra el IdCuota
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerMontoCancelado]    Script Date: 12/12/2024 23:42:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ObtenerMontoCancelado]
    @PrestamoID INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Sumar el monto de las cuotas canceladas para el préstamo específico,
    -- devolviendo 0 si no existen cuotas canceladas
    SELECT ISNULL(SUM(MontoCuota), 0) AS MontoCancelado
    FROM Cuotas
    WHERE PrestamoID = @PrestamoID AND Estado = 'Cancelada';
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerPrestamosPendientesPorCliente]    Script Date: 12/12/2024 23:42:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ObtenerPrestamosPendientesPorCliente]
    @ClienteID INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        PrestamoID,
        ClienteID,
        MontoTotal,
        MontoConIntereses,
        TasaInteres,
        FechaPrestamo,
        FechaVencimiento,
        Estado,
        NumeroCuotas,
        FrecuenciaPago,
		EstadoAprobacion
    FROM 
        Prestamos
    WHERE 
        ClienteID = @ClienteID
        AND Estado = 'Pendiente';
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerPrestamosPorCliente]    Script Date: 12/12/2024 23:42:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ObtenerPrestamosPorCliente]
    @ClienteID INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        PrestamoID,
        ClienteID,
        MontoTotal,
        MontoConIntereses,
        TasaInteres,
        FechaPrestamo,
        FechaVencimiento,
        Estado,
        NumeroCuotas,
        FrecuenciaPago,
		EstadoAprobacion
    FROM 
        Prestamos
    WHERE 
        ClienteID = @ClienteID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerRolesPorCliente]    Script Date: 12/12/2024 23:42:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ObtenerRolesPorCliente]
    @ClienteID INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT R.RolID, R.NombreRol
    FROM Roles R
    INNER JOIN ClienteRoles CR ON R.RolID = CR.RolID
    WHERE CR.ClienteID = @ClienteID;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerTodosLosPrestamos]    Script Date: 12/12/2024 23:42:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ObtenerTodosLosPrestamos]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        PrestamoID,
        ClienteID,
        MontoTotal,
        MontoConIntereses,
        TasaInteres,
        FechaPrestamo,
        FechaVencimiento,
        Estado,
        NumeroCuotas,
        FrecuenciaPago,
		EstadoAprobacion
    FROM 
        Prestamos
    ORDER BY 
        FechaPrestamo DESC;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerValorConfiguracion]    Script Date: 12/12/2024 23:42:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ObtenerValorConfiguracion]
    @ConfigKey NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT ConfigValue
    FROM Configuracion
    WHERE ConfigKey = @ConfigKey;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_OcultarCliente]    Script Date: 12/12/2024 23:42:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_OcultarCliente]
    @ClienteID INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Clientes
    SET Visible = 0
    WHERE ClienteID = @ClienteID AND Visible = 1;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ValidarClienteWeb]    Script Date: 12/12/2024 23:42:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ValidarClienteWeb]
    @Email NVARCHAR(150),
    @Contraseña NVARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ClienteID INT = NULL;
    DECLARE @EsValido BIT = 0;

    -- Validar el usuario y comparar los hashes
    IF EXISTS (
        SELECT 1
        FROM Clientes c
        JOIN ClienteRoles cr ON c.ClienteID = cr.ClienteID
        JOIN Roles r ON cr.RolID = r.RolID
        WHERE c.Email = @Email
          AND c.Contraseña = @Contraseña
          AND r.NombreRol = 'Usuario'
          AND c.Visible = 1
    )
    BEGIN
        SET @ClienteID = (SELECT ClienteID FROM Clientes WHERE Email = @Email);
        SET @EsValido = 1;
    END

    IF @EsValido = 1
    BEGIN
        UPDATE Clientes
        SET UltimoAcceso = GETDATE()
        WHERE Email = @Email;
    END

    SELECT @EsValido AS EsValido, @ClienteID AS ClienteID;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ValidarUsuario]    Script Date: 12/12/2024 23:42:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ValidarUsuario]
    @Email NVARCHAR(150),
    @Contraseña NVARCHAR(255),
    @Resultado INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    -- Inicializar el resultado a 0
    SET @Resultado = 0;

    -- Verificar si el usuario existe con el rol de "Administrador"
    SELECT @Resultado = COUNT(*)
    FROM Clientes C
    INNER JOIN ClienteRoles CR ON C.ClienteID = CR.ClienteID
    INNER JOIN Roles R ON CR.RolID = R.RolID
    WHERE C.Email = @Email 
      AND C.Contraseña = @Contraseña
      AND R.NombreRol = 'Administrador'; -- Aquí aseguramos que solo los administradores puedan ingresar

    -- Nota: En una implementación real, se recomienda usar un método seguro para el almacenamiento y verificación de contraseñas
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_ValidarYRegistrarUltimoAcceso]    Script Date: 12/12/2024 23:42:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ValidarYRegistrarUltimoAcceso]
    @Email NVARCHAR(150),
    @Contraseña NVARCHAR(255),
    @Cuenta INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    -- Inicializar la salida en 0
    SET @Cuenta = 0;

    -- Verificar si el usuario existe con el email, contraseña, y tiene el rol de "Administrador"
    SELECT @Cuenta = COUNT(*)
    FROM Clientes C
    INNER JOIN ClienteRoles CR ON C.ClienteID = CR.ClienteID
    INNER JOIN Roles R ON CR.RolID = R.RolID
    WHERE C.Email = @Email 
      AND C.Contraseña = @Contraseña
      AND R.NombreRol = 'Administrador'; -- Aseguramos que solo los administradores sean contados

    -- Si el cliente tiene credenciales válidas y es administrador, actualizar el UltimoAcceso
    IF @Cuenta = 1
    BEGIN
        UPDATE Clientes
        SET UltimoAcceso = GETDATE()
        WHERE Email = @Email;
    END
END;
GO
USE [master]
GO
ALTER DATABASE [DeudasDB] SET  READ_WRITE 
GO
