USE [master]
GO
/****** Object:  Database [MagicBooksDB]    Script Date: 2015-06-02 10:27:28 ******/
CREATE DATABASE [MagicBooksDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MagicBooksDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MJMSTATSERVER\MSSQL\DATA\MagicBooksDB.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MagicBooksDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MJMSTATSERVER\MSSQL\DATA\MagicBooksDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MagicBooksDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MagicBooksDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MagicBooksDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MagicBooksDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MagicBooksDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MagicBooksDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MagicBooksDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [MagicBooksDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MagicBooksDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MagicBooksDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MagicBooksDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MagicBooksDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MagicBooksDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MagicBooksDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MagicBooksDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MagicBooksDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MagicBooksDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MagicBooksDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MagicBooksDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MagicBooksDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MagicBooksDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MagicBooksDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MagicBooksDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MagicBooksDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MagicBooksDB] SET RECOVERY FULL 
GO
ALTER DATABASE [MagicBooksDB] SET  MULTI_USER 
GO
ALTER DATABASE [MagicBooksDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MagicBooksDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MagicBooksDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MagicBooksDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [MagicBooksDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MagicBooksDB', N'ON'
GO
USE [MagicBooksDB]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 2015-06-02 10:27:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Street] [nvarchar](max) NOT NULL,
	[ZipCode] [nvarchar](max) NOT NULL,
	[City] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Author]    Script Date: 2015-06-02 10:27:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Author](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Author] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AuthorBook]    Script Date: 2015-06-02 10:27:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuthorBook](
	[AuthorId] [int] NOT NULL,
	[BookId] [int] NOT NULL,
 CONSTRAINT [PK_AuthorBook] PRIMARY KEY CLUSTERED 
(
	[AuthorId] ASC,
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Book]    Script Date: 2015-06-02 10:27:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[ImagePath] [nvarchar](max) NULL,
	[ISBN] [nvarchar](max) NOT NULL,
	[LanguageId] [int] NOT NULL,
	[PageNumber] [int] NOT NULL,
	[PublishingDate] [datetime] NOT NULL,
	[PublisherId] [int] NOT NULL,
	[Weight] [int] NOT NULL,
	[Price] [money] NOT NULL,
	[FormatId] [int] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[SeriesId] [int] NULL,
	[QuantityInStock] [int] NOT NULL,
	[NotOnSale] [bit] NOT NULL CONSTRAINT [DF_Book_NotOnSale]  DEFAULT ((0)),
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BookGenre]    Script Date: 2015-06-02 10:27:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookGenre](
	[BookId] [int] NOT NULL,
	[GenreId] [int] NOT NULL,
 CONSTRAINT [PK_BookGenre] PRIMARY KEY CLUSTERED 
(
	[BookId] ASC,
	[GenreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Contact]    Script Date: 2015-06-02 10:27:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SocialSecurityNumber] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[CellPhoneNumber] [nvarchar](max) NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[AddressId] [int] NOT NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DeliveryType]    Script Date: 2015-06-02 10:27:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeliveryType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_DeliveryType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Format]    Script Date: 2015-06-02 10:27:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Format](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Format] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Genre]    Script Date: 2015-06-02 10:27:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genre](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Genre] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Language]    Script Date: 2015-06-02 10:27:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Language](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Language] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order]    Script Date: 2015-06-02 10:27:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AddressId] [int] NOT NULL,
	[ContactId] [int] NOT NULL,
	[Comment] [nvarchar](max) NULL,
	[OrderDate] [date] NOT NULL,
	[OrderNumber] [nvarchar](max) NOT NULL,
	[TotalPrice] [money] NOT NULL,
	[DeliveryTypeId] [int] NOT NULL,
	[PaymentTypeId] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 2015-06-02 10:27:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[QuantityOrdered] [int] NOT NULL,
	[BookId] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PaymentType]    Script Date: 2015-06-02 10:27:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_PaymentType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Publisher]    Script Date: 2015-06-02 10:27:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publisher](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Publisher] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Reader]    Script Date: 2015-06-02 10:27:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reader](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Reader] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ReaderInBook]    Script Date: 2015-06-02 10:27:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReaderInBook](
	[ReaderId] [int] NOT NULL,
	[BookId] [int] NOT NULL,
 CONSTRAINT [PK_ReaderInBook] PRIMARY KEY CLUSTERED 
(
	[ReaderId] ASC,
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Series]    Script Date: 2015-06-02 10:27:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Series](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Series] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Address] ON 

INSERT [dbo].[Address] ([Id], [Street], [ZipCode], [City]) VALUES (1, N'Slottsskogsgatan 24', N'41453', N'25')
INSERT [dbo].[Address] ([Id], [Street], [ZipCode], [City]) VALUES (2, N'Bragatan 111', N'41453', N'Göteborg')
INSERT [dbo].[Address] ([Id], [Street], [ZipCode], [City]) VALUES (3, N'zxc', N'41453', N'Göteborg')
SET IDENTITY_INSERT [dbo].[Address] OFF
SET IDENTITY_INSERT [dbo].[Author] ON 

INSERT [dbo].[Author] ([Id], [FirstName], [LastName]) VALUES (1, N'Björn', N'Wahlroos')
INSERT [dbo].[Author] ([Id], [FirstName], [LastName]) VALUES (2, N'Jussi', N'Adler-olsen')
INSERT [dbo].[Author] ([Id], [FirstName], [LastName]) VALUES (3, N'Jakob', N'Wegelius')
INSERT [dbo].[Author] ([Id], [FirstName], [LastName]) VALUES (4, N'Astrid', N'Lindgren')
INSERT [dbo].[Author] ([Id], [FirstName], [LastName]) VALUES (5, N'Rolf', N'Staflin')
INSERT [dbo].[Author] ([Id], [FirstName], [LastName]) VALUES (6, N'Inger', N'Ingmanson')
INSERT [dbo].[Author] ([Id], [FirstName], [LastName]) VALUES (7, N'Mats', N'Heide')
INSERT [dbo].[Author] ([Id], [FirstName], [LastName]) VALUES (8, N'Catrin', N'Johansson')
INSERT [dbo].[Author] ([Id], [FirstName], [LastName]) VALUES (9, N'Charlotte', N'Simonsson')
INSERT [dbo].[Author] ([Id], [FirstName], [LastName]) VALUES (10, N'Brené', N'Brown')
INSERT [dbo].[Author] ([Id], [FirstName], [LastName]) VALUES (11, N'Astrid', N'Lindgren')
INSERT [dbo].[Author] ([Id], [FirstName], [LastName]) VALUES (12, N'Rolf', N'Staflin')
INSERT [dbo].[Author] ([Id], [FirstName], [LastName]) VALUES (13, N'Marianne', N'Cedervall')
INSERT [dbo].[Author] ([Id], [FirstName], [LastName]) VALUES (14, N'Karin', N'Nyman')
INSERT [dbo].[Author] ([Id], [FirstName], [LastName]) VALUES (15, N'Ann', N'Heberlein')
INSERT [dbo].[Author] ([Id], [FirstName], [LastName]) VALUES (16, N'Roy', N'Fares')
INSERT [dbo].[Author] ([Id], [FirstName], [LastName]) VALUES (17, N'Giulia', N'Enders')
INSERT [dbo].[Author] ([Id], [FirstName], [LastName]) VALUES (18, N'Fredrik', N'Backman')
INSERT [dbo].[Author] ([Id], [FirstName], [LastName]) VALUES (19, N'Jo', N'Nesbø')
INSERT [dbo].[Author] ([Id], [FirstName], [LastName]) VALUES (20, N'Mikael', N'Holmqvist')
INSERT [dbo].[Author] ([Id], [FirstName], [LastName]) VALUES (21, N'Fredrik', N'Eklund')
INSERT [dbo].[Author] ([Id], [FirstName], [LastName]) VALUES (22, N'Bruce', N'Littlefield')
INSERT [dbo].[Author] ([Id], [FirstName], [LastName]) VALUES (23, N'Görel', N'Cavalli-björkman')
INSERT [dbo].[Author] ([Id], [FirstName], [LastName]) VALUES (24, N'Lars', N'Wilderäng')
SET IDENTITY_INSERT [dbo].[Author] OFF
INSERT [dbo].[AuthorBook] ([AuthorId], [BookId]) VALUES (1, 14)
INSERT [dbo].[AuthorBook] ([AuthorId], [BookId]) VALUES (2, 13)
INSERT [dbo].[AuthorBook] ([AuthorId], [BookId]) VALUES (3, 15)
INSERT [dbo].[AuthorBook] ([AuthorId], [BookId]) VALUES (4, 16)
INSERT [dbo].[AuthorBook] ([AuthorId], [BookId]) VALUES (5, 17)
INSERT [dbo].[AuthorBook] ([AuthorId], [BookId]) VALUES (6, 18)
INSERT [dbo].[AuthorBook] ([AuthorId], [BookId]) VALUES (7, 19)
INSERT [dbo].[AuthorBook] ([AuthorId], [BookId]) VALUES (8, 19)
INSERT [dbo].[AuthorBook] ([AuthorId], [BookId]) VALUES (9, 19)
INSERT [dbo].[AuthorBook] ([AuthorId], [BookId]) VALUES (13, 20)
INSERT [dbo].[AuthorBook] ([AuthorId], [BookId]) VALUES (14, 16)
INSERT [dbo].[AuthorBook] ([AuthorId], [BookId]) VALUES (15, 21)
INSERT [dbo].[AuthorBook] ([AuthorId], [BookId]) VALUES (16, 22)
INSERT [dbo].[AuthorBook] ([AuthorId], [BookId]) VALUES (17, 23)
INSERT [dbo].[AuthorBook] ([AuthorId], [BookId]) VALUES (18, 24)
INSERT [dbo].[AuthorBook] ([AuthorId], [BookId]) VALUES (19, 25)
INSERT [dbo].[AuthorBook] ([AuthorId], [BookId]) VALUES (20, 26)
INSERT [dbo].[AuthorBook] ([AuthorId], [BookId]) VALUES (21, 27)
INSERT [dbo].[AuthorBook] ([AuthorId], [BookId]) VALUES (22, 27)
INSERT [dbo].[AuthorBook] ([AuthorId], [BookId]) VALUES (23, 31)
INSERT [dbo].[AuthorBook] ([AuthorId], [BookId]) VALUES (24, 32)
SET IDENTITY_INSERT [dbo].[Book] ON 

