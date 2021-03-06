USE [master]
GO
/****** Object:  Database [MagicBooksDB]    Script Date: 2015-06-03 21:14:55 ******/
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
/****** Object:  Table [dbo].[Address]    Script Date: 2015-06-03 21:14:55 ******/
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
/****** Object:  Table [dbo].[Author]    Script Date: 2015-06-03 21:14:55 ******/
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
/****** Object:  Table [dbo].[AuthorBook]    Script Date: 2015-06-03 21:14:55 ******/
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
/****** Object:  Table [dbo].[Book]    Script Date: 2015-06-03 21:14:55 ******/
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
/****** Object:  Table [dbo].[BookGenre]    Script Date: 2015-06-03 21:14:55 ******/
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
/****** Object:  Table [dbo].[Contact]    Script Date: 2015-06-03 21:14:55 ******/
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
/****** Object:  Table [dbo].[DeliveryType]    Script Date: 2015-06-03 21:14:55 ******/
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
/****** Object:  Table [dbo].[Format]    Script Date: 2015-06-03 21:14:55 ******/
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
/****** Object:  Table [dbo].[Genre]    Script Date: 2015-06-03 21:14:55 ******/
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
/****** Object:  Table [dbo].[Language]    Script Date: 2015-06-03 21:14:55 ******/
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
/****** Object:  Table [dbo].[Order]    Script Date: 2015-06-03 21:14:55 ******/
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
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 2015-06-03 21:14:55 ******/
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
/****** Object:  Table [dbo].[PaymentType]    Script Date: 2015-06-03 21:14:55 ******/
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
/****** Object:  Table [dbo].[Publisher]    Script Date: 2015-06-03 21:14:55 ******/
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
/****** Object:  Table [dbo].[Reader]    Script Date: 2015-06-03 21:14:55 ******/
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
/****** Object:  Table [dbo].[ReaderInBook]    Script Date: 2015-06-03 21:14:55 ******/
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
/****** Object:  Table [dbo].[Series]    Script Date: 2015-06-03 21:14:55 ******/
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

INSERT [dbo].[Address] ([Id], [Street], [ZipCode], [City]) VALUES (4, N'Slottsskogsgatan 24', N'41453', N'Göteborg')
INSERT [dbo].[Address] ([Id], [Street], [ZipCode], [City]) VALUES (5, N'Gulagatan 24', N'41454', N'Göteborg')
INSERT [dbo].[Address] ([Id], [Street], [ZipCode], [City]) VALUES (6, N'Maggiogatan 2', N'11221', N'Stockholm')
INSERT [dbo].[Address] ([Id], [Street], [ZipCode], [City]) VALUES (7, N'Bragatan 111', N'41453', N'Uppsala')
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
INSERT [dbo].[Author] ([Id], [FirstName], [LastName]) VALUES (25, N'Anna', N'Kågström')
INSERT [dbo].[Author] ([Id], [FirstName], [LastName]) VALUES (26, N'Åke', N'Viberg')
INSERT [dbo].[Author] ([Id], [FirstName], [LastName]) VALUES (27, N'Kerstin', N'Ballardini')
INSERT [dbo].[Author] ([Id], [FirstName], [LastName]) VALUES (28, N'Sune', N'Stjärnlöf')
INSERT [dbo].[Author] ([Id], [FirstName], [LastName]) VALUES (29, N'Hasse', N'Andersson')
INSERT [dbo].[Author] ([Id], [FirstName], [LastName]) VALUES (30, N'Samantha', N'Ellis')
INSERT [dbo].[Author] ([Id], [FirstName], [LastName]) VALUES (31, N'A. S. A.', N'Harrison')
INSERT [dbo].[Author] ([Id], [FirstName], [LastName]) VALUES (32, N'Joel', N'Dahlberg')
INSERT [dbo].[Author] ([Id], [FirstName], [LastName]) VALUES (33, N'Siri', N'Spont')
INSERT [dbo].[Author] ([Id], [FirstName], [LastName]) VALUES (34, N'Henning', N'Mankell')
INSERT [dbo].[Author] ([Id], [FirstName], [LastName]) VALUES (35, N'Kjell', N'Bergqvist')
INSERT [dbo].[Author] ([Id], [FirstName], [LastName]) VALUES (36, N'Hans', N'Christiansen')
INSERT [dbo].[Author] ([Id], [FirstName], [LastName]) VALUES (37, N'Jojo', N'Moyes')
INSERT [dbo].[Author] ([Id], [FirstName], [LastName]) VALUES (38, N'Lars', N'Kepler')
INSERT [dbo].[Author] ([Id], [FirstName], [LastName]) VALUES (39, N'Mats', N'Billmark')
INSERT [dbo].[Author] ([Id], [FirstName], [LastName]) VALUES (40, N'Susan', N'Billmark')
INSERT [dbo].[Author] ([Id], [FirstName], [LastName]) VALUES (41, N'Ingrid', N'Ottersten')
INSERT [dbo].[Author] ([Id], [FirstName], [LastName]) VALUES (42, N'Mijo', N'Balic')
INSERT [dbo].[Author] ([Id], [FirstName], [LastName]) VALUES (43, N'Ola', N'Schenström')
SET IDENTITY_INSERT [dbo].[Author] OFF
INSERT [dbo].[AuthorBook] ([AuthorId], [BookId]) VALUES (1, 38)
INSERT [dbo].[AuthorBook] ([AuthorId], [BookId]) VALUES (2, 37)
INSERT [dbo].[AuthorBook] ([AuthorId], [BookId]) VALUES (5, 51)
INSERT [dbo].[AuthorBook] ([AuthorId], [BookId]) VALUES (13, 39)
INSERT [dbo].[AuthorBook] ([AuthorId], [BookId]) VALUES (20, 42)
INSERT [dbo].[AuthorBook] ([AuthorId], [BookId]) VALUES (31, 40)
INSERT [dbo].[AuthorBook] ([AuthorId], [BookId]) VALUES (32, 43)
INSERT [dbo].[AuthorBook] ([AuthorId], [BookId]) VALUES (33, 44)
INSERT [dbo].[AuthorBook] ([AuthorId], [BookId]) VALUES (34, 45)
INSERT [dbo].[AuthorBook] ([AuthorId], [BookId]) VALUES (35, 46)
INSERT [dbo].[AuthorBook] ([AuthorId], [BookId]) VALUES (36, 46)
INSERT [dbo].[AuthorBook] ([AuthorId], [BookId]) VALUES (37, 47)
INSERT [dbo].[AuthorBook] ([AuthorId], [BookId]) VALUES (38, 48)
INSERT [dbo].[AuthorBook] ([AuthorId], [BookId]) VALUES (39, 49)
INSERT [dbo].[AuthorBook] ([AuthorId], [BookId]) VALUES (40, 49)
INSERT [dbo].[AuthorBook] ([AuthorId], [BookId]) VALUES (41, 50)
INSERT [dbo].[AuthorBook] ([AuthorId], [BookId]) VALUES (42, 50)
INSERT [dbo].[AuthorBook] ([AuthorId], [BookId]) VALUES (43, 52)
SET IDENTITY_INSERT [dbo].[Book] ON 

