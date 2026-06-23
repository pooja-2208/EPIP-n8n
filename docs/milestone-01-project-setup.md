# Milestone 01 – Project Setup

## Objective
Set up the development environment and establish Google Drive integration for the EPIP policy ingestion pipeline.

## Completed
#### n8n Installation
    Prerequisites: Node.js and npm. Installing Node.js automatically installs npm.
    1. Downloaded Node.js v22.23 LTS (Windows Installer.msi).
    2. Opened Command Prompt as Administrator.
    3. Verified the installation and installed n8n globally.
        node -v
        npm -v
        npm install -g n8n --fetch-timeout=600000 --fetch-retries=5
        n8n -v
        n8n 
    4. Created an n8n account and activated the free license.

#### Google Drive Setup
    1. Created an EPIP folder in Google Drive.
    2. Uploaded enterprise policy documents to the EPIP folder.

#### n8n Workflow Creation
    Created a new n8n workflow and added the Google Drive Trigger node (On changes involving a specific folder).

#### Google Cloud Console Configuration
    1. Google Cloud Project
        Project Name: EPIP
        Parent resource: No organisation
    2. Google Drive API.
        Selected the EPIP project.
        Searched for Google Drive API in the search bar.
        Opened Google Drive API.
        Clicked Enable.
    3. OAuth Consent Screen Configuration
        APIs & Services ----> OAuth consent screen ----> Get started
        Under Branding,
            App name: EPIP
            User support email: GOOGLE_EMAIL
            Developer contact email: GOOGLE_EMAIL
        Under Audience,
            Choose: External
        Contact information: GOOGLE_EMAIL
    4. OAuth client ID Creation
        Clients ----> Create Client
        Application Type: Web application
        Name: EPIP-n8n
        Authorized Redirect URI: GOOGLE_REDIRECT_URI
        Client ID and Client Secret are generated

#### Google Drive Trigger node Configuration
    1. Create new credential ----> OAuth 2.0 credentials for Google Drive authentication 
        Created a new Google Drive OAuth credential in n8n.
        Added the Google Cloud Client ID and Client Secret.
        Renamed the credential to Google Drive - EPIP.
        Connected Google Drive to n8n using OAuth authentication.
    2. Configured the trigger:
        Poll Times: Every minute
        Trigger On: Changes Involving a Specific Folder
        Folder: EPIP
        Watch for: File Created

## Outcome
Successfully configured the EPIP development environment and created the initial workflow to monitor newly uploaded policy documents from the Google Drive EPIP folder.