INSERT [dbo].[Book] ([Id], [Title], [ImagePath], [ISBN], [LanguageId], [PageNumber], [PublishingDate], [PublisherId], [Weight], [Price], [FormatId], [Description], [SeriesId], [QuantityInStock], [NotOnSale]) VALUES (13, N'Den gränslösehehe', N'http://www.adlibris.com/se/organisationer/covers/M/9/17/9174332953.jpg', N'9174332953', 1, 0, CAST(N'2015-05-08 00:00:00.000' AS DateTime), 2, 344, 298.0000, 2, N'En telefonsignal skär genom källaren i Köpenhamns polishus och väcker kriminalinspektör Carl Mørck från den sedvanliga morgonluren med fötterna på skrivbordet. När Carl förstår att kollegan från Bornholm vill ha Avdelning Q:s hjälp med ett gammalt hopplöst fall blir han genast avvisande. I andra änden av tråden läggs luren tyst på. Några få timmar senare står det klart att konsekvenserna av Carls kallsinnighet varit katastrofala. Tillsammans med kollegorna Assad, Rose och Gordon dras Carl in i utredningen av en sjutton år gammal tragedi. En ung livsglad kvinna försvann från en folkhögskola på Bornholm och hittades död hängande i ett träd några kilometer därifrån. För den skeptiskt lagde Carl blir det mystiska fallet särskilt svårt att finna reda i. Efterforskningarna leder till en soldyrkande sekt på Öland och en manipulatör med järnvilja som inte skyr några medel för att skydda sig själv och de sina. Den gränslöse är den sjätte delen i Jussi Adler- Olsens hyllade kriminalserie om Avdelning Q. En berättelse om vanvett, passion och besatthet." Jussi Adler- Olsen är i toppform" Jyllands- Posten', 1, 10, 0)
INSERT [dbo].[Book] ([Id], [Title], [ImagePath], [ISBN], [LanguageId], [PageNumber], [PublishingDate], [PublisherId], [Weight], [Price], [FormatId], [Description], [SeriesId], [QuantityInStock], [NotOnSale]) VALUES (14, N'De tio sämsta ekonomiska teorierna : från Keynes till Piketty', N'http://www.adlibris.com/se/organisationer/covers/M/9/10/9100149004.jpg', N'9100149004', 1, 413, CAST(N'2015-05-19 00:00:00.000' AS DateTime), 1, 592, 163.0000, 1, N'Recepten för en stabil ekonomisk utveckling är varken hemliga eller okända, men de är svåra att genomföra i ett demokratiskt samhällssystem. För att citera E U-ordförande Jean- Claude Juncker: " Vi vet alla vad vi måste göra, vi vet bara inte hur vi ska kunna bli återvalda efter att vi gjort det". De etablerade ekonomiska teorierna står idag inför en omprövning. Björn Wahlroos har valt tio teorier, eller antaganden, alla grundläggande för den forskning som kritiserar den ekonomiska laissez faire-skolan. Han undersöker dessa teoriers förmåga att hantera vår tids ekonomiska verklighet. De visar sig vara trubbiga verktyg. ', NULL, 0, 0)
INSERT [dbo].[Book] ([Id], [Title], [ImagePath], [ISBN], [LanguageId], [PageNumber], [PublishingDate], [PublisherId], [Weight], [Price], [FormatId], [Description], [SeriesId], [QuantityInStock], [NotOnSale]) VALUES (15, N'Mördarens apa', N'http://www.adlibris.com/se/organisationer/covers/M/9/16/9163877384.jpg', N'9163877384', 1, 617, CAST(N'2014-04-02 00:00:00.000' AS DateTime), 3, 930, 177.0000, 3, N'2014 års Augustprisvinnare i barn- och ungdomsbokskategorin! Årets svenska barn- och ungdomsbok. Med motiveringen:  Legenden om Sally Jones har fått sin fortsättning, nedskriven av gorillan Sally själv. Hennes vän Chiefen blir oskyldigt anklagad för ett mord och Sally måste rentvå hans namn. Det tar henne ut på ett svindlande äventyr, återgivet så levande att dofterna från Lissabons gränder och skummet från stormiga sjöresor stiger upp ur pappret. Jakob Wegelius berättarglädje ackompanjeras av detaljrika och tidstypiska porträtt och vinjetter i svartvitt. Välkommen in i en helt annan värld! En makalös och vindlande historia om ett gåtfullt mordfall Augustprisvinnaren Jakob Wegelius nya bok är en makalös och vindlande historia om ett gåtfullt mordfall. Berättelsen rör sig från Lissabons nattliga hamnkvarter, över de stora oceanerna, till mysterierna vid en indisk maharadjas hov. Det är en historia om mörka hemligheter och svåra brott, men även om oväntad vänskap, hopp och förlåtelse. Mördarens apa är en fristående fortsättning på den hyllade Legenden om Sally Jones från 2008. Historiens berättare är gorillan Sally Jones, maskinist på lastskutan Hudson Queen. Hon och hennes vän, sjömannen som kallas för Chiefen, är strandsatta i Lissabon. Där blir de inlurade i en smugglingsaffär som slutar illa. Hudson Queen går under och Chiefen blir oskyldigt dömd för mordet på den skugglike Alphonse Morro. För Sally Jones börjar en lång och svår kamp, både för sin egen överlevnad och för att rentvå Chiefen. Hon har mäktiga krafter emot sig. Krafter som till varje pris vill skydda hemligheterna som Morro tog med sig när han försvann i floden Tejos svarta strömvirvlar. Denna sällsamma berättelse är rikligt illustrerad med fantastiska och fantasieggande bilder i svartvitt, alla gjorda med utsökt precision in i minsta detalj. Sagt om Legenden om Sally Jones:" Det här måste vara en av årets bästa och högst konstnärliga bilderböcker - en bok om vänskap, längtan, hopp och svek." Svante Ors, Bibliotekstjänst "... så vackert skriven och så finurligt komponerad att man blir alldeles varm om hjärtat. Tänk att det fortfarande görs sådana här böcker ...", Expressen Sagt om Mördarens apa?:" Det blir en femma. Det är en fantastisk bok!" Yukiko Duke, SV T Gomorron" Boken är riktigt spännande och målande skriven. Det är svårt att sluta läsa och man känner med karaktärerna. Ett mästerverk." ? Kamratposten, Bokpanelen, ger betyg 5 av 5 möjliga." Jakob Wegelius ger än en gång prov på sin säkra berättarförmåga och sin förmämliga illustrationskonst. /.../ I '' Mördarens apa'' finns kopplingar till den klassiska deckaren, till äventyrsberättelser och saltmättade sjöhistorier från förr. Wegelius har skrivit och tecknat en verklig allåldersbok, idealisk för högläsning." Svenska Dagbladet, Lena Kåreland', NULL, 6, 0)
INSERT [dbo].[Book] ([Id], [Title], [ImagePath], [ISBN], [LanguageId], [PageNumber], [PublishingDate], [PublisherId], [Weight], [Price], [FormatId], [Description], [SeriesId], [QuantityInStock], [NotOnSale]) VALUES (16, N'Krigsdagböcker 1939-1945', N'http://www.adlibris.com/se/organisationer/covers/M/9/18/9187659042.jpg', N'9187659042', 1, 366, CAST(N'2015-04-27 00:00:00.000' AS DateTime), 4, 957, 199.0000, 1, N'I maj 2015 är det 70 år sedan andra världskriget tog slut. Under hela kriget skriver Astrid Lindgren dagbok där hon berättar om vardagen i Stockholm, om det som händer i världen och om Sveriges agerande under kriget. Astrid Lindgrens krigsdagböcker är en mycket personlig skildring av hur dramatiska världshändelser påverkar oss alla. Texten är laddad med stor sorg och förfäran. Det här är före Astrid Lindgrens tid som världsberömd författare; den första boken om Pippi Långstrump kommer ut samma år som kriget slutar, 1945.  Blandat med Astrid Lindgrens egna anteckningar innehåller dagböckerna mängder av utklippta artiklar ur svenska tidningar som hon kommenterar. I boken återfinns över 70 faksimilbilder av dagboksuppslagen och många hittills opublicerade familjebilder från krigsåren. Författaren Kerstin Ekman, som kände Astrid Lindgren, skriver förord och Astrids dotter, Karin Nyman, skriver efterord. Totalt är det 17 dagböcker som kommer ut i bokform. Astrid Lindgren är ständigt aktuell och en daglig referenspunkt i samhällsdebatten. Hennes böcker är en omistlig del av vårt kulturarv och når oavbrutet nya läsare och får nya betydelser runt om i världen. Vad många inte vet är att hon var en tidig anti-nazist och att hon genom hela sitt liv kämpade mot krig och våld. Hon var en övertygad humanist och en människa som tänkte själv, stod för sina åsikter med såväl civilkurage som humor och kärlek. I maj 2015 släpps Astrid Lindgrens krigsdagböcker så som hon skrev dem. Ett unikt dokument från en vanlig människa och en av världens mest kända svenskar.', NULL, 9, 0)
INSERT [dbo].[Book] ([Id], [Title], [ImagePath], [ISBN], [LanguageId], [PageNumber], [PublishingDate], [PublisherId], [Weight], [Price], [FormatId], [Description], [SeriesId], [QuantityInStock], [NotOnSale]) VALUES (17, N'HTML och CSS-boken', N'http://www.adlibris.com/se/organisationer/covers/M/9/16/9163609940.jpg', N'9163609940', 1, 505, CAST(N'2011-11-30 00:00:00.000' AS DateTime), 5, 794, 204.0000, 4, N'Den sjunde upplagan av HTM L och CS S-boken täcker in HTM L5, XHTM L och CS S. Boken börjar från grunden och innehåller allt du behöver veta för att skriva webbsidor. Författaren beskriver systematiskt, med hundratals exempel, hur du lägger in rätt taggar så att dina webbsidor får det utseende och den funktion du vill. Du kan ha stor glädje av att kunna HTM L även om du använder andra program som skapar HTM L-kod, eller översätter färdiga dokument till HTM L. HTM L- och CS S-boken är skriven för Linux-, Mac- och P C-användare. Betoningen ligger på hur man skriver dokument som kan visas på alla datorer och med alla webläsare. Skillnaderna mellan XHTM L och HTM L tas upp efter hand. Boken har blivit mycket uppskattad och den här upplagan markerar bokens femtonårsjubileum. Den nya upplagan är som alltid noggrant genomarbetad och uppdaterad in i minsta detalj för att vara helt aktuell. O M FÖRFATTAREN Rolf Staflin är fil.mag. i datavetenskap och arbetar som I T-arkitekt och utvecklare på konsultbas. Han har arbetat med allt från enkla webbplatser med några få sidor till stora EJ B-baserade klient/serversystem med tusentals användare. De senaste åren har Rolf utvecklat ett tiotal appar för i Phone och Android samt webbplatser för mobila enheter.', 2, 7, 0)
INSERT [dbo].[Book] ([Id], [Title], [ImagePath], [ISBN], [LanguageId], [PageNumber], [PublishingDate], [PublisherId], [Weight], [Price], [FormatId], [Description], [SeriesId], [QuantityInStock], [NotOnSale]) VALUES (18, N'Kan man äta sånt?', N'http://www.adlibris.com/se/organisationer/covers/M/9/11/911306486X.jpg', N'911306486X', 1, 172, CAST(N'2014-07-14 00:00:00.000' AS DateTime), 6, 0, 360.0000, 4, N'Långt fler vilda växter än man tror kan ätas - ibland kan man äta bladen och blommorna, ibland rötterna eller frukterna. Förr i tiden torkades många växter, maldes och blandades t.ex. i mjölet under år med missväxt - eller användes som läkeörter. Numera går vi ut och samlar vilda växter, bär och svamp för att det är roligt, nyttigt och ger nya smakupplevelser. Dessutom får vi bättre kontroll över det vi stoppar i oss! Och inte behöver vi bege oss ut i skogen för att plocka. I parker, på gårdar och andra öppna platser i städerna finns det gott om s.k. ogräs som lätt kan förvandlas till rena läckerheterna. Kan man äta sånt? presenterar våra ätliga vilda växter, hur de ser ut, var de växer och hur de kan användas. Vi får också veta hur de användes förr. Insprängda i presentationerna finns tillagningstips och recept. I slutet av boken hittar vi grundrecept på örtteer, såser, drinkar, gratänger, soppor, buljonger, pannkakor, bröd och pajer samt tips om konservering, inläggningar, vintillverkning, brännvins- och likörkryddning. Några pressröster:&rdquo; Hela boken genomsyras av experimentlustans glädje av att se, känna, lukta, smaka och uppleva.&rdquo; Fauna och flora&rdquo; Hon har gjort ett storslaget arbete.&rdquo; Upsala Nya Tidning&rdquo; En oumbärlig bok om man har intresse av att veta vilka läckerheter vi av okunnighet går och trampar på.&rdquo; Ekoteket&nbsp;&nbsp;', NULL, 8, 0)
INSERT [dbo].[Book] ([Id], [Title], [ImagePath], [ISBN], [LanguageId], [PageNumber], [PublishingDate], [PublisherId], [Weight], [Price], [FormatId], [Description], [SeriesId], [QuantityInStock], [NotOnSale]) VALUES (19, N'Kommunikation i organisationer', N'http://www.adlibris.com/se/organisationer/covers/M/9/14/9147094834.jpg', N'9147094834', 1, 281, CAST(N'2012-08-14 00:00:00.000' AS DateTime), 7, 514, 324.0000, 5, N'Arbetsuppgifterna i dagens organisationer består i stor utsträckning av kommunikation. Det gäller inte bara professionella kommunikatörer utan också chefer och medarbetare. Hela organisationen existens och framgång är beroende av en väl fungerande kommunikation. Läs mer Den här boken tar upp den teoretiska grunden kring nyckelbegrepp inom kommunikation och organisation liksom själva processerna med koppling till organisationens visionsarbete, ledarskap, lärande och identitet. I den andra upplagan av boken har författarna integrerat nya forskningsresultat sedan den första upplagan publicerades. Flera kapitel är helt omarbetade och ett nytt kapitel om sociala medier och intern kommunikation har tillkommit. Boken är i första hand tänkt som en lärobok för studenter inom området organisationskommunikation. Boken riktar sig även till chefer, projektledare, kommunikatörer, H R-specialister, marknadsförare och andra som arbetar praktiskt med kommunikation i organisationer. Om författarna Mats Heide är docent vid Lunds Universitet, Catrin Johansson är docent vid Mittuniversitetet och Charlotte Simonsson är fil.dr vid Lunds Universitet.', 3, 10, 0)
INSERT [dbo].[Book] ([Id], [Title], [ImagePath], [ISBN], [LanguageId], [PageNumber], [PublishingDate], [PublisherId], [Weight], [Price], [FormatId], [Description], [SeriesId], [QuantityInStock], [NotOnSale]) VALUES (20, N'Stormsvala', N'http://www.adlibris.com/se/organisationer/covers/M/9/17/9170368295.jpg', N'9170368295', 1, 0, CAST(N'2013-03-21 00:00:00.000' AS DateTime), 11, 166, 281.0000, 2, N'Till New York har de kommit för att hjälpa sina döttrar, som startat ett lyxigt svenskt spa på Manhattan. Hervors dotter Ingrid får ett gåtfullt brev från Sverige och en manlig kund lyckas påverka Hervor så till den milda grad att hon till och med tappar sin förmåga att skåda in i framtiden. Hon hävdar bestämt att hon är utbränd, vilket Mirjam inte riktigt tror på. Mirjam litar inte på den charmige mannen som har tid att vara på spaet ständigt och jämt. Dessutom tar han sig in i deras bostad. Vem är han egentligen och vad gör han i New York? Här är den fjärde boken i serien om Mirjam och Hervor!om tidigare böcker i serien: Svinhugg innehåller både en spännande och oväntad historia, sköna miljöer och mustiga karaktärer. Den lappländska Hervor som inte spottar i glaset och svär som en borstbindare, är en favorit. Marianne Cedervall lovar fler böcker om Mirjam och Hervor. Något att se fram emot. Susanne Blick, SKT F- Tidningen Det här är en underbar roman av debutanten Marianne Cedervall! Den är både varm, finurlig och full av humor och man bara måste veta hur det går för Mirjam! Birgitta Delbrand, Året Runt Underbart makaber debutroman som imponerar Gunilla Weddin, Skånskan', 4, 4, 0)
INSERT [dbo].[Book] ([Id], [Title], [ImagePath], [ISBN], [LanguageId], [PageNumber], [PublishingDate], [PublisherId], [Weight], [Price], [FormatId], [Description], [SeriesId], [QuantityInStock], [NotOnSale]) VALUES (21, N'Gud, om vi ska talas vid du och jag måste jag vara helt ärlig', N'http://www.adlibris.com/se/organisationer/covers/M/9/10/9100138673.jpg', N'9100138673', 1, 133, CAST(N'2015-03-18 00:00:00.000' AS DateTime), 1, 190, 133.0000, 1, N'" Gud, om vi ska talas vid du och jag måste jag vara helt ärlig. Vem är du egentligen? Vad vill du? Vill du någonting alls, med mig? Ska vi ta vår relation vidare, eller ska vi bryta här?" I en svidande vidräkning med Gud söker Ann Heberlein svar på de klassiska teologiska frågorna - om Guds egenskaper, om allmakten och ondskan - och ifrågasätter Guds patriarkala framtoning. Svaren hon finner och får är inte vad hon förväntar sig. Gud visar sig vara någon annan än den hon föreställt sig."... berörande och befriande." Borås Tidning', NULL, 23, 0)
INSERT [dbo].[Book] ([Id], [Title], [ImagePath], [ISBN], [LanguageId], [PageNumber], [PublishingDate], [PublisherId], [Weight], [Price], [FormatId], [Description], [SeriesId], [QuantityInStock], [NotOnSale]) VALUES (22, N'United States of Cakes : bakverk och sötsaker från den amerikanska västkusten', N'http://www.adlibris.com/se/organisationer/covers/M/9/17/9174243381.jpg', N'9174243381', 1, 173, CAST(N'2013-09-03 00:00:00.000' AS DateTime), 12, 850, 179.0000, 1, N'Ta en cookie till! Mästerkonditorn Roy Fares drar till Los Angeles för att utforska de amerikanska bakverken. Och här är han verkligen i sitt rätta element, för i änglarnas stad tar man ut svängarna rejält när det kommer till bakning. Inför den här boken ville Roy fördjupa sina kunskaper om amerikanska sötsaker och besökte i L A flera världskända bagerier är man delar hans djupa passion för söta saker. Några av deras bästa recept finns med i boken, men givetvis med en Roy-twist! Boken innehåller 55 recept och är indelad i fem kapitel: Mjuka kakor, Cookies och konfektyr, Tårtor, cheesecakes och pajer, Cupcakes och Cake pops och slutligen Sweet breakfast. Här varvas klassiska amerikanska bakverk med nya och överraskande recept. En del kakor är härligt rustika medan andra är ogenerat frossiga i allt vad som finns i sockerväg. Snickers cheesecake, Frozen Peanutbutter cream pie, Capuccino cupcakes, Chocolate waffles, Fudge brownies eller Banana nutbread är bara några exempel på allt det härliga som väntar på att bli bakat. Risk för Super Duper Sugar Overload? Självklart! Det här är ingen vanlig bok med de bästa amerikanska kakrecepten. För lika mycket som man kan njuta av receptens dofter och smaker kan man njuta av det stora och snygga bildmaterialet. Med Roy som ciceron åker vi till olika delar av jättestaden L A och bjuds på bilder som ger en skön känsla av att faktiskt vara där själv.', NULL, 5, 0)
INSERT [dbo].[Book] ([Id], [Title], [ImagePath], [ISBN], [LanguageId], [PageNumber], [PublishingDate], [PublisherId], [Weight], [Price], [FormatId], [Description], [SeriesId], [QuantityInStock], [NotOnSale]) VALUES (23, N'Charmen med tarmen : allt om ett av kroppens mest underskattade organ', N'http://www.adlibris.com/se/organisationer/covers/M/9/13/9137143921.jpg', N'9137143921', 1, 253, CAST(N'2014-12-23 00:00:00.000' AS DateTime), 13, 414, 169.0000, 1, N'Tarmen pratar vi inte gärna om &ndash; det är det dags att ändra på. Tarmsystemet är grundläggande för både kropp och själ och förtjänar att tas på största allvar. Det har stor inverkan på hur vi mår. Ny forskning visar att övervikt, depressioner, allergier och Alzheimers kan orsakas av obalans i tarmfloran. Och kopplingen mellan hjärnan och tarmen är av avgörande betydelse. Är det sant att vi alla sitter på fel sätt på toaletten? Vad är det vi får i oss när vi äter? Hur gör man för att rapa lättare? Vad har blindtarmen egentligen för funktion? Giulia Enders ger svar och lär oss att förstå kroppens reaktioner utifrån de senaste forskningsrönen. På ett enkelt och underhållande sätt förklarar hon hur vi kan uppnå välbefinnande, åldras friskt och leva lyckligare." Den unga tyska läkaren Giulia Enders skriver glatt och frejdigt om alla möjliga tarmrelateradefrågor, från hur man bäst ska sitta på toastolen till vad avföringens färg kan betyda, varför stress inte är bra för tarmen, varför kräkningar är gynnsamma och hur olika sorters tarmbakterier kan bidra till övervikt. Bokens hurtiga titel gjorde mig först tveksam, men författarens ungdomligt skojfriska ton fungerar i huvudsak bra, och får läsaren att med intresse lära sig mer om tarmens inre liv än man någonsin trodde var möjligt." BT J" På ett väldigt lättförståeligt och underhållande sätt skriver hon om tarmsystemets funktion, detta fantastiska organ som har så stor betydelse för både vår kroppsliga och själsliga välbefinnande. Hon går igenom matsmältningssystemet steg för steg... Boken har gått vidare till maken och likt stafettlöpare står svärfar och svärmor i kö och väntar på att få läsa. Köp boken eller låna den, men läs den! Läs den för din egen skull! Populärvetenskap när den är som bäst, helt enkelt!" Beasbokhylla.se', NULL, 10, 0)
INSERT [dbo].[Book] ([Id], [Title], [ImagePath], [ISBN], [LanguageId], [PageNumber], [PublishingDate], [PublisherId], [Weight], [Price], [FormatId], [Description], [SeriesId], [QuantityInStock], [NotOnSale]) VALUES (24, N'Saker min son behöver veta om världen', N'http://www.adlibris.com/se/organisationer/covers/M/9/17/9175032201.jpg', N'9175032201', 1, 201, CAST(N'2013-09-16 00:00:00.000' AS DateTime), 14, 120, 51.0000, 8, N'" Det är alltså jag som är din pappa. Du får vänja dig." Till min son. Jag ber om din förlåtelse redan nu. För allt jag kommer göra fel. För allt jag inte kommer förstå. För minibussen. Shortsen. " Öl byggde denna vackra kropp"-t-shirten. För att jag försöker high-fajva dina kompisar. Den här boken är till dig. Om sakerna jag tror att du behöver veta om världen. Om fotboll, Ikea, manlighet, Gud, friterad Snickers-glass och hur man klarar Monkey Island 3. Om försvunna bilnycklar och varför pappa var tvungen att döda den sjungande plastgiraffen. Mest av allt är det en bok om att försöka vara en bra förälder. För jag vill att du ska veta att jag verkligen alltid gjorde så gott jag kunde. Ingen googlade mer än jag. Saker min son behöver veta om världen är en pappas stapplande försök att förklara världen för en tvååring. I kapitel som " Vad du kommer att behöva veta om Ikea", " Vad du kommer att behöva veta om rörelseaktiverade toalettlampor" och " Vad du kommer att behöva veta om varför Felicias mamma är sur på mig" blottlägger Fredrik Backman med stor komisk träffsäkerhet 2000-talets småbarnsföräldrars alla ängsligheter och tillkortakommanden. Men mellan igenkännande gapskratt och skarpa samtidsreflektioner finns också kapitel som " Vad du kommer att behöva veta om manlighet" och " Vad du kommer att behöva vet om när jag håller dig lite för hårt i handen". Med uppriktiga rädslor och villkorslösa kärleksförklaringar som går rakt in i bröstet hos läsaren. Vare sig man är förälder eller inte." Han skriver om fotboll, Gud, bagageband på flygplasten och annat som behöver en riktig introduktion. Bitvis insiktsfull, oväntat ödmjuk och andlöst rolig bok med klockrena speglingar av familjesituationer på IKE A, vid skötbord och annat. Jag skrattar högt åt denna grabbiga kärleksförklaring som uppmanar till lek, att jaga passionen, hitta kärleken, vara snäll när du kan och hård när du måste ... Underbart!" Varbergs Posten', NULL, 10, 0)
INSERT [dbo].[Book] ([Id], [Title], [ImagePath], [ISBN], [LanguageId], [PageNumber], [PublishingDate], [PublisherId], [Weight], [Price], [FormatId], [Description], [SeriesId], [QuantityInStock], [NotOnSale]) VALUES (25, N'Blod på snö', N'http://www.adlibris.com/se/organisationer/covers/M/9/16/9164204340.jpg', N'9164204340', 1, 181, CAST(N'2015-05-20 00:00:00.000' AS DateTime), 15, 386, 175.0000, 1, N'En ond saga om en förälskad mördare Jag trodde att blodet skulle frysa på snöns yta och ligga kvar. Men i stället sög snön upp det, drog in det under ytan, gömde det, som om det själv behövde blodet. ur Blod på snö Det är Oslo i december, den kallaste vintern i mannaminne. Där lever Olav. Han är en mycket ensam person som mördar på uppdrag. När man slår ihjäl folk mot pengar är det inte lätt att komma någon nära. Nu har han mött Corina, sin drömkvinna. Det är bara ett problem. Hon är chefens fru. Och det är henne han har fått i uppdrag att döda. Blod på snö är en mörk och ond saga om en förälskad mördare. Jo Nesbø är en av världens mest lästa kriminalförfattare. Han har med böckerna om Harry Hole, Huvudjägarna och Sonen sålt mer än 25 miljoner böcker och även toppat New York Times bästsäljarlista. Blod på snö är en ny fristående thriller, och den första i en serie om två böcker.', NULL, 9, 0)
INSERT [dbo].[Book] ([Id], [Title], [ImagePath], [ISBN], [LanguageId], [PageNumber], [PublishingDate], [PublisherId], [Weight], [Price], [FormatId], [Description], [SeriesId], [QuantityInStock], [NotOnSale]) VALUES (26, N'Djursholm : Sveriges ledarsamhälle', N'http://www.adlibris.com/se/organisationer/covers/M/9/17/9173537721.jpg', N'9173537721', 1, 740, CAST(N'2015-05-18 00:00:00.000' AS DateTime), 16, 1710, 249.0000, 1, N'Djursholm har alltsedan dess grundande år 1889 varit hem för ledare inom konst, akademi, förvaltning och framför allt näringsliv. Mikael Holmqvist presenterar en inträngande analys av detta samhälles värderingar, normer och ideal, och hur de påverkar de människor som bor och lever där. Författaren visar att Djursholm formar människor som ledare och beskriver särskilt hur detta påverkar dem som växer upp i detta samhälle. Mikael Holmqvist är ledarskapsforskare och professor i företagsekonomi vid Stockholms universitet.', NULL, 7, 0)
INSERT [dbo].[Book] ([Id], [Title], [ImagePath], [ISBN], [LanguageId], [PageNumber], [PublishingDate], [PublisherId], [Weight], [Price], [FormatId], [Description], [SeriesId], [QuantityInStock], [NotOnSale]) VALUES (27, N'SÄLJ! : konsten att sälja vad som helst till vem som helst', N'http://www.adlibris.com/se/organisationer/covers/M/9/18/9187391589.jpg', N'9187391589', 1, 268, CAST(N'2015-03-16 00:00:00.000' AS DateTime), 17, 620, 209.0000, 1, N'Fredrik Eklund har gjort sig ett namn som fastighetsmäklaren mega­kändisarna vänder sig till när de vill spendera miljoner på en ny Manhattanbostad.  Under sitt första år som mäklare  sålde han fastigheter för 50 miljoner dollar och blev utsedd till Årets nykomling. Fredrik Eklund har med andra ord en gedigen kunskap om hur man säljer  och tjänar stora pengar. Han har flitigt delat med sig av sina kunskaper på sociala medier, i tidningar och tv-program, bland annat genom realityserien Million Dollar Listing New York, som renderat honom fans i över 113 länder världen över. På ett humoristiskt, insiktsfullt och varmhjärtat sätt berättar Fredrik Eklund om hur han uppnått sina drömmar och hur D U kan göra detsamma. Boken ger råd om allt från träning och klädsel till hur du får dina kunder att verkligen gilla och lita på dig. Alldeles oavsett du har titeln försäljare eller inte är Sälj! en bok för dig. Den beskriver det som vi alla ägnar oss åt varenda dag.  Från ett extra varmt leende för ett bättre bord på krogen, till att övertala femåringen att det är läggdags, eller att få partnern att vilja åka till just ditt drömresemål på semestern.  Allt handlar om samma sak. Om du klarar att sälja dig själv, klarar du att sälja vad som helst! Fredrik Eklund, född i Stockholm 1977, kom till New York 2002  utan pengar, jobb och bostad. Genom sitt makalösa driv och framåtanda lyckades Fredrik  efter en kurs i fastighetsmäkleri  bli en toppsäljare redan det första året som mäklare. Han har vid det här laget sålt fastigheter för över två miljarder dollar. Och köparna är megastjärnor som Jennifer Lopez, Daniel Craig, Cameron Diaz med flera. År 2009 grundade Fredrik Eklund sitt eget företag i fastighetsmäklarbranschen, Eklund Stockholm New York A B, med kontor i Stockholm, Oslo och London. Boken ges ut även i US A. Översättare Ulrika Junker Miranda.', NULL, 5, 0)
INSERT [dbo].[Book] ([Id], [Title], [ImagePath], [ISBN], [LanguageId], [PageNumber], [PublishingDate], [PublisherId], [Weight], [Price], [FormatId], [Description], [SeriesId], [QuantityInStock], [NotOnSale]) VALUES (28, N'De tio sämsta ekonomiska teorierna : från Keynes till Piketty', N'http://www.adlibris.com/se/organisationer/covers/M/9/10/9100149004.jpg', N'9100149004', 1, 413, CAST(N'2015-05-19 00:00:00.000' AS DateTime), 1, 592, 163.0000, 1, N'Recepten för en stabil ekonomisk utveckling är varken hemliga eller okända, men de är svåra att genomföra i ett demokratiskt samhällssystem. För att citera E U-ordförande Jean- Claude Juncker: " Vi vet alla vad vi måste göra, vi vet bara inte hur vi ska kunna bli återvalda efter att vi gjort det". De etablerade ekonomiska teorierna står idag inför en omprövning. Björn Wahlroos har valt tio teorier, eller antaganden, alla grundläggande för den forskning som kritiserar den ekonomiska laissez faire-skolan. Han undersöker dessa teoriers förmåga att hantera vår tids ekonomiska verklighet. De visar sig vara trubbiga verktyg. ', NULL, 11, 0)
INSERT [dbo].[Book] ([Id], [Title], [ImagePath], [ISBN], [LanguageId], [PageNumber], [PublishingDate], [PublisherId], [Weight], [Price], [FormatId], [Description], [SeriesId], [QuantityInStock], [NotOnSale]) VALUES (31, N'Eva Bonnier : ett konstnärsliv', N'http://www.adlibris.com/se/organisationer/covers/M/9/10/9100130931.jpg', N'9100130931', 1, 383, CAST(N'2013-03-12 00:00:00.000' AS DateTime), 1, 1133, 210.0000, 1, N'" I alla hennes bilder känner man människan som levt, hennes ömtålighet och engagement, hennes uppriktighet. Det är konst som är ytlighetens motsats, en djup konst", skrev Ulf Linde till en minnesutställning 1961 om konstnären Eva Bonnier (1857--&ndash;1909). Det var framför allt som porträttmålare Eva Bonnier hade sina framgångar. Hennes porträtt utmärks av psykologisk inlevelse, men är aldrig insmickrande. Hon målade även en rad finstämda interiörer och landskap. Flera av hennes verk hänger på Nationalmuseum, men de allra flesta finns i privat ägo. Det kan vara en förklaring till att Eva Bonnier inte blivit lika känd som sina kamrater i Konstnärsförbundet. Denna stora biografi över Eva Bonnier fyller ett tomrum. Här framträder en konstnär som verkat lite grand i tysthet, tillbakahållen av annat än de vanliga ekonomiska konstnärsbekymren. Konstvetaren Görel Cavalli- Björkman skildrar hennes uppväxt och väg in i konstnärskapet via målarskolor och Parisvistelser, konstnärsvänner och familjeliv, men framför allt genom att visa hennes målningar och diskutera dem. Genom de många citerade breven får läsaren också höra Eva Bonniers egen röst, fylld av retsam kvickhet i familjekretsen men präglad av allvar och nobless i offentligheten.', NULL, 10, 0)
INSERT [dbo].[Book] ([Id], [Title], [ImagePath], [ISBN], [LanguageId], [PageNumber], [PublishingDate], [PublisherId], [Weight], [Price], [FormatId], [Description], [SeriesId], [QuantityInStock], [NotOnSale]) VALUES (32, N'Stjärnklart', N'http://www.adlibris.com/se/organisationer/covers/M/9/18/9187135930.jpg', N'9187135930', 1, 0, CAST(N'2014-08-25 00:00:00.000' AS DateTime), 23, 292, 296.0000, 2, N'Elektronik har inget immunförsvar. Det är något som inte stämmer med de allt fler trasiga telefonerna som har lämnats in för reparation runtom i landet. De är stendöda. Samtidigt börjar en rad oförklarliga händelser i samhället avlösa varandra. Ett fabrikationsfel i bilarnas mikrochips förvandlar snabbt vägarna till bilkyrkogårdar. Tågen drabbas av elfel, hyllorna i affärerna gapar tomma, sommarförkylningarna blir allt segare och strömavbrotten blir en del av den nya vardagen. På Karlsborgs flygplats står elitsoldaten Gustaf Silverbane redo för utlandsinsats när något går fruktansvärt snett och ett eldsken fyller himlen. Survivalisten Filip Stenvik får se sin tidigare hånade hobby förvandlas till blodigt allvar. I den tilltagande ovissheten driver polisen Peter Ragnhell sina redan okonventionella metoder för brottsbekämpning till sin spets. Samtidigt gör programmeraren Anna Ljungberg en upptäckt som hotar att förändra förutsättningarna för allt mänskligt liv på jorden. Eller är det redan för sent? Efter ännu ett strömavbrott förändras allt. Den mörka hösten går in i en stjärnklar vinter där kaos råder och få överlever. Stjärnklart är första delen i en ny efterlängtad serie av författaren till Midvintermörker och Midsommargryning.', 9, 20, 1)
SET IDENTITY_INSERT [dbo].[Book] OFF
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (13, 23)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (13, 33)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (13, 63)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (13, 64)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (14, 6)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (14, 28)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (14, 45)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (14, 65)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (14, 66)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (15, 23)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (15, 26)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (15, 29)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (15, 30)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (15, 31)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (15, 32)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (15, 33)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (15, 34)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (16, 2)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (16, 15)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (16, 67)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (16, 68)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (17, 3)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (17, 36)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (17, 37)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (17, 38)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (18, 5)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (18, 23)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (18, 39)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (18, 40)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (18, 41)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (18, 42)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (18, 43)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (18, 44)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (18, 45)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (18, 46)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (18, 47)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (19, 6)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (19, 19)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (19, 45)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (19, 48)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (19, 49)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (19, 50)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (20, 9)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (20, 23)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (20, 33)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (20, 39)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (20, 61)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (20, 62)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (21, 8)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (21, 69)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (21, 70)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (21, 71)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (22, 9)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (22, 41)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (22, 45)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (22, 72)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (22, 73)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (22, 74)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (22, 75)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (22, 76)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (23, 7)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (23, 77)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (23, 78)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (23, 79)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (24, 12)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (24, 54)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (24, 80)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (24, 81)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (25, 23)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (25, 33)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (25, 63)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (25, 64)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (26, 21)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (26, 82)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (26, 83)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (26, 84)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (27, 6)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (27, 45)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (27, 85)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (27, 86)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (31, 9)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (31, 14)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (31, 87)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (31, 88)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (31, 89)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (32, 23)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (32, 33)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (32, 62)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (32, 63)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (32, 90)
SET IDENTITY_INSERT [dbo].[Contact] ON 

