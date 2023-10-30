-- Your database schema. Use the Schema Designer at http://localhost:8001/ to add some tables.
CREATE TYPE post_type AS ENUM ('article', 'blog_post');
CREATE TABLE posts (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    title TEXT NOT NULL,
    post_type post_type NOT NULL
);
