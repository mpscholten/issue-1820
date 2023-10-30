CREATE TYPE post_type AS ENUM ('article', 'blog_post');
CREATE TABLE posts (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    title TEXT NOT NULL,
    post_type post_type NOT NULL
);