INSERT [dbo].[Contact] ([Id], [SocialSecurityNumber], [Email], [CellPhoneNumber], [FirstName], [LastName], [AddressId]) VALUES (1, N'197301010000', N'hej@hej.se', N'07012345678', N'Zlatan', N'Zlatko', 1)
SET IDENTITY_INSERT [dbo].[Contact] OFF
SET IDENTITY_INSERT [dbo].[DeliveryType] ON 

INSERT [dbo].[DeliveryType] ([Id], [Name]) VALUES (1, N'Posten')
INSERT [dbo].[DeliveryType] ([Id], [Name]) VALUES (2, N'Schenker')
INSERT [dbo].[DeliveryType] ([Id], [Name]) VALUES (3, N'DHL')
INSERT [dbo].[DeliveryType] ([Id], [Name]) VALUES (4, N'Bring')
INSERT [dbo].[DeliveryType] ([Id], [Name]) VALUES (5, N'UPS')
SET IDENTITY_INSERT [dbo].[DeliveryType] OFF
SET IDENTITY_INSERT [dbo].[Format] ON 

INSERT [dbo].[Format] ([Id], [Name]) VALUES (1, N'Inbunden')
INSERT [dbo].[Format] ([Id], [Name]) VALUES (2, N'CD-skiva')
INSERT [dbo].[Format] ([Id], [Name]) VALUES (3, N'Kartonnage')
INSERT [dbo].[Format] ([Id], [Name]) VALUES (4, N'Häftad')
INSERT [dbo].[Format] ([Id], [Name]) VALUES (5, N'Danskt band')
INSERT [dbo].[Format] ([Id], [Name]) VALUES (8, N'Pocket')
INSERT [dbo].[Format] ([Id], [Name]) VALUES (13, N'CD-skiva')
SET IDENTITY_INSERT [dbo].[Format] OFF
SET IDENTITY_INSERT [dbo].[Genre] ON 

