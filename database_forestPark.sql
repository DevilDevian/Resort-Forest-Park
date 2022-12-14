USE [master]
GO
/****** Object:  Database [db_ForestPark]    Script Date: 06.12.2022 15:47:46 ******/
CREATE DATABASE [db_ForestPark]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db_ForestPark', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\db_ForestPark.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'db_ForestPark_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\db_ForestPark_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [db_ForestPark] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_ForestPark].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_ForestPark] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db_ForestPark] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db_ForestPark] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db_ForestPark] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db_ForestPark] SET ARITHABORT OFF 
GO
ALTER DATABASE [db_ForestPark] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [db_ForestPark] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db_ForestPark] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db_ForestPark] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db_ForestPark] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db_ForestPark] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db_ForestPark] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db_ForestPark] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db_ForestPark] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db_ForestPark] SET  DISABLE_BROKER 
GO
ALTER DATABASE [db_ForestPark] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db_ForestPark] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db_ForestPark] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db_ForestPark] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db_ForestPark] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db_ForestPark] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db_ForestPark] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db_ForestPark] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [db_ForestPark] SET  MULTI_USER 
GO
ALTER DATABASE [db_ForestPark] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db_ForestPark] SET DB_CHAINING OFF 
GO
ALTER DATABASE [db_ForestPark] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [db_ForestPark] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [db_ForestPark] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [db_ForestPark] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [db_ForestPark] SET QUERY_STORE = OFF
GO
USE [db_ForestPark]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 06.12.2022 15:47:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[id_clients] [int] NOT NULL,
	[surname] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[patronymic] [nvarchar](50) NOT NULL,
	[password_SeriesNumber] [nvarchar](30) NOT NULL,
	[birthday] [date] NOT NULL,
	[address] [nvarchar](100) NOT NULL,
	[e-mail address] [nvarchar](100) NOT NULL,
	[password] [nvarchar](25) NOT NULL,
 CONSTRAINT [PK_Clients] PRIMARY KEY CLUSTERED 
(
	[id_clients] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Logins]    Script Date: 06.12.2022 15:47:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logins](
	[id_login] [nvarchar](50) NOT NULL,
	[id_staff] [int] NOT NULL,
	[time] [datetime] NOT NULL,
	[id_typeLogin] [int] NOT NULL,
 CONSTRAINT [PK_Logins_1] PRIMARY KEY CLUSTERED 
(
	[id_login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 06.12.2022 15:47:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id_orders] [int] IDENTITY(1,45462576) NOT NULL,
	[dateAdd] [date] NOT NULL,
	[time] [time](7) NOT NULL,
	[id_clients] [int] NOT NULL,
	[id_status] [int] NOT NULL,
	[dateEnd] [date] NULL,
	[time_rental_in_minutes] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[id_orders] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderServices]    Script Date: 06.12.2022 15:47:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderServices](
	[id_order] [int] NOT NULL,
	[id_service] [int] NOT NULL,
 CONSTRAINT [PK_OrderServices_1] PRIMARY KEY CLUSTERED 
(
	[id_order] ASC,
	[id_service] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Services]    Script Date: 06.12.2022 15:47:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[id_service] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[code_service] [nvarchar](20) NULL,
	[price] [money] NOT NULL,
 CONSTRAINT [PK_Services] PRIMARY KEY CLUSTERED 
(
	[id_service] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 06.12.2022 15:47:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[id_staff] [int] IDENTITY(1,111) NOT NULL,
	[id_type] [int] NOT NULL,
	[surname] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[patronymic] [nvarchar](50) NOT NULL,
	[login] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[id_staff] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatusOrder]    Script Date: 06.12.2022 15:47:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusOrder](
	[id_status] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_StatusOrder] PRIMARY KEY CLUSTERED 
(
	[id_status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeLogin]    Script Date: 06.12.2022 15:47:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeLogin](
	[id_typeLogin] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_TypeLogin] PRIMARY KEY CLUSTERED 
(
	[id_typeLogin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeUsers]    Script Date: 06.12.2022 15:47:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeUsers](
	[id_type] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TypeUsers] PRIMARY KEY CLUSTERED 
