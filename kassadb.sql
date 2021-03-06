USE [dbkassa]
GO
--
/****** Object:  Table [dbo].[bestelitems]    Script Date: 4-6-2020 22:44:32 ******/
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
/****** Object:  Table [dbo].[bestellingen]    Script Date: 4-6-2020 22:44:32 ******/
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
/****** Object:  Table [dbo].[klanten]    Script Date: 4-6-2020 22:44:32 ******/
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
/****** Object:  Table [dbo].[prijshistories]    Script Date: 4-6-2020 22:44:32 ******/
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
/****** Object:  Table [dbo].[product_soorten]    Script Date: 4-6-2020 22:44:32 ******/
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
/****** Object:  Table [dbo].[producten]    Script Date: 4-6-2020 22:44:32 ******/
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

INSERT [dbo].[bestelitems] ([id], [aantal], [bestelling_id], [product_id]) VALUES (8, 1, 7, 26)
INSERT [dbo].[bestelitems] ([id], [aantal], [bestelling_id], [product_id]) VALUES (9, 2, 7, 24)
INSERT [dbo].[bestelitems] ([id], [aantal], [bestelling_id], [product_id]) VALUES (10, 1, 7, 23)
INSERT [dbo].[bestelitems] ([id], [aantal], [bestelling_id], [product_id]) VALUES (11, 1, 7, 10)
INSERT [dbo].[bestelitems] ([id], [aantal], [bestelling_id], [product_id]) VALUES (12, 1, 7, 12)
INSERT [dbo].[bestelitems] ([id], [aantal], [bestelling_id], [product_id]) VALUES (13, 3, 7, 14)
INSERT [dbo].[bestelitems] ([id], [aantal], [bestelling_id], [product_id]) VALUES (14, 1, 7, 15)
INSERT [dbo].[bestelitems] ([id], [aantal], [bestelling_id], [product_id]) VALUES (15, 1, 7, 17)
SET IDENTITY_INSERT [dbo].[bestelitems] OFF
GO
SET IDENTITY_INSERT [dbo].[bestellingen] ON 

INSERT [dbo].[bestellingen] ([id], [datum], [klant_id]) VALUES (7, CAST(N'2020-06-04T21:47:24.510' AS DateTime), 3)
SET IDENTITY_INSERT [dbo].[bestellingen] OFF
GO
SET IDENTITY_INSERT [dbo].[klanten] ON 

INSERT [dbo].[klanten] ([id], [voornaam], [achternaam], [woonplaats], [telefoonnummer], [email]) VALUES (1, N'ronald', N'de graaff', N'roosendaal', N'06-12345678', N'rhm.degraaff@ziggo.nl')
INSERT [dbo].[klanten] ([id], [voornaam], [achternaam], [woonplaats], [telefoonnummer], [email]) VALUES (2, N'mark', N'de graaff', N'roosendaal', N'06-23456789', N'mark.de.graaff@outlook.nl')
INSERT [dbo].[klanten] ([id], [voornaam], [achternaam], [woonplaats], [telefoonnummer], [email]) VALUES (3, N'Ingrid', N'de Graaff', N'roosendaal', N'06-55966565', N'itm.graaff@ziggo.nl')
SET IDENTITY_INSERT [dbo].[klanten] OFF
GO
SET IDENTITY_INSERT [dbo].[prijshistories] ON 

