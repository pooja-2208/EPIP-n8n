-- EPIP - Supabase Vector Store Schema
-- Creates the policy_documents table and match_documents
-- function used by the AI Policy Assistant.

-- Create table
create table policy_documents (
  id bigserial primary key,
  content text,
  metadata jsonb,
  embedding extensions.vector(3072)
);

-- Create search function
create or replace function match_documents (
  query_embedding extensions.vector(3072),
  match_count int default null,
  filter jsonb default '{}'
)
returns table (
  id bigint,
  content text,
  metadata jsonb,
  similarity float
)
language plpgsql
as $$
#variable_conflict use_column
begin
  return query
  select
    id,
    content,
    metadata,
    1 - (policy_documents.embedding <=> query_embedding) as similarity
  from policy_documents
  where metadata @> filter
  order by policy_documents.embedding <=> query_embedding
  limit match_count;
end;
$$;