INSERT [dbo].[Genre] ([Id], [Name]) VALUES (1, N'Barnböcker')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (2, N'Biografier & Memoarer')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (3, N'Datorer & IT')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (4, N'Deckare')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (5, N'Djur & Natur')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (6, N'Ekonomi & Juridik')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (7, N'Familj & Hälsa')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (8, N'Filosofi & Religion')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (9, N'Geografiska områden')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (10, N'Hem & Trädgård')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (11, N'Historia & Arkeologi')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (12, N'Humor & Presentböcker')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (13, N'Kokböcker')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (14, N'Konst & Musik')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (15, N'Litteraturvetenskap')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (16, N'Medicin')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (17, N'Naturvetenskap & Teknik')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (18, N'Ordböcker & Språk ')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (19, N'Psykologi & Pedagogik')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (20, N'Resor & Geografi')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (21, N'Samhälle & Politik')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (22, N'Serier & Grafiska romaner')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (23, N'Skönlitteratur')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (24, N'Sport & Fritid')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (25, N'Student')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (26, N'Tonår & Unga vuxna')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (27, N'Uppslagsverk')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (28, N'Ekonomisk teori & filosofi')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (29, N'Läsnivå: från ca 12 år')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (30, N'Spänning')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (31, N'Tecknat & Manga')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (32, N'Hc,u - Svensk skönlitteratur för barn och ungdom')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (33, N'H - Skönlitteratur')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (34, N'Hcg - Skönlitteratur för mellanåldern')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (35, N' Historia & Arkeologi')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (36, N'Webbprogrammering')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (37, N'Pucbb - Programmering och redigering')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (38, N'P - Teknik, industri och kommunikationer')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (39, N'Modern & samtida skönlitteratur')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (40, N'Matlagning: allmänt & recept')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (41, N'Mat & Dryck')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (42, N'Konservering & djupfrysning')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (43, N'Växter')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (44, N'Qca - Mat och dryck')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (45, N'Q - Ekonomi och näringsväsen')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (46, N'Ufab - Nyttoväxter')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (47, N'U - Naturvetenskap')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (48, N'Arbetspsykologi & industriell psykologi')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (49, N'Organisationsteori & organisationers beteende')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (50, N'Qbaab - Organisationslära')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (51, N'Psykologi')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (52, N'Populärpsykologi')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (53, N'Dokb - Personlig utveckling och träning')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (54, N'D - Filosofi och psykologi')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (55, N'Biografier & Memoarer')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (56, N' Historia & Arkeologi')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (57, N'Datorer & IT')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (58, N'Webbprogrammering')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (59, N'Pucbb - Programmering och redigering')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (60, N'P - Teknik, industri och kommunikationer')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (61, N'New York')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (62, N'Hc - Svensk skönlitteratur')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (63, N'Deckare & kriminalromaner')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (64, N'Hce - Utländsk skönlitteratur i svensk översättning')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (65, N'Ekonomisk historia')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (66, N'Qaaa - Doktrinhistoria')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (67, N'Dagböcker & brev')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (68, N'Litteraturvetenskap: skönlitteratur, roman- & prosaförfattare')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (69, N'Kristen teologi')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (70, N'Ca - Allmänt')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (71, N'C - Religion')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (72, N'USA')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (73, N'Kokböcker av tv- / kändiskockar')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (74, N'Nationella & regionala kök')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (75, N'Kakor, bakning, glasering & dekorering')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (76, N'Qcae - Bakning')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (77, N'Populärmedicin')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (78, N'Vej - Matsmältningsorganen (medicinsk gastroenterologi)')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (79, N'V - Medicin')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (80, N'Humor')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (81, N'Doff - Vuxenpsykologi')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (82, N'Sociala klasser')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (83, N'Oabka - Sociala klasser')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (84, N'O - Samhällsvetenskap och rättsvetenskap')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (85, N'Försäljning & marknadsföring')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (86, N'Qia - Handelsteknik')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (87, N'Sverige')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (88, N'Konsthistoria / konst- & designstilar ca 1800 ? ca 1900')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (89, N'Särskilda konstnärer, konstmonografier')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (90, N'Science fiction')
SET IDENTITY_INSERT [dbo].[Genre] OFF
SET IDENTITY_INSERT [dbo].[Language] ON 