INSERT [dbo].[prijshistories] ([id], [start_datum], [eind_datum], [prijs], [product_id]) VALUES (5, CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'2021-01-01T00:00:00.000' AS DateTime), 4.0000, 10)
INSERT [dbo].[prijshistories] ([id], [start_datum], [eind_datum], [prijs], [product_id]) VALUES (6, CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'2021-01-01T00:00:00.000' AS DateTime), 4.0000, 9)
INSERT [dbo].[prijshistories] ([id], [start_datum], [eind_datum], [prijs], [product_id]) VALUES (7, CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'2021-01-01T00:00:00.000' AS DateTime), 4.5000, 11)
INSERT [dbo].[prijshistories] ([id], [start_datum], [eind_datum], [prijs], [product_id]) VALUES (8, CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'2021-01-01T00:00:00.000' AS DateTime), 5.0000, 12)
INSERT [dbo].[prijshistories] ([id], [start_datum], [eind_datum], [prijs], [product_id]) VALUES (9, CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'2021-01-01T00:00:00.000' AS DateTime), 3.5000, 13)
INSERT [dbo].[prijshistories] ([id], [start_datum], [eind_datum], [prijs], [product_id]) VALUES (10, CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'2021-01-01T00:00:00.000' AS DateTime), 2.0000, 14)
INSERT [dbo].[prijshistories] ([id], [start_datum], [eind_datum], [prijs], [product_id]) VALUES (11, CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'2021-01-01T00:00:00.000' AS DateTime), 2.2500, 15)
INSERT [dbo].[prijshistories] ([id], [start_datum], [eind_datum], [prijs], [product_id]) VALUES (12, CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'2021-01-01T00:00:00.000' AS DateTime), 2.0000, 17)
INSERT [dbo].[prijshistories] ([id], [start_datum], [eind_datum], [prijs], [product_id]) VALUES (13, CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'2021-01-01T00:00:00.000' AS DateTime), 2.7500, 16)
INSERT [dbo].[prijshistories] ([id], [start_datum], [eind_datum], [prijs], [product_id]) VALUES (14, CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'2021-01-01T00:00:00.000' AS DateTime), 4.0000, 18)
INSERT [dbo].[prijshistories] ([id], [start_datum], [eind_datum], [prijs], [product_id]) VALUES (15, CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'2021-01-01T00:00:00.000' AS DateTime), 1.9000, 19)
INSERT [dbo].[prijshistories] ([id], [start_datum], [eind_datum], [prijs], [product_id]) VALUES (16, CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'2021-01-01T00:00:00.000' AS DateTime), 1.9000, 21)
INSERT [dbo].[prijshistories] ([id], [start_datum], [eind_datum], [prijs], [product_id]) VALUES (17, CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'2021-01-01T00:00:00.000' AS DateTime), 1.7500, 20)
INSERT [dbo].[prijshistories] ([id], [start_datum], [eind_datum], [prijs], [product_id]) VALUES (18, CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'2021-01-01T00:00:00.000' AS DateTime), 1.9000, 22)
INSERT [dbo].[prijshistories] ([id], [start_datum], [eind_datum], [prijs], [product_id]) VALUES (19, CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'2021-01-01T00:00:00.000' AS DateTime), 2.0000, 23)
INSERT [dbo].[prijshistories] ([id], [start_datum], [eind_datum], [prijs], [product_id]) VALUES (20, CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'2021-01-01T00:00:00.000' AS DateTime), 2.0000, 24)
INSERT [dbo].[prijshistories] ([id], [start_datum], [eind_datum], [prijs], [product_id]) VALUES (21, CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'2021-01-01T00:00:00.000' AS DateTime), 2.0000, 25)
INSERT [dbo].[prijshistories] ([id], [start_datum], [eind_datum], [prijs], [product_id]) VALUES (22, CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'2021-01-01T00:00:00.000' AS DateTime), 0.2500, 26)
SET IDENTITY_INSERT [dbo].[prijshistories] OFF
GO
SET IDENTITY_INSERT [dbo].[product_soorten] ON 

INSERT [dbo].[product_soorten] ([id], [soort]) VALUES (1, N'saladen')
INSERT [dbo].[product_soorten] ([id], [soort]) VALUES (2, N'frisdranken')
INSERT [dbo].[product_soorten] ([id], [soort]) VALUES (3, N'snacks')
INSERT [dbo].[product_soorten] ([id], [soort]) VALUES (4, N'bieren')
SET IDENTITY_INSERT [dbo].[product_soorten] OFF
GO
SET IDENTITY_INSERT [dbo].[producten] ON 

INSERT [dbo].[producten] ([id], [naam], [ps_id], [barcode]) VALUES (9, N'Caprese', 1, N'7095390739084')
INSERT [dbo].[producten] ([id], [naam], [ps_id], [barcode]) VALUES (10, N'Ceasar', 1, N'7630373267361')
INSERT [dbo].[producten] ([id], [naam], [ps_id], [barcode]) VALUES (11, N'Pasta', 1, N'9806390366365')
INSERT [dbo].[producten] ([id], [naam], [ps_id], [barcode]) VALUES (12, N'Hete Kip', 1, N'6832860743735')
INSERT [dbo].[producten] ([id], [naam], [ps_id], [barcode]) VALUES (13, N'CousCous', 1, N'8683673232675')
INSERT [dbo].[producten] ([id], [naam], [ps_id], [barcode]) VALUES (14, N'KaasSoufle', 3, N'7096734909026')
INSERT [dbo].[producten] ([id], [naam], [ps_id], [barcode]) VALUES (15, N'Frikandel', 3, N'3636236636361')
INSERT [dbo].[producten] ([id], [naam], [ps_id], [barcode]) VALUES (16, N'Mexicano', 3, N'5365682385322')
INSERT [dbo].[producten] ([id], [naam], [ps_id], [barcode]) VALUES (17, N'Kroket', 3, N'6798362798324')
INSERT [dbo].[producten] ([id], [naam], [ps_id], [barcode]) VALUES (18, N'Kip nuggets', 3, N'6839862630971')
INSERT [dbo].[producten] ([id], [naam], [ps_id], [barcode]) VALUES (19, N'Heineken', 4, N'6723232623666')
INSERT [dbo].[producten] ([id], [naam], [ps_id], [barcode]) VALUES (20, N'Hertog Jan', 4, N'6793697623808')
INSERT [dbo].[producten] ([id], [naam], [ps_id], [barcode]) VALUES (21, N'Grolsch', 4, N'6237868206075')
INSERT [dbo].[producten] ([id], [naam], [ps_id], [barcode]) VALUES (22, N'Bavaria', 4, N'6378292592263')
INSERT [dbo].[producten] ([id], [naam], [ps_id], [barcode]) VALUES (23, N'Fanta', 2, N'1234567890128')
INSERT [dbo].[producten] ([id], [naam], [ps_id], [barcode]) VALUES (24, N'Cola', 2, N'6239627962970')
INSERT [dbo].[producten] ([id], [naam], [ps_id], [barcode]) VALUES (25, N'7up', 2, N'5485454573242')
INSERT [dbo].[producten] ([id], [naam], [ps_id], [barcode]) VALUES (26, N'Tonic', 2, N'8757395627054')
SET IDENTITY_INSERT [dbo].[producten] OFF
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
