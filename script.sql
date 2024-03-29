USE [master]
GO
/****** Object:  Database [CharacterGenerator]    Script Date: 9/9/2019 8:48:33 AM ******/
CREATE DATABASE [CharacterGenerator]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CharacterGenerator', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\CharacterGenerator.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CharacterGenerator_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\CharacterGenerator_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [CharacterGenerator] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CharacterGenerator].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CharacterGenerator] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CharacterGenerator] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CharacterGenerator] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CharacterGenerator] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CharacterGenerator] SET ARITHABORT OFF 
GO
ALTER DATABASE [CharacterGenerator] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CharacterGenerator] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CharacterGenerator] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CharacterGenerator] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CharacterGenerator] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CharacterGenerator] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CharacterGenerator] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CharacterGenerator] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CharacterGenerator] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CharacterGenerator] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CharacterGenerator] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CharacterGenerator] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CharacterGenerator] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CharacterGenerator] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CharacterGenerator] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CharacterGenerator] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CharacterGenerator] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CharacterGenerator] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CharacterGenerator] SET  MULTI_USER 
GO
ALTER DATABASE [CharacterGenerator] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CharacterGenerator] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CharacterGenerator] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CharacterGenerator] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CharacterGenerator] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CharacterGenerator] SET QUERY_STORE = OFF
GO
USE [CharacterGenerator]
GO
/****** Object:  Table [dbo].[Characters]    Script Date: 9/9/2019 8:48:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Characters](
	[CharacterID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[CharacterName] [nvarchar](50) NULL,
	[ClassID] [int] NULL,
	[RaceID] [int] NULL,
	[StrengthScore] [int] NULL,
	[DexterityScore] [int] NULL,
	[ConstitutionScore] [int] NULL,
	[IntelligenceScore] [int] NULL,
	[WisdomScore] [int] NULL,
	[CharismaScore] [int] NULL,
 CONSTRAINT [PK_Characters] PRIMARY KEY CLUSTERED 
(
	[CharacterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Classes]    Script Date: 9/9/2019 8:48:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classes](
	[ClassID] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [nvarchar](10) NULL,
	[Description] [nvarchar](250) NULL,
	[ClassModifier] [int] NULL,
 CONSTRAINT [PK_Classes] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClassModifiers]    Script Date: 9/9/2019 8:48:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassModifiers](
	[ClassModifierID] [int] IDENTITY(1,1) NOT NULL,
	[ClassID] [int] NULL,
	[StatID] [int] NULL,
	[Modifier] [int] NULL,
 CONSTRAINT [PK_ClassModifiers] PRIMARY KEY CLUSTERED 
(
	[ClassModifierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LogTrace]    Script Date: 9/9/2019 8:48:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogTrace](
	[LogID] [int] IDENTITY(1,1) NOT NULL,
	[Message] [nvarchar](250) NULL,
	[StackTrace] [nvarchar](max) NULL,
	[TimeStamp] [datetime2](7) NULL,
 CONSTRAINT [PK_LogTrace] PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RaceModifiers]    Script Date: 9/9/2019 8:48:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RaceModifiers](
	[RaceModifierID] [int] IDENTITY(1,1) NOT NULL,
	[RaceID] [int] NOT NULL,
	[StatID] [int] NULL,
	[Modifier] [int] NULL,
 CONSTRAINT [PK_RaceModifiers] PRIMARY KEY CLUSTERED 
(
	[RaceModifierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Races]    Script Date: 9/9/2019 8:48:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Races](
	[RaceID] [int] IDENTITY(1,1) NOT NULL,
	[RaceName] [nvarchar](10) NULL,
	[RaceModifier] [int] NULL,
 CONSTRAINT [PK_Races] PRIMARY KEY CLUSTERED 
(
	[RaceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 9/9/2019 8:48:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 9/9/2019 8:48:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](20) NULL,
	[Email] [nvarchar](50) NULL,
	[RoleID] [int] NULL,
	[Hash] [nvarchar](250) NULL,
	[Salt] [nvarchar](250) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [AK_EmailAddress]    Script Date: 9/9/2019 8:48:34 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [AK_EmailAddress] ON [dbo].[Users]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [AK_UserName]    Script Date: 9/9/2019 8:48:34 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [AK_UserName] ON [dbo].[Users]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Characters]  WITH CHECK ADD  CONSTRAINT [FK_Characters_Classes] FOREIGN KEY([ClassID])
REFERENCES [dbo].[Classes] ([ClassID])
GO
ALTER TABLE [dbo].[Characters] CHECK CONSTRAINT [FK_Characters_Classes]
GO
ALTER TABLE [dbo].[Characters]  WITH CHECK ADD  CONSTRAINT [FK_Characters_Races] FOREIGN KEY([RaceID])
REFERENCES [dbo].[Races] ([RaceID])
GO
ALTER TABLE [dbo].[Characters] CHECK CONSTRAINT [FK_Characters_Races]
GO
ALTER TABLE [dbo].[Characters]  WITH CHECK ADD  CONSTRAINT [FK_Characters_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Characters] CHECK CONSTRAINT [FK_Characters_Users]
GO
ALTER TABLE [dbo].[ClassModifiers]  WITH CHECK ADD  CONSTRAINT [FK_ClassModifiers_Classes] FOREIGN KEY([ClassID])
REFERENCES [dbo].[Classes] ([ClassID])
GO
ALTER TABLE [dbo].[ClassModifiers] CHECK CONSTRAINT [FK_ClassModifiers_Classes]
GO
ALTER TABLE [dbo].[RaceModifiers]  WITH CHECK ADD  CONSTRAINT [FK_RaceModifiers_Races] FOREIGN KEY([RaceID])
REFERENCES [dbo].[Races] ([RaceID])
GO
ALTER TABLE [dbo].[RaceModifiers] CHECK CONSTRAINT [FK_RaceModifiers_Races]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
/****** Object:  StoredProcedure [dbo].[CreateCharacter]    Script Date: 9/9/2019 8:48:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jesse Guerrero
-- Create date: 07/29/19
-- Description:	Create a new Character
-- =============================================
CREATE PROCEDURE [dbo].[CreateCharacter] 
	-- Add the parameters for the stored procedure here
			@CharacterID int output
		   ,@UserID int
           ,@CharacterName nvarchar(50)
           ,@ClassID int
           ,@RaceID int
           ,@StrengthScore int
           ,@DexterityScore int
           ,@ConstitutionScore int
           ,@IntelligenceScore int
           ,@WisdomScore int
           ,@CharismaScore int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[Characters]
           ([UserID]
           ,[CharacterName]
           ,[ClassID]
           ,[RaceID]
           ,[StrengthScore]
           ,[DexterityScore]
           ,[ConstitutionScore]
           ,[IntelligenceScore]
           ,[WisdomScore]
           ,[CharismaScore])
     VALUES
           (@UserID
           ,@CharacterName
           ,@ClassID
           ,@RaceID
           ,@StrengthScore
           ,@DexterityScore
           ,@ConstitutionScore
           ,@IntelligenceScore
           ,@WisdomScore
           ,@CharismaScore);
	SELECT @CharacterID = @@IDENTITY
END
GO
/****** Object:  StoredProcedure [dbo].[CreateClass]    Script Date: 9/9/2019 8:48:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jesse Guerrero
-- Create date: 07/29/19
-- Description:	Create a new Class
-- =============================================
CREATE PROCEDURE [dbo].[CreateClass] 
	-- Add the parameters for the stored procedure here
			@ClassID int output
		   ,@ClassName nvarchar(10)
           ,@Description nvarchar(250)
           ,@ClassModifier int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[Classes]
           ([ClassName]
           ,[Description]
           ,[ClassModifier])
     VALUES
           (@ClassName
           ,@Description
           ,@ClassModifier)
	SELECT @ClassID = @@IDENTITY
END
GO
/****** Object:  StoredProcedure [dbo].[CreateClassModifier]    Script Date: 9/9/2019 8:48:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[CreateClassModifier]
@ClassModifierID int output,
@ClassID int, 
@StatID int, 
@Modifier int
as
begin
insert into [dbo] . [ClassModifiers]
(
[ClassID],
[StatID],
[Modifier])
values
(
@ClassID,
@StatID,
@Modifier);
select @ClassModifierID = @@IDENTITY
end
GO
/****** Object:  StoredProcedure [dbo].[CreateRace]    Script Date: 9/9/2019 8:48:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jesse Guerrero
-- Create date: 07/29/19
-- Description:	Create a new Race
-- =============================================
CREATE PROCEDURE [dbo].[CreateRace] 
	-- Add the parameters for the stored procedure here
	 @RaceID int output
	,@RaceName nvarchar(10)
	,@RaceModifier int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[Races]
           ([RaceName]
           ,[RaceModifier])
     VALUES
           (@RaceName
           ,@RaceModifier)
	SELECT @RaceID = @@IDENTITY
END
GO
/****** Object:  StoredProcedure [dbo].[CreateRaceModifier]    Script Date: 9/9/2019 8:48:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[CreateRaceModifier]
@RaceModifierID int output,
@RaceID int, 
@StatID int, 
@Modifier int
as
begin
set nocount on;
insert into [dbo] .[RaceModifiers]
(
[RaceID],
[StatID],
[Modifier])
values
(
@RaceID,
@StatID,
@Modifier);
select @RaceModifierID = @@IDENTITY
end
GO
/****** Object:  StoredProcedure [dbo].[CreateRole]    Script Date: 9/9/2019 8:48:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jesse Guerrero
-- Create date: 07/29/19
-- Description:	Create a new Role
-- =============================================
CREATE PROCEDURE [dbo].[CreateRole] 
	-- Add the parameters for the stored procedure here
	@RoleID int output,
	@RoleName nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[Roles]
           ([RoleName])
     VALUES
           (@RoleName);
	SELECT @RoleID = @@IDENTITY
END
GO
/****** Object:  StoredProcedure [dbo].[CreateUser]    Script Date: 9/9/2019 8:48:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jesse Guerrero
-- Create date: 07/29/19
-- Description:	Create a new User
-- =============================================
CREATE PROCEDURE [dbo].[CreateUser] 
	-- Add the parameters for the stored procedure here
	  @UserID int output
	 ,@UserName nvarchar(20)
     ,@Email nvarchar(50)
     ,@RoleID int
     ,@Hash nvarchar(250)
     ,@Salt nvarchar(250)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[Users]
           ([UserName]
           ,[Email]
           ,[RoleID]
           ,[Hash]
           ,[Salt])
     VALUES
           (@UserName
           ,@Email
           ,@RoleID
           ,@Hash
           ,@Salt);

	SELECT @UserID = @@IDENTITY
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteCharacter]    Script Date: 9/9/2019 8:48:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jesse Guerrero
-- Create date: 07/29/19
-- Description:	Delete Character
-- =============================================
CREATE PROCEDURE [dbo].[DeleteCharacter] 
	-- Add the parameters for the stored procedure here
	@CharacterID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete from Characters where @CharacterID = CharacterID
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteClass]    Script Date: 9/9/2019 8:48:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jesse Guerrero
-- Create date: 07/29/19
-- Description:	Delete a Class
-- =============================================
CREATE PROCEDURE [dbo].[DeleteClass] 
	-- Add the parameters for the stored procedure here
	@ClassID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete from Classes where @ClassID = ClassID
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteClassModifier]    Script Date: 9/9/2019 8:48:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[DeleteClassModifier]
@ClassModifierID int
as
begin
delete from ClassModifiers where @ClassModifierID = ClassModifierID
end
GO
/****** Object:  StoredProcedure [dbo].[DeleteRace]    Script Date: 9/9/2019 8:48:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jesse Guerrero
-- Create date: 07/29/19
-- Description:	Delete a Race
-- =============================================
CREATE PROCEDURE [dbo].[DeleteRace] 
	-- Add the parameters for the stored procedure here
	@RaceID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete from Races where @RaceID = RaceID
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteRaceModifier]    Script Date: 9/9/2019 8:48:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[DeleteRaceModifier]
@RaceModifierID int
as
begin
delete from RaceModifiers where @RaceModifierID = RaceModifierID
end
GO
/****** Object:  StoredProcedure [dbo].[DeleteRole]    Script Date: 9/9/2019 8:48:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jesse Guerrero
-- Create date: 07/29/19
-- Description:	Delete a Role
-- =============================================
CREATE PROCEDURE [dbo].[DeleteRole]
	-- Add the parameters for the stored procedure here
	@RoleID int
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete from Roles where @RoleID = RoleID
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteUser]    Script Date: 9/9/2019 8:48:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jesse Guerrero
-- Create date: 07/29/19
-- Description:	Delete a User
-- =============================================
CREATE PROCEDURE [dbo].[DeleteUser] 
	-- Add the parameters for the stored procedure here
	 @UserID int
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	-- foreign key contraint requires characters to be deleted first
	delete from Characters where @UserID = UserID
	delete from Users where @UserID = UserID
END
GO
/****** Object:  StoredProcedure [dbo].[FindByCharacterID]    Script Date: 9/9/2019 8:48:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[FindByCharacterID]
@CharacterID int
as
begin
select CharacterID, Characters.UserID, CharacterName, Characters.ClassID, Characters.RaceID, StrengthScore, DexterityScore, ConstitutionScore, IntelligenceScore, WisdomScore, CharismaScore, UserName, ClassName, RaceName  
from Characters
inner join Users on Users.UserID = Characters.UserID
inner join Classes on Classes.ClassID = Characters.ClassID
inner join Races on Races.RaceID = Characters.RaceID
where CharacterID = @CharacterID
end
GO
/****** Object:  StoredProcedure [dbo].[FindClassByClassID]    Script Date: 9/9/2019 8:48:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[FindClassByClassID]
@ClassID int
as
begin
SELECT ClassID, ClassName, Description, ClassModifier 
	from Classes
	where ClassID = @ClassID
	end
GO
/****** Object:  StoredProcedure [dbo].[FindClassModifierByClassModifierID]    Script Date: 9/9/2019 8:48:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[FindClassModifierByClassModifierID]
@ClassModifierID int
as
begin
SELECT ClassModifierID, ClassModifiers.ClassID, StatID, Modifier, ClassName
	from ClassModifiers
	inner join Classes on Classes.ClassModifier = ClassModifiers.ClassModifierID
	where ClassModifierID = @ClassModifierID
	end
GO
/****** Object:  StoredProcedure [dbo].[FindRaceByRaceID]    Script Date: 9/9/2019 8:48:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[FindRaceByRaceID]
@RaceID int
as
begin
SELECT RaceID, RaceName, RaceModifier 
	from Races
	where RaceID = @RaceID
	end
GO
/****** Object:  StoredProcedure [dbo].[FindRaceModifierByRaceModifierID]    Script Date: 9/9/2019 8:48:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[FindRaceModifierByRaceModifierID]
@RaceModifierID int
as
begin
SELECT RaceModifierID, RaceModifiers.RaceID, StatID, Modifier, RaceName 
	from RaceModifiers
	inner join Races on Races.RaceModifier = RaceModifiers.RaceModifierID
	where RaceModifierID = @RaceModifierID
	end
GO
/****** Object:  StoredProcedure [dbo].[FindRoleByRoleID]    Script Date: 9/9/2019 8:48:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[FindRoleByRoleID]
@RoleID int
as
begin
SELECT RoleID, RoleName
	from Roles
	where RoleID = @RoleID
	end
GO
/****** Object:  StoredProcedure [dbo].[FindUserByEmail]    Script Date: 9/9/2019 8:48:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[FindUserByEmail]
@Email nvarchar(50)
as
begin
SELECT UserID, UserName, Email, Users.RoleID, Hash, Salt, RoleName
	from Users
	inner join Roles on Roles.RoleID = Users.RoleID
	where Email = @Email
end
GO
/****** Object:  StoredProcedure [dbo].[FindUserByUserID]    Script Date: 9/9/2019 8:48:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[FindUserByUserID]
@UserID int
as
begin
SELECT UserID, UserName, Email, Users.RoleID, Hash, Salt, RoleName
	from Users
	inner join Roles on Roles.RoleID = Users.RoleID
	where UserID = @UserID 
end
GO
/****** Object:  StoredProcedure [dbo].[FindUserByUserName]    Script Date: 9/9/2019 8:48:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[FindUserByUserName]
@UserName nvarchar(20)
as
begin
SELECT UserID, UserName, Email, Users.RoleID, Hash, Salt, RoleName
	from Users
	inner join Roles on Roles.RoleID = Users.RoleID
	where UserName = @UserName
end
GO
/****** Object:  StoredProcedure [dbo].[GetCharacters]    Script Date: 9/9/2019 8:48:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jesse Guerrero
-- Create date: 07/29/19
-- Description:	Get Characters
-- =============================================
CREATE PROCEDURE [dbo].[GetCharacters] 
	-- Add the parameters for the stored procedure here
	@skip int
	,@take int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select CharacterID, Characters.UserID, CharacterName, Characters.ClassID, Characters.RaceID, StrengthScore, DexterityScore, ConstitutionScore, IntelligenceScore, WisdomScore, CharismaScore, UserName, ClassName, RaceName  
from Characters
inner join Users on Users.UserID = Characters.UserID
inner join Classes on Classes.ClassID = Characters.ClassID
inner join Races on Races.RaceID = Characters.RaceID
order by CharacterID
offset @skip rows
fetch next @take rows only
END
GO
/****** Object:  StoredProcedure [dbo].[GetCharactersRelatedToClassID]    Script Date: 9/9/2019 8:48:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetCharactersRelatedToClassID]
@ClassID int,
@skip int,
@take int
as
begin
select CharacterID, Characters.UserID, CharacterName, Characters.ClassID, Characters.RaceID, StrengthScore, DexterityScore, ConstitutionScore, IntelligenceScore, WisdomScore, CharismaScore, UserName, ClassName, RaceName  
from Characters
inner join Users on Users.UserID = Characters.UserID
inner join Classes on Classes.ClassID = Characters.ClassID
inner join Races on Races.RaceID = Characters.RaceID
where Characters.ClassID = @ClassID
order by CharacterID
offset @skip rows
fetch next @take rows only
end
GO
/****** Object:  StoredProcedure [dbo].[GetCharactersRelatedToRaceID]    Script Date: 9/9/2019 8:48:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetCharactersRelatedToRaceID]
@RaceID int,
@skip int,
@take int
as
begin
select CharacterID, Characters.UserID, CharacterName, Characters.ClassID, Characters.RaceID, StrengthScore, DexterityScore, ConstitutionScore, IntelligenceScore, WisdomScore, CharismaScore, UserName, ClassName, RaceName  
from Characters
inner join Users on Users.UserID = Characters.UserID
inner join Classes on Classes.ClassID = Characters.ClassID
inner join Races on Races.RaceID = Characters.RaceID
where Characters.RaceID = @RaceID
order by CharacterID
offset @skip rows
fetch next @take rows only
end
GO
/****** Object:  StoredProcedure [dbo].[GetCharactersRelatedToUserID]    Script Date: 9/9/2019 8:48:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetCharactersRelatedToUserID]
@UserID int,
@skip int,
@take int
as
begin
select CharacterID, Characters.UserID, CharacterName, Characters.ClassID, Characters.RaceID, StrengthScore, DexterityScore, ConstitutionScore, IntelligenceScore, WisdomScore, CharismaScore, UserName, ClassName, RaceName  
from Characters
inner join Users on Users.UserID = Characters.UserID
inner join Classes on Classes.ClassID = Characters.ClassID
inner join Races on Races.RaceID = Characters.RaceID
where Characters.UserID = @UserID
order by CharacterID
offset @skip rows
fetch next @take rows only
end
GO
/****** Object:  StoredProcedure [dbo].[GetClasses]    Script Date: 9/9/2019 8:48:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jesse Guerrero
-- Create date: 07/29/19
-- Description:	Get Classes
-- =============================================
CREATE PROCEDURE [dbo].[GetClasses]
	-- Add the parameters for the stored procedure here
	@skip int
	,@take int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT ClassID, ClassName, Description, ClassModifier 
	from Classes
	order by ClassName 
	OFFSET @skip rows 
	fetch next @take rows only;
END
GO
/****** Object:  StoredProcedure [dbo].[GetClassModifiers]    Script Date: 9/9/2019 8:48:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jesse Guerrero
-- Create date: 07/29/19
-- Description:	Get Class Modifiers
-- =============================================
CREATE PROCEDURE [dbo].[GetClassModifiers] 
	-- Add the parameters for the stored procedure here
	@skip int
	,@take int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT ClassModifierID, ClassModifiers.ClassID, StatID, Modifier, ClassName
	from ClassModifiers
	inner join Classes on Classes.ClassModifier = ClassModifiers.ClassModifierID
	order by Modifier OFFSET @skip rows fetch next @take rows only;
END
GO
/****** Object:  StoredProcedure [dbo].[GetClassModifiersRelatedToClasses]    Script Date: 9/9/2019 8:48:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetClassModifiersRelatedToClasses]
@ClassID int,
@skip int,
@take int
as
begin
SELECT ClassModifierID, ClassModifiers.ClassID, StatID, Modifier, ClassName
	from ClassModifiers
	inner join Classes on Classes.ClassModifier = ClassModifiers.ClassModifierID
	where ClassModifiers.ClassID = @ClassID
	order by ClassModifierID 
	OFFSET @skip rows 
	fetch next @take rows only;
end
GO
/****** Object:  StoredProcedure [dbo].[GetRaceModifiers]    Script Date: 9/9/2019 8:48:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jesse Guerrero
-- Create date: 07/29/19
-- Description:	Get Race Modifiers
-- =============================================
CREATE PROCEDURE [dbo].[GetRaceModifiers] 
	-- Add the parameters for the stored procedure here
	@skip int
	,@take int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT RaceModifierID, RaceModifiers.RaceID, StatID, Modifier, RaceName 
	from RaceModifiers
	inner join Races on Races.RaceModifier = RaceModifiers.RaceModifierID
	order by Modifier 
	OFFSET @skip rows 
	fetch next @take rows only;
END
GO
/****** Object:  StoredProcedure [dbo].[GetRaceModifiersRelatedToRaces]    Script Date: 9/9/2019 8:48:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetRaceModifiersRelatedToRaces]
@RaceID int,
@skip int,
@take int
as
begin
SELECT RaceModifierID, RaceModifiers.RaceID, StatID, Modifier, RaceName
	from RaceModifiers
	inner join Races on Races.RaceModifier = RaceModifiers.RaceModifierID
	where RaceModifiers.RaceID = @RaceID
	order by RaceModifierID 
	OFFSET @skip rows 
	fetch next @take rows only;
end
GO
/****** Object:  StoredProcedure [dbo].[GetRaces]    Script Date: 9/9/2019 8:48:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jesse Guerrero
-- Create date: 07/29/19
-- Description:	Get Races
-- =============================================
CREATE PROCEDURE [dbo].[GetRaces] 
	-- Add the parameters for the stored procedure here
	@skip int
	,@take int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT RaceID, RaceName, RaceModifier 
	from Races
	order by RaceName 
	OFFSET @skip rows 
	fetch next @take rows only; 
END
GO
/****** Object:  StoredProcedure [dbo].[GetRoles]    Script Date: 9/9/2019 8:48:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jesse Guerrero
-- Create date: 07/29/19
-- Description:	Get Roles
-- =============================================
CREATE PROCEDURE [dbo].[GetRoles] 
	-- Add the parameters for the stored procedure here
	 @skip int
	,@take int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select RoleID, RoleName 
	from Roles 
	order by RoleName 
	OFFSET @skip rows 
	fetch next @take rows only;
END

GO
/****** Object:  StoredProcedure [dbo].[GetUsers]    Script Date: 9/9/2019 8:48:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jesse Guerrero
-- Create date: 07/29/19
-- Description:	Get Users
-- =============================================
CREATE PROCEDURE [dbo].[GetUsers] 
	-- Add the parameters for the stored procedure here
	 @skip int
	,@take int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT UserID, UserName, Email, Users.RoleID, Hash, Salt, RoleName
	from Users
	inner join Roles on Roles.RoleID = Users.RoleID
	order by UserID 
	OFFSET @skip rows 
	fetch next @take rows only;
END
GO
/****** Object:  StoredProcedure [dbo].[GetUsersRelatedToRoles]    Script Date: 9/9/2019 8:48:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetUsersRelatedToRoles]
@RoleID int,
@skip int,
@take int
as
begin
SELECT UserID, UserName, Email, Users.RoleID, Hash, Salt, RoleName
	from Users
	inner join Roles on Roles.RoleID = Users.RoleID
	where Users.RoleID = @RoleID
	order by UserID 
	OFFSET @skip rows 
	fetch next @take rows only;
end
GO
/****** Object:  StoredProcedure [dbo].[InsertLogItem]    Script Date: 9/9/2019 8:48:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InsertLogItem]
@message nvarchar(250),
@stacktrace nvarchar(max)
as
begin
insert into LogTrace
([Message],
[StackTrace],
[TimeStamp])
values
(@message, 
@stacktrace,
GetDate())
end
GO
/****** Object:  StoredProcedure [dbo].[JustUpdateCharacter]    Script Date: 9/9/2019 8:48:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jesse Guerrero
-- Create date: 07/29/19
-- Description:	Update a Character
-- =============================================
CREATE PROCEDURE [dbo].[JustUpdateCharacter] 
	-- Add the parameters for the stored procedure here
	   @CharacterID int
	  ,@UserID int
      ,@CharacterName nvarchar(50)
      ,@ClassID int
      ,@RaceID int
      ,@StrengthScore int
      ,@DexterityScore int
      ,@ConstitutionScore int
      ,@IntelligenceScore int
      ,@WisdomScore int
      ,@CharismaScore int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update Characters set CharacterName = @CharacterName, UserID = @UserID, ClassID =@ClassID, 
	RaceID = @RaceID, StrengthScore = @StrengthScore, DexterityScore = @DexterityScore, ConstitutionScore = @ConstitutionScore,
	IntelligenceScore = @IntelligenceScore, WisdomScore = @WisdomScore, CharismaScore = @CharismaScore where @CharacterID = CharacterID
END
GO
/****** Object:  StoredProcedure [dbo].[JustUpdateClass]    Script Date: 9/9/2019 8:48:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jesse Guerrero
-- Create date: 07/29/19
-- Description:	Update a Class
-- =============================================
CREATE PROCEDURE [dbo].[JustUpdateClass] 
	-- Add the parameters for the stored procedure here
	   @ClassID int
	  ,@ClassName nvarchar(10)
      ,@Description nvarchar(250)
      ,@ClassModifier int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update Classes set ClassName = @ClassName, Description = @Description, ClassModifier = @ClassModifier where @ClassID = ClassID
END
GO
/****** Object:  StoredProcedure [dbo].[JustUpdateRace]    Script Date: 9/9/2019 8:48:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jesse Guerrero
-- Create date: 07/29/19
-- Description:	Update a Race
-- =============================================
CREATE PROCEDURE [dbo].[JustUpdateRace] 
	-- Add the parameters for the stored procedure here
	 @RaceID int
	,@RaceName nvarchar(10)
	,@RaceModifier int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update Races set RaceName = @RaceName, RaceModifier = @RaceModifier where @RaceID = RaceID
END
GO
/****** Object:  StoredProcedure [dbo].[JustUpdateRole]    Script Date: 9/9/2019 8:48:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jesse Guerrero
-- Create date: 07/29/19
-- Description:	Update a Role
-- =============================================
CREATE PROCEDURE [dbo].[JustUpdateRole] 
	-- Add the parameters for the stored procedure here
	 @RoleID int
	,@RoleName nvarchar(150)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update Roles set RoleName = @RoleName where @RoleID = RoleID
END
GO
/****** Object:  StoredProcedure [dbo].[JustUpdateUser]    Script Date: 9/9/2019 8:48:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jesse Guerrero
-- Create date: 07/29/19
-- Description:	Update a User
-- =============================================
CREATE PROCEDURE [dbo].[JustUpdateUser] 
	-- Add the parameters for the stored procedure here
	 @UserID int
	,@UserName nvarchar(20)
	,@Email nvarchar(50)
	,@RoleID int
	,@Hash nvarchar(250)
	,@Salt nvarchar(250)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update Users 
	set UserName = @UserName, Email = @Email, RoleID = @RoleID, Hash = @Hash, Salt = @Salt 
	where @UserID = UserID
END
GO
/****** Object:  StoredProcedure [dbo].[ObtainCharacterCount]    Script Date: 9/9/2019 8:48:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ObtainCharacterCount]
as
begin
select count (*) from Characters
end
GO
/****** Object:  StoredProcedure [dbo].[ObtainCharactersRelatedToUserIDCount]    Script Date: 9/9/2019 8:48:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ObtainCharactersRelatedToUserIDCount]
@UserID int
as
begin 
select count (*) from Characters
where UserID = @UserID
end
GO
/****** Object:  StoredProcedure [dbo].[ObtainClassCount]    Script Date: 9/9/2019 8:48:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ObtainClassCount]
as
begin
select count (*) from Classes
end
GO
/****** Object:  StoredProcedure [dbo].[ObtainClassModifierCount]    Script Date: 9/9/2019 8:48:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ObtainClassModifierCount]
as
begin
select count (*) from ClassModifiers
end
GO
/****** Object:  StoredProcedure [dbo].[ObtainRaceCount]    Script Date: 9/9/2019 8:48:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ObtainRaceCount]
as
begin
select count (*) from Races
end
GO
/****** Object:  StoredProcedure [dbo].[ObtainRaceModifierCount]    Script Date: 9/9/2019 8:48:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ObtainRaceModifierCount]
as
begin
select count (*) from RaceModifiers
end
GO
/****** Object:  StoredProcedure [dbo].[ObtainRoleCount]    Script Date: 9/9/2019 8:48:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ObtainRoleCount]
as
begin
select count (*) from Roles
end
GO
/****** Object:  StoredProcedure [dbo].[ObtainUserCount]    Script Date: 9/9/2019 8:48:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ObtainUserCount]
as
begin
-- for paging purposes i needed to know the total number of records
select count (*) from Users
end
GO
/****** Object:  StoredProcedure [dbo].[Reload]    Script Date: 9/9/2019 8:48:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Reload]
as
begin
--Roles
declare @aid int
declare @vid int
declare @nid int
--Users
declare @idp int
declare @idm int
declare @idt int
declare @idg int
declare @idk int
declare @idh int
--Races
declare @ridd int
declare @ride int
declare @ridg int
declare @ridhe int
declare @ridho int
declare @ridh int
--RaceModifiers
declare @rmidd int
declare @rmide int
declare @rmidg int
declare @rmidhe int
declare @rmidho int
declare @rmidh int
--Classes
declare @cidbn int
declare @cidbd int
declare @cidc int
declare @cidd int
declare @cidf int
declare @cidm int
declare @cidp int
declare @cidrr int
declare @cidrg int
declare @cids int
declare @cidwl int
declare @cidwi int
--ClassModifiers
declare @cmidbn int
declare @cmidbd int
declare @cmidc int
declare @cmidd int
declare @cmidf int
declare @cmidm int
declare @cmidp int
declare @cmidrr int
declare @cmidrg int
declare @cmids int
declare @cmidwl int
declare @cmidwi int
--Characters
declare @uida int
declare @uidb int
declare @uidc int
declare @uidd int
declare @uide int
declare @uidf int
declare @uidg int
declare @uidh int
declare @uidi int
declare @uidj int

exec CreateRole @aid output,'Admin'
exec CreateRole @vid output,'VerifiedUser'
exec CreateRole @nid output,'RegularUser'


exec CreateUser @idp output, 'Justin','Justin@aol.com',@aid,'AJZViaK4keyFU+x26H9biNs46hOXuWmYAZmGzaOlduh/O+gEiVPSth07hSLz2NQ1Sg==','54596+Q7X7HYlKd91ADJaQ=='
exec CreateUser @idm output, 'Tony Stark','TStark@live.com',@vid,'AJVuuNZK8RnbT6MLJIbcZf/7QoRVHzfJktD733vU42iSU8bFM0xWgq58q982Eo7Zxg==','VHlLEWKHuldzOl59TUPAJQ=='
exec CreateUser @idt output, 'Thor','Thor@thor.com',@vid,'ANlwF9ztHe4vPwVbOYbzNw+kX805wlN/XbgXqUACpCwwwG/uBjXQCtEc08PoC6NbhQ==','HO7gUVDpnGDfqCRCiM2dRQ=='
exec CreateUser @idg output, 'Natalia','blackwidow@blackwidow.com',@vid,'AGQA6AeXYbNE9KuOdHemAykHcsKotmOSt03vzkrxWN4Wb2RyrmlpnGorYTDKEOdoPg==','JxfEY1YzHV1NXQL2NzEPrg=='
exec CreateUser @idk output, 'MattyIce','matt@matty.com',@vid,'AKqyInjQ8XLhEAPBNHAwFMBc6w933mhKVOw1Ft1QCwu+gi12ERq381XquIIdUqCcEQ==','pavVAKUEZXcj6ERzNOauqw=='
exec CreateUser @idh output, 'Harry', 'harry@email.com', @nid, 'AMXUAViLi/ZfgztFSbhmFw5yf8Ha5veWMZrxR6nRJ+PfGpzIa2t6bwtlOkaNWjfV6Q==','34DJYP6uaKrVyiQ2gWNXsQ=='

exec CreateRace @ridd output, 'Dwarf', @rmidd
exec CreateRace @ride output, 'Elf', @rmide
exec CreateRace @ridg output, 'Gnome', @rmidg
exec CreateRace @ridhe output, 'Half-Elf', @rmidhe
exec CreateRace @ridho output, 'Half-Orc', @rmidho
exec CreateRace @ridh output, 'Human', @rmidh


exec CreateRaceModifier @rmidd output, @ridd, 6, 1
exec CreateRaceModifier @rmide output, @ride, 7, 2
exec CreateRaceModifier @rmidg output, @ridg, 7, 2
exec CreateRaceModifier @rmidhe output, @ridhe, 11, 2
exec CreateRaceModifier @rmidho output, @ridho, 6, 2
exec CreateRaceModifier @rmidh output, @ridh, 10, 2


exec JustUpdateRace @ridd, 'Dwarf', @rmidd
exec JustUpdateRace @ride , 'Elf', @rmide
exec JustUpdateRace @ridg , 'Gnome', @rmidg
exec JustUpdateRace @ridhe, 'Half-Elf', @rmidhe
exec JustUpdateRace @ridho, 'Half-Orc', @rmidho
exec JustUpdateRace @ridh, 'Human', @rmidh


exec CreateClass @cidbn output, 'Barbarian', 'A Tribal Warrior that taps into his primal rage', @cmidbn
exec CreateClass @cidbd output, 'Bard', 'A magic user that aids through song', @cmidbd
exec CreateClass @cidc output, 'Cleric', 'A healer devoted to his god', @cmidc
exec CreateClass @cidd output, 'Druid', 'A magic user that obtains power through nature', @cmidd
exec CreateClass @cidf output, 'Fighter', 'A warrior that has devoted their life to combat', @cmidf
exec CreateClass @cidm output, 'Monk', 'A warrior that is specialized in unarmed combat', @cmidm
exec CreateClass @cidp output, 'Paladin', 'A holy warrior that aids and destroys in the name of their god', @cmidp
exec CreateClass @cidrr output, 'Ranger', 'A warrior who excels in nature', @cmidrr
exec CreateClass @cidrg output, 'Rogue', 'A cut throat criminal at home in the shadows', @cmidrg
exec CreateClass @cids output, 'Sorcerer', 'A magic user with innate power', @cmids
exec CreateClass @cidwl output, 'Warlock', 'A magic user who has made a pact with a god for power', @cmidwl
exec CreateClass @cidwi output, 'Wizard', 'A magic user that devoted their life to the study of magic', @cmidwi


exec CreateClassModifier @cmidbn output, @cidbn, 6, 2
exec CreateClassModifier @cmidbd output, @cidbd, 11, 2
exec CreateClassModifier @cmidc output, @cidc, 10, 1
exec CreateClassModifier @cmidd output, @cidd, 9, 2
exec CreateClassModifier @cmidf output, @cidf, 8, 2
exec CreateClassModifier @cmidm output, @cidm, 7, 2
exec CreateClassModifier @cmidp output, @cidp, 11, 2
exec CreateClassModifier @cmidrr output, @cidrr, 7, 1
exec CreateClassModifier @cmidrg output, @cidrg, 7, 2
exec CreateClassModifier @cmids output, @cids, 10, 2
exec CreateClassModifier @cmidwl output, @cidwl, 9, 2
exec CreateClassModifier @cmidwi output, @cidwi, 11, 2


exec JustUpdateClass @cidbn , 'Barbarian', 'A Tribal Warrior that taps into his primal rage', @cmidbn
exec JustUpdateClass @cidbd , 'Bard', 'A magic user that aids through song', @cmidbd
exec JustUpdateClass @cidc, 'Cleric', 'A healer devoted to his god', @cmidc
exec JustUpdateClass @cidd, 'Druid', 'A magic user that obtains power through nature', @cmidd
exec JustUpdateClass @cidf, 'Fighter', 'A warrior that has devoted their life to combat', @cmidf
exec JustUpdateClass @cidm , 'Monk', 'A warrior that is specialized in unarmed combat', @cmidm
exec JustUpdateClass @cidp, 'Paladin', 'A holy warrior that aids and destroys in the name of their god', @cmidp
exec JustUpdateClass @cidrr, 'Ranger', 'A warrior who excels in nature', @cmidrr
exec JustUpdateClass @cidrg, 'Rogue', 'A cut throat criminal at home in the shadows', @cmidrg
exec JustUpdateClass @cids, 'Sorcerer', 'A magic user with innate power', @cmids
exec JustUpdateClass @cidwl, 'Warlock', 'A magic user who has made a pact with a god for power', @cmidwl
exec JustUpdateClass @cidwi , 'Wizard', 'A magic user that devoted their life to the study of magic', @cmidwi


exec CreateCharacter @uida output, @idp, 'Jalinar', @cidwi, @ride, 15, 15, 17, 15, 15, 18
exec CreateCharacter @uidb output, @idp, 'Tyrion', @cidbd, @ridd, 8, 15, 14, 13, 10, 14
exec CreateCharacter @uidc output, @idp, 'Ugga', @cidbn, @ridho, 22, 10, 17, 6, 9, 12
exec CreateCharacter @uidd output, @idp, 'Jerry', @cidf, @ridh, 12, 15, 13, 16, 18, 13
exec CreateCharacter @uide output, @idm, 'Iron Man', @cidp, @ridh, 12, 18, 16, 16, 18, 18
exec CreateCharacter @uidf output, @idt, 'Stormbreaker', @cidc, @ride, 18, 16, 17, 18, 15, 18
exec CreateCharacter @uidg output, @idg, 'Black Widow', @cidrg, @ridh, 8, 19, 13, 15, 12, 18
exec CreateCharacter @uidh output, @idk, 'Fabian', @cidf, @ridg, 17, 16, 11, 16, 18, 10
exec CreateCharacter @uidi output, @idh, 'Dresden', @cidwi, @ridh, 12, 16, 18, 16, 18, 10
exec CreateCharacter @uidj output, @idt, 'Phillip', @cidwl, @ridho, 20, 12, 13, 15, 10, 10
end
GO
/****** Object:  StoredProcedure [dbo].[Reset]    Script Date: 9/9/2019 8:48:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Reset]
as
begin
	delete from characters;
	delete from racemodifiers;
	delete from races;
	delete from classmodifiers;
	delete from classes;
	delete from users;
	delete from roles;

	dbcc checkident('characters',reseed,0)
	dbcc checkident('racemodifiers',reseed,0)
	dbcc checkident('races',reseed,0)
	dbcc checkident('classmodifiers',reseed,0)
	dbcc checkident('classes',reseed,0)
	dbcc checkident('users',reseed,0)
	dbcc checkident('roles',reseed,0)
	
	end
GO
USE [master]
GO
ALTER DATABASE [CharacterGenerator] SET  READ_WRITE 
GO
