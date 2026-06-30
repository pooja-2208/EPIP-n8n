# Milestone 02 – Policy Ingestion

## Objective

Build an automated document ingestion pipeline that monitors Google Drive for newly uploaded policy documents, downloads the PDF files, extracts the document text, generates embeddings using Google Gemini, and stores the embeddings in a Supabase Vector Store.

## Completed
#### Download file node Configuration
    Credential: Google Drive - EPIP
    Resource: File
    Operation: Download
    File:
      By ID: {{$json.id}}

#### Extract from File node Configuration
    Operation: Extract From PDF
    Input Binary Field: data

#### Supabase Vector Store Credential Creation
    Supabase.com ---> Sign up ---> Sign in
    1. Created a New Organization
        Name: Pooja
        Type: Personal
        Plan: Free
    2. Created a New Project
        Organization: Pooja
        Project name: EPIP - n8n
        Database password: DATABASE_PASSWORD
        Region: Asia-Pacific
    3. Project Settings
        Under Data API:
            Enabled the Data API.
            Copied the generated API URL.
        Under API Keys:
            Copied the service_role secret from service_role API key.

#### Supabase Vector Store node Configuration
    1. Created a new credential
        Host: API_URL 
        Service Role Secret: SERVICE_ROLE_SECRET
        Renamed the credential to Supabase - EPIP.
        Connected Supabase to n8n using API URL & service_role secret.
    2. Table Creation in Supabase
        Opened Supabase Documentation.
            Documentation ---> Quickstart for Setting Up Your Vector Store.
        Copied the SQL script provided in the documentation.
        In Supabase:
            SQL Editor ---> Pasted the SQL script.
        Enabled the vector extension.
            Database ---> Extensions ---> Search "vector" ---> Enable.
        Modified the SQL script.
            Removed the "Enable pgvector extension" block.
            Renamed:
                documents ---> policy_documents
                dimensions ---> 3072
        Executed the SQL script to create the policy_documents table.
    
    3. Configured the node:
        Operation mode: Insert Documents
        Table Name:
            From list: policy_documents

#### Google Cloud Console
    APIs & Services ---> Gemini API ---> enable
    Documentation ---> API Keys ---> create or view API key
    Copied the Default Gemini API Key.

#### Embeddings Google Gemini node Configuration
    1. Created a new credential
        API Key: GEMINI_API
        Renamed the credential to Gemini - EPIP.
        Connected Google Gemini to n8n using the Default Gemini API Key.
    2. Configured the node:
        Model: models/gemini-embedding-001

#### Default Data Loader node Configuration
    Type of Data: JSON
    Mode: Load Specific Data
    Data: {{$json.text}}
    Text Splitting: Simple     

## Outcome
Successfully implemented the document ingestion pipeline by integrating Google Drive, Google Gemini, and Supabase. The workflow automatically downloads newly uploaded policy documents, extracts the document text, generates vector embeddings, and stores them in the `policy_documents` table within the Supabase Vector Store. This workflow forms the knowledge ingestion pipeline for the Enterprise Policy Intelligence Platform (EPIP).