(
	[id_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Clients] ([id_clients], [surname], [name], [patronymic], [password_SeriesNumber], [birthday], [address], [e-mail address], [password]) VALUES (45462526, N'Фролов', N'Андрей', N'Иванович', N'1180 176596', CAST(N'2001-07-14' AS Date), N'344288, г. Санкт-Петербург, ул. Чехова, 1, кв. 34', N'gohufreilagrau-3818@yopmail.com', N'cl12345')
INSERT [dbo].[Clients] ([id_clients], [surname], [name], [patronymic], [password_SeriesNumber], [birthday], [address], [e-mail address], [password]) VALUES (45462527, N'Николаев', N'Даниил', N'Всеволодович', N'2280 223523', CAST(N'2001-02-10' AS Date), N'614164, г. Санкт-Петербург, ул. Степная, 30, кв. 75', N'xawugosune-1385@yopmail.com', N'cl12346')
INSERT [dbo].[Clients] ([id_clients], [surname], [name], [patronymic], [password_SeriesNumber], [birthday], [address], [e-mail address], [password]) VALUES (45462528, N'Снегирев', N'Макар', N'Иванович', N'4560 354155', CAST(N'1998-05-21' AS Date), N'394242, г. Санкт-Петербург, ул. Коммунистическая, 43, кв. 57', N'satrahuddusei-4458@yopmail.com', N'cl12347')
INSERT [dbo].[Clients] ([id_clients], [surname], [name], [patronymic], [password_SeriesNumber], [birthday], [address], [e-mail address], [password]) VALUES (45462529, N'Иванов', N'Иван', N'Ильич', N'9120 554296', CAST(N'1998-10-01' AS Date), N'660540, г. Санкт-Петербург, ул. Солнечная, 25, кв. 78', N'boippaxeufrepra-7093@yopmail.com', N'cl12348')
INSERT [dbo].[Clients] ([id_clients], [surname], [name], [patronymic], [password_SeriesNumber], [birthday], [address], [e-mail address], [password]) VALUES (45462530, N'Филиппова', N'Анна', N'Глебовна', N'2367 558134', CAST(N'1976-05-31' AS Date), N'125837, г. Санкт-Петербург, ул. Шоссейная, 40, кв. 92', N'zapramaxesu-7741@yopmail.com', N'cl12349')
INSERT [dbo].[Clients] ([id_clients], [surname], [name], [patronymic], [password_SeriesNumber], [birthday], [address], [e-mail address], [password]) VALUES (45462531, N'Иванов', N'Михаил', N'Владимирович', N'7101 669343', CAST(N'1985-11-04' AS Date), N'125703, г. Санкт-Петербург, ул. Партизанская, 49, кв. 84', N'rouzecroummegre-3899@yopmail.com', N'cl12350')
INSERT [dbo].[Clients] ([id_clients], [surname], [name], [patronymic], [password_SeriesNumber], [birthday], [address], [e-mail address], [password]) VALUES (45462532, N'Власов', N'Дмитрий', N'Александрович', N'3455 719630', CAST(N'1998-08-17' AS Date), N'625283, г. Санкт-Петербург, ул. Победы, 46, кв. 7', N'ziyeuddocrabri-4748@yopmail.com', N'cl12351')
INSERT [dbo].[Clients] ([id_clients], [surname], [name], [patronymic], [password_SeriesNumber], [birthday], [address], [e-mail address], [password]) VALUES (45462533, N'Серова', N'Екатерина', N'Львовна', N'2377 871623', CAST(N'1984-10-24' AS Date), N'614611, г. Санкт-Петербург, ул. Молодежная, 50, кв. 78', N'ketameissoinnei-1951@yopmail.com', N'cl12352')
INSERT [dbo].[Clients] ([id_clients], [surname], [name], [patronymic], [password_SeriesNumber], [birthday], [address], [e-mail address], [password]) VALUES (45462534, N'Борисова', N'Ирина', N'Ивановна', N'8755 921148', CAST(N'1976-10-14' AS Date), N'454311, г. Санкт-Петербург, ул. Новая, 19, кв. 78', N'yipraubaponou-5849@yopmail.com', N'cl12353')
INSERT [dbo].[Clients] ([id_clients], [surname], [name], [patronymic], [password_SeriesNumber], [birthday], [address], [e-mail address], [password]) VALUES (45462535, N'Зайцев', N'Никита', N'Артёмович', N'4355 104594', CAST(N'1999-10-14' AS Date), N'660007, г. Санкт-Петербург, ул. Октябрьская, 19, кв. 42', N'crapedocouca-3572@yopmail.com', N'cl12354')
INSERT [dbo].[Clients] ([id_clients], [surname], [name], [patronymic], [password_SeriesNumber], [birthday], [address], [e-mail address], [password]) VALUES (45462536, N'Медведев', N'Святослав', N'Евгеньевич', N'2791 114390', CAST(N'1985-07-13' AS Date), N'603036, г. Санкт-Петербург, ул. Садовая, 4, кв. 13', N'ceigoixakaunni-9227@yopmail.com', N'cl12355')
INSERT [dbo].[Clients] ([id_clients], [surname], [name], [patronymic], [password_SeriesNumber], [birthday], [address], [e-mail address], [password]) VALUES (45462537, N'Коротков', N'Кирилл', N'Алексеевич', N'5582 126286', CAST(N'1976-05-26' AS Date), N'450983, г. Санкт-Петербург, ул. Комсомольская, 26, кв. 60', N'yeimmeiwauzomo-7054@yopmail.com', N'cl12356')
INSERT [dbo].[Clients] ([id_clients], [surname], [name], [patronymic], [password_SeriesNumber], [birthday], [address], [e-mail address], [password]) VALUES (45462538, N'Калашникова', N'Арина', N'Максимовна', N'2978 133653', CAST(N'1999-08-13' AS Date), N'394782, г. Санкт-Петербург, ул. Чехова, 3, кв. 14', N'poleifenevi-1560@yopmail.com', N'cl12357')
INSERT [dbo].[Clients] ([id_clients], [surname], [name], [patronymic], [password_SeriesNumber], [birthday], [address], [e-mail address], [password]) VALUES (45462539, N'Минина', N'Таисия', N'Кирилловна', N'7512 141956', CAST(N'1985-10-13' AS Date), N'603002, г. Санкт-Петербург, ул. Дзержинского, 28, кв. 56', N'kauprezofautei-6607@yopmail.com', N'cl12358')
INSERT [dbo].[Clients] ([id_clients], [surname], [name], [patronymic], [password_SeriesNumber], [birthday], [address], [e-mail address], [password]) VALUES (45462540, N'Наумов', N'Серафим', N'Романович', N'5046 158433', CAST(N'1999-04-15' AS Date), N'450558, г. Санкт-Петербург, ул. Набережная, 30, кв. 71', N'quaffaullelourei-1667@yopmail.com', N'cl12359')
INSERT [dbo].[Clients] ([id_clients], [surname], [name], [patronymic], [password_SeriesNumber], [birthday], [address], [e-mail address], [password]) VALUES (45462541, N'Воробьева', N'Василиса', N'Евгеньевна', N'2460 169505', CAST(N'1999-01-13' AS Date), N'394060, г. Санкт-Петербург, ул. Фрунзе, 43, кв. 79', N'jsteele@rojas-robinson.net', N'cl12360')
INSERT [dbo].[Clients] ([id_clients], [surname], [name], [patronymic], [password_SeriesNumber], [birthday], [address], [e-mail address], [password]) VALUES (45462542, N'Калинин', N'Александр', N'Андреевич', N'3412 174593', CAST(N'1999-01-07' AS Date), N'410661, г. Санкт-Петербург, ул. Школьная, 50, кв. 53', N'vhopkins@lewis-mullen.com', N'cl12361')
INSERT [dbo].[Clients] ([id_clients], [surname], [name], [patronymic], [password_SeriesNumber], [birthday], [address], [e-mail address], [password]) VALUES (45462543, N'Кузнецова', N'Милана', N'Владиславовна', N'4950 183032', CAST(N'1999-01-24' AS Date), N'625590, г. Санкт-Петербург, ул. Коммунистическая, 20, кв. 34', N'nlewis@yahoo.com', N'cl12362')
INSERT [dbo].[Clients] ([id_clients], [surname], [name], [patronymic], [password_SeriesNumber], [birthday], [address], [e-mail address], [password]) VALUES (45462544, N'Фирсов', N'Егор', N'Романович', N'5829 219464', CAST(N'1993-09-02' AS Date), N'625683, г. Санкт-Петербург, ул. 8 Марта, 20, кв. 21', N'garciadavid@mckinney-mcbride.com', N'cl12363')
INSERT [dbo].[Clients] ([id_clients], [surname], [name], [patronymic], [password_SeriesNumber], [birthday], [address], [e-mail address], [password]) VALUES (45462545, N'Зимина', N'Агния', N'Александровна', N'6443 208059', CAST(N'1998-09-03' AS Date), N'400562, г. Санкт-Петербург, ул. Зеленая, 32, кв. 67', N'cbradley@castro.com', N'cl12364')
INSERT [dbo].[Clients] ([id_clients], [surname], [name], [patronymic], [password_SeriesNumber], [birthday], [address], [e-mail address], [password]) VALUES (45462546, N'Титов', N'Андрей', N'Глебович', N'7079 213265', CAST(N'1985-10-23' AS Date), N'614510, г. Санкт-Петербург, ул. Маяковского, 47, кв. 72', N'cuevascatherine@carlson.biz', N'cl12365')
INSERT [dbo].[Clients] ([id_clients], [surname], [name], [patronymic], [password_SeriesNumber], [birthday], [address], [e-mail address], [password]) VALUES (45462547, N'Орлов', N'Николай', N'Егорович', N'8207 522702', CAST(N'1985-07-27' AS Date), N'410542, г. Санкт-Петербург, ул. Светлая, 46, кв. 82', N'thomasmoore@wilson-singh.net', N'cl12366')
INSERT [dbo].[Clients] ([id_clients], [surname], [name], [patronymic], [password_SeriesNumber], [birthday], [address], [e-mail address], [password]) VALUES (45462548, N'Кузнецова', N'Аиша', N'Михайловна', N'9307 232158', CAST(N'1998-10-04' AS Date), N'620839, г. Санкт-Петербург, ул. Цветочная, 8, кв. 100', N'jessica84@hotmail.com', N'cl12367')
INSERT [dbo].[Clients] ([id_clients], [surname], [name], [patronymic], [password_SeriesNumber], [birthday], [address], [e-mail address], [password]) VALUES (45462549, N'Куликов', N'Никита', N'Георгиевич', N'1357 242839', CAST(N'1999-04-23' AS Date), N'443890, г. Санкт-Петербург, ул. Коммунистическая, 1, кв. 10', N'jessicapark@hotmail.com', N'cl12368')
INSERT [dbo].[Clients] ([id_clients], [surname], [name], [patronymic], [password_SeriesNumber], [birthday], [address], [e-mail address], [password]) VALUES (45462550, N'Карпова', N'София', N'Егоровна', N'1167 256636', CAST(N'1993-10-01' AS Date), N'603379, г. Санкт-Петербург, ул. Спортивная, 46, кв. 95', N'ginaritter@schneider-buchanan.com', N'cl12369')
INSERT [dbo].[Clients] ([id_clients], [surname], [name], [patronymic], [password_SeriesNumber], [birthday], [address], [e-mail address], [password]) VALUES (45462551, N'Смирнова', N'Дарья', N'Макаровна', N'1768 266986', CAST(N'1976-03-22' AS Date), N'603721, г. Санкт-Петербург, ул. Гоголя, 41, кв. 57', N'stephen99@yahoo.com', N'cl12370')
INSERT [dbo].[Clients] ([id_clients], [surname], [name], [patronymic], [password_SeriesNumber], [birthday], [address], [e-mail address], [password]) VALUES (45462552, N'Абрамова', N'Александра', N'Мироновна', N'1710 427875', CAST(N'1999-03-26' AS Date), N'410172, г. Санкт-Петербург, ул. Северная, 13, кв. 86', N'lopezlisa@hotmail.com', N'cl12371')
INSERT [dbo].[Clients] ([id_clients], [surname], [name], [patronymic], [password_SeriesNumber], [birthday], [address], [e-mail address], [password]) VALUES (45462553, N'Наумов', N'Руслан', N'Михайлович', N'1806 289145', CAST(N'1999-10-11' AS Date), N'420151, г. Санкт-Петербург, ул. Вишневая, 32, кв. 81', N'lori17@hotmail.com', N'cl12372')
INSERT [dbo].[Clients] ([id_clients], [surname], [name], [patronymic], [password_SeriesNumber], [birthday], [address], [e-mail address], [password]) VALUES (45462554, N'Бочаров', N'Никита', N'Матвеевич', N'1587 291249', CAST(N'1997-06-29' AS Date), N'125061, г. Санкт-Петербург, ул. Подгорная, 8, кв. 74', N'campbellkevin@gardner.com', N'cl12373')
INSERT [dbo].[Clients] ([id_clients], [surname], [name], [patronymic], [password_SeriesNumber], [birthday], [address], [e-mail address], [password]) VALUES (45462555, N'Соловьев', N'Давид', N'Ильич', N'1647 306372', CAST(N'1984-03-06' AS Date), N'630370, г. Санкт-Петербург, ул. Шоссейная, 24, кв. 81', N'morganhoward@clark.com', N'cl12374')
INSERT [dbo].[Clients] ([id_clients], [surname], [name], [patronymic], [password_SeriesNumber], [birthday], [address], [e-mail address], [password]) VALUES (45462556, N'Васильева', N'Валерия', N'Дмитриевна', N'1742 316556', CAST(N'1999-09-30' AS Date), N'614753, г. Санкт-Петербург, ул. Полевая, 35, кв. 39', N'carsontamara@gmail.com', N'cl12375')
INSERT [dbo].[Clients] ([id_clients], [surname], [name], [patronymic], [password_SeriesNumber], [birthday], [address], [e-mail address], [password]) VALUES (45462557, N'Макарова', N'Василиса', N'Андреевна', N'1474 326347', CAST(N'1999-04-08' AS Date), N'426030, г. Санкт-Петербург, ул. Маяковского, 44, кв. 93', N'kevinpatel@gmail.com', N'cl12376')
INSERT [dbo].[Clients] ([id_clients], [surname], [name], [patronymic], [password_SeriesNumber], [birthday], [address], [e-mail address], [password]) VALUES (45462558, N'Алексеев', N'Матвей', N'Викторович', N'1452 339539', CAST(N'1998-08-02' AS Date), N'450375, г. Санкт-Петербург, ул. Клубная, 44, кв. 80', N'sethbishop@yahoo.com', N'cl12377')
INSERT [dbo].[Clients] ([id_clients], [surname], [name], [patronymic], [password_SeriesNumber], [birthday], [address], [e-mail address], [password]) VALUES (45462559, N'Никитина', N'Полина', N'Александровна', N'2077 443480', CAST(N'1976-09-19' AS Date), N'625560, г. Санкт-Петербург, ул. Некрасова, 12, кв. 66', N'drollins@schultz-soto.net', N'cl12378')
INSERT [dbo].[Clients] ([id_clients], [surname], [name], [patronymic], [password_SeriesNumber], [birthday], [address], [e-mail address], [password]) VALUES (45462560, N'Окулова', N'Олеся', N'Алексеевна', N'2147 357518', CAST(N'1999-04-03' AS Date), N'630201, г. Санкт-Петербург, ул. Комсомольская, 17, кв. 25', N'pblack@copeland-winters.org', N'cl12379')
INSERT [dbo].[Clients] ([id_clients], [surname], [name], [patronymic], [password_SeriesNumber], [birthday], [address], [e-mail address], [password]) VALUES (45462561, N'Захарова', N'Полина', N'Яновна', N'2687 363884', CAST(N'1976-04-21' AS Date), N'190949, г. Санкт-Петербург, ул. Мичурина, 26, кв. 93', N'johnathon.oberbrunner@yahoo.com', N'cl12380')
INSERT [dbo].[Clients] ([id_clients], [surname], [name], [patronymic], [password_SeriesNumber], [birthday], [address], [e-mail address], [password]) VALUES (45462562, N'Зайцев', N'Владимир', N'Давидович', N'2376 443711', CAST(N'1998-01-26' AS Date), N'350501, г. Санкт-Петербург, ул. Парковая, 2, кв. 7', N'bradly29@gmail.com', N'cl12381')
INSERT [dbo].[Clients] ([id_clients], [surname], [name], [patronymic], [password_SeriesNumber], [birthday], [address], [e-mail address], [password]) VALUES (45462563, N'Иванов', N'Виталий', N'Даниилович', N'2568 386237', CAST(N'1976-08-11' AS Date), N'450048, г. Санкт-Петербург, ул. Коммунистическая, 21, кв. 3', N'stark.cristina@hilpert.biz', N'cl12382')
INSERT [dbo].[Clients] ([id_clients], [surname], [name], [patronymic], [password_SeriesNumber], [birthday], [address], [e-mail address], [password]) VALUES (45462564, N'Захаров', N'Матвей', N'Романович', N'2556 439376', CAST(N'1993-07-12' AS Date), N'644921, г. Санкт-Петербург, ул. Школьная, 46, кв. 37', N'bruen.eleanore@yahoo.com', N'cl12383')
INSERT [dbo].[Clients] ([id_clients], [surname], [name], [patronymic], [password_SeriesNumber], [birthday], [address], [e-mail address], [password]) VALUES (45462565, N'Иванов', N'Степан', N'Степанович', N'2737 407501', CAST(N'1998-09-19' AS Date), N'614228, г. Санкт-Петербург, ул. Дорожная, 36, кв. 54', N'percival.halvorson@yahoo.com', N'cl12384')
INSERT [dbo].[Clients] ([id_clients], [surname], [name], [patronymic], [password_SeriesNumber], [birthday], [address], [e-mail address], [password]) VALUES (45462566, N'Ткачева', N'Милана', N'Тимуровна', N'2581 441645', CAST(N'1998-05-24' AS Date), N'350940, г. Санкт-Петербург, ул. Первомайская, 23, кв. 2', N'javonte71@kuhlman.biz', N'cl12385')
INSERT [dbo].[Clients] ([id_clients], [surname], [name], [patronymic], [password_SeriesNumber], [birthday], [address], [e-mail address], [password]) VALUES (45462567, N'Семенов', N'Даниил', N'Иванович', N'2675 427933', CAST(N'1976-01-04' AS Date), N'344990, г. Санкт-Петербург, ул. Красноармейская, 19, кв. 92', N'vconnelly@kautzer.com', N'cl12386')
INSERT [dbo].[Clients] ([id_clients], [surname], [name], [patronymic], [password_SeriesNumber], [birthday], [address], [e-mail address], [password]) VALUES (45462568, N'Виноградов', N'Вячеслав', N'Дмитриевич', N'2967 434531', CAST(N'1976-07-12' AS Date), N'410248, г. Санкт-Петербург, ул. Чкалова, 11, кв. 75', N'anabelle07@schultz.info', N'cl12387')
INSERT [dbo].[Clients] ([id_clients], [surname], [name], [patronymic], [password_SeriesNumber], [birthday], [address], [e-mail address], [password]) VALUES (45462569, N'Соболева', N'Николь', N'Фёдоровна', N'3070 449655', CAST(N'1976-05-02' AS Date), N'400839, г. Санкт-Петербург, ул. 8 Марта, 46, кв. 44', N'nitzsche.katlynn@yahoo.com', N'cl12388')
INSERT [dbo].[Clients] ([id_clients], [surname], [name], [patronymic], [password_SeriesNumber], [birthday], [address], [e-mail address], [password]) VALUES (45462570, N'Тихонова', N'Анна', N'Львовна', N'3108 451174', CAST(N'1985-03-23' AS Date), N'450539, г. Санкт-Петербург, ул. Заводская, 3, кв. 81', N'corine16@von.com', N'cl12389')
INSERT [dbo].[Clients] ([id_clients], [surname], [name], [patronymic], [password_SeriesNumber], [birthday], [address], [e-mail address], [password]) VALUES (45462571, N'Кузнецова', N'Ульяна', N'Савельевна', N'3250 464705', CAST(N'1999-06-03' AS Date), N'614591, г. Санкт-Петербург, ул. Цветочная, 20, кв. 40', N'otha.wisozk@lubowitz.org', N'cl12390')
INSERT [dbo].[Clients] ([id_clients], [surname], [name], [patronymic], [password_SeriesNumber], [birthday], [address], [e-mail address], [password]) VALUES (45462572, N'Смирнова', N'Анна', N'Германовна', N'3392 471644', CAST(N'1997-07-18' AS Date), N'400260, г. Санкт-Петербург, ул. Больничная, 30, кв. 53', N'may.kirlin@hotmail.com', N'cl12391')
INSERT [dbo].[Clients] ([id_clients], [surname], [name], [patronymic], [password_SeriesNumber], [birthday], [address], [e-mail address], [password]) VALUES (45462573, N'Черепанова', N'Анна', N'Давидовна', N'3497 487819', CAST(N'1985-11-06' AS Date), N'660924, г. Санкт-Петербург, ул. Молодежная, 32, кв. 59', N'bryana.kautzer@yahoo.com', N'cl12392')
INSERT [dbo].[Clients] ([id_clients], [surname], [name], [patronymic], [password_SeriesNumber], [birthday], [address], [e-mail address], [password]) VALUES (45462574, N'Григорьев', N'Максим', N'Кириллович', N'3560 491260', CAST(N'1999-05-26' AS Date), N'644133, г. Санкт-Петербург, ул. Гагарина, 28, кв. 69', N'deborah.christiansen@quigley.biz', N'cl12393')
INSERT [dbo].[Clients] ([id_clients], [surname], [name], [patronymic], [password_SeriesNumber], [birthday], [address], [e-mail address], [password]) VALUES (45462575, N'Голубев', N'Даниэль', N'Александрович', N'3620 506034', CAST(N'1999-06-14' AS Date), N'450698, г. Санкт-Петербург, ул. Вокзальная, 14, кв. 37', N'connelly.makayla@yahoo.com', N'cl12394')
INSERT [dbo].[Clients] ([id_clients], [surname], [name], [patronymic], [password_SeriesNumber], [birthday], [address], [e-mail address], [password]) VALUES (45462576, N'Миронов', N'Юрий', N'Денисович', N'3774 511438', CAST(N'1985-01-26' AS Date), N'620653, г. Санкт-Петербург, ул. Западная, 15, кв. 25', N'tatum.collins@fay.org', N'cl12395')
INSERT [dbo].[Clients] ([id_clients], [surname], [name], [patronymic], [password_SeriesNumber], [birthday], [address], [e-mail address], [password]) VALUES (45462577, N'Терехов', N'Михаил', N'Андреевич', N'3862 521377', CAST(N'1976-07-06' AS Date), N'644321, г. Санкт-Петербург, ул. Клубная, 32, кв. 10', N'itzel73@anderson.com', N'cl12396')
INSERT [dbo].[Clients] ([id_clients], [surname], [name], [patronymic], [password_SeriesNumber], [birthday], [address], [e-mail address], [password]) VALUES (45462578, N'Орлова', N'Алиса', N'Михайловна', N'3084 535966', CAST(N'1997-02-24' AS Date), N'603653, г. Санкт-Петербург, ул. Молодежная, 2, кв. 45', N'arjun39@hotmail.com', N'cl12397')
INSERT [dbo].[Clients] ([id_clients], [surname], [name], [patronymic], [password_SeriesNumber], [birthday], [address], [e-mail address], [password]) VALUES (45462579, N'Кулаков', N'Константин', N'Даниилович', N'4021 541528', CAST(N'1993-06-20' AS Date), N'410181, г. Санкт-Петербург, ул. Механизаторов, 16, кв. 74', N'ohara.rebeka@yahoo.com', N'cl12398')
INSERT [dbo].[Clients] ([id_clients], [surname], [name], [patronymic], [password_SeriesNumber], [birthday], [address], [e-mail address], [password]) VALUES (45462580, N'Кудрявцев', N'Максим', N'Романович', N'4109 554053', CAST(N'1998-05-10' AS Date), N'394207, г. Санкт-Петербург, ул. Свердлова, 31, кв. 28', N'danika58@rath.com', N'cl12399')
INSERT [dbo].[Clients] ([id_clients], [surname], [name], [patronymic], [password_SeriesNumber], [birthday], [address], [e-mail address], [password]) VALUES (45462581, N'Соболева', N'Кира', N'Фёдоровна', N'4537 564868', CAST(N'1998-03-14' AS Date), N'420633, г. Санкт-Петербург, ул. Матросова, 18, кв. 41', N'janae.bogan@gmail.com', N'cl12400')
INSERT [dbo].[Clients] ([id_clients], [surname], [name], [patronymic], [password_SeriesNumber], [birthday], [address], [e-mail address], [password]) VALUES (45462582, N'Коновалов', N'Арсений', N'Максимович', N'4914 572471', CAST(N'1985-02-18' AS Date), N'445720, г. Санкт-Петербург, ул. Матросова, 50, кв. 67', N'vern91@yahoo.com', N'cl12401')
INSERT [dbo].[Clients] ([id_clients], [surname], [name], [patronymic], [password_SeriesNumber], [birthday], [address], [e-mail address], [password]) VALUES (45462583, N'Гусев', N'Михаил', N'Дмитриевич', N'4445 581302', CAST(N'1999-11-23' AS Date), N'400646, г. Санкт-Петербург, ул. Октябрьская, 47, кв. 65', N'mariana.leannon@larkin.net', N'cl12402')
INSERT [dbo].[Clients] ([id_clients], [surname], [name], [patronymic], [password_SeriesNumber], [birthday], [address], [e-mail address], [password]) VALUES (45462584, N'Суханова', N'Варвара', N'Матвеевна', N'4743 598180', CAST(N'1993-09-13' AS Date), N'644410, г. Санкт-Петербург, ул. Красная, 17, кв. 69', N'vmoore@gmail.com', N'cl12403')
INSERT [dbo].[Clients] ([id_clients], [surname], [name], [patronymic], [password_SeriesNumber], [birthday], [address], [e-mail address], [password]) VALUES (45462585, N'Орлова', N'Ясмина', N'Васильевна', N'4741 601821', CAST(N'1984-06-24' AS Date), N'400750, г. Санкт-Петербург, ул. Школьная, 36, кв. 71', N'damon.mcclure@mills.com', N'cl12404')
INSERT [dbo].[Clients] ([id_clients], [surname], [name], [patronymic], [password_SeriesNumber], [birthday], [address], [e-mail address], [password]) VALUES (45462586, N'Васильева', N'Ксения', N'Константиновна', N'4783 612567', CAST(N'1999-08-01' AS Date), N'660590, г. Санкт-Петербург, ул. Дачная, 37, кв. 70', N'grady.reilly@block.com', N'cl12405')
INSERT [dbo].[Clients] ([id_clients], [surname], [name], [patronymic], [password_SeriesNumber], [birthday], [address], [e-mail address], [password]) VALUES (45462587, N'Борисова', N'Тамара', N'Данииловна', N'4658 621200', CAST(N'1993-05-29' AS Date), N'426083, г. Санкт-Петербург, ул. Механизаторов, 41, кв. 26', N'boyd.koss@yahoo.com', N'cl12406')
INSERT [dbo].[Clients] ([id_clients], [surname], [name], [patronymic], [password_SeriesNumber], [birthday], [address], [e-mail address], [password]) VALUES (45462588, N'Дмитриев', N'Мирон', N'Ильич', N'4908 634613', CAST(N'1985-04-13' AS Date), N'410569, г. Санкт-Петербург, ул. Парковая, 36, кв. 17', N'obartell@franecki.info', N'cl12407')
INSERT [dbo].[Clients] ([id_clients], [surname], [name], [patronymic], [password_SeriesNumber], [birthday], [address], [e-mail address], [password]) VALUES (45462589, N'Лебедева', N'Анна', N'Александровна', N'5092 642468', CAST(N'1985-03-30' AS Date), N'443375, г. Санкт-Петербург, ул. Дзержинского, 50, кв. 95', N'reina75@ferry.net', N'cl12408')
INSERT [dbo].[Clients] ([id_clients], [surname], [name], [patronymic], [password_SeriesNumber], [birthday], [address], [e-mail address], [password]) VALUES (45462590, N'Пономарев', N'Артём', N'Маркович', N'5155 465274', CAST(N'1984-06-02' AS Date), N'614316, г. Санкт-Петербург, ул. Первомайская, 48, кв. 31', N'karson28@hotmail.com', N'cl12409')
INSERT [dbo].[Clients] ([id_clients], [surname], [name], [patronymic], [password_SeriesNumber], [birthday], [address], [e-mail address], [password]) VALUES (45462591, N'Борисова', N'Елена', N'Михайловна', N'5086 666893', CAST(N'1976-05-23' AS Date), N'445685, г. Санкт-Петербург, ул. Зеленая, 7, кв. 47', N'damaris61@okon.com', N'cl12410')
INSERT [dbo].[Clients] ([id_clients], [surname], [name], [patronymic], [password_SeriesNumber], [birthday], [address], [e-mail address], [password]) VALUES (45462592, N'Моисеев', N'Камиль', N'Максимович', N'5333 675375', CAST(N'1999-06-17' AS Date), N'614505, г. Санкт-Петербург, ул. Нагорная, 37, кв. 31', N'carroll.jerod@hotmail.com', N'cl12411')
INSERT [dbo].[Clients] ([id_clients], [surname], [name], [patronymic], [password_SeriesNumber], [birthday], [address], [e-mail address], [password]) VALUES (45462593, N'Герасимова', N'Дарья', N'Константиновна', N'5493 684572', CAST(N'1984-10-13' AS Date), N'426629, г. Санкт-Петербург, ул. Весенняя, 32, кв. 46', N'ron.treutel@quitzon.com', N'cl12412')
INSERT [dbo].[Clients] ([id_clients], [surname], [name], [patronymic], [password_SeriesNumber], [birthday], [address], [e-mail address], [password]) VALUES (45462594, N'Михайлова', N'Мария', N'Марковна', N'5150 696226', CAST(N'1976-12-02' AS Date), N'603743, г. Санкт-Петербург, ул. Матросова, 19, кв. 20', N'olen79@yahoo.com', N'cl12413')
INSERT [dbo].[Clients] ([id_clients], [surname], [name], [patronymic], [password_SeriesNumber], [birthday], [address], [e-mail address], [password]) VALUES (45462595, N'Коршунов', N'Кирилл', N'Максимович', N'1308 703305', CAST(N'1985-05-22' AS Date), N'450750, г. Санкт-Петербург, ул. Клубная, 23, кв. 90', N'pacocha.robbie@yahoo.com', N'cl12414')
GO
INSERT [dbo].[Logins] ([id_login], [id_staff], [time], [id_typeLogin]) VALUES (N'belyeva@@namecomp.ru  ', 109, CAST(N'2022-05-15T09:15:00.000' AS DateTime), 1)
INSERT [dbo].[Logins] ([id_login], [id_staff], [time], [id_typeLogin]) VALUES (N'fedorov@namecomp.ru  ', 103, CAST(N'2022-05-15T07:13:00.000' AS DateTime), 1)
INSERT [dbo].[Logins] ([id_login], [id_staff], [time], [id_typeLogin]) VALUES (N'hohlov@namecomp.ru  ', 107, CAST(N'2022-05-15T15:13:00.000' AS DateTime), 1)
INSERT [dbo].[Logins] ([id_login], [id_staff], [time], [id_typeLogin]) VALUES (N'ignatov@namecomp.ru  ', 106, CAST(N'2022-05-15T14:13:00.000' AS DateTime), 1)
INSERT [dbo].[Logins] ([id_login], [id_staff], [time], [id_typeLogin]) VALUES (N'Ivanov@namecomp.ru  ', 101, CAST(N'2022-05-15T11:13:00.000' AS DateTime), 1)
INSERT [dbo].[Logins] ([id_login], [id_staff], [time], [id_typeLogin]) VALUES (N'mironov@namecomp.ru  ', 104, CAST(N'2022-05-15T08:30:00.000' AS DateTime), 1)
INSERT [dbo].[Logins] ([id_login], [id_staff], [time], [id_typeLogin]) VALUES (N'petrov@namecomp.ru  ', 102, CAST(N'2022-05-15T10:13:00.000' AS DateTime), 1)
INSERT [dbo].[Logins] ([id_login], [id_staff], [time], [id_typeLogin]) VALUES (N'shiryev@namecomp.ru  ', 105, CAST(N'2022-05-15T13:13:00.000' AS DateTime), 2)
INSERT [dbo].[Logins] ([id_login], [id_staff], [time], [id_typeLogin]) VALUES (N'smirnova@@namecomp.ru  ', 110, CAST(N'2022-05-15T09:13:00.000' AS DateTime), 1)
INSERT [dbo].[Logins] ([id_login], [id_staff], [time], [id_typeLogin]) VALUES (N'strelkov@namecomp.ru  ', 108, CAST(N'2022-05-15T09:30:00.000' AS DateTime), 2)
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([id_orders], [dateAdd], [time], [id_clients], [id_status], [dateEnd], [time_rental_in_minutes]) VALUES (45462526, CAST(N'2022-03-12' AS Date), CAST(N'09:10:00' AS Time), 45462526, 1, NULL, 120)
INSERT [dbo].[Orders] ([id_orders], [dateAdd], [time], [id_clients], [id_status], [dateEnd], [time_rental_in_minutes]) VALUES (45462527, CAST(N'2022-03-13' AS Date), CAST(N'10:10:00' AS Time), 45462527, 2, NULL, 600)
INSERT [dbo].[Orders] ([id_orders], [dateAdd], [time], [id_clients], [id_status], [dateEnd], [time_rental_in_minutes]) VALUES (45462528, CAST(N'2022-03-14' AS Date), CAST(N'11:10:00' AS Time), 45462528, 2, NULL, 120)
INSERT [dbo].[Orders] ([id_orders], [dateAdd], [time], [id_clients], [id_status], [dateEnd], [time_rental_in_minutes]) VALUES (45462529, CAST(N'2022-03-15' AS Date), CAST(N'12:10:00' AS Time), 45462529, 1, NULL, 600)
INSERT [dbo].[Orders] ([id_orders], [dateAdd], [time], [id_clients], [id_status], [dateEnd], [time_rental_in_minutes]) VALUES (45462530, CAST(N'2022-03-16' AS Date), CAST(N'13:10:00' AS Time), 45462530, 3, CAST(N'2022-04-16' AS Date), 320)
INSERT [dbo].[Orders] ([id_orders], [dateAdd], [time], [id_clients], [id_status], [dateEnd], [time_rental_in_minutes]) VALUES (45462531, CAST(N'2022-03-17' AS Date), CAST(N'14:10:00' AS Time), 45462531, 1, NULL, 480)
INSERT [dbo].[Orders] ([id_orders], [dateAdd], [time], [id_clients], [id_status], [dateEnd], [time_rental_in_minutes]) VALUES (45462532, CAST(N'2022-03-18' AS Date), CAST(N'15:10:00' AS Time), 45462532, 1, NULL, 240)
INSERT [dbo].[Orders] ([id_orders], [dateAdd], [time], [id_clients], [id_status], [dateEnd], [time_rental_in_minutes]) VALUES (45462533, CAST(N'2022-03-19' AS Date), CAST(N'16:10:00' AS Time), 45462533, 2, NULL, 360)
INSERT [dbo].[Orders] ([id_orders], [dateAdd], [time], [id_clients], [id_status], [dateEnd], [time_rental_in_minutes]) VALUES (45462534, CAST(N'2022-03-20' AS Date), CAST(N'10:00:00' AS Time), 45462534, 2, NULL, 720)
INSERT [dbo].[Orders] ([id_orders], [dateAdd], [time], [id_clients], [id_status], [dateEnd], [time_rental_in_minutes]) VALUES (45462535, CAST(N'2022-03-21' AS Date), CAST(N'11:00:00' AS Time), 45462535, 1, NULL, 120)
INSERT [dbo].[Orders] ([id_orders], [dateAdd], [time], [id_clients], [id_status], [dateEnd], [time_rental_in_minutes]) VALUES (45462536, CAST(N'2022-03-22' AS Date), CAST(N'12:00:00' AS Time), 45462536, 3, CAST(N'2022-03-22' AS Date), 600)
INSERT [dbo].[Orders] ([id_orders], [dateAdd], [time], [id_clients], [id_status], [dateEnd], [time_rental_in_minutes]) VALUES (45462537, CAST(N'2022-03-23' AS Date), CAST(N'13:00:00' AS Time), 45462537, 2, NULL, 120)
INSERT [dbo].[Orders] ([id_orders], [dateAdd], [time], [id_clients], [id_status], [dateEnd], [time_rental_in_minutes]) VALUES (45462538, CAST(N'2022-03-24' AS Date), CAST(N'14:00:00' AS Time), 45462538, 2, NULL, 600)
INSERT [dbo].[Orders] ([id_orders], [dateAdd], [time], [id_clients], [id_status], [dateEnd], [time_rental_in_minutes]) VALUES (45462539, CAST(N'2022-03-25' AS Date), CAST(N'15:00:00' AS Time), 45462539, 2, NULL, 320)
INSERT [dbo].[Orders] ([id_orders], [dateAdd], [time], [id_clients], [id_status], [dateEnd], [time_rental_in_minutes]) VALUES (45462540, CAST(N'2022-03-26' AS Date), CAST(N'16:00:00' AS Time), 45462540, 3, CAST(N'2022-04-26' AS Date), 480)
INSERT [dbo].[Orders] ([id_orders], [dateAdd], [time], [id_clients], [id_status], [dateEnd], [time_rental_in_minutes]) VALUES (45462541, CAST(N'2022-03-27' AS Date), CAST(N'17:00:00' AS Time), 45462541, 1, NULL, 240)
INSERT [dbo].[Orders] ([id_orders], [dateAdd], [time], [id_clients], [id_status], [dateEnd], [time_rental_in_minutes]) VALUES (45462542, CAST(N'2022-03-28' AS Date), CAST(N'18:00:00' AS Time), 45462542, 2, NULL, 360)
INSERT [dbo].[Orders] ([id_orders], [dateAdd], [time], [id_clients], [id_status], [dateEnd], [time_rental_in_minutes]) VALUES (45462543, CAST(N'2022-03-29' AS Date), CAST(N'19:00:00' AS Time), 45462543, 2, NULL, 720)
INSERT [dbo].[Orders] ([id_orders], [dateAdd], [time], [id_clients], [id_status], [dateEnd], [time_rental_in_minutes]) VALUES (45462544, CAST(N'2022-03-30' AS Date), CAST(N'12:30:00' AS Time), 45462544, 1, NULL, 120)
INSERT [dbo].[Orders] ([id_orders], [dateAdd], [time], [id_clients], [id_status], [dateEnd], [time_rental_in_minutes]) VALUES (45462545, CAST(N'2022-03-31' AS Date), CAST(N'13:30:00' AS Time), 45462545, 1, NULL, 600)
INSERT [dbo].[Orders] ([id_orders], [dateAdd], [time], [id_clients], [id_status], [dateEnd], [time_rental_in_minutes]) VALUES (45462546, CAST(N'2022-04-01' AS Date), CAST(N'14:30:00' AS Time), 45462546, 3, CAST(N'2022-04-01' AS Date), 120)
INSERT [dbo].[Orders] ([id_orders], [dateAdd], [time], [id_clients], [id_status], [dateEnd], [time_rental_in_minutes]) VALUES (45462547, CAST(N'2022-04-02' AS Date), CAST(N'15:30:00' AS Time), 45462547, 1, NULL, 600)
INSERT [dbo].[Orders] ([id_orders], [dateAdd], [time], [id_clients], [id_status], [dateEnd], [time_rental_in_minutes]) VALUES (45462548, CAST(N'2022-04-03' AS Date), CAST(N'16:30:00' AS Time), 45462548, 1, NULL, 320)
INSERT [dbo].[Orders] ([id_orders], [dateAdd], [time], [id_clients], [id_status], [dateEnd], [time_rental_in_minutes]) VALUES (45462549, CAST(N'2022-04-04' AS Date), CAST(N'17:30:00' AS Time), 45462549, 2, NULL, 480)
INSERT [dbo].[Orders] ([id_orders], [dateAdd], [time], [id_clients], [id_status], [dateEnd], [time_rental_in_minutes]) VALUES (45462550, CAST(N'2022-04-05' AS Date), CAST(N'18:30:00' AS Time), 45462550, 2, NULL, 240)
INSERT [dbo].[Orders] ([id_orders], [dateAdd], [time], [id_clients], [id_status], [dateEnd], [time_rental_in_minutes]) VALUES (45462551, CAST(N'2022-04-06' AS Date), CAST(N'15:30:00' AS Time), 45462551, 2, NULL, 360)
INSERT [dbo].[Orders] ([id_orders], [dateAdd], [time], [id_clients], [id_status], [dateEnd], [time_rental_in_minutes]) VALUES (45462552, CAST(N'2022-04-07' AS Date), CAST(N'16:30:00' AS Time), 45462552, 2, NULL, 720)
INSERT [dbo].[Orders] ([id_orders], [dateAdd], [time], [id_clients], [id_status], [dateEnd], [time_rental_in_minutes]) VALUES (45462553, CAST(N'2022-04-08' AS Date), CAST(N'17:30:00' AS Time), 45462553, 3, CAST(N'2022-04-08' AS Date), 120)
INSERT [dbo].[Orders] ([id_orders], [dateAdd], [time], [id_clients], [id_status], [dateEnd], [time_rental_in_minutes]) VALUES (45462554, CAST(N'2022-04-09' AS Date), CAST(N'18:30:00' AS Time), 45462554, 1, NULL, 600)
INSERT [dbo].[Orders] ([id_orders], [dateAdd], [time], [id_clients], [id_status], [dateEnd], [time_rental_in_minutes]) VALUES (45462555, CAST(N'2022-04-10' AS Date), CAST(N'19:30:00' AS Time), 45462555, 2, NULL, 120)
INSERT [dbo].[Orders] ([id_orders], [dateAdd], [time], [id_clients], [id_status], [dateEnd], [time_rental_in_minutes]) VALUES (45462556, CAST(N'2022-04-11' AS Date), CAST(N'10:30:00' AS Time), 45462556, 2, NULL, 600)
INSERT [dbo].[Orders] ([id_orders], [dateAdd], [time], [id_clients], [id_status], [dateEnd], [time_rental_in_minutes]) VALUES (45462557, CAST(N'2022-04-12' AS Date), CAST(N'11:30:00' AS Time), 45462557, 1, NULL, 320)
INSERT [dbo].[Orders] ([id_orders], [dateAdd], [time], [id_clients], [id_status], [dateEnd], [time_rental_in_minutes]) VALUES (45462558, CAST(N'2022-04-13' AS Date), CAST(N'12:30:00' AS Time), 45462558, 1, NULL, 480)
INSERT [dbo].[Orders] ([id_orders], [dateAdd], [time], [id_clients], [id_status], [dateEnd], [time_rental_in_minutes]) VALUES (45462559, CAST(N'2022-04-14' AS Date), CAST(N'13:30:00' AS Time), 45462559, 1, NULL, 240)
INSERT [dbo].[Orders] ([id_orders], [dateAdd], [time], [id_clients], [id_status], [dateEnd], [time_rental_in_minutes]) VALUES (45462560, CAST(N'2022-04-15' AS Date), CAST(N'14:30:00' AS Time), 45462560, 2, NULL, 360)
INSERT [dbo].[Orders] ([id_orders], [dateAdd], [time], [id_clients], [id_status], [dateEnd], [time_rental_in_minutes]) VALUES (45462561, CAST(N'2022-04-02' AS Date), CAST(N'15:30:00' AS Time), 45462561, 2, NULL, 720)
INSERT [dbo].[Orders] ([id_orders], [dateAdd], [time], [id_clients], [id_status], [dateEnd], [time_rental_in_minutes]) VALUES (45462562, CAST(N'2022-04-03' AS Date), CAST(N'16:30:00' AS Time), 45462562, 2, NULL, 120)
INSERT [dbo].[Orders] ([id_orders], [dateAdd], [time], [id_clients], [id_status], [dateEnd], [time_rental_in_minutes]) VALUES (45462563, CAST(N'2022-04-04' AS Date), CAST(N'17:30:00' AS Time), 45462563, 3, CAST(N'2022-04-04' AS Date), 600)
INSERT [dbo].[Orders] ([id_orders], [dateAdd], [time], [id_clients], [id_status], [dateEnd], [time_rental_in_minutes]) VALUES (45462564, CAST(N'2022-04-05' AS Date), CAST(N'10:15:00' AS Time), 45462564, 2, NULL, 120)
INSERT [dbo].[Orders] ([id_orders], [dateAdd], [time], [id_clients], [id_status], [dateEnd], [time_rental_in_minutes]) VALUES (45462565, CAST(N'2022-04-06' AS Date), CAST(N'11:15:00' AS Time), 45462565, 1, NULL, 600)
INSERT [dbo].[Orders] ([id_orders], [dateAdd], [time], [id_clients], [id_status], [dateEnd], [time_rental_in_minutes]) VALUES (45462566, CAST(N'2022-04-07' AS Date), CAST(N'12:15:00' AS Time), 45462566, 3, CAST(N'2022-04-07' AS Date), 320)
INSERT [dbo].[Orders] ([id_orders], [dateAdd], [time], [id_clients], [id_status], [dateEnd], [time_rental_in_minutes]) VALUES (45462567, CAST(N'2022-04-08' AS Date), CAST(N'13:15:00' AS Time), 45462567, 2, NULL, 480)
INSERT [dbo].[Orders] ([id_orders], [dateAdd], [time], [id_clients], [id_status], [dateEnd], [time_rental_in_minutes]) VALUES (45462568, CAST(N'2022-04-09' AS Date), CAST(N'14:15:00' AS Time), 45462568, 2, NULL, 240)
INSERT [dbo].[Orders] ([id_orders], [dateAdd], [time], [id_clients], [id_status], [dateEnd], [time_rental_in_minutes]) VALUES (45462569, CAST(N'2022-04-01' AS Date), CAST(N'15:15:00' AS Time), 45462569, 2, NULL, 360)
INSERT [dbo].[Orders] ([id_orders], [dateAdd], [time], [id_clients], [id_status], [dateEnd], [time_rental_in_minutes]) VALUES (45462570, CAST(N'2022-04-02' AS Date), CAST(N'16:15:00' AS Time), 45462570, 2, NULL, 720)
INSERT [dbo].[Orders] ([id_orders], [dateAdd], [time], [id_clients], [id_status], [dateEnd], [time_rental_in_minutes]) VALUES (45462571, CAST(N'2022-04-03' AS Date), CAST(N'10:45:00' AS Time), 45462571, 2, NULL, 480)
INSERT [dbo].[Orders] ([id_orders], [dateAdd], [time], [id_clients], [id_status], [dateEnd], [time_rental_in_minutes]) VALUES (45462572, CAST(N'2022-04-04' AS Date), CAST(N'11:45:00' AS Time), 45462572, 3, CAST(N'2022-04-04' AS Date), 320)
INSERT [dbo].[Orders] ([id_orders], [dateAdd], [time], [id_clients], [id_status], [dateEnd], [time_rental_in_minutes]) VALUES (45462573, CAST(N'2022-04-05' AS Date), CAST(N'12:45:00' AS Time), 45462573, 1, NULL, 480)
INSERT [dbo].[Orders] ([id_orders], [dateAdd], [time], [id_clients], [id_status], [dateEnd], [time_rental_in_minutes]) VALUES (45462574, CAST(N'2022-04-06' AS Date), CAST(N'13:45:00' AS Time), 45462574, 1, NULL, 240)
INSERT [dbo].[Orders] ([id_orders], [dateAdd], [time], [id_clients], [id_status], [dateEnd], [time_rental_in_minutes]) VALUES (45462575, CAST(N'2022-04-07' AS Date), CAST(N'14:45:00' AS Time), 45462575, 1, NULL, 420)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
INSERT [dbo].[OrderServices] ([id_order], [id_service]) VALUES (45462526, 31)
INSERT [dbo].[OrderServices] ([id_order], [id_service]) VALUES (45462526, 34)
INSERT [dbo].[OrderServices] ([id_order], [id_service]) VALUES (45462526, 336)
INSERT [dbo].[OrderServices] ([id_order], [id_service]) VALUES (45462526, 353)
INSERT [dbo].[OrderServices] ([id_order], [id_service]) VALUES (45462527, 45)
INSERT [dbo].[OrderServices] ([id_order], [id_service]) VALUES (45462527, 89)
INSERT [dbo].[OrderServices] ([id_order], [id_service]) VALUES (45462527, 98)
INSERT [dbo].[OrderServices] ([id_order], [id_service]) VALUES (45462527, 99)
INSERT [dbo].[OrderServices] ([id_order], [id_service]) VALUES (45462527, 123)
INSERT [dbo].[OrderServices] ([id_order], [id_service]) VALUES (45462528, 45)
INSERT [dbo].[OrderServices] ([id_order], [id_service]) VALUES (45462528, 57)
INSERT [dbo].[OrderServices] ([id_order], [id_service]) VALUES (45462528, 88)
INSERT [dbo].[OrderServices] ([id_order], [id_service]) VALUES (45462528, 92)
INSERT [dbo].[OrderServices] ([id_order], [id_service]) VALUES (45462529, 44)
INSERT [dbo].[OrderServices] ([id_order], [id_service]) VALUES (45462529, 45)
INSERT [dbo].[OrderServices] ([id_order], [id_service]) VALUES (45462529, 57)
INSERT [dbo].[OrderServices] ([id_order], [id_service]) VALUES (45462529, 88)
INSERT [dbo].[OrderServices] ([id_order], [id_service]) VALUES (45462529, 92)
INSERT [dbo].[OrderServices] ([id_order], [id_service]) VALUES (45462530, 34)
INSERT [dbo].[OrderServices] ([id_order], [id_service]) VALUES (45462530, 45)
INSERT [dbo].[OrderServices] ([id_order], [id_service]) VALUES (45462530, 89)
INSERT [dbo].[OrderServices] ([id_order], [id_service]) VALUES (45462530, 98)
INSERT [dbo].[OrderServices] ([id_order], [id_service]) VALUES (45462530, 336)
INSERT [dbo].[OrderServices] ([id_order], [id_service]) VALUES (45462530, 353)
INSERT [dbo].[OrderServices] ([id_order], [id_service]) VALUES (45462531, 31)
INSERT [dbo].[OrderServices] ([id_order], [id_service]) VALUES (45462531, 34)
INSERT [dbo].[OrderServices] ([id_order], [id_service]) VALUES (45462531, 353)
INSERT [dbo].[OrderServices] ([id_order], [id_service]) VALUES (45462532, 45)
INSERT [dbo].[OrderServices] ([id_order], [id_service]) VALUES (45462532, 89)
INSERT [dbo].[OrderServices] ([id_order], [id_service]) VALUES (45462532, 98)
INSERT [dbo].[OrderServices] ([id_order], [id_service]) VALUES (45462532, 99)
INSERT [dbo].[OrderServices] ([id_order], [id_service]) VALUES (45462533, 45)
INSERT [dbo].[OrderServices] ([id_order], [id_service]) VALUES (45462533, 57)
INSERT [dbo].[OrderServices] ([id_order], [id_service]) VALUES (45462533, 89)
INSERT [dbo].[OrderServices] ([id_order], [id_service]) VALUES (45462533, 92)
INSERT [dbo].[OrderServices] ([id_order], [id_service]) VALUES (45462534, 45)
INSERT [dbo].[OrderServices] ([id_order], [id_service]) VALUES (45462534, 57)
INSERT [dbo].[OrderServices] ([id_order], [id_service]) VALUES (45462534, 88)
INSERT [dbo].[OrderServices] ([id_order], [id_service]) VALUES (45462534, 92)
INSERT [dbo].[OrderServices] ([id_order], [id_service]) VALUES (45462535, 45)
INSERT [dbo].[OrderServices] ([id_order], [id_service]) VALUES (45462535, 89)
INSERT [dbo].[OrderServices] ([id_order], [id_service]) VALUES (45462535, 98)
INSERT [dbo].[OrderServices] ([id_order], [id_service]) VALUES (45462535, 336)
INSERT [dbo].[OrderServices] ([id_order], [id_service]) VALUES (45462535, 353)
INSERT [dbo].[OrderServices] ([id_order], [id_service]) VALUES (45462536, 31)
INSERT [dbo].[OrderServices] ([id_order], [id_service]) VALUES (45462536, 34)
INSERT [dbo].[OrderServices] ([id_order], [id_service]) VALUES (45462536, 353)
GO
INSERT [dbo].[Services] ([id_service], [name], [code_service], [price]) VALUES (31, N'Прокат набора защитного оборудования', N'JUR8R', 1000.0000)
INSERT [dbo].[Services] ([id_service], [name], [code_service], [price]) VALUES (34, N'Прокат роликов', N'JKFBJ09', 1000.0000)
INSERT [dbo].[Services] ([id_service], [name], [code_service], [price]) VALUES (44, N'Аренда лодки', N'DHBGFY563', 700.0000)
INSERT [dbo].[Services] ([id_service], [name], [code_service], [price]) VALUES (45, N'Прокат электросамоката', N'JFH7382', 1200.0000)
INSERT [dbo].[Services] ([id_service], [name], [code_service], [price]) VALUES (57, N'Инструктор по катанию на роликах', N'JHVSJF6', 1000.0000)
INSERT [dbo].[Services] ([id_service], [name], [code_service], [price]) VALUES (88, N'Инструктор по катанию на велосипеде', N'DJHGBS982', 1000.0000)
INSERT [dbo].[Services] ([id_service], [name], [code_service], [price]) VALUES (89, N'Прокат велоколяски', N'OIJNB12', 2000.0000)
INSERT [dbo].[Services] ([id_service], [name], [code_service], [price]) VALUES (92, N'Аренда шезлонга', N'HJBUJE21J', 300.0000)
INSERT [dbo].[Services] ([id_service], [name], [code_service], [price]) VALUES (98, N'Прокат самоката', N'63748HF', 700.0000)
INSERT [dbo].[Services] ([id_service], [name], [code_service], [price]) VALUES (99, N'Аренда беседки', N'BSFBHV63', 2000.0000)
INSERT [dbo].[Services] ([id_service], [name], [code_service], [price]) VALUES (123, N'Инструктор по катанию на лодке', N'638VVNQ3', 1200.0000)
INSERT [dbo].[Services] ([id_service], [name], [code_service], [price]) VALUES (336, N'Прокат велосипеда', N'8HFJHG443', 1000.0000)
INSERT [dbo].[Services] ([id_service], [name], [code_service], [price]) VALUES (353, N'Прокат шлема', N'87FDJKHJ', 400.0000)
GO
SET IDENTITY_INSERT [dbo].[Staff] ON 

INSERT [dbo].[Staff] ([id_staff], [id_type], [surname], [name], [patronymic], [login], [password]) VALUES (101, 3, N'Иванов', N'Иван', N'Иванович', N'Ivanov@namecomp.ru', N'2L6KZG')
INSERT [dbo].[Staff] ([id_staff], [id_type], [surname], [name], [patronymic], [login], [password]) VALUES (102, 3, N'Петров', N'Петр', N'Петрович', N'petrov@namecomp.ru', N'uzWC67')
INSERT [dbo].[Staff] ([id_staff], [id_type], [surname], [name], [patronymic], [login], [password]) VALUES (103, 1, N'Федоров', N'Федор', N'Федорович', N'fedorov@namecomp.ru', N'8ntwUp')
INSERT [dbo].[Staff] ([id_staff], [id_type], [surname], [name], [patronymic], [login], [password]) VALUES (104, 2, N'Миронов', N'Вениамин', N'Куприянович', N'mironov@namecomp.ru', N'YOyhfR')
INSERT [dbo].[Staff] ([id_staff], [id_type], [surname], [name], [patronymic], [login], [password]) VALUES (105, 2, N'Ширяев', N'Ермолай', N'Вениаминович', N'shiryev@namecomp.ru', N'RSbvHv')
INSERT [dbo].[Staff] ([id_staff], [id_type], [surname], [name], [patronymic], [login], [password]) VALUES (106, 2, N'Игнатов', N'Кассиан', N'Васильевич', N'ignatov@namecomp.ru', N'rwVDh9')
INSERT [dbo].[Staff] ([id_staff], [id_type], [surname], [name], [patronymic], [login], [password]) VALUES (107, 3, N'Хохлов', N'Владимир', N'Мэлсович', N'hohlov@namecomp.ru', N'LdNyos')
INSERT [dbo].[Staff] ([id_staff], [id_type], [surname], [name], [patronymic], [login], [password]) VALUES (108, 3, N'Стрелков', N'Мстислав', N'Геогргъевич', N'strelkov@namecomp.ru', N'gynQMT')
INSERT [dbo].[Staff] ([id_staff], [id_type], [surname], [name], [patronymic], [login], [password]) VALUES (109, 3, N'Беляева', N'Лилия', N'Наумова', N'belyeva@@namecomp.ru', N'AtnDjr')
INSERT [dbo].[Staff] ([id_staff], [id_type], [surname], [name], [patronymic], [login], [password]) VALUES (110, 3, N'Смирнова', N'Ульяна', N'Гордеева', N'smirnova@@namecomp.ru', N'JlFRCZ')
INSERT [dbo].[Staff] ([id_staff], [id_type], [surname], [name], [patronymic], [login], [password]) VALUES (332, 1, N'ывыфв', N'фывфы', N'фывфыв', N'фывфыв', N'выфвфы')
SET IDENTITY_INSERT [dbo].[Staff] OFF
GO
INSERT [dbo].[StatusOrder] ([id_status], [name]) VALUES (1, N'Новая')
INSERT [dbo].[StatusOrder] ([id_status], [name]) VALUES (2, N'В прокате')
INSERT [dbo].[StatusOrder] ([id_status], [name]) VALUES (3, N'Закрыта')
GO
INSERT [dbo].[TypeLogin] ([id_typeLogin], [name]) VALUES (1, N'Успешно')
INSERT [dbo].[TypeLogin] ([id_typeLogin], [name]) VALUES (2, N'Неуспешно')
GO
INSERT [dbo].[TypeUsers] ([id_type], [name]) VALUES (1, N'Администратор')
INSERT [dbo].[TypeUsers] ([id_type], [name]) VALUES (2, N'Старший смены')
INSERT [dbo].[TypeUsers] ([id_type], [name]) VALUES (3, N'Продавец')
GO
ALTER TABLE [dbo].[Logins]  WITH CHECK ADD  CONSTRAINT [FK_Logins_Staff] FOREIGN KEY([id_staff])
REFERENCES [dbo].[Staff] ([id_staff])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Logins] CHECK CONSTRAINT [FK_Logins_Staff]
GO
ALTER TABLE [dbo].[Logins]  WITH CHECK ADD  CONSTRAINT [FK_Logins_TypeLogin] FOREIGN KEY([id_typeLogin])
REFERENCES [dbo].[TypeLogin] ([id_typeLogin])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Logins] CHECK CONSTRAINT [FK_Logins_TypeLogin]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Clients] FOREIGN KEY([id_clients])
REFERENCES [dbo].[Clients] ([id_clients])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Clients]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_StatusOrder] FOREIGN KEY([id_status])
REFERENCES [dbo].[StatusOrder] ([id_status])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_StatusOrder]
GO
ALTER TABLE [dbo].[OrderServices]  WITH CHECK ADD  CONSTRAINT [FK_OrderServices_Orders] FOREIGN KEY([id_order])
REFERENCES [dbo].[Orders] ([id_orders])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderServices] CHECK CONSTRAINT [FK_OrderServices_Orders]
GO
ALTER TABLE [dbo].[OrderServices]  WITH CHECK ADD  CONSTRAINT [FK_OrderServices_Services] FOREIGN KEY([id_service])
REFERENCES [dbo].[Services] ([id_service])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderServices] CHECK CONSTRAINT [FK_OrderServices_Services]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_TypeUsers] FOREIGN KEY([id_type])
REFERENCES [dbo].[TypeUsers] ([id_type])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_TypeUsers]
GO
USE [master]
GO
ALTER DATABASE [db_ForestPark] SET  READ_WRITE 
GO