INSERT [dbo].[Language] ([Id], [Name]) VALUES (1, N'Svenska')
INSERT [dbo].[Language] ([Id], [Name]) VALUES (2, N'Danska')
INSERT [dbo].[Language] ([Id], [Name]) VALUES (3, N'Norska')
INSERT [dbo].[Language] ([Id], [Name]) VALUES (4, N'Engelska')
INSERT [dbo].[Language] ([Id], [Name]) VALUES (5, N'Tyska')
INSERT [dbo].[Language] ([Id], [Name]) VALUES (6, N'Ryska')
INSERT [dbo].[Language] ([Id], [Name]) VALUES (7, N'Finska')
INSERT [dbo].[Language] ([Id], [Name]) VALUES (8, N'Spanska')
SET IDENTITY_INSERT [dbo].[Language] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Id], [AddressId], [ContactId], [Comment], [OrderDate], [OrderNumber], [TotalPrice], [DeliveryTypeId], [PaymentTypeId]) VALUES (11, 1, 1, NULL, CAST(N'2015-05-29' AS Date), N'a45079e4-0342-4aed-8486-369d0e2d6ae4', 1630.0000, 1, 1)
INSERT [dbo].[Order] ([Id], [AddressId], [ContactId], [Comment], [OrderDate], [OrderNumber], [TotalPrice], [DeliveryTypeId], [PaymentTypeId]) VALUES (12, 1, 1, NULL, CAST(N'2015-05-31' AS Date), N'0d087436-25dd-4a08-84f2-a5f30dbc8b99', 1526.0000, 1, 1)
INSERT [dbo].[Order] ([Id], [AddressId], [ContactId], [Comment], [OrderDate], [OrderNumber], [TotalPrice], [DeliveryTypeId], [PaymentTypeId]) VALUES (13, 1, 1, NULL, CAST(N'2015-05-31' AS Date), N'28b354f0-5aa3-422d-8947-e97d97dd19bc', 2125.0000, 1, 1)
INSERT [dbo].[Order] ([Id], [AddressId], [ContactId], [Comment], [OrderDate], [OrderNumber], [TotalPrice], [DeliveryTypeId], [PaymentTypeId]) VALUES (14, 1, 1, NULL, CAST(N'2015-05-31' AS Date), N'a026d4cb-a3d7-4542-9595-785f0a31abfc', 199.0000, 3, 4)
INSERT [dbo].[Order] ([Id], [AddressId], [ContactId], [Comment], [OrderDate], [OrderNumber], [TotalPrice], [DeliveryTypeId], [PaymentTypeId]) VALUES (15, 1, 1, NULL, CAST(N'2015-05-31' AS Date), N'fb018d3f-7148-4d94-8045-dee9cfcf5c33', 204.0000, 5, 5)
INSERT [dbo].[Order] ([Id], [AddressId], [ContactId], [Comment], [OrderDate], [OrderNumber], [TotalPrice], [DeliveryTypeId], [PaymentTypeId]) VALUES (16, 1, 1, NULL, CAST(N'2015-05-31' AS Date), N'c1e00080-1147-4221-a9c4-edd290d18a2b', 204.0000, 2, 4)
INSERT [dbo].[Order] ([Id], [AddressId], [ContactId], [Comment], [OrderDate], [OrderNumber], [TotalPrice], [DeliveryTypeId], [PaymentTypeId]) VALUES (17, 1, 1, NULL, CAST(N'2015-05-31' AS Date), N'2e6e7e38-758d-4b63-aa62-104cfe57bcb1', 249.0000, 2, 1)
INSERT [dbo].[Order] ([Id], [AddressId], [ContactId], [Comment], [OrderDate], [OrderNumber], [TotalPrice], [DeliveryTypeId], [PaymentTypeId]) VALUES (18, 1, 1, NULL, CAST(N'2015-05-31' AS Date), N'93e8742e-3242-4656-9613-7abe28653fc3', 414.0000, 1, 2)
INSERT [dbo].[Order] ([Id], [AddressId], [ContactId], [Comment], [OrderDate], [OrderNumber], [TotalPrice], [DeliveryTypeId], [PaymentTypeId]) VALUES (19, 1, 1, NULL, CAST(N'2015-05-31' AS Date), N'6fe85c82-ffa4-4603-a8a3-c399559e4d8e', 51.0000, 2, 1)
INSERT [dbo].[Order] ([Id], [AddressId], [ContactId], [Comment], [OrderDate], [OrderNumber], [TotalPrice], [DeliveryTypeId], [PaymentTypeId]) VALUES (20, 1, 1, NULL, CAST(N'2015-05-31' AS Date), N'dc63a294-028f-4be7-9002-7fe1edace397', 175.0000, 1, 1)
INSERT [dbo].[Order] ([Id], [AddressId], [ContactId], [Comment], [OrderDate], [OrderNumber], [TotalPrice], [DeliveryTypeId], [PaymentTypeId]) VALUES (21, 1, 1, NULL, CAST(N'2015-05-31' AS Date), N'cb1cd637-ecc3-4a22-8af8-2f14936e2ca9', 204.0000, 1, 1)
INSERT [dbo].[Order] ([Id], [AddressId], [ContactId], [Comment], [OrderDate], [OrderNumber], [TotalPrice], [DeliveryTypeId], [PaymentTypeId]) VALUES (22, 1, 1, NULL, CAST(N'2015-05-31' AS Date), N'8803fcef-f129-4553-8f5c-d428090e3b0c', 249.0000, 1, 1)
INSERT [dbo].[Order] ([Id], [AddressId], [ContactId], [Comment], [OrderDate], [OrderNumber], [TotalPrice], [DeliveryTypeId], [PaymentTypeId]) VALUES (23, 1, 1, NULL, CAST(N'2015-05-31' AS Date), N'1e74a9cd-56ed-48ce-8158-4f6adb3bb395', 249.0000, 1, 1)
INSERT [dbo].[Order] ([Id], [AddressId], [ContactId], [Comment], [OrderDate], [OrderNumber], [TotalPrice], [DeliveryTypeId], [PaymentTypeId]) VALUES (24, 1, 1, NULL, CAST(N'2015-05-31' AS Date), N'43c068b4-641d-4e82-9f75-044dfe09706f', 133.0000, 1, 1)
INSERT [dbo].[Order] ([Id], [AddressId], [ContactId], [Comment], [OrderDate], [OrderNumber], [TotalPrice], [DeliveryTypeId], [PaymentTypeId]) VALUES (25, 1, 1, NULL, CAST(N'2015-05-31' AS Date), N'af91265d-8ab5-4156-8956-5f021eed068a', 169.0000, 1, 1)
INSERT [dbo].[Order] ([Id], [AddressId], [ContactId], [Comment], [OrderDate], [OrderNumber], [TotalPrice], [DeliveryTypeId], [PaymentTypeId]) VALUES (26, 1, 1, NULL, CAST(N'2015-05-31' AS Date), N'5924e57e-06a9-4432-998d-2668a1ef6c37', 177.0000, 1, 1)
SET IDENTITY_INSERT [dbo].[Order] OFF
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([Id], [OrderId], [QuantityOrdered], [BookId]) VALUES (6, 11, 10, 14)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [QuantityOrdered], [BookId]) VALUES (7, 12, 3, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [QuantityOrdered], [BookId]) VALUES (8, 13, 2, 18)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [QuantityOrdered], [BookId]) VALUES (9, 13, 5, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [QuantityOrdered], [BookId]) VALUES (10, 14, 1, 16)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [QuantityOrdered], [BookId]) VALUES (11, 15, 1, 17)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [QuantityOrdered], [BookId]) VALUES (12, 16, 1, 17)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [QuantityOrdered], [BookId]) VALUES (13, 17, 1, 26)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [QuantityOrdered], [BookId]) VALUES (14, 18, 1, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [QuantityOrdered], [BookId]) VALUES (15, 18, 1, 21)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [QuantityOrdered], [BookId]) VALUES (16, 19, 1, 24)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [QuantityOrdered], [BookId]) VALUES (17, 20, 1, 25)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [QuantityOrdered], [BookId]) VALUES (18, 21, 1, 17)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [QuantityOrdered], [BookId]) VALUES (19, 22, 1, 26)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [QuantityOrdered], [BookId]) VALUES (20, 23, 1, 26)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [QuantityOrdered], [BookId]) VALUES (21, 24, 1, 21)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [QuantityOrdered], [BookId]) VALUES (22, 25, 1, 23)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [QuantityOrdered], [BookId]) VALUES (23, 26, 1, 15)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
SET IDENTITY_INSERT [dbo].[PaymentType] ON 

