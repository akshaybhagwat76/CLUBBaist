USE [master]
GO
/****** Object:  Database [ClubBAIST]    Script Date: 29-02-2020 10:42:13 ******/
CREATE DATABASE [ClubBAIST]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ClubBAIST', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ClubBAIST.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ClubBAIST_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ClubBAIST_log.ldf' , SIZE = 2560KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ClubBAIST] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ClubBAIST].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ClubBAIST] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ClubBAIST] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ClubBAIST] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ClubBAIST] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ClubBAIST] SET ARITHABORT OFF 
GO
ALTER DATABASE [ClubBAIST] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ClubBAIST] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ClubBAIST] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ClubBAIST] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ClubBAIST] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ClubBAIST] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ClubBAIST] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ClubBAIST] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ClubBAIST] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ClubBAIST] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ClubBAIST] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ClubBAIST] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ClubBAIST] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ClubBAIST] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ClubBAIST] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ClubBAIST] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ClubBAIST] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ClubBAIST] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ClubBAIST] SET  MULTI_USER 
GO
ALTER DATABASE [ClubBAIST] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ClubBAIST] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ClubBAIST] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ClubBAIST] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ClubBAIST] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ClubBAIST', N'ON'
GO
ALTER DATABASE [ClubBAIST] SET QUERY_STORE = OFF
GO
USE [ClubBAIST]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 29-02-2020 10:42:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[MemberNumber] [int] NULL,
	[CurrentBalance] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Application]    Script Date: 29-02-2020 10:42:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Application](
	[ApplicationID] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [nvarchar](25) NOT NULL,
	[FirstName] [nvarchar](24) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[PostalCode] [varchar](7) NOT NULL,
	[Phone] [varchar](15) NOT NULL,
	[AltPhone] [varchar](15) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[BirthDate] [date] NOT NULL,
	[Occupation] [varchar](50) NOT NULL,
	[CompanyName] [nvarchar](50) NOT NULL,
	[CompanyAddress] [nvarchar](max) NOT NULL,
	[CompanyPostalCode] [varchar](7) NOT NULL,
	[CompanyPhone] [varchar](20) NOT NULL,
	[SubmitDate] [date] NOT NULL,
	[Sex] [char](1) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[WantsShare] [bit] NOT NULL,
	[IsAccepted] [bit] NOT NULL,
	[IsDenied] [bit] NOT NULL,
	[IsWaitlisted] [bit] NOT NULL,
	[IsOnhold] [bit] NOT NULL,
	[ShareholderName1] [nvarchar](50) NOT NULL,
	[ShareholderDate1] [date] NOT NULL,
	[ShareholderName2] [nvarchar](50) NOT NULL,
	[ShareholderDate2] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ApplicationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DailyReservationSheet]    Script Date: 29-02-2020 10:42:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DailyReservationSheet](
	[Date] [date] NOT NULL,
	[DayofWeek] [nvarchar](9) NOT NULL,
 CONSTRAINT [PKDate] PRIMARY KEY CLUSTERED 
(
	[Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Entry]    Script Date: 29-02-2020 10:42:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entry](
	[EntryID] [int] IDENTITY(1,1) NOT NULL,
	[AccountID] [int] NOT NULL,
	[PostDate] [date] NOT NULL,
	[ActivityDate] [date] NOT NULL,
	[Description] [varchar](100) NOT NULL,
	[Amount] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EntryID] ASC,
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Member]    Script Date: 29-02-2020 10:42:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Member](
	[MemberNumber] [int] IDENTITY(1,1) NOT NULL,
	[MembershipLevel] [varchar](6) NOT NULL,
	[MembershipTier] [varchar](30) NOT NULL,
	[MemberName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[IsShareHolder] [bit] NOT NULL,
	[Sex] [char](1) NOT NULL,
	[Standing] [char](1) NOT NULL,
	[Handicap] [float] NOT NULL,
 CONSTRAINT [PKMemberID] PRIMARY KEY CLUSTERED 
(
	[MemberNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Score]    Script Date: 29-02-2020 10:42:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Score](
	[ScoreID] [int] IDENTITY(1,1) NOT NULL,
	[MemberNumber] [int] NULL,
	[Tee] [nvarchar](5) NOT NULL,
	[DateTime] [datetime] NULL,
	[Hole1] [int] NOT NULL,
	[Hole2] [int] NOT NULL,
	[Hole3] [int] NOT NULL,
	[Hole4] [int] NOT NULL,
	[Hole5] [int] NOT NULL,
	[Hole6] [int] NOT NULL,
	[Hole7] [int] NOT NULL,
	[Hole8] [int] NOT NULL,
	[Hole9] [int] NOT NULL,
	[Hole10] [int] NULL,
	[Hole11] [int] NULL,
	[Hole12] [int] NULL,
	[Hole13] [int] NULL,
	[Hole14] [int] NULL,
	[Hole15] [int] NULL,
	[Hole16] [int] NULL,
	[Hole17] [int] NULL,
	[Hole18] [int] NULL,
	[Total] [int] NOT NULL,
	[HandicapDifferential] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[ScoreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StandingReservation]    Script Date: 29-02-2020 10:42:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StandingReservation](
	[Year] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[RequestedTime] [time](0) NOT NULL,
	[DayOfWeek] [nvarchar](9) NOT NULL,
	[MemberNumber1] [int] NOT NULL,
	[MemberNumber2] [int] NULL,
	[MemberNumber3] [int] NULL,
	[MemberNumber4] [int] NULL,
	[MemberName1] [nvarchar](50) NOT NULL,
	[MemberName2] [nvarchar](50) NOT NULL,
	[MemberName3] [nvarchar](50) NOT NULL,
	[MemberName4] [nvarchar](50) NOT NULL,
	[IsCanceled] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Year] ASC,
	[MemberNumber1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeeTime]    Script Date: 29-02-2020 10:42:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeeTime](
	[Date] [date] NOT NULL,
	[Time] [time](0) NOT NULL,
	[MemberNumber] [int] NULL,
	[MemberName1] [nvarchar](20) NOT NULL,
	[MemberName2] [nvarchar](20) NULL,
	[MemberName3] [nvarchar](20) NULL,
	[MemberName4] [nvarchar](20) NULL,
	[NumberOfPlayers] [int] NOT NULL,
	[PhoneNumber] [varchar](15) NOT NULL,
	[NumberOfCarts] [int] NOT NULL,
	[BookingDate] [date] NOT NULL,
	[BookingTime] [time](0) NOT NULL,
	[EmployeeName] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Date] ASC,
	[Time] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Member] ON 

