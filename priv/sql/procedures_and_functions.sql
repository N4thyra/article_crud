
CREATE OR REPLACE FUNCTION get_articles(
    _id INTEGER DEFAULT NULL
)
  RETURNS SETOF article AS
$function$
    SELECT * 
    FROM article 
    WHERE (_id IS NULL OR id = _id)
$function$
LANGUAGE sql;


CREATE OR REPLACE FUNCTION insert_article(
    _title   TEXT,
    _body   TEXT
) 
RETURNS BOOLEAN 
LANGUAGE plpgsql 
SECURITY DEFINER AS $$
BEGIN
    INSERT INTO article (
    	title, 
    	body
    )
    VALUES (
    	_title,
    	_body
    );
    RETURN FOUND;
END;
$$;

CREATE OR REPLACE FUNCTION update_article(
    _id INT,
    _title   TEXT,
    _body   TEXT
) 
RETURNS BOOLEAN 
LANGUAGE plpgsql 
SECURITY DEFINER AS $$
BEGIN
    UPDATE article
    SET    title         = _title,
           body          = _body
    WHERE article.id = update_article._id;
    RETURN FOUND;
END;
$$;

CREATE OR REPLACE FUNCTION delete_article(
    _id INT
) 
RETURNS BOOLEAN 
LANGUAGE plpgsql 
SECURITY DEFINER AS $$
BEGIN
    DELETE 
    FROM article
    WHERE article.id = delete_article._id;
    RETURN FOUND;
END;
$$;