INSERT [dbo].[PaymentType] ([Id], [Name]) VALUES (1, N'Kreditkort VISA')
INSERT [dbo].[PaymentType] ([Id], [Name]) VALUES (2, N'Kreditkort MasterCard')
INSERT [dbo].[PaymentType] ([Id], [Name]) VALUES (3, N'Internetbank Nordea')
INSERT [dbo].[PaymentType] ([Id], [Name]) VALUES (4, N'Internetbank Swedbank')
INSERT [dbo].[PaymentType] ([Id], [Name]) VALUES (5, N'Faktura Klarna')
INSERT [dbo].[PaymentType] ([Id], [Name]) VALUES (6, N'Faktura Ikano')
SET IDENTITY_INSERT [dbo].[PaymentType] OFF
SET IDENTITY_INSERT [dbo].[Publisher] ON 

INSERT [dbo].[Publisher] ([Id], [Name]) VALUES (1, N'Albert Bonniers Förlag')
INSERT [dbo].[Publisher] ([Id], [Name]) VALUES (2, N'Bonnier Audio')
INSERT [dbo].[Publisher] ([Id], [Name]) VALUES (3, N'Bonnier Carlsen')
INSERT [dbo].[Publisher] ([Id], [Name]) VALUES (4, N'Salikon Förlag')
INSERT [dbo].[Publisher] ([Id], [Name]) VALUES (5, N'Pagina Förlag')
INSERT [dbo].[Publisher] ([Id], [Name]) VALUES (6, N'Norstedts')
INSERT [dbo].[Publisher] ([Id], [Name]) VALUES (7, N'Liber')
INSERT [dbo].[Publisher] ([Id], [Name]) VALUES (8, N'Libris förlag')
INSERT [dbo].[Publisher] ([Id], [Name]) VALUES (9, N'Salikon Förlag')
INSERT [dbo].[Publisher] ([Id], [Name]) VALUES (11, N'Storyside')
INSERT [dbo].[Publisher] ([Id], [Name]) VALUES (12, N'Bonnier Fakta')
INSERT [dbo].[Publisher] ([Id], [Name]) VALUES (13, N'Bokförlaget Forum')
INSERT [dbo].[Publisher] ([Id], [Name]) VALUES (14, N'Månpocket')
INSERT [dbo].[Publisher] ([Id], [Name]) VALUES (15, N'Piratförlaget')
INSERT [dbo].[Publisher] ([Id], [Name]) VALUES (16, N'Bokförlaget Atlantis')
INSERT [dbo].[Publisher] ([Id], [Name]) VALUES (17, N'Ekerlids')
INSERT [dbo].[Publisher] ([Id], [Name]) VALUES (23, N'Massolit Förlag')
SET IDENTITY_INSERT [dbo].[Publisher] OFF
SET IDENTITY_INSERT [dbo].[Reader] ON 

