CREATE TABLE docs (line STRING)
LOAD DATA INPATH '/root/user/doc' OVERWRITE INTO TABLE docs;
CREATE TABLE word_couts as
SELECT word, count(word) AS count FROM
        (SELECT EXPLODE(SPLIT(LINE, '\s')) AS word FROM docs) w
GROUP BY word

ORDER BY word;

