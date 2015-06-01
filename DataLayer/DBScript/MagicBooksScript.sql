USE [master]
GO
/****** Object:  Database [MagicBooksDB]    Script Date: 2015-05-29 09:25:07 ******/
CREATE DATABASE [MagicBooksDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MagicBooksDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MJMSTATSERVER\MSSQL\DATA\MagicBooksDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
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
/****** Object:  Table [dbo].[Address]    Script Date: 2015-05-29 09:25:07 ******/
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
/****** Object:  Table [dbo].[Author]    Script Date: 2015-05-29 09:25:07 ******/
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
/****** Object:  Table [dbo].[AuthorBook]    Script Date: 2015-05-29 09:25:07 ******/
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
/****** Object:  Table [dbo].[Book]    Script Date: 2015-05-29 09:25:07 ******/
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
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BookGenre]    Script Date: 2015-05-29 09:25:07 ******/
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
/****** Object:  Table [dbo].[Contact]    Script Date: 2015-05-29 09:25:07 ******/
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
/****** Object:  Table [dbo].[DeliveryType]    Script Date: 2015-05-29 09:25:07 ******/
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
/****** Object:  Table [dbo].[Format]    Script Date: 2015-05-29 09:25:07 ******/
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
/****** Object:  Table [dbo].[Genre]    Script Date: 2015-05-29 09:25:07 ******/
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
/****** Object:  Table [dbo].[Language]    Script Date: 2015-05-29 09:25:07 ******/
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
/****** Object:  Table [dbo].[Order]    Script Date: 2015-05-29 09:25:07 ******/
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
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 2015-05-29 09:25:07 ******/
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
/****** Object:  Table [dbo].[PaymentType]    Script Date: 2015-05-29 09:25:07 ******/
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
/****** Object:  Table [dbo].[Publisher]    Script Date: 2015-05-29 09:25:07 ******/
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
/****** Object:  Table [dbo].[Reader]    Script Date: 2015-05-29 09:25:07 ******/
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
/****** Object:  Table [dbo].[ReaderInBook]    Script Date: 2015-05-29 09:25:07 ******/
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
/****** Object:  Table [dbo].[Series]    Script Date: 2015-05-29 09:25:07 ******/
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
SET IDENTITY_INSERT [dbo].[Book] ON 

