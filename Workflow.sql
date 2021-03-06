SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblWorkflowActions](
	[wfaID] [int] IDENTITY(1,1) NOT NULL,
	[wfaAction] [varchar](max) NOT NULL,
	[wfaDefaultParameters] [varchar](max) NULL,
	[wfaIsPublic] [bit] NOT NULL,
	[wfaIsShown] [bit] NOT NULL,
	[wfaIsActive] [bit] NOT NULL,
 CONSTRAINT [PK_tblWorkflowActions] PRIMARY KEY CLUSTERED 
(
	[wfaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblWorkflowMasterOwners](
	[wmoID] [int] IDENTITY(1,1) NOT NULL,
	[wmoWorkflowMasterID] [int] NOT NULL,
	[wmoWorkflowUserID] [int] NOT NULL,
 CONSTRAINT [PK_tblWorkflowMasterOwners] PRIMARY KEY CLUSTERED 
(
	[wmoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblWorkflowMasters](
	[wfmID] [int] IDENTITY(1,1) NOT NULL,
	[wfmName] [nvarchar](255) NULL,
	[wfmDescription] [nvarchar](max) NULL,
	[wfmCreatedByID] [int] NOT NULL,
	[wfmCreatedByDate] [date] NOT NULL,
	[wfmCreatedByDateTime] [datetime] NOT NULL,
	[wfmIsPublic] [bit] NOT NULL,
	[wfmIsShown] [bit] NOT NULL,
	[wfmIsActive] [bit] NOT NULL,
	[wfmWorkerTemplateSubjectLine] [nvarchar](2000) NULL,
	[wfmWorkerTemplateMessage] [nvarchar](max) NULL,
	[wfmWorkerTemplateCCWorkflowUserID] [int] NULL,
 CONSTRAINT [PK_tblWorkflowMasters] PRIMARY KEY CLUSTERED 
(
	[wfmID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblWorkflowStepActions](
	[wsaID] [int] IDENTITY(1,1) NOT NULL,
	[wsaWorkflowStepID] [int] NOT NULL,
	[wsaWorkflowActionID] [int] NOT NULL,
	[wsaParameters] [varchar](max) NULL,
 CONSTRAINT [PK_tblWorkflowStepActions] PRIMARY KEY CLUSTERED 
(
	[wsaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblWorkflowStepActionsTemplates](
	[satID] [int] IDENTITY(1,1) NOT NULL,
	[satWorkflowStepTemplateID] [int] NOT NULL,
	[satWorkflowActionID] [int] NOT NULL,
	[satParameters] [varchar](max) NULL,
 CONSTRAINT [PK_tblWorkflowStepActionsTemplates] PRIMARY KEY CLUSTERED 
(
	[satID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblWorkflowStepErrors](
	[wseID] [int] IDENTITY(1,1) NOT NULL,
	[wseWorkflowStepID] [int] NOT NULL,
	[wseDate] [date] NOT NULL,
	[wseDateTime] [datetime] NULL,
	[wseErrorMessage] [varchar](max) NULL,
	[wseOther] [varchar](max) NULL,
 CONSTRAINT [PK_tblWorkflowStepErrors] PRIMARY KEY CLUSTERED 
(
	[wseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblWorkflowStepResults](
	[wsrID] [int] IDENTITY(1,1) NOT NULL,
	[wsrName] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_tblWorkflowStepResults] PRIMARY KEY CLUSTERED 
(
	[wsrID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblWorkflowSteps](
	[wfsID] [int] IDENTITY(1,1) NOT NULL,
	[wfsWorkflowWorkerID] [int] NOT NULL,
	[wfsName] [nvarchar](255) NULL,
	[wfsDescription] [nvarchar](1000) NULL,
	[wfsExpiresInDays] [int] NOT NULL,
	[wfsExpiresInHours] [int] NOT NULL,
	[wfsExpiresInMinutes] [int] NOT NULL,
	[wfsFriendlyReminderDays] [int] NOT NULL,
	[wfsFriendlyReminderHours] [int] NOT NULL,
	[wfsFriendlyReminderMinutes] [int] NOT NULL,
	[wfsWillExpire] [bit] NOT NULL,
	[wfsBecameActiveDate] [date] NULL,
	[wfsBecameActiveDateTime] [datetime] NULL,
	[wfsFriendlyReminderDateTime] [datetime] NULL,
	[wfsDueDate] [date] NULL,
	[wfsDueDateTime] [datetime] NULL,
	[wfsCompletedDate] [date] NULL,
	[wfsCompletedDateTime] [datetime] NULL,
	[wfsIsCompleted] [bit] NOT NULL,
	[wfsIsFinalStep] [bit] NOT NULL,
	[wfsStepNumber] [int] NOT NULL,
	[wfsIsActiveStep] [bit] NOT NULL,
	[wfsOwnerWorkflowUserID] [int] NULL,
	[wfsWorkflowStepTypeID] [int] NOT NULL,
	[wfsWorkflowStepResultID] [int] NOT NULL,
 CONSTRAINT [PK_tblWorkflowSteps] PRIMARY KEY CLUSTERED 
(
	[wfsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblWorkflowStepsTemplates](
	[wstID] [int] IDENTITY(1,1) NOT NULL,
	[wstWorkflowWorkerID] [int] NOT NULL,
	[wstName] [nvarchar](255) NULL,
	[wstDescription] [nvarchar](1000) NULL,
	[wstExpiresInDays] [int] NOT NULL,
	[wstExpiresInHours] [int] NOT NULL,
	[wstExpiresInMinutes] [int] NOT NULL,
	[wstFriendlyReminderDays] [int] NOT NULL,
	[wstFriendlyReminderHours] [int] NOT NULL,
	[wstFriendlyReminderMinutes] [int] NOT NULL,
	[wstWillExpire] [bit] NOT NULL,
	[wstIsFinalStep] [bit] NOT NULL,
	[wstStepNumber] [int] NOT NULL,
	[wstOwnerWorkflowUserID] [int] NULL,
	[wstWorkflowStepTypeID] [int] NOT NULL,
 CONSTRAINT [PK_tblWorkflowStepsTemplates] PRIMARY KEY CLUSTERED 
(
	[wstID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblWorkflowStepTypes](
	[wstID] [int] IDENTITY(1,1) NOT NULL,
	[wstName] [nvarchar](255) NULL,
 CONSTRAINT [PK_tblWorkflowStepTypes] PRIMARY KEY CLUSTERED 
(
	[wstID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblWorkflowUsers](
	[wfuID] [int] IDENTITY(1,1) NOT NULL,
	[wfuFirstName] [nvarchar](255) NOT NULL,
	[wfuLastName] [nvarchar](255) NULL,
	[wfuEmailAddress] [varchar](255) NOT NULL,
	[wfuSSO] [varchar](10) NULL,
 CONSTRAINT [PK_tblWorkflowUsers] PRIMARY KEY CLUSTERED 
(
	[wfuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblWorkflowWorkerComments](
	[wwcID] [int] IDENTITY(1,1) NOT NULL,
	[wwcWorkflowWorkerID] [int] NOT NULL,
	[wwcComments] [nvarchar](max) NOT NULL,
	[wwcCreatedByID] [int] NOT NULL,
	[wwcCreatedDate] [date] NOT NULL,
	[wwcCreatedDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_tblWorkflowWorkerComments] PRIMARY KEY CLUSTERED 
(
	[wwcID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblWorkflowWorkerDeliverables](
	[wwdID] [int] IDENTITY(1,1) NOT NULL,
	[wwdWorkflowWorkerID] [int] NOT NULL,
	[wwdFileDownloadID] [int] NOT NULL,
	[wwdCreatedByID] [int] NOT NULL,
	[wwdCreatedDate] [date] NOT NULL,
	[wwdCreatedDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_tblWorkflowWorkerDeliverables] PRIMARY KEY CLUSTERED 
(
	[wwdID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblWorkflowWorkers](
	[wfwID] [int] IDENTITY(1,1) NOT NULL,
	[wfwWorkflowMasterID] [int] NOT NULL,
	[wfwWorkflowStatusID] [int] NOT NULL,
	[wfwCreatedByID] [int] NOT NULL,
	[wfwCreatedDate] [date] NULL,
	[wfwCreatedDateTime] [datetime] NULL,
	[wfwActiveWorkflowStepID] [int] NULL,
	[wfwCompletionDate] [date] NULL,
	[wfwCompletionDateTime] [datetime] NULL,
	[wfwSubjectline] [nvarchar](255) NULL,
	[wfwMessage] [nvarchar](max) NULL,
	[wfwCCWorkflowUsersID] [int] NULL,
 CONSTRAINT [PK_tblWorkflowWorkers] PRIMARY KEY CLUSTERED 
(
	[wfwID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblWorkflowWorkerStatus](
	[wwsID] [int] IDENTITY(1,1) NOT NULL,
	[wwsName] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_tblWorkflowWorkerStatus] PRIMARY KEY CLUSTERED 
(
	[wwsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[tblWorkflowStepResults] ON 

GO
INSERT [dbo].[tblWorkflowStepResults] ([wsrID], [wsrName]) VALUES (1, N'Approved')
GO
INSERT [dbo].[tblWorkflowStepResults] ([wsrID], [wsrName]) VALUES (2, N'Not Approved')
GO
INSERT [dbo].[tblWorkflowStepResults] ([wsrID], [wsrName]) VALUES (3, N'Open')
GO
INSERT [dbo].[tblWorkflowStepResults] ([wsrID], [wsrName]) VALUES (4, N'Executed')
GO
SET IDENTITY_INSERT [dbo].[tblWorkflowStepResults] OFF
GO
SET IDENTITY_INSERT [dbo].[tblWorkflowStepTypes] ON 

GO
INSERT [dbo].[tblWorkflowStepTypes] ([wstID], [wstName]) VALUES (1, N'Code')
GO
INSERT [dbo].[tblWorkflowStepTypes] ([wstID], [wstName]) VALUES (2, N'ApprovalSingle')
GO
INSERT [dbo].[tblWorkflowStepTypes] ([wstID], [wstName]) VALUES (3, N'ApprovalAny')
GO
INSERT [dbo].[tblWorkflowStepTypes] ([wstID], [wstName]) VALUES (4, N'ApprovalAll')
GO
SET IDENTITY_INSERT [dbo].[tblWorkflowStepTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[tblWorkflowWorkerStatus] ON 

GO
INSERT [dbo].[tblWorkflowWorkerStatus] ([wwsID], [wwsName]) VALUES (1, N'Open')
GO
INSERT [dbo].[tblWorkflowWorkerStatus] ([wwsID], [wwsName]) VALUES (2, N'Completed')
GO
INSERT [dbo].[tblWorkflowWorkerStatus] ([wwsID], [wwsName]) VALUES (3, N'Deleted')
GO
SET IDENTITY_INSERT [dbo].[tblWorkflowWorkerStatus] OFF
GO
ALTER TABLE [dbo].[tblWorkflowMasters] ADD  DEFAULT (getdate()) FOR [wfmCreatedByDate]
GO
ALTER TABLE [dbo].[tblWorkflowMasters] ADD  DEFAULT (getdate()) FOR [wfmCreatedByDateTime]
GO
ALTER TABLE [dbo].[tblWorkflowMasters] ADD  DEFAULT ((0)) FOR [wfmIsPublic]
GO
ALTER TABLE [dbo].[tblWorkflowMasters] ADD  DEFAULT ((0)) FOR [wfmIsShown]
GO
ALTER TABLE [dbo].[tblWorkflowMasters] ADD  DEFAULT ((0)) FOR [wfmIsActive]
GO
ALTER TABLE [dbo].[tblWorkflowStepErrors] ADD  DEFAULT (getdate()) FOR [wseDate]
GO
ALTER TABLE [dbo].[tblWorkflowStepErrors] ADD  DEFAULT (getdate()) FOR [wseDateTime]
GO
ALTER TABLE [dbo].[tblWorkflowSteps] ADD  DEFAULT ((0)) FOR [wfsExpiresInDays]
GO
ALTER TABLE [dbo].[tblWorkflowSteps] ADD  DEFAULT ((0)) FOR [wfsExpiresInHours]
GO
ALTER TABLE [dbo].[tblWorkflowSteps] ADD  DEFAULT ((0)) FOR [wfsExpiresInMinutes]
GO
ALTER TABLE [dbo].[tblWorkflowSteps] ADD  DEFAULT ((0)) FOR [wfsFriendlyReminderDays]
GO
ALTER TABLE [dbo].[tblWorkflowSteps] ADD  DEFAULT ((0)) FOR [wfsFriendlyReminderHours]
GO
ALTER TABLE [dbo].[tblWorkflowSteps] ADD  DEFAULT ((0)) FOR [wfsFriendlyReminderMinutes]
GO
ALTER TABLE [dbo].[tblWorkflowSteps] ADD  DEFAULT ((0)) FOR [wfsWillExpire]
GO
ALTER TABLE [dbo].[tblWorkflowSteps] ADD  DEFAULT ((0)) FOR [wfsIsCompleted]
GO
ALTER TABLE [dbo].[tblWorkflowSteps] ADD  DEFAULT ((0)) FOR [wfsIsFinalStep]
GO
ALTER TABLE [dbo].[tblWorkflowSteps] ADD  DEFAULT ((0)) FOR [wfsIsActiveStep]
GO
ALTER TABLE [dbo].[tblWorkflowStepsTemplates] ADD  DEFAULT ((0)) FOR [wstExpiresInDays]
GO
ALTER TABLE [dbo].[tblWorkflowStepsTemplates] ADD  DEFAULT ((0)) FOR [wstExpiresInHours]
GO
ALTER TABLE [dbo].[tblWorkflowStepsTemplates] ADD  DEFAULT ((0)) FOR [wstExpiresInMinutes]
GO
ALTER TABLE [dbo].[tblWorkflowStepsTemplates] ADD  DEFAULT ((0)) FOR [wstFriendlyReminderDays]
GO
ALTER TABLE [dbo].[tblWorkflowStepsTemplates] ADD  DEFAULT ((0)) FOR [wstFriendlyReminderHours]
GO
ALTER TABLE [dbo].[tblWorkflowStepsTemplates] ADD  DEFAULT ((0)) FOR [wstFriendlyReminderMinutes]
GO
ALTER TABLE [dbo].[tblWorkflowStepsTemplates] ADD  DEFAULT ((0)) FOR [wstWillExpire]
GO
ALTER TABLE [dbo].[tblWorkflowStepsTemplates] ADD  DEFAULT ((0)) FOR [wstIsFinalStep]
GO
ALTER TABLE [dbo].[tblWorkflowWorkerComments] ADD  DEFAULT (getdate()) FOR [wwcCreatedDate]
GO
ALTER TABLE [dbo].[tblWorkflowWorkerComments] ADD  DEFAULT (getdate()) FOR [wwcCreatedDateTime]
GO
ALTER TABLE [dbo].[tblWorkflowWorkerDeliverables] ADD  DEFAULT (getdate()) FOR [wwdCreatedDate]
GO
ALTER TABLE [dbo].[tblWorkflowWorkerDeliverables] ADD  DEFAULT (getdate()) FOR [wwdCreatedDateTime]
GO
ALTER TABLE [dbo].[tblWorkflowWorkers] ADD  DEFAULT (getdate()) FOR [wfwCreatedDate]
GO
ALTER TABLE [dbo].[tblWorkflowWorkers] ADD  DEFAULT (getdate()) FOR [wfwCreatedDateTime]
GO
ALTER TABLE [dbo].[tblWorkflowMasterOwners]  WITH CHECK ADD  CONSTRAINT [FK_tblWorkflowMasterOwners_wmoWorkflowMasterID] FOREIGN KEY([wmoWorkflowMasterID])
REFERENCES [dbo].[tblWorkflowMasters] ([wfmID])
GO
ALTER TABLE [dbo].[tblWorkflowMasterOwners] CHECK CONSTRAINT [FK_tblWorkflowMasterOwners_wmoWorkflowMasterID]
GO
ALTER TABLE [dbo].[tblWorkflowMasterOwners]  WITH CHECK ADD  CONSTRAINT [FK_tblWorkflowMasterOwners_wmoWorkflowUserID] FOREIGN KEY([wmoWorkflowUserID])
REFERENCES [dbo].[tblWorkflowUsers] ([wfuID])
GO
ALTER TABLE [dbo].[tblWorkflowMasterOwners] CHECK CONSTRAINT [FK_tblWorkflowMasterOwners_wmoWorkflowUserID]
GO
ALTER TABLE [dbo].[tblWorkflowMasters]  WITH CHECK ADD  CONSTRAINT [FK_tblWorkflowMasters_wfmCreatedByID] FOREIGN KEY([wfmCreatedByID])
REFERENCES [dbo].[tblWorkflowUsers] ([wfuID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblWorkflowMasters] CHECK CONSTRAINT [FK_tblWorkflowMasters_wfmCreatedByID]
GO
ALTER TABLE [dbo].[tblWorkflowStepActions]  WITH CHECK ADD  CONSTRAINT [FK_tblWorkflowStepActions_wsaWorkflowActionID] FOREIGN KEY([wsaWorkflowActionID])
REFERENCES [dbo].[tblWorkflowActions] ([wfaID])
GO
ALTER TABLE [dbo].[tblWorkflowStepActions] CHECK CONSTRAINT [FK_tblWorkflowStepActions_wsaWorkflowActionID]
GO
ALTER TABLE [dbo].[tblWorkflowStepActions]  WITH CHECK ADD  CONSTRAINT [FK_tblWorkflowStepActions_wsaWorkflowStepID] FOREIGN KEY([wsaWorkflowStepID])
REFERENCES [dbo].[tblWorkflowSteps] ([wfsID])
GO
ALTER TABLE [dbo].[tblWorkflowStepActions] CHECK CONSTRAINT [FK_tblWorkflowStepActions_wsaWorkflowStepID]
GO
ALTER TABLE [dbo].[tblWorkflowStepActionsTemplates]  WITH CHECK ADD  CONSTRAINT [FK_tblWorkflowStepActionsTemplates_satWorkflowActionID] FOREIGN KEY([satWorkflowActionID])
REFERENCES [dbo].[tblWorkflowActions] ([wfaID])
GO
ALTER TABLE [dbo].[tblWorkflowStepActionsTemplates] CHECK CONSTRAINT [FK_tblWorkflowStepActionsTemplates_satWorkflowActionID]
GO
ALTER TABLE [dbo].[tblWorkflowStepActionsTemplates]  WITH CHECK ADD  CONSTRAINT [FK_tblWorkflowStepActionsTemplates_satWorkflowStepTemplateID] FOREIGN KEY([satWorkflowStepTemplateID])
REFERENCES [dbo].[tblWorkflowStepsTemplates] ([wstID])
GO
ALTER TABLE [dbo].[tblWorkflowStepActionsTemplates] CHECK CONSTRAINT [FK_tblWorkflowStepActionsTemplates_satWorkflowStepTemplateID]
GO
ALTER TABLE [dbo].[tblWorkflowStepErrors]  WITH CHECK ADD  CONSTRAINT [FK_tblWorkflowStepErrors_wseWorkflowStepID] FOREIGN KEY([wseWorkflowStepID])
REFERENCES [dbo].[tblWorkflowSteps] ([wfsID])
GO
ALTER TABLE [dbo].[tblWorkflowStepErrors] CHECK CONSTRAINT [FK_tblWorkflowStepErrors_wseWorkflowStepID]
GO
ALTER TABLE [dbo].[tblWorkflowSteps]  WITH CHECK ADD  CONSTRAINT [FK_tblWorkflowSteps_wfsOwnerWorkflowUserID] FOREIGN KEY([wfsOwnerWorkflowUserID])
REFERENCES [dbo].[tblWorkflowUsers] ([wfuID])
GO
ALTER TABLE [dbo].[tblWorkflowSteps] CHECK CONSTRAINT [FK_tblWorkflowSteps_wfsOwnerWorkflowUserID]
GO
ALTER TABLE [dbo].[tblWorkflowSteps]  WITH CHECK ADD  CONSTRAINT [FK_tblWorkflowSteps_wfsWorkflowStepResultID] FOREIGN KEY([wfsWorkflowStepResultID])
REFERENCES [dbo].[tblWorkflowStepResults] ([wsrID])
GO
ALTER TABLE [dbo].[tblWorkflowSteps] CHECK CONSTRAINT [FK_tblWorkflowSteps_wfsWorkflowStepResultID]
GO
ALTER TABLE [dbo].[tblWorkflowSteps]  WITH CHECK ADD  CONSTRAINT [FK_tblWorkflowSteps_wfsWorkflowStepTypeID] FOREIGN KEY([wfsWorkflowStepTypeID])
REFERENCES [dbo].[tblWorkflowStepTypes] ([wstID])
GO
ALTER TABLE [dbo].[tblWorkflowSteps] CHECK CONSTRAINT [FK_tblWorkflowSteps_wfsWorkflowStepTypeID]
GO
ALTER TABLE [dbo].[tblWorkflowSteps]  WITH CHECK ADD  CONSTRAINT [FK_tblWorkflowSteps_wfsWorkflowWorkerID] FOREIGN KEY([wfsWorkflowWorkerID])
REFERENCES [dbo].[tblWorkflowWorkers] ([wfwID])
GO
ALTER TABLE [dbo].[tblWorkflowSteps] CHECK CONSTRAINT [FK_tblWorkflowSteps_wfsWorkflowWorkerID]
GO
ALTER TABLE [dbo].[tblWorkflowStepsTemplates]  WITH CHECK ADD  CONSTRAINT [FK_tblWorkflowStepsTemplates_wstOwnerWorkflowUserID] FOREIGN KEY([wstOwnerWorkflowUserID])
REFERENCES [dbo].[tblWorkflowUsers] ([wfuID])
GO
ALTER TABLE [dbo].[tblWorkflowStepsTemplates] CHECK CONSTRAINT [FK_tblWorkflowStepsTemplates_wstOwnerWorkflowUserID]
GO
ALTER TABLE [dbo].[tblWorkflowStepsTemplates]  WITH CHECK ADD  CONSTRAINT [FK_tblWorkflowStepsTemplates_wstWorkflowStepTypeID] FOREIGN KEY([wstWorkflowStepTypeID])
REFERENCES [dbo].[tblWorkflowStepTypes] ([wstID])
GO
ALTER TABLE [dbo].[tblWorkflowStepsTemplates] CHECK CONSTRAINT [FK_tblWorkflowStepsTemplates_wstWorkflowStepTypeID]
GO
ALTER TABLE [dbo].[tblWorkflowStepsTemplates]  WITH CHECK ADD  CONSTRAINT [FK_tblWorkflowStepsTemplates_wstWorkflowWorkerID] FOREIGN KEY([wstWorkflowWorkerID])
REFERENCES [dbo].[tblWorkflowWorkers] ([wfwID])
GO
ALTER TABLE [dbo].[tblWorkflowStepsTemplates] CHECK CONSTRAINT [FK_tblWorkflowStepsTemplates_wstWorkflowWorkerID]
GO
ALTER TABLE [dbo].[tblWorkflowWorkerComments]  WITH CHECK ADD  CONSTRAINT [FK_tblWorkflowWorkerComments_wwcCreatedByID] FOREIGN KEY([wwcCreatedByID])
REFERENCES [dbo].[tblWorkflowUsers] ([wfuID])
GO
ALTER TABLE [dbo].[tblWorkflowWorkerComments] CHECK CONSTRAINT [FK_tblWorkflowWorkerComments_wwcCreatedByID]
GO
ALTER TABLE [dbo].[tblWorkflowWorkerComments]  WITH CHECK ADD  CONSTRAINT [FK_tblWorkflowWorkerComments_wwcWorkflowWorkerID] FOREIGN KEY([wwcWorkflowWorkerID])
REFERENCES [dbo].[tblWorkflowWorkers] ([wfwID])
GO
ALTER TABLE [dbo].[tblWorkflowWorkerComments] CHECK CONSTRAINT [FK_tblWorkflowWorkerComments_wwcWorkflowWorkerID]
GO
ALTER TABLE [dbo].[tblWorkflowWorkerDeliverables]  WITH CHECK ADD  CONSTRAINT [FK_tblWorkflowWorkerDeliverables_wwdCreatedByID] FOREIGN KEY([wwdCreatedByID])
REFERENCES [dbo].[tblWorkflowUsers] ([wfuID])
GO
ALTER TABLE [dbo].[tblWorkflowWorkerDeliverables] CHECK CONSTRAINT [FK_tblWorkflowWorkerDeliverables_wwdCreatedByID]
GO
ALTER TABLE [dbo].[tblWorkflowWorkerDeliverables]  WITH CHECK ADD  CONSTRAINT [FK_tblWorkflowWorkerDeliverables_wwdFileDownloadID] FOREIGN KEY([wwdFileDownloadID])
REFERENCES [dbo].[tblSys_FileDownload] ([fdlFileDownloadID])
GO
ALTER TABLE [dbo].[tblWorkflowWorkerDeliverables] CHECK CONSTRAINT [FK_tblWorkflowWorkerDeliverables_wwdFileDownloadID]
GO
ALTER TABLE [dbo].[tblWorkflowWorkerDeliverables]  WITH CHECK ADD  CONSTRAINT [FK_tblWorkflowWorkerDeliverables_wwdWorkflowWorkerID] FOREIGN KEY([wwdWorkflowWorkerID])
REFERENCES [dbo].[tblWorkflowWorkers] ([wfwID])
GO
ALTER TABLE [dbo].[tblWorkflowWorkerDeliverables] CHECK CONSTRAINT [FK_tblWorkflowWorkerDeliverables_wwdWorkflowWorkerID]
GO
ALTER TABLE [dbo].[tblWorkflowWorkers]  WITH CHECK ADD  CONSTRAINT [FK_tblWorkflowWorkers_wfwActiveWorkflowStepID] FOREIGN KEY([wfwActiveWorkflowStepID])
REFERENCES [dbo].[tblWorkflowSteps] ([wfsID])
GO
ALTER TABLE [dbo].[tblWorkflowWorkers] CHECK CONSTRAINT [FK_tblWorkflowWorkers_wfwActiveWorkflowStepID]
GO
ALTER TABLE [dbo].[tblWorkflowWorkers]  WITH CHECK ADD  CONSTRAINT [FK_tblWorkflowWorkers_wfwCCWorkflowUsersID] FOREIGN KEY([wfwCCWorkflowUsersID])
REFERENCES [dbo].[tblWorkflowUsers] ([wfuID])
GO
ALTER TABLE [dbo].[tblWorkflowWorkers] CHECK CONSTRAINT [FK_tblWorkflowWorkers_wfwCCWorkflowUsersID]
GO
ALTER TABLE [dbo].[tblWorkflowWorkers]  WITH CHECK ADD  CONSTRAINT [FK_tblWorkflowWorkers_wfwCreatedByID] FOREIGN KEY([wfwCreatedByID])
REFERENCES [dbo].[tblWorkflowUsers] ([wfuID])
GO
ALTER TABLE [dbo].[tblWorkflowWorkers] CHECK CONSTRAINT [FK_tblWorkflowWorkers_wfwCreatedByID]
GO
ALTER TABLE [dbo].[tblWorkflowWorkers]  WITH CHECK ADD  CONSTRAINT [FK_tblWorkflowWorkers_wfwWorkflowMasterID] FOREIGN KEY([wfwWorkflowMasterID])
REFERENCES [dbo].[tblWorkflowMasters] ([wfmID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblWorkflowWorkers] CHECK CONSTRAINT [FK_tblWorkflowWorkers_wfwWorkflowMasterID]
GO
ALTER TABLE [dbo].[tblWorkflowWorkers]  WITH CHECK ADD  CONSTRAINT [FK_tblWorkflowWorkers_wfwWorkflowStatusID] FOREIGN KEY([wfwWorkflowStatusID])
REFERENCES [dbo].[tblWorkflowWorkerStatus] ([wwsID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblWorkflowWorkers] CHECK CONSTRAINT [FK_tblWorkflowWorkers_wfwWorkflowStatusID]
GO
