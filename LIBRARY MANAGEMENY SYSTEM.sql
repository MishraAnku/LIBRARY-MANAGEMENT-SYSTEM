-- Create table for storing information about books
CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title NVARCHAR(100) NOT NULL,
    Author NVARCHAR(100) NOT NULL,
    ISBN NVARCHAR(20) NOT NULL,
    PublicationYear INT,
    Genre NVARCHAR(50),
    Available BIT NOT NULL DEFAULT 1
);

-- Create table for storing information about library members
CREATE TABLE Members (
    MemberID INT PRIMARY KEY,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100),
    Phone NVARCHAR(20)
);

-- Create table for storing information about book loans
CREATE TABLE Loans (
    LoanID INT PRIMARY KEY,
    BookID INT,
    MemberID INT,
    LoanDate DATE NOT NULL,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

-- Create table for storing information about library branches
CREATE TABLE Branches (
    BranchID INT PRIMARY KEY,
    BranchName NVARCHAR(100) NOT NULL,
    Location NVARCHAR(200) NOT NULL
);

-- Create table for storing information about book copies in each branch
CREATE TABLE Copies (
    CopyID INT PRIMARY KEY,
    BookID INT,
    BranchID INT,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (BranchID) REFERENCES Branches(BranchID)
);
