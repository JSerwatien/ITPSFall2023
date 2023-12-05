CREATE DATABASE ITPS
GO
USE ITPS
GO
CREATE TABLE [dbo].[Department](
	[DepartmentKey] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentCode] [varchar](5) NOT NULL,
	[Department] [varchar](50) NOT NULL,
	[ActiveInd] [tinyint] NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[Note](
	[NoteKey] [int] IDENTITY(1,1) NOT NULL,
	[TicketKey] [int] NOT NULL,
	[Note] [varchar](100) NULL,
	[CreatedDateTime] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[LastUpdatedDateTime] [datetime] NULL,
	[LastUpdatedBy] [varchar](50) NULL,
	[ActiveInd] [tinyint] NULL,
 CONSTRAINT [PK_Note] PRIMARY KEY CLUSTERED 
(
	[NoteKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[Notification](
	[NotificationKey] [int] IDENTITY(1,1) NOT NULL,
	[NotificationTypeKey] [int] NOT NULL,
	[UserProfileKey] [int] NULL,
	[NotificationValue] [varchar](100) NOT NULL,
	[CreatedDateTime] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[LastUpdatedDateTime] [datetime] NULL,
	[LastUpdatedBy] [varchar](50) NULL,
 CONSTRAINT [PK_Notification] PRIMARY KEY CLUSTERED 
(
	[NotificationKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[NotificationActive](
	[NotificationActiveKey] [int] IDENTITY(1,1) NOT NULL,
	[UserProfileKey] [int] NOT NULL,
	[NotificationKey] [int] NOT NULL,
	[CreatedDateTime] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[LastUpdatedDateTime] [datetime] NULL,
	[LastUpdatedBy] [varchar](50) NULL,
 CONSTRAINT [PK_NotificationActive] PRIMARY KEY CLUSTERED 
(
	[NotificationActiveKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[NotificationType](
	[NotificationTypeKey] [int] IDENTITY(1,1) NOT NULL,
	[NotificationTypeCode] [varchar](5) NOT NULL,
	[Description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_NotificationType] PRIMARY KEY CLUSTERED 
(
	[NotificationTypeKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Status](
	[StatusKey] [int] IDENTITY(1,1) NOT NULL,
	[StatusCode] [varchar](5) NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[ClosedInd] [int] NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[StatusKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[StatusHistory](
	[StatusHistoryKey] [int] IDENTITY(1,1) NOT NULL,
	[TicketKey] [int] NOT NULL,
	[OldStatusKey] [int] NULL,
	[NewStatusKey] [int] NULL,
	[UpdatedBy] [varchar](30) NULL,
	[DateOfChange] [datetime] NOT NULL,
 CONSTRAINT [PK_StatusHistory] PRIMARY KEY CLUSTERED 
(
	[StatusHistoryKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Ticket](
	[TicketKey] [int] IDENTITY(1,1) NOT NULL,
	[UserProfileKey] [int] NULL,
	[AssignedToUserProfileKey] [int] NULL,
	[ShortDescription] [varchar](50) NULL,
	[LongDescription] [varchar](100) NULL,
	[Priority] [int] NULL,
	[StatusKey] [int] NULL,
	[DueDate] [datetime] NULL,
	[CreatedDateTime] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[LastUpdatedDateTime] [datetime] NULL,
	[LastUpdatedBy] [varchar](50) NULL,
 CONSTRAINT [PK_Ticket] PRIMARY KEY CLUSTERED 
(
	[TicketKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[UserProfile](
	[UserProfileKey] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[EmailAddress] [varchar](50) NOT NULL,
	[PhoneNumber] [varchar](50) NULL,
	[ActiveInd] [tinyint] NULL,
	[DepartmentKey] [int] NOT NULL,
	[ChallengeQuestion] [varchar](50) NULL,
	[ChallengeAnswer] [varchar](50) NULL,
	[CreatedDateTime] [datetime] NULL,
 CONSTRAINT [PK_UserProfile] PRIMARY KEY CLUSTERED 
(
	[UserProfileKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Department] ADD  CONSTRAINT [DF_Department_ActiveInd]  DEFAULT ((1)) FOR [ActiveInd]
GO
ALTER TABLE [dbo].[Note] ADD  DEFAULT ((1)) FOR [ActiveInd]
GO
ALTER TABLE [dbo].[UserProfile] ADD  CONSTRAINT [DF_UserProfile_ActiveInd]  DEFAULT ((1)) FOR [ActiveInd]
GO
ALTER TABLE [dbo].[UserProfile] ADD  CONSTRAINT [DF_UserProfile_CreateDateTime]  DEFAULT (getdate()) FOR [CreatedDateTime]
GO
ALTER TABLE [dbo].[Note]  WITH CHECK ADD  CONSTRAINT [FK_Note_Ticket] FOREIGN KEY([TicketKey])
REFERENCES [dbo].[Ticket] ([TicketKey])
GO
ALTER TABLE [dbo].[Note] CHECK CONSTRAINT [FK_Note_Ticket]
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD  CONSTRAINT [FK_Notification_NotificationType] FOREIGN KEY([NotificationTypeKey])
REFERENCES [dbo].[NotificationType] ([NotificationTypeKey])
GO
ALTER TABLE [dbo].[Notification] CHECK CONSTRAINT [FK_Notification_NotificationType]
GO
ALTER TABLE [dbo].[StatusHistory]  WITH CHECK ADD  CONSTRAINT [FK_StatusHistory_Ticket] FOREIGN KEY([TicketKey])
REFERENCES [dbo].[Ticket] ([TicketKey])
GO
ALTER TABLE [dbo].[StatusHistory] CHECK CONSTRAINT [FK_StatusHistory_Ticket]
GO
ALTER TABLE [dbo].[UserProfile]  WITH CHECK ADD  CONSTRAINT [FK_UserProfile_Department] FOREIGN KEY([DepartmentKey])
REFERENCES [dbo].[Department] ([DepartmentKey])
GO
ALTER TABLE [dbo].[UserProfile] CHECK CONSTRAINT [FK_UserProfile_Department]
GO

CREATE TABLE [dbo].[SurveyQuestion](
	[QuestionKey] [int] IDENTITY(1,1) NOT NULL,
	[Question] [varchar](500) NULL,
	[ActiveInd] [tinyint] NULL,
	[SortDisplay] [int] NULL,
 CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED 
(
	[QuestionKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[SurveyItem](
	[SurveyItemKey] [int] IDENTITY(1,1) NOT NULL,
	[SurveyQuestionKey] [int] NULL,
	[SurveyRating] [int] NULL,
	[Comments] [varchar](1000) NULL,
	[TicketKey] [int] NULL,
	[UserProfileKey] [int] NULL,
 CONSTRAINT [PK_TicketSurveyItem] PRIMARY KEY CLUSTERED 
(
	[SurveyItemKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SurveyItem]  WITH CHECK ADD  CONSTRAINT [FK_SurveyItem_SurveyQuestion] FOREIGN KEY([UserProfileKey])
REFERENCES [dbo].[UserProfile] ([UserProfileKey])
GO

ALTER TABLE [dbo].[SurveyItem] CHECK CONSTRAINT [FK_SurveyItem_SurveyQuestion]
GO