create table tools(
  name varchar(80) NOT NULL primary key,
  rating integer
);

create table repos(
  url varchar(80) NOT NULL primary key,
  description varchar(80)
);

create table repo_tool(
  tool varchar(80) NOT NULL references tools(name),
  repo varchar(80) NOT NULL references repos(url),
  PRIMARY KEY (tool, repo)
);

-- let's document plz

COMMENT ON TABLE tools IS 'Our might tools for DevOps magic and mayhem.';
COMMENT ON COLUMN tools.rating IS 'Rating. Or null if the tool has not been evaluated yet.';
COMMENT ON COLUMN tools.name IS 'Primary key, the canonical name of the tool.';

COMMENT ON TABLE repos IS 'Source code repositories of the most awesome projects.';
COMMENT ON COLUMN repos.url IS 'Primary key, the git URL for the repository.';

-- Mr. Data, make it so

insert into tools(name, rating) values
  ('Travis CI', 2),
  ('Concource CI', null),
  ('Jenkins', 3),
  ('Drone.IO', null),
  ('Heroku pipelines', null),
  ('Bamboo', 1),
  ('Codeship', null),
  ('Go', 2),
  ('Circle CI', null),
  ('Solita CD Jenkins the Ultimate', 6510);
  