INSERT [dbo].[Reader] ([Id], [FirstName], [LastName]) VALUES (1, N'Stefan', N'Sauk')
INSERT [dbo].[Reader] ([Id], [FirstName], [LastName]) VALUES (2, N'Susanne Alfvengren;Gun', N'Olofsson')
INSERT [dbo].[Reader] ([Id], [FirstName], [LastName]) VALUES (3, N'Johan', N'Holmberg')
SET IDENTITY_INSERT [dbo].[Reader] OFF
INSERT [dbo].[ReaderInBook] ([ReaderId], [BookId]) VALUES (1, 13)
INSERT [dbo].[ReaderInBook] ([ReaderId], [BookId]) VALUES (2, 20)
INSERT [dbo].[ReaderInBook] ([ReaderId], [BookId]) VALUES (3, 32)
SET IDENTITY_INSERT [dbo].[Series] ON 

INSERT [dbo].[Series] ([Id], [Name]) VALUES (1, N'Avdelning Q 06')
INSERT [dbo].[Series] ([Id], [Name]) VALUES (2, N'Pagina Classic ')
INSERT [dbo].[Series] ([Id], [Name]) VALUES (3, N'Kommunikation i organisationer ')
INSERT [dbo].[Series] ([Id], [Name]) VALUES (4, N'Mirjam och Hervor 4')
INSERT [dbo].[Series] ([Id], [Name]) VALUES (9, N'Trilogi 1')
SET IDENTITY_INSERT [dbo].[Series] OFF
ALTER TABLE [dbo].[AuthorBook]  WITH CHECK ADD  CONSTRAINT [FK_AuthorBook_Author] FOREIGN KEY([AuthorId])
REFERENCES [dbo].[Author] ([Id])
GO
ALTER TABLE [dbo].[AuthorBook] CHECK CONSTRAINT [FK_AuthorBook_Author]
GO
ALTER TABLE [dbo].[AuthorBook]  WITH CHECK ADD  CONSTRAINT [FK_AuthorBook_Book] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([Id])
GO
ALTER TABLE [dbo].[AuthorBook] CHECK CONSTRAINT [FK_AuthorBook_Book]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_Format] FOREIGN KEY([FormatId])
REFERENCES [dbo].[Format] ([Id])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_Format]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_Language] FOREIGN KEY([LanguageId])
REFERENCES [dbo].[Language] ([Id])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_Language]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_Publisher] FOREIGN KEY([PublisherId])
REFERENCES [dbo].[Publisher] ([Id])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_Publisher]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_Series] FOREIGN KEY([SeriesId])
REFERENCES [dbo].[Series] ([Id])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_Series]
GO
ALTER TABLE [dbo].[BookGenre]  WITH CHECK ADD  CONSTRAINT [FK_BookGenre_Book] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([Id])
GO
ALTER TABLE [dbo].[BookGenre] CHECK CONSTRAINT [FK_BookGenre_Book]
GO
ALTER TABLE [dbo].[BookGenre]  WITH CHECK ADD  CONSTRAINT [FK_BookGenre_Genre] FOREIGN KEY([GenreId])
REFERENCES [dbo].[Genre] ([Id])
GO
ALTER TABLE [dbo].[BookGenre] CHECK CONSTRAINT [FK_BookGenre_Genre]
GO
ALTER TABLE [dbo].[Contact]  WITH CHECK ADD  CONSTRAINT [FK_Contact_Address] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Address] ([Id])
GO
ALTER TABLE [dbo].[Contact] CHECK CONSTRAINT [FK_Contact_Address]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Address] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Address] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Address]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Contact] FOREIGN KEY([ContactId])
REFERENCES [dbo].[Contact] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Contact]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_DeliveryType] FOREIGN KEY([DeliveryTypeId])
REFERENCES [dbo].[DeliveryType] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_DeliveryType]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_PaymentType] FOREIGN KEY([PaymentTypeId])
REFERENCES [dbo].[PaymentType] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_PaymentType]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Book] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Book]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Order]
GO
ALTER TABLE [dbo].[ReaderInBook]  WITH CHECK ADD  CONSTRAINT [FK_ReaderInBook_Book] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([Id])
GO
ALTER TABLE [dbo].[ReaderInBook] CHECK CONSTRAINT [FK_ReaderInBook_Book]
GO
ALTER TABLE [dbo].[ReaderInBook]  WITH CHECK ADD  CONSTRAINT [FK_ReaderInBook_Reader] FOREIGN KEY([ReaderId])
REFERENCES [dbo].[Reader] ([Id])
GO
ALTER TABLE [dbo].[ReaderInBook] CHECK CONSTRAINT [FK_ReaderInBook_Reader]
GO
USE [master]
GO
ALTER DATABASE [MagicBooksDB] SET  READ_WRITE 
GO
