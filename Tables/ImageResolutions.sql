CREATE TABLE ImageResolutions
(
	Id BIGINT IDENTITY(1,1) NOT NULL,
	[Guid] UNIQUEIDENTIFIER NOT NULL DEFAULT(NEWID()),
	[Name] NVARCHAR(25) NOT NULL,

	CreatedBy BIGINT NOT NULL,
	CreatedOn DATETIME2(0) NOT NULL,
	ModifiedBy BIGINT NULL,
	ModifiedOn DATETIME2(0) NULL,

	IsTest BIT NOT NULL DEFAULT(0),

	CONSTRAINT PK_ImageResolutions PRIMARY KEY CLUSTERED (Id ASC),
	CONSTRAINT UQ_ImageResolutions_Guid UNIQUE ([Guid] ASC),
	CONSTRAINT FK_ImageResolutions_CreatedBy FOREIGN KEY(CreatedBy) REFERENCES Users (Id),
	CONSTRAINT FK_ImageResolutions_ModifiedBy FOREIGN KEY(ModifiedBy) REFERENCES Users (Id)
)