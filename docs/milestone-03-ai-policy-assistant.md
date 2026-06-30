# Milestone 03 – AI Policy Assistant (Retrieval)

## Objective
Build an AI-powered policy assistant that accepts user queries through a chat interface, retrieves the most relevant policy document chunks from the Supabase Vector Store using semantic search, maintains conversation history with PostgreSQL, and generates context-aware responses using the Google Gemini Chat Model.

## Completed
#### Chat trigger node
    Mode: On new Chat event

#### AI Agent node Configuration
    Source for Prompt (User Message): Connected Chat Trigger Node
    Prompt (User Message): {{$json.chatInput}}

#### Google Gemini Chat Model Configuration
    Credential: Gemini - EPIP
    Model: models/gemini-2.5-flash

#### Postgres Chat Memory Configuration
    1. Created a new credential
        In Supabase:
            EPIP - n8n Project ---> Connect ---> Direct Connection string ---> Transaction Pooler
        Copied host, port, database, and user
        Entered the Database Password and connected PostgreSQL to n8n.
        Renamed the credential to Postgres - EPIP.
    2. Configured the node:
        Session ID: Connected Chat Trigger Node
        Session Key From Previous Node: {{$json.sessionId}}
        Table Name: n8n_chat_histories
        Context Window Length: 500

#### Supabase Vector Store Retriever Configuration
    Credential: Supabase - EPIP
    Operation Mode: Retrieve Documents (As Tool for AI Agent)
    Table Name: 
        From list: policy_documents
    Limit: 4
    Include Metadata: Enabled

#### Google Gemini Embeddings Configuration
    Credential: Gemini - EPIP
    Model: models/gemini-embedding-001

#### Issue Encountered & Resolution
    Issue
        AI Agent returned:
            Expected object, received string
    Resolution
        Upgraded n8n to the latest version.

## Outcome
Successfully developed a Retrieval-Augmented Generation (RAG) solution that enables users to interact with enterprise policy documents through natural language conversations. The system delivers relevant responses by combining semantic search, conversational memory, and Google Gemini-powered response generation.