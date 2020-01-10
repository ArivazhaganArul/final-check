-- Include table data insertion, updation, deletion and select scripts

-- -----------------------------------------------------
-- Add values in movie
-- -----------------------------------------------------

insert into movie values (1, 'Avatar', 2787965087, 'Yes','2017-03-15','Science Fiction', 'Yes'),
(2, 'The Avengers', 1518812988, 'Yes', '2017-12-23','Superhero','No'),
(3, 'Titanic', 2187463944, 'Yes','2017-08-21', 'Romance','No'),
(4, 'Jurassic World', 1671713208,'No', '2017-07-02','Science Fiction','Yes'),
(5, 'Avengers: End Game', 2750760348,'Yes','2022-11-02','Superhero','Yes');

-- -----------------------------------------------------
-- View Movie
-- -----------------------------------------------------

select *from movie;

-- -----------------------------------------------------
-- update movie
-- -----------------------------------------------------

update movie set m_title = 'Darbar' where m_id = 1;

-- -----------------------------------------------------
-- Insert Values in user
-- -----------------------------------------------------

insert into user (us_name) values ('Tony'),('Stark');

-- -----------------------------------------------------
-- View user
-- -----------------------------------------------------
select *from user;

-- --------------------------------------------------------------------------
-- favorites list
-- --------------------------------------------------------------------------

select m_title, m_hasTeaser, m_boxOffice, m_genre from movie
where m_active ='yes' and m_date_of_launch <= (select(curdate()));

-- --------------------------------------------------------------------------
-- Insert Values in favorites
-- --------------------------------------------------------------------------

insert into favorites(ft_us_id,ft_mv_id) values (1,1);
insert into favorites(ft_us_id,ft_mv_id) values (1,3);
insert into favorites(ft_us_id,ft_mv_id) values (1,3);
insert into favorites(ft_us_id,ft_mv_id) values (1,3);

-- --------------------------------------------------------------------------
-- View favorites items
-- --------------------------------------------------------------------------

select m_title,m_hasTeaser, m_boxOffice from movie
inner join favorites on ft_mv_id=m_id
where ft_us_id=1;

-- --------------------------------------------------------------------------
-- View favroites count
-- --------------------------------------------------------------------------

select count(m_title) as No_of_favorites from movie
inner join favorites on ft_mv_id=m_id
where ft_us_id=1;   

-- -----------------------------------------------------
-- view favorites
-- ------------------------------------------------------

select * from favorites;

-- -----------------------------------------------------
-- Delete Item From favorites
-- ------------------------------------------------------

delete from favorites where ft_us_id=1 and ft_id=4;

-- --------------------------------------------------------------------------
-- View favorites items after delete
-- --------------------------------------------------------------------------

select m_title,m_hasTeaser, m_boxOffice from movie
inner join favorites on ft_mv_id=m_id
where ft_us_id=1;

-- --------------------------------------------------------------------------
-- View count after delete
-- --------------------------------------------------------------------------

select count(m_title) as No_of_favorites from movie
inner join favorites on ft_mv_id=m_id
where ft_us_id=1; 

-- -----------------------------------------------------
-- Delete favorites
-- ------------------------------------------------------

delete from favorites;