INSERT [dbo].[Member] ([MemberNumber], [MembershipLevel], [MembershipTier], [MemberName], [Password], [IsShareHolder], [Sex], [Standing], [Handicap]) VALUES (10, N'Normal', N'three', N'AKshay', N'Test@123', 1, N'm', N'y', 2)
SET IDENTITY_INSERT [dbo].[Member] OFF
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([MemberNumber])
REFERENCES [dbo].[Member] ([MemberNumber])
GO
ALTER TABLE [dbo].[Entry]  WITH CHECK ADD FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Score]  WITH CHECK ADD FOREIGN KEY([MemberNumber])
REFERENCES [dbo].[Member] ([MemberNumber])
GO
ALTER TABLE [dbo].[StandingReservation]  WITH CHECK ADD FOREIGN KEY([MemberNumber1])
REFERENCES [dbo].[Member] ([MemberNumber])
GO
ALTER TABLE [dbo].[StandingReservation]  WITH CHECK ADD FOREIGN KEY([MemberNumber2])
REFERENCES [dbo].[Member] ([MemberNumber])
GO
ALTER TABLE [dbo].[StandingReservation]  WITH CHECK ADD FOREIGN KEY([MemberNumber3])
REFERENCES [dbo].[Member] ([MemberNumber])
GO
ALTER TABLE [dbo].[StandingReservation]  WITH CHECK ADD FOREIGN KEY([MemberNumber4])
REFERENCES [dbo].[Member] ([MemberNumber])
GO
ALTER TABLE [dbo].[TeeTime]  WITH CHECK ADD  CONSTRAINT [FKDATE] FOREIGN KEY([Date])
REFERENCES [dbo].[DailyReservationSheet] ([Date])
GO
ALTER TABLE [dbo].[TeeTime] CHECK CONSTRAINT [FKDATE]
GO
ALTER TABLE [dbo].[TeeTime]  WITH CHECK ADD  CONSTRAINT [FKMemberID] FOREIGN KEY([MemberNumber])
REFERENCES [dbo].[Member] ([MemberNumber])
GO
ALTER TABLE [dbo].[TeeTime] CHECK CONSTRAINT [FKMemberID]
GO
/****** Object:  StoredProcedure [dbo].[AcceptApplication]    Script Date: 29-02-2020 10:42:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AcceptApplication](@ApplicationID INT = NULL,@MemberNumber INT OUT)
AS
DECLARE @MemberShipTier VARCHAR(30)
DECLARE @MemberName NVARCHAR(50)
DECLARE @Password NVARCHAR(100)
DECLARE @IsShareHolder BIT
DECLARE @Sex CHAR(1)
DECLARE @Standing CHAR(1)
DECLARE @BirthDate DATE
DECLARE @CurrentDate DATE = GETDATE()
DECLARE @ReturnCode INT = 1
IF @ApplicationID IS NULL
	RAISERROR('AcceptApplication error - Missing Parameter @ApplicationID',16,1)
ELSE
	BEGIN
		UPDATE Application
		SET IsAccepted = 1
		WHERE ApplicationID = @ApplicationID
		IF @@ERROR = 1
			RAISERROR('AcceptApplication error - UPDATE ERROR',16,1)
		SELECT @MemberName = FirstName + ' ' + LastName,@Password = Password,@IsShareHolder = WantsShare,@Sex = Sex,@BirthDate = BirthDate FROM Application WHERE ApplicationID = @ApplicationID

		IF @IsShareHolder = 0
		BEGIN
			SET @MemberShipTier = 'Associate'
			EXECUTE AddMember 'Gold',@MemberShipTier,@MemberName,@Password,0,@Sex,'G',@MemberNumber OUT
			EXECUTE AddAccount @MemberNumber
			EXECUTE AddNewEntry @MemberNumber,@CurrentDate,'1 Payment out of 4 for Entrance Fee',2500
		END
		ELSE
			BEGIN
			IF	DATEDIFF(YEAR,@BirthDate,@CurrentDate) > 64
			BEGIN
				SET @MemberShipTier = 'Senior Shareholder'
				EXECUTE AddMember 'Gold',@MemberShipTier,@MemberName,@Password,1,@Sex,'G',@MemberNumber OUT
				EXECUTE AddAccount @MemberNumber
				EXECUTE AddNewEntry @MemberNumber,@CurrentDate,'1 Payment out of 4 for Entrance Fee',2500
				EXECUTE AddNewEntry @MemberNumber,@CurrentDate,'Payment for Share',1000
			END
			ELSE
			BEGIN
				SET @MemberShipTier = 'Shareholder'
				EXECUTE AddMember 'Gold',@MemberShipTier,@MemberName,@Password,1,@Sex,'G',@MemberNumber OUT
				EXECUTE AddAccount @MemberNumber
				EXECUTE AddNewEntry @MemberNumber,@CurrentDate,'1 Payment out of 4 for Entrance Fee',2500
				EXECUTE AddNewEntry @MemberNumber,@CurrentDate,'Payment for Share',1000
			END
			END

	END
RETURN @ReturnCode
GO
/****** Object:  StoredProcedure [dbo].[AddAccount]    Script Date: 29-02-2020 10:42:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddAccount](@MemberNumber INT = NULL)
AS
DECLARE @ReturnCode INT = 1

IF @MemberNumber IS NULL
	RAISERROR('AddAccount error - Required parameter @MemberNumber',16,1)
ELSE
	BEGIN
		INSERT INTO Account Values
		(@MemberNumber,0)
		IF @@ERROR = 0
			SET @ReturnCode = 0
		ELSE
			RAISERROR('GetLoginInfo error - INSERT ERROR',16,1)
	END
RETURN @ReturnCode
GO
/****** Object:  StoredProcedure [dbo].[AddApplication]    Script Date: 29-02-2020 10:42:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddApplication](@LastName NVARCHAR(25) = NULL,@FirstName NVARCHAR(24) = NULL,@Address NVARCHAR(MAX) = NULL,@PostalCode VARCHAR(7) = NULL,@Phone VARCHAR(20) = NULL,@AltPhone VARCHAR(20) = NULL,
@Email NVARCHAR(50) = NULL, @BirthDate DATE = NULL,@Occupation VARCHAR(50) = NULL,@CompanyName NVARCHAR(50) = NULL,@CompanyAddress NVARCHAR(MAX) = NULL,@CompanyPostalCode VARCHAR(7) = NULL,@CompanyPhone VARCHAR(20) = NULL,
@SubmitDate DATE = NULL,@Sex CHAR(1) = NULL,@Password NVARCHAR(100) = NULL,@WantsShare BIT = NULL,
@ShareholderName1 NVARCHAR(50),@ShareholderDate1 DATE,@ShareholderName2 NVARCHAR(50) = NULL,@ShareholderDate2 DATE = NULL)
AS
DECLARE @ReturnCode INT = 1

IF @LastName IS NULL
	RAISERROR('AddApplication error - Missing parameter @LastName',16,1)
ELSE IF @FirstName IS NULL
	RAISERROR('AddApplication error - Missing parameter @FirstName',16,1)
ELSE IF @Address IS NULL
	RAISERROR('AddApplication error - Missing parameter @Address',16,1)
ELSE IF @PostalCode IS NULL
	RAISERROR('AddApplication error - Missing parameter @PostalCode',16,1)
ELSE IF @Phone IS NULL
	RAISERROR('AddApplication error - Missing parameter @Phone',16,1)
ELSE IF @AltPhone IS NULL
	RAISERROR('AddApplication error - Missing parameter @AltPhone',16,1)
ELSE IF @Email IS NULL
	RAISERROR('AddApplication error - Missing parameter @Email',16,1)
ELSE IF @BirthDate IS NULL
	RAISERROR('AddApplication error - Missing parameter @BirthDate',16,1)
ELSE IF @Occupation IS NULL
	RAISERROR('AddApplication error - Missing parameter @Occupation',16,1)
ELSE IF @CompanyName IS NULL
	RAISERROR('AddApplication error - Missing parameter @CompanyName',16,1)
ELSE IF @CompanyAddress IS NULL
	RAISERROR('AddApplication error - Missing parameter @CompanyAddress',16,1)
ELSE IF @CompanyPostalCode IS NULL
	RAISERROR('AddApplication error - Missing parameter @CompanyPostalCode',16,1)
ELSE IF @CompanyPhone IS NULL
	RAISERROR('AddApplication error - Missing parameter @CompanyPhone',16,1)
ELSE IF @SubmitDate IS NULL
	RAISERROR('AddApplication error - Missing parameter @SubmitDate',16,1)
ELSE IF @Sex IS NULL
	RAISERROR('AddApplication error - Missing parameter @Sex',16,1)
ELSE IF @Password IS NULL
	RAISERROR('AddApplication error - Missing parameter @Password',16,1)
ELSE IF @WantsShare IS NULL
	RAISERROR('AddApplication error - Missing parameter @WantsShare',16,1)
ELSE IF @ShareholderName1 IS NULL
	RAISERROR('AddApplication error - Missing parameter @ShareholderName1',16,1)
ELSE IF @ShareholderDate1 IS NULL
	RAISERROR('AddApplication error - Missing parameter @ShareholderDate1',16,1)
ELSE IF @ShareholderName2 IS NULL
	RAISERROR('AddApplication error - Missing parameter @ShareholderName2',16,1)
ELSE IF @ShareholderDate2 IS NULL
	RAISERROR('AddApplication error - Missing parameter @ShareholderDate2',16,1)
ELSE
	BEGIN
	INSERT INTO Application VALUES
	(@LastName,@FirstName,@Address,@PostalCode,@Phone,@AltPhone,@Email,@BirthDate,@Occupation,@CompanyName,@CompanyAddress,@CompanyPostalCode,@CompanyPhone,@SubmitDate,@Sex,@Password,@WantsShare,0,
	0,0,0,@ShareholderName1,@ShareholderDate1,@ShareholderName2,@ShareholderDate2)
	IF @@ERROR = 0
		SET @ReturnCode = 0
	ELSE
		RAISERROR('AddApplication error - INSERT ERROR',16,1)
	END
RETURN @ReturnCode
GO
/****** Object:  StoredProcedure [dbo].[AddEntry]    Script Date: 29-02-2020 10:42:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddEntry](@AccountID INT = NULL,@ActivityDate DATE = NULL, @Description NVARCHAR(100) = NULL,@Amount MONEY = NULL)
AS
DECLARE @ReturnCode INT = 1
IF @AccountID IS NULL
	RAISERROR('AddTransaction error - Required parameter @AccountID',16,1)
ELSE IF @ActivityDate IS NULL
	RAISERROR('AddTransaction error - Required parameter @ActivityDate',16,1)
ELSE IF @Description IS NULL
	RAISERROR('AddTransaction error - Required parameter @Description',16,1)
ELSE IF @Amount IS NULL
	RAISERROR('AddTransaction error - Required parameter @Amount',16,1)
ELSE
	BEGIN
		INSERT INTO Entry VALUES
		(@AccountID,GETDATE(),@ActivityDate,@Description,@Amount)
		UPDATE Account 
		SET CurrentBalance = CurrentBalance - @Amount
		WHERE AccountID = @AccountID
	END
RETURN @ReturnCode
GO
/****** Object:  StoredProcedure [dbo].[AddMember]    Script Date: 29-02-2020 10:42:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[AddMember](@MembershipLevel VARCHAR(6) = NULL,@MembershipTier VARCHAR(30) = NULL, @MemberName NVARCHAR(50) = NULL,@Password NVARCHAR(100) = NULL,@IsShareHolder BIT = NULL,
@Sex CHAR = NULL,@Standing CHAR = NULL,@MemberNumber INT OUT)
AS
DECLARE @ReturnCode INT
SET @ReturnCode = 0

IF @MembershipLevel IS NULL
	RAISERROR('AddMember error - Required parameter @MembershipLevel',16,1)
ELSE IF @MemberName IS NULL
	RAISERROR('AddMember error - Required parameter @MemberName',16,1)
ELSE IF @MembershipLevel != 'Gold' AND @MembershipLevel != 'Silver' AND @MembershipLevel != 'Bronze' AND @MembershipLevel != 'Copper'
	RAISERROR('AddMember error - Bad membership level',16,1)
ELSE IF @MembershipTier IS NULL
	RAISERROR('AddMember error - Required parameter @MembershipTier',16,1)
ELSE IF @Password IS NULL
	RAISERROR('AddMember error - Required parameter @Password',16,1)
ELSE IF @IsShareHolder IS NULL
	RAISERROR('AddMember error - Required parameter @IsShareHolder',16,1)
ELSE IF @Sex IS NULL
	RAISERROR('AddMember error - Required parameter @Sex',16,1)
ELSE IF @Standing IS NULL
	RAISERROR('AddMember error - Required parameter @Standing',16,1)
ELSE
	BEGIN
	INSERT INTO Member
	VALUES(@MembershipLevel,@MembershipTier,@MemberName,@Password,@IsShareHolder,@Sex,@Standing,0.0)
	SET @memberNumber = @@IDENTITY
	IF
		@@ERROR = 0
		SET @ReturnCode = 0
	ELSE
		RAISERROR('AddMember error - INSERT ERROR',16,1)
	END
RETURN @ReturnCode
GO
/****** Object:  StoredProcedure [dbo].[AddNewEntry]    Script Date: 29-02-2020 10:42:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddNewEntry](@MemberNumber INT = NULL,@ActivityDate DATE = NULL, @Description NVARCHAR(100) = NULL,@Amount MONEY = NULL)
AS
DECLARE @ReturnCode INT = 1
IF @MemberNumber IS NULL
	RAISERROR('AddTransactionQuick error - Required parameter @MemberNumber',16,1)
ELSE IF @ActivityDate IS NULL
	RAISERROR('AddTransactionQuick error - Required parameter @ActivityDate',16,1)
ELSE IF @Description IS NULL
	RAISERROR('AddTransactionQuick error - Required parameter @Description',16,1)
ELSE IF @Amount IS NULL
	RAISERROR('AddTransactionQuick error - Required parameter @Amount',16,1)
ELSE
	BEGIN
		DECLARE @AccountID INT = (Select AccountID FROM Account WHERE MemberNumber = @MemberNumber)
		IF @@ERROR = 0
		BEGIN
			SET @ReturnCode = 0
			EXECUTE AddEntry  @AccountID,@ActivityDate,@Description,@Amount
		END
		ELSE
			RAISERROR('AddTransactionQuick error - SELECT ERROR',16,1)
		
	END
	RETURN @ReturnCode
GO
/****** Object:  StoredProcedure [dbo].[AddStandingReservation]    Script Date: 29-02-2020 10:42:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddStandingReservation](@StartDate DATE = NULL,@EndDate DATE = NULL, @RequestedTime Time(0) = NULL,@DayOfWeek NVARCHAR(9) = NULL,@MemberNumber1 INT = NULL, @MemberNumber2 INT = NULL, @MemberNumber3 INT = NULL, @MemberNumber4 INT = NULL, 
@MemberName1 NVARCHAR(20) = NULL, @MemberName2 NVARCHAR(20) = NULL, @MemberName3 NVARCHAR(20) = NULL, @MemberName4 NVARCHAR(20) = NULL)
AS
DECLARE @ReturnCode INT
SET @ReturnCode = 1
DECLARE @MinTime Time
SET @MinTime = '06:00AM'
DECLARE @MaxTime Time
SET @MaxTime = '08:52PM'

IF @StartDate IS NULL
	RAISERROR('AddStandingReservation error - required parameter @StartDate',16,1)
ELSE IF @EndDate IS NULL
	RAISERROR('AddStandingReservation error - required parameter @EndDate',16,1)
ELSE IF @RequestedTime IS NULL
	RAISERROR('AddStandingReservation error - required parameter @RequestedTime',16,1)
ELSE IF @DayOfWeek IS NULL
	RAISERROR('AddStandingReservation error - required parameter @DaySfWeek',16,1)
ELSE IF @MemberNumber1 IS NULL
	RAISERROR('AddStandingReservation error - required parameter @MemberNumber1',16,1)
ELSE IF @MemberNumber2 IS NULL
	RAISERROR('AddStandingReservation error - required parameter @MemberNumber2',16,1)
ELSE IF @MemberNumber3 IS NULL
	RAISERROR('AddStandingReservation error - required parameter @MemberNumber3',16,1)
ELSE IF @MemberNumber4 IS NULL
	RAISERROR('AddStandingReservation error - required parameter @MemberNumber4',16,1)
ELSE IF @MemberName1 IS NULL
	RAISERROR('AddStandingReservation error - required parameter @MemberName1',16,1)
ELSE IF @MemberName2 IS NULL
	RAISERROR('AddStandingReservation error - required parameter @MemberName2',16,1)
ELSE IF @MemberName3 IS NULL
	RAISERROR('AddStandingReservation error - required parameter @MemberName3',16,1)
ELSE IF @MemberName4 IS NULL
	RAISERROR('AddStandingReservation error - required parameter @MemberName4',16,1)
ELSE 
	BEGIN
		IF NOT EXISTS (SELECT * FROM StandingReservation WHERE Year = DATEPART(YEAR,@StartDate) AND DayOfWeek = @DayOfWeek AND RequestedTime = @RequestedTime AND IsCanceled <>1)
		BEGIN
			INSERT INTO StandingReservation VALUES(DATEPART(YEAR,GETDATE()),@StartDate,@EndDate,@RequestedTime,@DayOfWeek,@MemberNumber1,@MemberNumber2,@MemberNumber3,@MemberNumber4,
			@MemberName1,@MemberName2,@MemberName3,@MemberName4,0)
			IF @@ERROR = 0
				SET @ReturnCode = 0
				ELSE
					RAISERROR('AddStandingReservation error - INSERT error',16,1)
		END
		ELSE
		BEGIN
			Declare @NewRequestedTime TIME
			SET @NewRequestedTime = DATEADD(MINUTE, 30, @RequestedTime)
			IF (NOT EXISTS (SELECT * FROM StandingReservation WHERE Year = DATEPART(YEAR,@StartDate) AND DayOfWeek = @DayOfWeek AND RequestedTime = @NewRequestedTime AND IsCanceled <>1) AND CAST(@NewRequestedTime AS TIME)<=CAST(@MaxTime AS TIME))
			BEGIN
				INSERT INTO StandingReservation VALUES(DATEPART(YEAR,GETDATE()),@StartDate,@EndDate,@NewRequestedTime,@DayOfWeek,@MemberNumber1,@MemberNumber2,@MemberNumber3,@MemberNumber4,
				@MemberName1,@MemberName2,@MemberName3,@MemberName4,0)
				IF @@ERROR = 0
					SET @ReturnCode = 0
					ELSE
						RAISERROR('AddStandingReservation error - INSERT error',16,1)
			END
			ELSE
			BEGIN
				SET @NewRequestedTime = DATEADD(MINUTE, -30, @RequestedTime)
				IF (NOT EXISTS (SELECT * FROM StandingReservation WHERE Year = DATEPART(YEAR,@StartDate) AND DayOfWeek = @DayOfWeek AND RequestedTime = @NewRequestedTime AND IsCanceled <>1)AND CAST(@NewRequestedTime AS TIME)>=CAST(@MinTime AS TIME))
				BEGIN
					INSERT INTO StandingReservation VALUES(DATEPART(YEAR,GETDATE()),@StartDate,@EndDate,@NewRequestedTime,@DayOfWeek,@MemberNumber1,@MemberNumber2,@MemberNumber3,@MemberNumber4,
				@MemberName1,@MemberName2,@MemberName3,@MemberName4,0)
				IF @@ERROR = 0
					SET @ReturnCode = 0
					ELSE
						RAISERROR('AddStandingReservation error - INSERT error',16,1)
				END
				ELSE
					RAISERROR('AddStandingReservation error - Standing Time Reservation Is Not Available',16,1)
			END	
		END
	END
	
RETURN @ReturnCode
GO
/****** Object:  StoredProcedure [dbo].[AddTeeTime]    Script Date: 29-02-2020 10:42:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddTeeTime](@Date date  = NULL,@Time TIME(0) = NULL,@MemberNumber INT = NULL,@MemberName1 NVARCHAR(20) = NULL,@MemberName2 NVARCHAR(20),@MemberName3 NVARCHAR(20),@MemberName4 NVARCHAR(20),@NumberOfPlayers INT = NULL,@PhoneNumber VARCHAR(15) = NULL,
@NumberOfCarts INT = NULL,@EmployeeName NVARCHAR(20) = NULL,@MembershipLevel VARCHAR(6) = NULL)
AS
DECLARE @ReturnCode INT
SET @ReturnCode = 1
DECLARE @Now AS DATETIME
SET @Now = GETDATE()
DECLARE @NumMem INT
DECLARE @Good Bit
SET @Good = 0
DECLARE @MEMBER1 NVARCHAR(20)
DECLARE @MEMBER2 NVARCHAR(20)
DECLARE @MEMBER3 NVARCHAR(20)
DECLARE @MEMBER4 NVARCHAR(20)

IF @Date IS NULL
	RAISERROR('AddTeeTime error - Required Parameter - @Date',16,1)
ELSE IF @Time IS NULL
	RAISERROR('AddTeeTime error - Required Parameter - @Time',16,1)
ELSE IF @MemberNumber IS NULL
	RAISERROR('AddTeeTime error - Required Parameter - @MemberID',16,1)
ELSE IF @NumberofPlayers IS NULL
	RAISERROR('AddTeeTime error - Required Parameter - @NumberOfPlayers',16,1)
ELSE IF @PhoneNumber IS NULL
	RAISERROR('AddTeeTime error - Required Parameter - @PhoneNumber',16,1)
ELSE IF @NumberOfCarts IS NULL
	RAISERROR('AddTeeTime error - Required Parameter - @NumberOfCarts',16,1)
ELSE IF @MemberName1 IS NULL
	RAISERROR('AddTeeTime error - Required Parameter - @MemberName1',16,1)
ELSE IF @MembershipLevel IS NULL
	RAISERROR('AddTeeTime error - Required Parameter - @MemberShipLevel',16,1)
ELSE
	BEGIN
	IF DATEDIFF(day,@Now,@Date) > 7 OR DATEDIFF(day,@Now,@Date) < 0
		RAISERROR('AddTeeTime error - reservation can be only done 1 week in advanced',16,1)
	ELSE
		BEGIN

		IF @MembershipLevel = 'Gold'
			SET @Good = 1
		ELSE IF @MembershipLevel = 'Silver' AND @Good = 0
			BEGIN
			IF (DATENAME(WEEKDAY,@Date) != 'Saturday' AND DATENAME(WEEKDAY,@Date) != 'Sunday') AND (@Time < '17:30:00' AND @Time > '15:00:00')
				RAISERROR('AddTeeTime error - Cannot reserve at that time',16,1)
			ELSE IF (DATENAME(WEEKDAY,@Date) = 'Saturday' OR DATENAME(WEEKDAY,@Date) = 'Sunday') AND @Time < '11:00:00'
				RAISERROR('AddTeeTime error - Cannot reserve at that time',16,1)
			ELSE
				SET @Good = 1
			END
		ELSE IF @MemberShipLevel = 'Bronze' AND @Good = 0
			BEGIN
			IF (DATENAME(WEEKDAY,@Date) != 'Saturday' AND DATENAME(WEEKDAY,@Date) != 'Sunday') AND (@Time < '18:00:00' AND @Time > '15:00:00')
				RAISERROR('AddTeeTime error - Cannot reserve at that time',16,1)
			ELSE IF (DATENAME(WEEKDAY,@Date) = 'Saturday' OR DATENAME(WEEKDAY,@Date) = 'Sunday') AND @Time < '13:00:00'
				RAISERROR('AddTeeTime error - Cannot reserve at that time',16,1)
			ELSE
				SET @Good = 1
			END
		ELSE IF @MembershipLevel = 'Copper' AND @Good = 0
			RAISERROR('AddTeeTime error - Copper members cannot make reserve teetimes',16,1)
	
		IF @Good = 1	
			BEGIN

				IF NOT EXISTS(SELECT Date FROM DailyReservationSheet WHERE Date = @Date)
				BEGIN
					RAISERROR('AddTeeTime error - The Reservation Sheet is not available for this day',16,1)
				END
				IF EXISTS (SELECT * FROM TeeTime WHERE Date = @Date AND Time = @Time AND NumberOfPlayers = 0)
					BEGIN
					UPDATE TeeTime
					SET MemberNumber = @MemberNumber,MemberName1 = @MemberName1,MemberName2 = @MemberName2,MemberName3 = @MemberName3,MemberName4 = @MemberName4,NumberOfPlayers = @NumberOfPlayers,
						NumberOfCarts = @NumberOfCarts, BookingDate = CONVERT(DATE,@Now),BookingTime = CONVERT(TIME,@Now)
						WHERE Date = @Date AND Time = @Time
					END
				 ELSE IF EXISTS (SELECT * FROM TeeTime WHERE Date = @Date AND Time = @Time AND (NumberOfPlayers + @NumberOfPlayers) <= 4) -- But if you can fit
					BEGIN
						SELECT @MEMBER1 = MemberName1, @MEMBER2 = MemberName2, @MEMBER3 = MemberName3, @MEMBER4 = MemberName4,@NumMem = NumberOfPlayers FROM TeeTime WHERE Date = @Date AND Time = @Time
						EXECUTE UpdateNamesOrder @MEMBER1 out, @MEMBER2 out, @MEMBER3 out, @MEMBER4 out, @MemberName1,@MemberName2,@MemberName3,@NumMem
						UPDATE TeeTime SET MemberName1 = @MEMBER1, MemberName2 = @MEMBER2,MemberName3 = @MEMBER3,MemberName4 = @MEMBER4,NumberOfPlayers = (NumberofPlayers + @NumberOfPlayers) WHERE Date = @Date AND Time = @Time
					END
				ELSE 
					RAISERROR('AddTeeTime error - Sorry Tee Time IS Full',16,1)
			END
		END
	END
RETURN @ReturnCode

GO
/****** Object:  StoredProcedure [dbo].[CancelStandingReservation]    Script Date: 29-02-2020 10:42:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CancelStandingReservation](@MemberNumber INT = NULL, @Year INT = NULL)
AS
DECLARE @ReturnCode INT
SET @ReturnCode = 1

IF	@MemberNumber IS NULL
	RAISERROR('CancelStandingReservation errer - required parameter @MemberNumber',16,1)
ELSE IF @Year IS NULL
	RAISERROR('CancelStandingReservation errer - required parameter @Year',16,1)
ELSE
	BEGIN
	UPDATE StandingReservation SET IsCanceled = 1 WHERE MemberNumber1 = @MemberNumber AND Year = @Year
	IF @@ERROR = 0
		SET @ReturnCode = 0
	ELSE
		RAISERROR('CancelStandingReservation errer - UPDATE error',16,1)
	END
RETURN @ReturnCode
GO
/****** Object:  StoredProcedure [dbo].[CancelTeeTime]    Script Date: 29-02-2020 10:42:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CancelTeeTime](@Date DATE = NULL, @Time TIME = NULL,@MemberNumber INT = NULL)
AS
DECLARE @ReturnCode INT
SET @ReturnCode = 1

IF @Date IS NULL
	RAISERROR('CancelTeeTime error - required parameter @Date',16,1)
ELSE IF @Time IS NULL
	RAISERROR('CancelTeeTime error - required parameter @Time',16,1)
ELSE IF @MemberNumber IS NULL
	RAISERROR('CancelTeeTime error - required parameter @MemberNumber',16,1)
ELSE
	BEGIN
	
	UPDATE TeeTime
					SET MemberNumber = 1,MemberName1 = 'N/A',MemberName2 = 'N/A',MemberName3 = 'N/A',MemberName4 = 'N/A',NumberOfPlayers = 0,
						NumberOfCarts = 0, BookingDate = Date ,BookingTime = Time
						WHERE Date = @Date AND Time = @Time

	IF @@ERROR = 0
		SET @ReturnCode = 0
	ELSE
		RAISERROR('CancelTeeTime error - DELETE error',16,1)
	END
RETURN @ReturnCode
GO
/****** Object:  StoredProcedure [dbo].[DenyApplication]    Script Date: 29-02-2020 10:42:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DenyApplication](@ApplicationID INT = NULL)
AS
DECLARE @ReturnCode INT = 1
IF @ApplicationID IS NULL
	RAISERROR('DenyApplication error - Missing Parameter @ApplicationID',16,1)
ELSE
	BEGIN
		UPDATE Application
		SET IsDenied = 1
		WHERE ApplicationID = @ApplicationID
		IF @@ERROR = 0
			SET @ReturnCode = 0
		ELSE
			RAISERROR('DenyApplication error - UPDATE ERROR',16,1)
	END
RETURN @ReturnCode
GO
/****** Object:  StoredProcedure [dbo].[GenerateReservationSheet]    Script Date: 29-02-2020 10:42:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GenerateReservationSheet] @Day DATETIME = NULL
AS
DECLARE @ReturnCode INT = 1
DECLARE @Time TIME = '06:00'
DECLARE @EndTime TIME = '20:07'
DECLARE @Bit BIT = 1
DECLARE @DayName NVARCHAR(9) = DATENAME(WEEKDAY,@Day)
IF @Day IS NULL
	RAISERROR('SetUpSpecificDay ERROR - REQUIRED PARAMETER @Day',16,1)
ELSE
	BEGIN
	INSERT INTO DailyReservationSheet
	VALUES(@Day,DATENAME(WEEKDAY,@Day))

	WHILE DATEDIFF(MINUTE,@Time,@EndTime) != 0
		BEGIN
		INSERT INTO TeeTime VALUES (@Day,@Time,1,'N/A','N/A','N/A','N/A',0,'0',0,@Day,@Day,'System')
		IF @Bit = 1
			BEGIN
			SET @Time = DATEADD(MINUTE,7,@Time)
			SET @Bit = 0
			END
		ELSE
			BEGIN
			SET @Time = DATEADD(MINUTE,8,@Time)
			SET @Bit = 1
			END
		END
	
SET @ReturnCode = 0

	END
RETURN @ReturnCode
GO
/****** Object:  StoredProcedure [dbo].[GetApplications]    Script Date: 29-02-2020 10:42:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetApplications]
AS
DECLARE @ReturnCode INT = 1
SELECT * FROM Application WHERE IsAccepted = 0 AND IsDenied = 0
IF @@ERROR = 0
	SET @ReturnCode = 0
ELSE
	RAISERROR('GetApplications error - SELECT ERROR',16,1)
RETURN @ReturnCode

GO
/****** Object:  StoredProcedure [dbo].[GetCurrentBalance]    Script Date: 29-02-2020 10:42:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCurrentBalance](@MemberNumber INT = NULL,@CurrentBalance MONEY OUT)
AS
DECLARE @ReturnCode INT = 1
IF @MemberNumber IS NULL
	RAISERROR('GetCurrentBalance error - Required parameter @MemberNumber',16,1)
ELSE
	BEGIN
	SET @CurrentBalance = (SELECT CurrentBalance FROM Account WHERE MemberNumber = @MemberNumber)
	IF @@ERROR = 0
		SET @ReturnCode = 0
	ELSE
		RAISERROR('GetCurrentBalance error - SELECT ERROR',16,1)
	END
RETURN @ReturnCode

GO
/****** Object:  StoredProcedure [dbo].[GetCurrentHandicap]    Script Date: 29-02-2020 10:42:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCurrentHandicap](@MemberNumber INT = NULL,@Handicap FLOAT OUT)
AS
DECLARE @ReturnCode INT = 1
IF @MemberNumber IS NULL
	RAISERROR('GetCurrentHandicap error - Missing Parameter @MemberNumber',16,1)
ELSE
	BEGIN
	SET @Handicap = (SELECT Handicap FROM Member WHERE MemberNumber = @MemberNumber)
	IF @@ERROR = 0
		SET @ReturnCode = 0
	ELSE
		RAISERROR('GetCurrentHandicap error - SELECT ERROR',16,1)
	END
RETURN @ReturnCode

GO
/****** Object:  StoredProcedure [dbo].[GetEntries]    Script Date: 29-02-2020 10:42:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetEntries](@MemberNumber INT = NULL)
AS
DECLARE @ReturnCode INT = 1
IF @MemberNumber IS NULL
	RAISERROR('GetTransactions error - Required parameter @MemberNumber',16,1)
ELSE
	BEGIN
		DECLARE @AccountID INT = (SELECT AccountID FROM Account WHERE MemberNumber = @MemberNumber)
		SELECT PostDate,ActivityDate,Description,Amount FROM Entry WHERE AccountID = @AccountID ORDER BY PostDate
		IF @@ERROR = 0
			SET @ReturnCode = 0
		ELSE
			RAISERROR('GetEntries error - SELECT ERROR',16,1)
	END
RETURN @ReturnCode
GO
/****** Object:  StoredProcedure [dbo].[GetHandicapDifferentials]    Script Date: 29-02-2020 10:42:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetHandicapDifferentials](@MemberNumber INT = NULL)
AS
DECLARE @ReturnCode INT = 1

IF @MemberNumber IS NULL
	RAISERROR('GetHandicapDifferentials error - Missing Parameter @MemberNumber',16,1)
ELSE
	BEGIN
	SELECT TOP 20 HandicapDifferential FROM score WHERE MemberNumber = @MemberNumber ORDER BY DateTime DESC 
	IF @@ERROR  = 0
		SET @ReturnCode = 0
	ELSE
		RAISERROR('GetHandicapDifferentials error - SELECT ERROR',16,1)
	END
RETURN @ReturnCode
GO
/****** Object:  StoredProcedure [dbo].[GetLoginInfo]    Script Date: 29-02-2020 10:42:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetLoginInfo](@MemberNumber INT = NULL, @Password NVARCHAR(100) OUT,@MemberName NVARCHAR(20) OUT, @MembershipLevel VARCHAR(6) OUT,@MembershipTier VARCHAR(30) OUT, @IsShareholder BIT OUT,
@Sex CHAR OUT, @Standing CHAR OUT)
AS
DECLARE @ReturnCode INT
SET @ReturnCode = 1

IF @MemberNumber IS NULL
	RAISERROR('GetLoginInfo error - Required parameter @MemberNumber',16,1)
ELSE
	BEGIN
	SELECT @Password = Password,@MemberName = MemberName, @MembershipLevel = MembershipLevel,@MembershipTier = MembershipTier,@IsShareholder = IsShareHolder,
	@Sex = Sex,@Standing = Standing 
	FROM Member WHERE MemberNumber = @MemberNumber

	IF @@ERROR = 0
		SET @ReturnCode = 0
	ELSE
		RAISERROR('GetLoginInfo error - SELECT ERROR',16,1)
	END
RETURN @ReturnCode

GO
/****** Object:  StoredProcedure [dbo].[GetMemberReservations]    Script Date: 29-02-2020 10:42:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE PROCEDURE [dbo].[GetMemberReservations]
     (@MemberNumber INT = NULL)
AS
DECLARE @ReturnCode INT = 1
IF @MemberNumber IS NULL
	RAISERROR('GetMembersReservations error - required parameter @MemberNumber',16,1)
ELSE
	BEGIN
	SELECT Date, Time FROM TeeTime WHERE MemberNumber = @MemberNumber AND DATEDIFF(DAY,Date,GETDATE()) <= 0
	IF @@ERROR = 0 
		SET @ReturnCode = 0
	ELSE
		RAISERROR('GetMembersReservations error - SELECT error',16,1)
	END
RETURN @ReturnCode


GO
/****** Object:  StoredProcedure [dbo].[GetTeeTimes]    Script Date: 29-02-2020 10:42:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetTeeTimes](@Date DATE = NULL)
AS
DECLARE @ReturnCode INT = 1
IF @Date IS NULL
	RAISERROR('GetTeeTimes error - Missing Parameter @Day',16,1)
ELSE
BEGIN
	SELECT Date,Time,MemberName1,MemberName2,MemberName3,MemberName4 FROM TeeTime WHERE Date = @Date
	IF @@ERROR = 0
		 SET @ReturnCode = 0
	ELSE
		RAISERROR('GetTeeTimes error - SELECT ERROR',16,1)
END
RETURN @ReturnCode

GO
/****** Object:  StoredProcedure [dbo].[HoldApplication]    Script Date: 29-02-2020 10:42:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[HoldApplication](@ApplicationID INT = NULL)
AS
DECLARE @ReturnCode INT = 1
IF @ApplicationID IS NULL
	RAISERROR('HoldApplication error - Missing Parameter @ApplicationID',16,1)
ELSE
	BEGIN
		UPDATE Application
		SET IsOnhold = 1
		WHERE ApplicationID = @ApplicationID
		IF @@ERROR = 0
			SET @ReturnCode = 0
		ELSE
			RAISERROR('HoldApplication error - UPDATE ERROR',16,1)
	END
RETURN @ReturnCode

GO
/****** Object:  StoredProcedure [dbo].[ProcessCurrentHandicapFactor]    Script Date: 29-02-2020 10:42:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ProcessCurrentHandicapFactor](@MemberNumber INT = NULL)
AS
DECLARE @ReturnCode INT = 1
DECLARE @Rows INT
DECLARE @numtouse INT = 0
DECLARE @HandicapFactor FLOAT
IF @MemberNumber IS NULL
	RAISERROR('ProcessCurrentHandicapFactor error - Missing Parameter @MemberNumber',16,1)
ELSE
	BEGIN
	SELECT TOP 20 HandicapDifferential FROM score WHERE MemberNumber = @MemberNumber ORDER BY DateTime DESC
	SET @Rows = @@ROWCOUNT

	IF @Rows < 5
		BEGIN
		UPDATE Member
		SET Handicap = 100
		WHERE MemberNumber = @MemberNumber
		END
	ELSE IF @Rows >= 5 AND @Rows <= 16
		BEGIN
		SET @numtouse = CAST(ROUND(((CAST(@Rows AS FLOAT)/2) - 2),1) AS INT)
		SET @HandicapFactor = (SELECT AVG(HandicapDifferential) From
		(SELECT TOP(10) HandicapDifferential FROM
		(SELECT TOP 20 HandicapDifferential FROM score WHERE MemberNumber = 1 ORDER BY DateTime DESC)t
		ORDER BY HandicapDifferential ASC)t)
		SET @HandicapFactor = @HandicapFactor * .96
		SET @HandicapFactor = ROUND(@HandicapFactor,1,1)
		UPDATE Member
		SET Handicap = @HandicapFactor
		WHERE MemberNumber = @MemberNumber
		END
	ELSE IF @Rows > 16
		BEGIN
		SET @numtouse = @Rows - 10
		SET @HandicapFactor = (SELECT AVG(HandicapDifferential) From
		(SELECT TOP(10) HandicapDifferential FROM
		(SELECT TOP 20 HandicapDifferential FROM score WHERE MemberNumber = 1 ORDER BY DateTime DESC)t
		ORDER BY HandicapDifferential ASC)t)
		SET @HandicapFactor = @HandicapFactor * .96
		SET @HandicapFactor = ROUND(@HandicapFactor,1,1)
		UPDATE Member
		SET Handicap = @HandicapFactor
		WHERE MemberNumber = @MemberNumber
		END
SET @ReturnCode = 0

	END
RETURN @ReturnCode

GO
/****** Object:  StoredProcedure [dbo].[UpdateNamesOrder]    Script Date: 29-02-2020 10:42:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateNamesOrder](@MEMBER1 NVARCHAR(20) OUT, @MEMBER2 NVARCHAR(20) = 'N/A' OUT, @MEMBER3 NVARCHAR(20) = 'N/A' OUT, @MEMBER4 NVARCHAR(20) = 'N/A' OUT, @MemberName1 NVARCHAR(20), @MemberName2 NVARCHAR(20) = 'N/A',@MemberName3 NVARCHAR(20) = 'N/A',@Num1 INT)
AS

IF @Num1 = 1
	BEGIN
	SET @MEMBER2 = @MemberName1
	SET @MEMBER3 = @MemberName2
	SET @MEMBER4 = @MemberName3
	END
ELSE IF @Num1 = 2
	BEGIN
		SET @MEMBER3 = @MemberName1
		SET @MEMBER4 = @MemberName2
	END
ELSE IF @Num1 = 3
	BEGIN
		SET @MEMBER4 = @MemberName1
	END
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[UpdateTeeTimesByStandingReservations]    Script Date: 29-02-2020 10:42:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateTeeTimesByStandingReservations]
(@Date DateTime= NULL,@RequestedTime DateTime= NULL,@MemberNumber1 INT= NULL,@MemberName1 NVARCHAR(20)= NULL,@MemberName2 NVARCHAR(20)= NULL,@MemberName3 NVARCHAR(20)= NULL,@MemberName4 NVARCHAR(20)= NULL)
AS
DECLARE @ReturnCode INT = 1
IF @RequestedTime IS NULL
	RAISERROR('UpdateTeeTimesByStandingReservations error - Missing Parameter @RequestedTime',16,1)
ELSE
IF @MemberNumber1 IS NULL
	RAISERROR('UpdateTeeTimesByStandingReservations error - Missing Parameter @MemberNumber1',16,1)
ELSE
IF @MemberName1 IS NULL
	RAISERROR('UpdateTeeTimesByStandingReservations error - Missing Parameter @MemberName1',16,1)
ELSE
IF @MemberName2 IS NULL
	RAISERROR('UpdateTeeTimesByStandingReservations error - Missing Parameter @MemberName2',16,1)
ELSE
IF @MemberName3 IS NULL
	RAISERROR('UpdateTeeTimesByStandingReservations error - Missing Parameter @MemberName3',16,1)
ELSE
IF @MemberName4 IS NULL
	RAISERROR('UpdateTeeTimesByStandingReservations error - Missing Parameter @MemberName4',16,1)
ELSE



BEGIN
		UPDATE TeeTime
		SET MemberNumber = @MemberNumber1,
		MemberName1 = @MemberName1,
		MemberName2 = @MemberName2,
		MemberName3 = @MemberName3,
		MemberName4 = @MemberName4 
						WHERE Date = CONVERT(DATE,@Date) AND Time = CONVERT(TIME,@RequestedTime)
	IF @@ERROR = 0
		 SET @ReturnCode = 0
	ELSE
		RAISERROR('GetStandingReservationsForGenerate error - SELECT ERROR',16,1)
END
RETURN @ReturnCode

GO
/****** Object:  StoredProcedure [dbo].[WaitlistApplication]    Script Date: 29-02-2020 10:42:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WaitlistApplication](@ApplicationID INT = NULL)
AS
DECLARE @ReturnCode INT = 1
IF @ApplicationID IS NULL
	RAISERROR('WaitlistApplication error - Missing Parameter @ApplicationID',16,1)
ELSE
	BEGIN
		UPDATE Application
		SET IsWaitlisted = 1
		WHERE ApplicationID = @ApplicationID
		IF @@ERROR = 0
			SET @ReturnCode = 0
		ELSE
			RAISERROR('WaitlistApplication error - UPDATE ERROR',16,1)
	END
RETURN @ReturnCode

GO
USE [master]
GO
ALTER DATABASE [ClubBAIST] SET  READ_WRITE 
GO