INSERT [dbo].[Book] ([Id], [Title], [ImagePath], [ISBN], [LanguageId], [PageNumber], [PublishingDate], [PublisherId], [Weight], [Price], [FormatId], [Description], [SeriesId], [QuantityInStock]) VALUES (13, N'Den gränslöse', N'http://www.adlibris.com/se/organisationer/covers/M/9/17/9174332953.jpg', N'9174332953', 1, 0, CAST(N'2015-05-08 00:00:00.000' AS DateTime), 2, 344, 298.0000, 2, N'En telefonsignal skär genom källaren i Köpenhamns polishus och väcker kriminalinspektör Carl Mørck från den sedvanliga morgonluren med fötterna på skrivbordet. När Carl förstår att kollegan från Bornholm vill ha Avdelning Q:s hjälp med ett gammalt hopplöst fall blir han genast avvisande. I andra änden av tråden läggs luren tyst på. Några få timmar senare står det klart att konsekvenserna av Carls kallsinnighet varit katastrofala. Tillsammans med kollegorna Assad, Rose och Gordon dras Carl in i utredningen av en sjutton år gammal tragedi. En ung livsglad kvinna försvann från en folkhögskola på Bornholm och hittades död hängande i ett träd några kilometer därifrån. För den skeptiskt lagde Carl blir det mystiska fallet särskilt svårt att finna reda i. Efterforskningarna leder till en soldyrkande sekt på Öland och en manipulatör med järnvilja som inte skyr några medel för att skydda sig själv och de sina. Den gränslöse är den sjätte delen i Jussi Adler- Olsens hyllade kriminalserie om Avdelning Q. En berättelse om vanvett, passion och besatthet." Jussi Adler- Olsen är i toppform" Jyllands- Posten', 1, 10)
INSERT [dbo].[Book] ([Id], [Title], [ImagePath], [ISBN], [LanguageId], [PageNumber], [PublishingDate], [PublisherId], [Weight], [Price], [FormatId], [Description], [SeriesId], [QuantityInStock]) VALUES (14, N'De tio sämsta ekonomiska teorierna : från Keynes till Piketty', N'http://www.adlibris.com/se/organisationer/covers/M/9/10/9100149004.jpg', N'9100149004', 1, 413, CAST(N'2015-05-19 00:00:00.000' AS DateTime), 1, 592, 163.0000, 1, N'Recepten för en stabil ekonomisk utveckling är varken hemliga eller okända, men de är svåra att genomföra i ett demokratiskt samhällssystem. För att citera E U-ordförande Jean- Claude Juncker: " Vi vet alla vad vi måste göra, vi vet bara inte hur vi ska kunna bli återvalda efter att vi gjort det". De etablerade ekonomiska teorierna står idag inför en omprövning. Björn Wahlroos har valt tio teorier, eller antaganden, alla grundläggande för den forskning som kritiserar den ekonomiska laissez faire-skolan. Han undersöker dessa teoriers förmåga att hantera vår tids ekonomiska verklighet. De visar sig vara trubbiga verktyg. ', NULL, 10)
INSERT [dbo].[Book] ([Id], [Title], [ImagePath], [ISBN], [LanguageId], [PageNumber], [PublishingDate], [PublisherId], [Weight], [Price], [FormatId], [Description], [SeriesId], [QuantityInStock]) VALUES (15, N'Mördarens apa', N'http://www.adlibris.com/se/organisationer/covers/M/9/16/9163877384.jpg', N'9163877384', 1, 617, CAST(N'2014-04-02 00:00:00.000' AS DateTime), 3, 930, 177.0000, 3, N'2014 års Augustprisvinnare i barn- och ungdomsbokskategorin! Årets svenska barn- och ungdomsbok. Med motiveringen:  Legenden om Sally Jones har fått sin fortsättning, nedskriven av gorillan Sally själv. Hennes vän Chiefen blir oskyldigt anklagad för ett mord och Sally måste rentvå hans namn. Det tar henne ut på ett svindlande äventyr, återgivet så levande att dofterna från Lissabons gränder och skummet från stormiga sjöresor stiger upp ur pappret. Jakob Wegelius berättarglädje ackompanjeras av detaljrika och tidstypiska porträtt och vinjetter i svartvitt. Välkommen in i en helt annan värld! En makalös och vindlande historia om ett gåtfullt mordfall Augustprisvinnaren Jakob Wegelius nya bok är en makalös och vindlande historia om ett gåtfullt mordfall. Berättelsen rör sig från Lissabons nattliga hamnkvarter, över de stora oceanerna, till mysterierna vid en indisk maharadjas hov. Det är en historia om mörka hemligheter och svåra brott, men även om oväntad vänskap, hopp och förlåtelse. Mördarens apa är en fristående fortsättning på den hyllade Legenden om Sally Jones från 2008. Historiens berättare är gorillan Sally Jones, maskinist på lastskutan Hudson Queen. Hon och hennes vän, sjömannen som kallas för Chiefen, är strandsatta i Lissabon. Där blir de inlurade i en smugglingsaffär som slutar illa. Hudson Queen går under och Chiefen blir oskyldigt dömd för mordet på den skugglike Alphonse Morro. För Sally Jones börjar en lång och svår kamp, både för sin egen överlevnad och för att rentvå Chiefen. Hon har mäktiga krafter emot sig. Krafter som till varje pris vill skydda hemligheterna som Morro tog med sig när han försvann i floden Tejos svarta strömvirvlar. Denna sällsamma berättelse är rikligt illustrerad med fantastiska och fantasieggande bilder i svartvitt, alla gjorda med utsökt precision in i minsta detalj. Sagt om Legenden om Sally Jones:" Det här måste vara en av årets bästa och högst konstnärliga bilderböcker - en bok om vänskap, längtan, hopp och svek." Svante Ors, Bibliotekstjänst "... så vackert skriven och så finurligt komponerad att man blir alldeles varm om hjärtat. Tänk att det fortfarande görs sådana här böcker ...", Expressen Sagt om Mördarens apa?:" Det blir en femma. Det är en fantastisk bok!" Yukiko Duke, SV T Gomorron" Boken är riktigt spännande och målande skriven. Det är svårt att sluta läsa och man känner med karaktärerna. Ett mästerverk." ? Kamratposten, Bokpanelen, ger betyg 5 av 5 möjliga." Jakob Wegelius ger än en gång prov på sin säkra berättarförmåga och sin förmämliga illustrationskonst. /.../ I '' Mördarens apa'' finns kopplingar till den klassiska deckaren, till äventyrsberättelser och saltmättade sjöhistorier från förr. Wegelius har skrivit och tecknat en verklig allåldersbok, idealisk för högläsning." Svenska Dagbladet, Lena Kåreland', NULL, 10)
INSERT [dbo].[Book] ([Id], [Title], [ImagePath], [ISBN], [LanguageId], [PageNumber], [PublishingDate], [PublisherId], [Weight], [Price], [FormatId], [Description], [SeriesId], [QuantityInStock]) VALUES (16, N'Krigsdagböcker 1939-1945', N'http://www.adlibris.com/se/organisationer/covers/M/9/18/9187659042.jpg', N'9187659042', 1, 366, CAST(N'2015-04-27 00:00:00.000' AS DateTime), 4, 957, 199.0000, 1, N'I maj 2015 är det 70 år sedan andra världskriget tog slut. Under hela kriget skriver Astrid Lindgren dagbok där hon berättar om vardagen i Stockholm, om det som händer i världen och om Sveriges agerande under kriget. Astrid Lindgrens krigsdagböcker är en mycket personlig skildring av hur dramatiska världshändelser påverkar oss alla. Texten är laddad med stor sorg och förfäran. Det här är före Astrid Lindgrens tid som världsberömd författare; den första boken om Pippi Långstrump kommer ut samma år som kriget slutar, 1945.  Blandat med Astrid Lindgrens egna anteckningar innehåller dagböckerna mängder av utklippta artiklar ur svenska tidningar som hon kommenterar. I boken återfinns över 70 faksimilbilder av dagboksuppslagen och många hittills opublicerade familjebilder från krigsåren. Författaren Kerstin Ekman, som kände Astrid Lindgren, skriver förord och Astrids dotter, Karin Nyman, skriver efterord. Totalt är det 17 dagböcker som kommer ut i bokform. Astrid Lindgren är ständigt aktuell och en daglig referenspunkt i samhällsdebatten. Hennes böcker är en omistlig del av vårt kulturarv och når oavbrutet nya läsare och får nya betydelser runt om i världen. Vad många inte vet är att hon var en tidig anti-nazist och att hon genom hela sitt liv kämpade mot krig och våld. Hon var en övertygad humanist och en människa som tänkte själv, stod för sina åsikter med såväl civilkurage som humor och kärlek. I maj 2015 släpps Astrid Lindgrens krigsdagböcker så som hon skrev dem. Ett unikt dokument från en vanlig människa och en av världens mest kända svenskar.', NULL, 10)
INSERT [dbo].[Book] ([Id], [Title], [ImagePath], [ISBN], [LanguageId], [PageNumber], [PublishingDate], [PublisherId], [Weight], [Price], [FormatId], [Description], [SeriesId], [QuantityInStock]) VALUES (17, N'HTML och CSS-boken', N'http://www.adlibris.com/se/organisationer/covers/M/9/16/9163609940.jpg', N'9163609940', 1, 505, CAST(N'2011-11-30 00:00:00.000' AS DateTime), 5, 794, 204.0000, 4, N'Den sjunde upplagan av HTM L och CS S-boken täcker in HTM L5, XHTM L och CS S. Boken börjar från grunden och innehåller allt du behöver veta för att skriva webbsidor. Författaren beskriver systematiskt, med hundratals exempel, hur du lägger in rätt taggar så att dina webbsidor får det utseende och den funktion du vill. Du kan ha stor glädje av att kunna HTM L även om du använder andra program som skapar HTM L-kod, eller översätter färdiga dokument till HTM L. HTM L- och CS S-boken är skriven för Linux-, Mac- och P C-användare. Betoningen ligger på hur man skriver dokument som kan visas på alla datorer och med alla webläsare. Skillnaderna mellan XHTM L och HTM L tas upp efter hand. Boken har blivit mycket uppskattad och den här upplagan markerar bokens femtonårsjubileum. Den nya upplagan är som alltid noggrant genomarbetad och uppdaterad in i minsta detalj för att vara helt aktuell. O M FÖRFATTAREN Rolf Staflin är fil.mag. i datavetenskap och arbetar som I T-arkitekt och utvecklare på konsultbas. Han har arbetat med allt från enkla webbplatser med några få sidor till stora EJ B-baserade klient/serversystem med tusentals användare. De senaste åren har Rolf utvecklat ett tiotal appar för i Phone och Android samt webbplatser för mobila enheter.', 2, 10)
INSERT [dbo].[Book] ([Id], [Title], [ImagePath], [ISBN], [LanguageId], [PageNumber], [PublishingDate], [PublisherId], [Weight], [Price], [FormatId], [Description], [SeriesId], [QuantityInStock]) VALUES (18, N'Kan man äta sånt?', N'http://www.adlibris.com/se/organisationer/covers/M/9/11/911306486X.jpg', N'911306486X', 1, 172, CAST(N'2014-07-14 00:00:00.000' AS DateTime), 6, 0, 360.0000, 4, N'Långt fler vilda växter än man tror kan ätas - ibland kan man äta bladen och blommorna, ibland rötterna eller frukterna. Förr i tiden torkades många växter, maldes och blandades t.ex. i mjölet under år med missväxt - eller användes som läkeörter. Numera går vi ut och samlar vilda växter, bär och svamp för att det är roligt, nyttigt och ger nya smakupplevelser. Dessutom får vi bättre kontroll över det vi stoppar i oss! Och inte behöver vi bege oss ut i skogen för att plocka. I parker, på gårdar och andra öppna platser i städerna finns det gott om s.k. ogräs som lätt kan förvandlas till rena läckerheterna. Kan man äta sånt? presenterar våra ätliga vilda växter, hur de ser ut, var de växer och hur de kan användas. Vi får också veta hur de användes förr. Insprängda i presentationerna finns tillagningstips och recept. I slutet av boken hittar vi grundrecept på örtteer, såser, drinkar, gratänger, soppor, buljonger, pannkakor, bröd och pajer samt tips om konservering, inläggningar, vintillverkning, brännvins- och likörkryddning. Några pressröster:&rdquo; Hela boken genomsyras av experimentlustans glädje av att se, känna, lukta, smaka och uppleva.&rdquo; Fauna och flora&rdquo; Hon har gjort ett storslaget arbete.&rdquo; Upsala Nya Tidning&rdquo; En oumbärlig bok om man har intresse av att veta vilka läckerheter vi av okunnighet går och trampar på.&rdquo; Ekoteket&nbsp;&nbsp;', NULL, 10)
INSERT [dbo].[Book] ([Id], [Title], [ImagePath], [ISBN], [LanguageId], [PageNumber], [PublishingDate], [PublisherId], [Weight], [Price], [FormatId], [Description], [SeriesId], [QuantityInStock]) VALUES (19, N'Kommunikation i organisationer', N'http://www.adlibris.com/se/organisationer/covers/M/9/14/9147094834.jpg', N'9147094834', 1, 281, CAST(N'2012-08-14 00:00:00.000' AS DateTime), 7, 514, 324.0000, 5, N'Arbetsuppgifterna i dagens organisationer består i stor utsträckning av kommunikation. Det gäller inte bara professionella kommunikatörer utan också chefer och medarbetare. Hela organisationen existens och framgång är beroende av en väl fungerande kommunikation. Läs mer Den här boken tar upp den teoretiska grunden kring nyckelbegrepp inom kommunikation och organisation liksom själva processerna med koppling till organisationens visionsarbete, ledarskap, lärande och identitet. I den andra upplagan av boken har författarna integrerat nya forskningsresultat sedan den första upplagan publicerades. Flera kapitel är helt omarbetade och ett nytt kapitel om sociala medier och intern kommunikation har tillkommit. Boken är i första hand tänkt som en lärobok för studenter inom området organisationskommunikation. Boken riktar sig även till chefer, projektledare, kommunikatörer, H R-specialister, marknadsförare och andra som arbetar praktiskt med kommunikation i organisationer. Om författarna Mats Heide är docent vid Lunds Universitet, Catrin Johansson är docent vid Mittuniversitetet och Charlotte Simonsson är fil.dr vid Lunds Universitet.', 3, 10)
INSERT [dbo].[Book] ([Id], [Title], [ImagePath], [ISBN], [LanguageId], [PageNumber], [PublishingDate], [PublisherId], [Weight], [Price], [FormatId], [Description], [SeriesId], [QuantityInStock]) VALUES (20, N'Stormsvala', N'http://www.adlibris.com/se/organisationer/covers/M/9/17/9170368295.jpg', N'9170368295', 1, 0, CAST(N'2013-03-21 00:00:00.000' AS DateTime), 11, 166, 281.0000, 2, N'Till New York har de kommit för att hjälpa sina döttrar, som startat ett lyxigt svenskt spa på Manhattan. Hervors dotter Ingrid får ett gåtfullt brev från Sverige och en manlig kund lyckas påverka Hervor så till den milda grad att hon till och med tappar sin förmåga att skåda in i framtiden. Hon hävdar bestämt att hon är utbränd, vilket Mirjam inte riktigt tror på. Mirjam litar inte på den charmige mannen som har tid att vara på spaet ständigt och jämt. Dessutom tar han sig in i deras bostad. Vem är han egentligen och vad gör han i New York? Här är den fjärde boken i serien om Mirjam och Hervor!om tidigare böcker i serien: Svinhugg innehåller både en spännande och oväntad historia, sköna miljöer och mustiga karaktärer. Den lappländska Hervor som inte spottar i glaset och svär som en borstbindare, är en favorit. Marianne Cedervall lovar fler böcker om Mirjam och Hervor. Något att se fram emot. Susanne Blick, SKT F- Tidningen Det här är en underbar roman av debutanten Marianne Cedervall! Den är både varm, finurlig och full av humor och man bara måste veta hur det går för Mirjam! Birgitta Delbrand, Året Runt Underbart makaber debutroman som imponerar Gunilla Weddin, Skånskan', 4, 10)
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
INSERT [dbo].[Format] ([Id], [Name]) VALUES (6, N'Inbunden')
INSERT [dbo].[Format] ([Id], [Name]) VALUES (7, N'Häftad')
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
INSERT [dbo].[Language] ([Id], [Name]) VALUES (9, N'Svenska')
INSERT [dbo].[Language] ([Id], [Name]) VALUES (10, N'Svenska')
SET IDENTITY_INSERT [dbo].[Language] OFF
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
INSERT [dbo].[Publisher] ([Id], [Name]) VALUES (10, N'Pagina Förlag')
INSERT [dbo].[Publisher] ([Id], [Name]) VALUES (11, N'Storyside')
SET IDENTITY_INSERT [dbo].[Publisher] OFF
SET IDENTITY_INSERT [dbo].[Reader] ON 

INSERT [dbo].[Reader] ([Id], [FirstName], [LastName]) VALUES (1, N'Stefan', N'Sauk')
INSERT [dbo].[Reader] ([Id], [FirstName], [LastName]) VALUES (2, N'Susanne Alfvengren;Gun', N'Olofsson')
SET IDENTITY_INSERT [dbo].[Reader] OFF
INSERT [dbo].[ReaderInBook] ([ReaderId], [BookId]) VALUES (1, 13)
INSERT [dbo].[ReaderInBook] ([ReaderId], [BookId]) VALUES (2, 20)
SET IDENTITY_INSERT [dbo].[Series] ON 

INSERT [dbo].[Series] ([Id], [Name]) VALUES (1, N'Avdelning Q 06')
INSERT [dbo].[Series] ([Id], [Name]) VALUES (2, N'Pagina Classic ')
INSERT [dbo].[Series] ([Id], [Name]) VALUES (3, N'Kommunikation i organisationer ')
INSERT [dbo].[Series] ([Id], [Name]) VALUES (4, N'Mirjam och Hervor 4')
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