INSERT [dbo].[Book] ([Id], [Title], [ImagePath], [ISBN], [LanguageId], [PageNumber], [PublishingDate], [PublisherId], [Weight], [Price], [FormatId], [Description], [SeriesId], [QuantityInStock], [NotOnSale]) VALUES (37, N'Den gränslöse', N'http://www.adlibris.com/se/organisationer/covers/M/9/17/9174332953.jpg', N'9174332953', 1, 0, CAST(N'2015-05-08 00:00:00.000' AS DateTime), 2, 344, 298.0000, 2, N'En telefonsignal skär genom källaren i Köpenhamns polishus och väcker kriminalinspektör Carl Mørck från den sedvanliga morgonluren med fötterna på skrivbordet. När Carl förstår att kollegan från Bornholm vill ha Avdelning Q:s hjälp med ett gammalt hopplöst fall blir han genast avvisande. I andra änden av tråden läggs luren tyst på. Några få timmar senare står det klart att konsekvenserna av Carls kallsinnighet varit katastrofala. Tillsammans med kollegorna Assad, Rose och Gordon dras Carl in i utredningen av en sjutton år gammal tragedi. En ung livsglad kvinna försvann från en folkhögskola på Bornholm och hittades död hängande i ett träd några kilometer därifrån. För den skeptiskt lagde Carl blir det mystiska fallet särskilt svårt att finna reda i. Efterforskningarna leder till en soldyrkande sekt på Öland och en manipulatör med järnvilja som inte skyr några medel för att skydda sig själv och de sina. Den gränslöse är den sjätte delen i Jussi Adler- Olsens hyllade kriminalserie om Avdelning Q. En berättelse om vanvett, passion och besatthet." Jussi Adler- Olsen är i toppform" Jyllands- Posten', 1, 6, 0)
INSERT [dbo].[Book] ([Id], [Title], [ImagePath], [ISBN], [LanguageId], [PageNumber], [PublishingDate], [PublisherId], [Weight], [Price], [FormatId], [Description], [SeriesId], [QuantityInStock], [NotOnSale]) VALUES (38, N'De tio sämsta ekonomiska teorierna : från Keynes till yaya', N'http://www.adlibris.com/se/organisationer/covers/M/9/10/9100149004.jpg', N'9100149004', 1, 413, CAST(N'2015-05-19 00:00:00.000' AS DateTime), 1, 592, 183.0000, 1, N'Recepten för en
stabil ekonomisk
utveckling är varken
hemliga eller
okända, men de är
svåra att genomföra
i ett demokratiskt
samhällssystem. För
att citera E
U-ordförande Jean-
Claude Juncker: " Vi
vet alla vad vi
måste göra, vi vet
bara inte hur vi ska
kunna bli återvalda
efter att vi gjort
det". De etablerade
ekonomiska teorierna
står idag inför en
omprövning. Björn
Wahlroos har valt
tio teorier, eller
antaganden, alla
grundläggande för
den forskning som
kritiserar den
ekonomiska laissez
faire-skolan. Han
undersöker dessa
teoriers förmåga att
hantera vår tids
ekonomiska
verklighet. De visar
sig vara trubbiga
verktyg. ', NULL, 0, 0)
INSERT [dbo].[Book] ([Id], [Title], [ImagePath], [ISBN], [LanguageId], [PageNumber], [PublishingDate], [PublisherId], [Weight], [Price], [FormatId], [Description], [SeriesId], [QuantityInStock], [NotOnSale]) VALUES (39, N'Stormsvala', N'http://www.adlibris.com/se/organisationer/covers/M/9/17/9170368295.jpg', N'9170368295', 1, 0, CAST(N'2013-03-21 00:00:00.000' AS DateTime), 11, 166, 281.0000, 2, N'Till New York har de kommit för att hjälpa sina döttrar, som startat ett lyxigt svenskt spa på Manhattan. Hervors dotter Ingrid får ett gåtfullt brev från Sverige och en manlig kund lyckas påverka Hervor så till den milda grad att hon till och med tappar sin förmåga att skåda in i framtiden. Hon hävdar bestämt att hon är utbränd, vilket Mirjam inte riktigt tror på. Mirjam litar inte på den charmige mannen som har tid att vara på spaet ständigt och jämt. Dessutom tar han sig in i deras bostad. Vem är han egentligen och vad gör han i New York? Här är den fjärde boken i serien om Mirjam och Hervor!om tidigare böcker i serien: Svinhugg innehåller både en spännande och oväntad historia, sköna miljöer och mustiga karaktärer. Den lappländska Hervor som inte spottar i glaset och svär som en borstbindare, är en favorit. Marianne Cedervall lovar fler böcker om Mirjam och Hervor. Något att se fram emot. Susanne Blick, SKT F- Tidningen Det här är en underbar roman av debutanten Marianne Cedervall! Den är både varm, finurlig och full av humor och man bara måste veta hur det går för Mirjam! Birgitta Delbrand, Året Runt Underbart makaber debutroman som imponerar Gunilla Weddin, Skånskan', 4, 9, 0)
INSERT [dbo].[Book] ([Id], [Title], [ImagePath], [ISBN], [LanguageId], [PageNumber], [PublishingDate], [PublisherId], [Weight], [Price], [FormatId], [Description], [SeriesId], [QuantityInStock], [NotOnSale]) VALUES (40, N'Hustrun', N'http://www.adlibris.com/se/organisationer/covers/M/9/18/9187135701.jpg', N'9187135701', 1, 0, CAST(N'2014-04-02 00:00:00.000' AS DateTime), 23, 190, 281.0000, 2, N'En psykologisk relationsroman om ett äktenskap, livslögner och hur långt en kvinna är beredd att gå för att behålla det hon anser vara hennes ... Jodi och Todd har levt tillsammans i över tjugo år. De har fortfarande känslor för varandra, men den flammande passionen har sedan länge lämnat plats för ett väl inövat rollspel, med åtskilliga kompromisser och tysta eftergifter. Jodi har lärt sig att se mellan fingrarna med Todds ständiga otrohet och slagit sig till ro i den bedrägligt bekväma tillvaro som hans framgångsrika fastighetsaffärer bekostar. Hon är psykoterapeut, men tar bara emot några få, inte alltför ansträngande, patienter och har därför gott om tid att träna pilates, odla kryddor, umgås med hunden Freud och servera Todd middagar när han kommer hem  om han kommer hem. Jodi har vandrat förnekelsens väg under många år, och hon varken tror eller hoppas på en förändring. Men när Todd inleder ett förhållande med den unga Natasha går han ett steg för långt. Den välpolerade fasad Jodi arbetat så hårt för att upprätthålla rasar ihop och makarna dras nu in i ett psykologiskt maktspel där insatserna är betydligt högre än vad någon av dem kunnat ana. Och det är först nu som Todd på allvar inser vem hans en gång så fogliga hustru egentligen är ... Hustrun är en mästerligt konstruerad psykologisk roman om hur ett mångårigt äktenskap faller samman, och de inre mekanismer som kan förvandla även den mest kontrollerade människan till en hänsynslös mördare.', NULL, 10, 0)
INSERT [dbo].[Book] ([Id], [Title], [ImagePath], [ISBN], [LanguageId], [PageNumber], [PublishingDate], [PublisherId], [Weight], [Price], [FormatId], [Description], [SeriesId], [QuantityInStock], [NotOnSale]) VALUES (42, N'Djursholm : Sveriges ledarsamhälle', N'http://www.adlibris.com/se/organisationer/covers/M/9/17/9173537721.jpg', N'9173537721', 1, 740, CAST(N'2015-05-18 00:00:00.000' AS DateTime), 16, 1710, 249.0000, 1, N'Djursholm har alltsedan dess grundande år 1889 varit hem för ledare inom konst, akademi, förvaltning och framför allt näringsliv. Mikael Holmqvist presenterar en inträngande analys av detta samhälles värderingar, normer och ideal, och hur de påverkar de människor som bor och lever där. Författaren visar att Djursholm formar människor som ledare och beskriver särskilt hur detta påverkar dem som växer upp i detta samhälle. Mikael Holmqvist är ledarskapsforskare och professor i företagsekonomi vid Stockholms universitet.', NULL, 9, 0)
INSERT [dbo].[Book] ([Id], [Title], [ImagePath], [ISBN], [LanguageId], [PageNumber], [PublishingDate], [PublisherId], [Weight], [Price], [FormatId], [Description], [SeriesId], [QuantityInStock], [NotOnSale]) VALUES (43, N'Sammansvärjningen : så luras 5 miljoner svenska fondsparare', N'http://www.adlibris.com/se/organisationer/covers/M/9/17/9170377588.jpg', N'9170377588', 1, 184, CAST(N'2015-05-08 00:00:00.000' AS DateTime), 27, 336, 204.0000, 1, N'" Mycket upplysande folkbildning. Jag har sällan läst en bok med så många billiga bortförklaringar och pinsamma undanflykter. Rena Kafkavärlden, skriver Dahlberg om bankernas maskhållning, och det är tyvärr lätt att hålla med." Jan Eklund, Dagens Nyheter" Ett rafflande bankreportage" Expressen Den svenska fondbranschen är en av finansvärlden mest spektakulära framgångssagor. För 35 år sedan hade svenska folket några få miljarder placerade i fonder. Den summan har idag vuxit till ofattbara 2 800 miljarder kronor och i princip varje vuxen svensk har pengar i en fond. De fyra storbankerna är helt dominerande och fondsparandet är därmed en av deras allra största kassakor; spararna betalar avgifter på långt över 20 miljarder kronor per år. Men de svenska bankerna har byggt sina makalösa framgångar på en väl kamouflerad bluff. I Sammansvärjningen går Joel Dahlberg på djupet och tar fram tidigare okända uppgifter om en korrupt bransch. Boken visar hur bankdirektörerna är beredda att dölja, vilseleda och ljuga för att upprätthålla bilden av att man levererar något av värde till spararen. Försvinnande få av bankernas fonder lyckas nämligen med målet att slå en billigare indexfond. Det här är väl känt i bankernas toppskikt, men man håller tyst om det eftersom det skulle innebära många miljarder kronor mindre i vinst om man sade som det är. Med andra ord  en omfattande sammansvärjning av bankdirektörer riktad mot deras kunder. I kontrast till storbankernas fondkulisser presenterar Joel Dahlberg också ett antal exempel på mindre fondbolag som lyckats där bankerna misslyckats och i intervjuer berättar några av Sveriges främsta fondprofiler hur de burit sig åt.', NULL, 10, 0)
INSERT [dbo].[Book] ([Id], [Title], [ImagePath], [ISBN], [LanguageId], [PageNumber], [PublishingDate], [PublisherId], [Weight], [Price], [FormatId], [Description], [SeriesId], [QuantityInStock], [NotOnSale]) VALUES (44, N'Vägrar fega ur', N'http://www.adlibris.com/se/organisationer/covers/M/9/18/9187033356.jpg', N'9187033356', 1, 134, CAST(N'2015-05-26 00:00:00.000' AS DateTime), 28, 305, 132.0000, 1, N'Missa inte den femte och sista boken om Tilda och Thea! Nu är det dags för klassresan och Tilda kan inte hoppa av. Friluftsliv i flera dagar med tält och lägereld. Inte ens mobilerna funkar där ute. Kan det bli värre? Fnissigt, träffsäkert och fartfyllt för slukaråldern! Favoritböcker - alltid på Bokjuryns topplista!', NULL, 9, 0)
INSERT [dbo].[Book] ([Id], [Title], [ImagePath], [ISBN], [LanguageId], [PageNumber], [PublishingDate], [PublisherId], [Weight], [Price], [FormatId], [Description], [SeriesId], [QuantityInStock], [NotOnSale]) VALUES (45, N'Svenska gummistövlar', N'http://www.adlibris.com/se/organisationer/covers/M/9/17/9173436003.jpg', N'9173436003', 1, 442, CAST(N'2015-06-01 00:00:00.000' AS DateTime), 29, 558, 188.0000, 1, N'Fristående
fortsättning på
Italienska skor, en
av Henning Mankells
största
internationella
framgångar. En
höstnatt vaknar den
pensionerade läkaren
Fredrik Welin av att
det brinner
våldsamt. Han hinner
precis ta sig ut
innan det är för
sent. Allt han
lyckas få med sig är
två
vänstergummistövlar.
Morgonen därpå finns
endast aska kvar av
hans älskade
skärgårdshus. För
Fredrik blir den
pyrande ruinen också
en symbol över ett
förspillt liv som
går mot sitt slut.
Då träder hans
dotter Louise och
journalisten Lisa
Modin in i
handlingen och
skakar om hans
tillvaro i grunden.
På nyårsnatten
brinner ännu ett hus
i den östgötska
skärgården, och
höstens alla
händelser leder till
en upplösning
Fredrik Welin aldrig
hade kunnat
föreställa sig
Svenska gummistövlar
är en roman om
kärlek, svek och att
åldras. Det är en
fristående
fortsättning på
Italienska skor. Om
den skrev
Östersundsposten:
Med varsam hand
ochutan åthävor
berättar Mankell om
några människor vars
livgått i stå. Om
kärlekens kraft att
hela men också
förgöra. Det är
vackert men också
intensivt vemodigt.
Min pärla
ihöstmörkret.
					', NULL, 9, 0)
INSERT [dbo].[Book] ([Id], [Title], [ImagePath], [ISBN], [LanguageId], [PageNumber], [PublishingDate], [PublisherId], [Weight], [Price], [FormatId], [Description], [SeriesId], [QuantityInStock], [NotOnSale]) VALUES (46, N'Kjelle Berka från Högdalen : Kjell Bergqvist berättar för Hans Christiansen', N'http://www.adlibris.com/se/organisationer/covers/M/9/11/9113059351.jpg', N'9113059351', 1, 281, CAST(N'2015-03-27 00:00:00.000' AS DateTime), 6, 660, 189.0000, 1, N'Kjell Bergqvist är
en mycket uppskattad
skådespelare, både
på scen och på
filmduken. Hans
engagemang för de
utsatta är stort,
framförallt för
kvinnor och barn.
Bakom allt det här
ligger egna
erfarenheter och
värderingar från
livets stig. En
kärleksfull uppväxt
i Högdalen där
halvsyskon dyker upp
var och varannan
dag, via päronglass
i nyllet på rektorn
i första ring med
relegering som
resultat. Det här är
en berättelse från
de första stapplande
stegen till i dag.
Alla gamla kolleger,
från Sif Ruud till
Tommy Körberg, som
har påverkat Kjelle
i hans yrke. Det
handlar om ett liv
med en förbrytare,
om möten med
drottningen och
middag med
regeringen. Om
Kjelles alla kvinnor
med bland annat sju
år i en romsk familj
och äktenskapet med
Miss Universum. Sorg
och glädje, och
fantastiskt roligt.
					', NULL, 10, 0)
INSERT [dbo].[Book] ([Id], [Title], [ImagePath], [ISBN], [LanguageId], [PageNumber], [PublishingDate], [PublisherId], [Weight], [Price], [FormatId], [Description], [SeriesId], [QuantityInStock], [NotOnSale]) VALUES (47, N'Etthundra mil', N'http://www.adlibris.com/se/organisationer/covers/M/9/18/9187343576.jpg', N'9187343576', 1, 384, CAST(N'2015-05-06 00:00:00.000' AS DateTime), 30, 210, 45.0000, 8, N'Författaren till "
Livet efter dig" är
tillbaka med en
romantisk, sorglig
och rolig road trip
genom
Storbritanniens
klassamhälle.
Ensamstående
tvåbarnsmamman Jess
måste jobba dubbelt
för att försörja
familjen. I
T-miljonären Ed har
hamnat i en
insiderhärva. Deras
vägar korsas, och
frågan är: kan de
rädda varandra? "
Moyes har än en gång
skrivit en klar
bladvändare som både
roar och berör." UNT', NULL, 10, 0)
INSERT [dbo].[Book] ([Id], [Title], [ImagePath], [ISBN], [LanguageId], [PageNumber], [PublishingDate], [PublisherId], [Weight], [Price], [FormatId], [Description], [SeriesId], [QuantityInStock], [NotOnSale]) VALUES (48, N'Stalker', N'http://www.adlibris.com/se/organisationer/covers/M/9/10/9100136743.jpg', N'9100136743', 1, 602, CAST(N'2014-10-20 00:00:00.000' AS DateTime), 1, 740, 210.0000, 1, N'Lås dörren, dra för
gardinerna -
thrillermästaren
Lars Kepler är
tillbaka med en ny
bladvändare! Om
lamporna är tända
kan en stalker se
dig utifrån, men om
lamporna är släckta
kan du inte se en
stalker som redan är
inne... För nio år
sedan dömdes prästen
Rocky Kyrklund till
rättspsykiatrisk
vård för ett brutalt
mord. Själv minns
han ingenting. Efter
en svår olycka har
han återkommande
blackouter. Samma
sommar som hans
återanpassning till
samhället påbörjas,
skickar någon en
filmsekvens på en
kvinna i ett fönster
till polisen. Nästa
dag hittas kvinnan
död i sitt hem. Det
är inte bara det
bestialiska våldet
som leder tankarna
till Rocky Kyrklunds
gamla mord. En ny
film kommer till
polisen. Ingen
förstår vad som
händer och Joona
Linna är försvunnen
sedan mer än ett år.
Nästan alla tror att
han är död. Nästan
alla.', 10, 10, 0)
INSERT [dbo].[Book] ([Id], [Title], [ImagePath], [ISBN], [LanguageId], [PageNumber], [PublishingDate], [PublisherId], [Weight], [Price], [FormatId], [Description], [SeriesId], [QuantityInStock], [NotOnSale]) VALUES (49, N'LÄR DIG LEVA: Mindre stress - Mer närvaro', N'http://www.adlibris.com/se/organisationer/covers/M/9/19/9197260002.jpg', N'9197260002', 1, 208, CAST(N'2014-12-10 00:00:00.000' AS DateTime), 31, 405, 168.0000, 1, N'BOKE N ALL A PRATA R
O M!&nbsp;&nbsp;
TOPPA R
FÖRSÄLJNINGSLISTORN
A I SVERIG E&nbsp;
JUS T N U! I den här
banbrytande boken
visar Mats Billmark
och Susan Billmark
att det är fullt
möjligt att komma
till rätta med
stress och oro. De
berättar hur viktigt
kommunikation är för
att ett förhållande
ska fungera och att
förändring är ett
måste om du inte är
tillfreds med ditt
liv. På ett enkelt
och tydligt sätt
förklarar de varför
medveten närvaro i
nuet är nyckeln till
ett lugnare, gladare
och mer harmoniskt
liv." Någon gång har
vi alla varit med om
att allt plötsligt
faller på plats och
att vi under några
korta ögonblick
upplever ett lugn
och en inre stillhet
som vi vill stanna
kvar i och ha mycket
&nbsp;mer av. Du vet
säkert vad vi menar,
några sekunder av
total kärlek och
intensiv glädje
tillsammans med ditt
barn, din partner,
ditt husdjur eller
en fantastisk
upplevelse i
naturen. Du har fått
uppleva ett litet
smakprov av medveten
närvaro." LÄ R DI G
LEV A Ä R BOKE N ME
D LIVSKUNSKAPE N SO
M KOMME R FÖRÄNDR A
MÅNG A MÄNNISKOR S
LI V!&nbsp;"
Tacksamheten över
att någon valt att
skriva en så här
underbar bok med
många redskap i går
inte att beskriva i
ord. Jag hoppas den
kommer hjälpa dig
lika mycket som den
hjälper&nbsp;mig!"
Anne- Marie
Eriksson&nbsp;&nbsp;" En
mycket läsvärd bok
för alla med
stressrelaterade
symtom." Inga- Lill
Morén Hubinette,
Läkare&nbsp;&nbsp;"
Kan verkligen
rekommendera LÄ R DI
G LEV A! Den får mig
att varva ner och
stressa av. Känner
mig både gladare och
positivare:" Eva
Vigulv&nbsp;" Fick
boken av min
fru.&nbsp; Är
egentligen ingen
större bokläsare men
oj vad många bra råd
jag har fått att
hantera både min
stress och oro."
Mattias Ljung&nbsp;"
Är sååå lycklig att
jag hittade denna
bok, den hjälper mig
när tankarna blir
för mycket.
Rekommenderar LÄ R
DI G LEV A till alla
jag känner." Erika
Lindström&nbsp;"
Boken är min bibel
vid frukostbordet
varje morgon, kommer
aldrig att låna ut
den. Mitt verktyg
2015!" Mikaela
Thim&nbsp;" Jag har
läst många böcker om
stress, men LÄ R DI
G LEV A är helt
klart bäst. Så många
klockrena och bra
tips som jag har
tagit till mig."
Ulrika
Bäckman&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;', NULL, 2, 0)
INSERT [dbo].[Book] ([Id], [Title], [ImagePath], [ISBN], [LanguageId], [PageNumber], [PublishingDate], [PublisherId], [Weight], [Price], [FormatId], [Description], [SeriesId], [QuantityInStock], [NotOnSale]) VALUES (50, N'Effektstyrning av IT : nyttan uppstår i användningen', N'http://www.adlibris.com/se/organisationer/covers/M/9/14/9147095865.jpg', N'9147095865', 1, 99, CAST(N'2010-05-27 00:00:00.000' AS DateTime), 32, 178, 245.0000, 4, N'Effektstyrning av
ITI T-produkter
skapar i sig inga
effekter &ndash; de
uppstår i
användningen. För
att få avsedd effekt
av sina
investeringar borde
alla beställare
aktivt styra sina
projekt mot dessa
effekter. Det låter
självklart, men är
det inte i
praktiken.', NULL, 10, 0)
INSERT [dbo].[Book] ([Id], [Title], [ImagePath], [ISBN], [LanguageId], [PageNumber], [PublishingDate], [PublisherId], [Weight], [Price], [FormatId], [Description], [SeriesId], [QuantityInStock], [NotOnSale]) VALUES (51, N'HTML och CSS-boken', N'http://www.adlibris.com/se/organisationer/covers/M/9/16/9163609940.jpg', N'9163609940', 1, 505, CAST(N'2011-11-30 00:00:00.000' AS DateTime), 5, 794, 204.0000, 4, N'Den sjunde upplagan
av HTM L och CS
S-boken täcker in
HTM L5, XHTM L och
CS S. Boken börjar
från grunden och
innehåller allt du
behöver veta för att
skriva webbsidor.
Författaren
beskriver
systematiskt, med
hundratals exempel,
hur du lägger in
rätt taggar så att
dina webbsidor får
det utseende och den
funktion du vill. Du
kan ha stor glädje
av att kunna HTM L
även om du använder
andra program som
skapar HTM L-kod,
eller översätter
färdiga dokument
till HTM L. HTM L-
och CS S-boken är
skriven för Linux-,
Mac- och P
C-användare.
Betoningen ligger på
hur man skriver
dokument som kan
visas på alla
datorer och med alla
webläsare.
Skillnaderna mellan
XHTM L och HTM L tas
upp efter hand.
Boken har blivit
mycket uppskattad
och den här upplagan
markerar bokens
femtonårsjubileum.
Den nya upplagan är
som alltid noggrant
genomarbetad och
uppdaterad in i
minsta detalj för
att vara helt
aktuell. O M
FÖRFATTAREN Rolf
Staflin är fil.mag.
i datavetenskap och
arbetar som I
T-arkitekt och
utvecklare på
konsultbas. Han har
arbetat med allt
från enkla
webbplatser med
några få sidor till
stora EJ B-baserade
klient/serversystem
med tusentals
användare. De
senaste åren har
Rolf utvecklat ett
tiotal appar för i
Phone och Android
samt webbplatser för
mobila enheter.', 2, 15, 0)
INSERT [dbo].[Book] ([Id], [Title], [ImagePath], [ISBN], [LanguageId], [PageNumber], [PublishingDate], [PublisherId], [Weight], [Price], [FormatId], [Description], [SeriesId], [QuantityInStock], [NotOnSale]) VALUES (52, N'Mindfulness i vardagen : vägar till medveten närvaro', N'http://www.adlibris.com/se/organisationer/covers/M/9/18/9185675059.jpg', N'9185675059', 1, 240, CAST(N'2007-09-28 00:00:00.000' AS DateTime), 13, 448, 192.0000, 1, N'Grundboken i
mindfulness. Förord
av Jon Kabat- Zinn.
Cd-skiva medföljer!
Mindfulness är
träning i att vara
närvarande i nuet.
Ett österländskt
sätt att förhålla
sig till livet som
motverkar oro och
stress. Mindfulness
i vardagen är en
efterlängtad
introduktion till
detta
förhållningssätt som
på kort tid blivit
populärt i
Sverige.&nbsp;
Mindfulness i
vardagen utgår Ola
Schenström från
vardagssituationer
och beskriver hur vi
kan lära oss att se
dem på ett nytt
sätt, tänka om och
göra kloka val genom
att vara medvetet
närvarande. Genom
övningar och
praktisk handledning
blir boken en
följeslagare, från
det att vi vaknar på
morgonen tills vi
somnar på kvällen.
Ola Schenström är
idag den enda
läkaren i Sverige
som enbart arbetar
med mindfulness inom
vården. Han är
utbildad av
mindfulness grundare
Jon Kabat- Zinn och
är en av Sveriges
främsta experter på
området.', NULL, 10, 0)
SET IDENTITY_INSERT [dbo].[Book] OFF
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (37, 23)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (37, 33)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (37, 63)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (37, 64)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (38, 6)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (38, 28)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (38, 45)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (38, 65)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (38, 66)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (39, 9)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (39, 23)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (39, 33)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (39, 39)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (39, 61)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (39, 62)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (40, 23)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (40, 33)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (40, 63)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (40, 64)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (40, 100)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (42, 21)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (42, 82)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (42, 83)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (42, 84)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (43, 6)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (43, 7)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (43, 45)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (43, 103)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (43, 104)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (43, 105)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (44, 23)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (44, 26)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (44, 33)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (44, 34)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (44, 106)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (44, 107)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (45, 23)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (45, 33)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (45, 39)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (45, 62)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (46, 2)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (46, 14)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (46, 97)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (46, 108)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (46, 109)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (47, 23)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (47, 33)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (47, 39)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (47, 64)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (48, 23)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (48, 33)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (48, 62)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (48, 63)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (49, 7)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (49, 19)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (49, 23)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (49, 39)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (49, 53)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (49, 54)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (49, 110)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (49, 111)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (50, 3)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (50, 38)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (50, 112)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (51, 3)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (51, 36)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (51, 37)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (51, 38)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (52, 8)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (52, 54)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (52, 113)
INSERT [dbo].[BookGenre] ([BookId], [GenreId]) VALUES (52, 114)
SET IDENTITY_INSERT [dbo].[Contact] ON 

INSERT [dbo].[Contact] ([Id], [SocialSecurityNumber], [Email], [CellPhoneNumber], [FirstName], [LastName], [AddressId]) VALUES (3, N'19880101-0102', N'hej@hej.se', N'07012345678', N'Zlatan', N'Zlatko', 4)
INSERT [dbo].[Contact] ([Id], [SocialSecurityNumber], [Email], [CellPhoneNumber], [FirstName], [LastName], [AddressId]) VALUES (4, N'19880201-0102', N'dude@hotmail.com', N'07012345679', N'Johannes', N'Andersson', 5)
INSERT [dbo].[Contact] ([Id], [SocialSecurityNumber], [Email], [CellPhoneNumber], [FirstName], [LastName], [AddressId]) VALUES (5, N'197301010000', N'hej@hej.se', N'07012345678', N'Zlatan', N'Zlatko', 4)
INSERT [dbo].[Contact] ([Id], [SocialSecurityNumber], [Email], [CellPhoneNumber], [FirstName], [LastName], [AddressId]) VALUES (6, N'197301010001', N'Maggio@maggio.com', N'07012345645', N'Veronica', N'Maggio', 6)
INSERT [dbo].[Contact] ([Id], [SocialSecurityNumber], [Email], [CellPhoneNumber], [FirstName], [LastName], [AddressId]) VALUES (7, N'19880101-0456', N'maria@google.com', N'07012345695', N'Maria', N'Petersson', 7)
INSERT [dbo].[Contact] ([Id], [SocialSecurityNumber], [Email], [CellPhoneNumber], [FirstName], [LastName], [AddressId]) VALUES (8, N'19880101-0104', N'Maggio@maggio.com', N'07012345678', N'Johannes', N'Maggio', 7)
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
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (91, N'Hästar & ponnyer')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (92, N'Material & kursböcker')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (93, N'Andra språk än engelska')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (94, N'Fct - Svenska för utlänningar')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (95, N'F - Språkvetenskap')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (96, N'Ishockey')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (97, N'Självbiografier')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (98, N'Litteraturhistoria & litteraturkritik')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (99, N'G - Litteraturvetenskap')
GO
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (100, N'Thrillers')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (101, N'Rb - Idrott och sport')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (102, N'R - Idrott, lek och spel')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (103, N'Investeringar & värdepapper')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (104, N'Privatekonomi')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (105, N'Qci - Privatekonomi')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (106, N'Läsnivå: från ca 9 år')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (107, N'Allmän skönlitteratur')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (108, N'Teater: särskilda skådespelare & regissörer')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (109, N'Särskilda skådespelare & artister')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (110, N'Yrkesvägledning')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (111, N'Karriärplanering & konsten att vinna framgång')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (112, N'Puba - Systemutveckling')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (113, N'Ande, själ & kropp: meditation & visualisering')
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (114, N'Dokba - Meditation')
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

INSERT [dbo].[Order] ([Id], [AddressId], [ContactId], [Comment], [OrderDate], [OrderNumber], [TotalPrice], [DeliveryTypeId], [PaymentTypeId]) VALUES (31, 4, 3, N'Leverera innan lunch', CAST(N'2015-06-03' AS Date), N'ed58cc00-65d3-4032-b4c8-c746aefdea68', 249.0000, 1, 1)
INSERT [dbo].[Order] ([Id], [AddressId], [ContactId], [Comment], [OrderDate], [OrderNumber], [TotalPrice], [DeliveryTypeId], [PaymentTypeId]) VALUES (32, 5, 4, N'Tack', CAST(N'2015-06-03' AS Date), N'ca8d161b-0eda-4bc4-bcf5-3d1723442899', 188.0000, 3, 1)
INSERT [dbo].[Order] ([Id], [AddressId], [ContactId], [Comment], [OrderDate], [OrderNumber], [TotalPrice], [DeliveryTypeId], [PaymentTypeId]) VALUES (33, 4, 5, NULL, CAST(N'2015-06-03' AS Date), N'fe67f7fe-70ed-4ed1-9f5f-a3d8e8368d23', 1192.0000, 1, 1)
INSERT [dbo].[Order] ([Id], [AddressId], [ContactId], [Comment], [OrderDate], [OrderNumber], [TotalPrice], [DeliveryTypeId], [PaymentTypeId]) VALUES (34, 6, 6, N'Leverera till min dörr', CAST(N'2015-06-03' AS Date), N'9bb080fe-1364-4495-b171-a5087f29f90c', 281.0000, 1, 1)
INSERT [dbo].[Order] ([Id], [AddressId], [ContactId], [Comment], [OrderDate], [OrderNumber], [TotalPrice], [DeliveryTypeId], [PaymentTypeId]) VALUES (35, 7, 7, NULL, CAST(N'2015-06-03' AS Date), N'b07e2ce1-a79e-4ad0-8a8e-7e529e820020', 132.0000, 1, 6)
INSERT [dbo].[Order] ([Id], [AddressId], [ContactId], [Comment], [OrderDate], [OrderNumber], [TotalPrice], [DeliveryTypeId], [PaymentTypeId]) VALUES (36, 7, 8, NULL, CAST(N'2015-06-03' AS Date), N'48152095-f5b3-48ed-b8cc-12ad26d12d88', 183.0000, 1, 4)
SET IDENTITY_INSERT [dbo].[Order] OFF
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([Id], [OrderId], [QuantityOrdered], [BookId]) VALUES (29, 31, 1, 42)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [QuantityOrdered], [BookId]) VALUES (30, 32, 1, 45)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [QuantityOrdered], [BookId]) VALUES (31, 33, 4, 37)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [QuantityOrdered], [BookId]) VALUES (32, 34, 1, 39)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [QuantityOrdered], [BookId]) VALUES (33, 35, 1, 44)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [QuantityOrdered], [BookId]) VALUES (34, 36, 1, 38)
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
INSERT [dbo].[Publisher] ([Id], [Name]) VALUES (24, N'Natur & Kultur Läromedel')
INSERT [dbo].[Publisher] ([Id], [Name]) VALUES (25, N'Sportförlaget i Europa')
INSERT [dbo].[Publisher] ([Id], [Name]) VALUES (26, N'Sportförlaget i Europa AB')
INSERT [dbo].[Publisher] ([Id], [Name]) VALUES (27, N'Ordfront Förlag')
INSERT [dbo].[Publisher] ([Id], [Name]) VALUES (28, N'Hippo Bokförlag')
INSERT [dbo].[Publisher] ([Id], [Name]) VALUES (29, N'Leopard Förlag')
INSERT [dbo].[Publisher] ([Id], [Name]) VALUES (30, N'Printz Publishing')
INSERT [dbo].[Publisher] ([Id], [Name]) VALUES (31, N'Inre Hälsa Förlag')
INSERT [dbo].[Publisher] ([Id], [Name]) VALUES (32, N'Liber AB')
SET IDENTITY_INSERT [dbo].[Publisher] OFF
SET IDENTITY_INSERT [dbo].[Reader] ON 

INSERT [dbo].[Reader] ([Id], [FirstName], [LastName]) VALUES (1, N'Stefan', N'Sauk')
INSERT [dbo].[Reader] ([Id], [FirstName], [LastName]) VALUES (2, N'Susanne Alfvengren;Gun', N'Olofsson')
INSERT [dbo].[Reader] ([Id], [FirstName], [LastName]) VALUES (3, N'Johan', N'Holmberg')
INSERT [dbo].[Reader] ([Id], [FirstName], [LastName]) VALUES (4, N'Alexandra', N'Rapaport')
SET IDENTITY_INSERT [dbo].[Reader] OFF
INSERT [dbo].[ReaderInBook] ([ReaderId], [BookId]) VALUES (1, 37)
INSERT [dbo].[ReaderInBook] ([ReaderId], [BookId]) VALUES (2, 39)
INSERT [dbo].[ReaderInBook] ([ReaderId], [BookId]) VALUES (4, 40)
SET IDENTITY_INSERT [dbo].[Series] ON 

INSERT [dbo].[Series] ([Id], [Name]) VALUES (1, N'Avdelning Q 06')
INSERT [dbo].[Series] ([Id], [Name]) VALUES (2, N'Pagina Classic ')
INSERT [dbo].[Series] ([Id], [Name]) VALUES (3, N'Kommunikation i organisationer ')
INSERT [dbo].[Series] ([Id], [Name]) VALUES (4, N'Mirjam och Hervor 4')
INSERT [dbo].[Series] ([Id], [Name]) VALUES (9, N'Trilogi 1')
INSERT [dbo].[Series] ([Id], [Name]) VALUES (10, N'Joona Linna 5')
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
