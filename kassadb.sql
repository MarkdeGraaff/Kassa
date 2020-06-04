USE [master]
GO
/****** Object:  Database [dbkassa]    Script Date: 4-6-2020 02:32:39 ******/
CREATE DATABASE [dbkassa]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbkassa', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\dbkassa.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbkassa_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\dbkassa_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbkassa].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbkassa] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbkassa] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbkassa] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbkassa] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbkassa] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbkassa] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbkassa] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbkassa] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbkassa] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbkassa] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbkassa] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbkassa] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbkassa] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbkassa] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbkassa] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbkassa] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbkassa] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbkassa] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbkassa] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbkassa] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbkassa] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbkassa] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbkassa] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dbkassa] SET  MULTI_USER 
GO
ALTER DATABASE [dbkassa] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbkassa] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbkassa] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbkassa] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbkassa] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'dbkassa', N'ON'
GO
ALTER DATABASE [dbkassa] SET QUERY_STORE = OFF
GO
USE [dbkassa]
GO
/****** Object:  Table [dbo].[bestelitems]    Script Date: 4-6-2020 02:32:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bestelitems](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[aantal] [int] NOT NULL,
	[bestelling_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
 CONSTRAINT [PK_bestelitems] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bestellingen]    Script Date: 4-6-2020 02:32:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bestellingen](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[datum] [datetime] NOT NULL,
	[klant_id] [int] NOT NULL,
 CONSTRAINT [PK_bestellingen] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[klanten]    Script Date: 4-6-2020 02:32:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[klanten](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[voornaam] [varchar](50) NOT NULL,
	[achternaam] [varchar](50) NOT NULL,
	[woonplaats] [varchar](50) NOT NULL,
	[telefoonnummer] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
 CONSTRAINT [PK_klanten] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[prijshistories]    Script Date: 4-6-2020 02:32:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[prijshistories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[start_datum] [datetime] NOT NULL,
	[eind_datum] [datetime] NOT NULL,
	[prijs] [money] NOT NULL,
	[product_id] [int] NOT NULL,
 CONSTRAINT [PK_prijshistories] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_soorten]    Script Date: 4-6-2020 02:32:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_soorten](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[soort] [varchar](50) NOT NULL,
 CONSTRAINT [PK_product_soorten] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[producten]    Script Date: 4-6-2020 02:32:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[producten](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[naam] [varchar](50) NOT NULL,
	[ps_id] [int] NOT NULL,
	[barcode] [varchar](128) NULL,
 CONSTRAINT [PK_producten] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[bestelitems] ON 

INSERT [dbo].[bestelitems] ([id], [aantal], [bestelling_id], [product_id]) VALUES (1, 1, 1, 1)
INSERT [dbo].[bestelitems] ([id], [aantal], [bestelling_id], [product_id]) VALUES (2, 1, 1, 3)
INSERT [dbo].[bestelitems] ([id], [aantal], [bestelling_id], [product_id]) VALUES (3, 1, 1, 2)
INSERT [dbo].[bestelitems] ([id], [aantal], [bestelling_id], [product_id]) VALUES (4, 2, 2, 4)
INSERT [dbo].[bestelitems] ([id], [aantal], [bestelling_id], [product_id]) VALUES (5, 1, 1, 2)
INSERT [dbo].[bestelitems] ([id], [aantal], [bestelling_id], [product_id]) VALUES (6, 1, 1, 3)
INSERT [dbo].[bestelitems] ([id], [aantal], [bestelling_id], [product_id]) VALUES (7, 4, 4, 1)
INSERT [dbo].[bestelitems] ([id], [aantal], [bestelling_id], [product_id]) VALUES (8, 1, 4, 3)
INSERT [dbo].[bestelitems] ([id], [aantal], [bestelling_id], [product_id]) VALUES (9, 26, 4, 5)
SET IDENTITY_INSERT [dbo].[bestelitems] OFF
GO
SET IDENTITY_INSERT [dbo].[bestellingen] ON 

INSERT [dbo].[bestellingen] ([id], [datum], [klant_id]) VALUES (1, CAST(N'2020-05-18T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[bestellingen] ([id], [datum], [klant_id]) VALUES (2, CAST(N'2020-05-19T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[bestellingen] ([id], [datum], [klant_id]) VALUES (3, CAST(N'2020-05-19T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[bestellingen] ([id], [datum], [klant_id]) VALUES (4, CAST(N'2020-06-04T02:27:17.950' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[bestellingen] OFF
GO
SET IDENTITY_INSERT [dbo].[klanten] ON 

INSERT [dbo].[klanten] ([id], [voornaam], [achternaam], [woonplaats], [telefoonnummer], [email]) VALUES (1, N'ronald', N'de graaff', N'roosendaal', N'06-12345678', N'rhm.degraaff@ziggo.nl')
INSERT [dbo].[klanten] ([id], [voornaam], [achternaam], [woonplaats], [telefoonnummer], [email]) VALUES (2, N'mark', N'de graaff', N'roosendaal', N'06-23456789', N'mark.de.graaff@outlook.nl')
SET IDENTITY_INSERT [dbo].[klanten] OFF
GO
SET IDENTITY_INSERT [dbo].[prijshistories] ON 

INSERT [dbo].[prijshistories] ([id], [start_datum], [eind_datum], [prijs], [product_id]) VALUES (1, CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'2020-03-01T00:00:00.000' AS DateTime), 2.0000, 1)
INSERT [dbo].[prijshistories] ([id], [start_datum], [eind_datum], [prijs], [product_id]) VALUES (2, CAST(N'2020-03-02T00:00:00.000' AS DateTime), CAST(N'2020-08-01T00:00:00.000' AS DateTime), 2.2000, 1)
INSERT [dbo].[prijshistories] ([id], [start_datum], [eind_datum], [prijs], [product_id]) VALUES (3, CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'2021-01-01T00:00:00.000' AS DateTime), 1.8000, 2)
INSERT [dbo].[prijshistories] ([id], [start_datum], [eind_datum], [prijs], [product_id]) VALUES (4, CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'2020-01-01T00:00:00.000' AS DateTime), 1.8000, 3)
INSERT [dbo].[prijshistories] ([id], [start_datum], [eind_datum], [prijs], [product_id]) VALUES (5, CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'2090-01-01T00:00:00.000' AS DateTime), 0.8000, 5)
SET IDENTITY_INSERT [dbo].[prijshistories] OFF
GO
SET IDENTITY_INSERT [dbo].[product_soorten] ON 

INSERT [dbo].[product_soorten] ([id], [soort]) VALUES (1, N'saladen')
INSERT [dbo].[product_soorten] ([id], [soort]) VALUES (2, N'dranken')
INSERT [dbo].[product_soorten] ([id], [soort]) VALUES (3, N'snacks')
INSERT [dbo].[product_soorten] ([id], [soort]) VALUES (4, N'bieren')
SET IDENTITY_INSERT [dbo].[product_soorten] OFF
GO
SET IDENTITY_INSERT [dbo].[producten] ON 

INSERT [dbo].[producten] ([id], [naam], [ps_id], [barcode]) VALUES (1, N'ceasar salade', 1, NULL)
INSERT [dbo].[producten] ([id], [naam], [ps_id], [barcode]) VALUES (2, N'Fanta', 2, NULL)
INSERT [dbo].[producten] ([id], [naam], [ps_id], [barcode]) VALUES (3, N'Cola', 2, NULL)
INSERT [dbo].[producten] ([id], [naam], [ps_id], [barcode]) VALUES (4, N'frikjandel', 3, NULL)
INSERT [dbo].[producten] ([id], [naam], [ps_id], [barcode]) VALUES (5, N'Cola light', 2, N'5449000050205')
INSERT [dbo].[producten] ([id], [naam], [ps_id], [barcode]) VALUES (6, N'Duvel', 4, NULL)
INSERT [dbo].[producten] ([id], [naam], [ps_id], [barcode]) VALUES (7, N'Hertog Jan', 4, NULL)
SET IDENTITY_INSERT [dbo].[producten] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_producten]    Script Date: 4-6-2020 02:32:40 ******/
CREATE NONCLUSTERED INDEX [IX_producten] ON [dbo].[producten]
(
	[barcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[bestelitems]  WITH CHECK ADD  CONSTRAINT [FK_bestelitems_bestellingen] FOREIGN KEY([bestelling_id])
REFERENCES [dbo].[bestellingen] ([id])
GO
ALTER TABLE [dbo].[bestelitems] CHECK CONSTRAINT [FK_bestelitems_bestellingen]
GO
ALTER TABLE [dbo].[bestelitems]  WITH CHECK ADD  CONSTRAINT [FK_bestelitems_producten] FOREIGN KEY([product_id])
REFERENCES [dbo].[producten] ([id])
GO
ALTER TABLE [dbo].[bestelitems] CHECK CONSTRAINT [FK_bestelitems_producten]
GO
ALTER TABLE [dbo].[bestellingen]  WITH CHECK ADD  CONSTRAINT [FK_bestellingen_klanten] FOREIGN KEY([klant_id])
REFERENCES [dbo].[klanten] ([id])
GO
ALTER TABLE [dbo].[bestellingen] CHECK CONSTRAINT [FK_bestellingen_klanten]
GO
ALTER TABLE [dbo].[prijshistories]  WITH CHECK ADD  CONSTRAINT [FK_prijshistories_producten] FOREIGN KEY([product_id])
REFERENCES [dbo].[producten] ([id])
GO
ALTER TABLE [dbo].[prijshistories] CHECK CONSTRAINT [FK_prijshistories_producten]
GO
ALTER TABLE [dbo].[producten]  WITH CHECK ADD  CONSTRAINT [FK_producten_product_soorten] FOREIGN KEY([ps_id])
REFERENCES [dbo].[product_soorten] ([id])
GO
ALTER TABLE [dbo].[producten] CHECK CONSTRAINT [FK_producten_product_soorten]
GO
USE [master]
GO
ALTER DATABASE [dbkassa] SET  READ_WRITE 
GO
