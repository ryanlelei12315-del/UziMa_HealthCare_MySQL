CREATE database talentroute;
USE talentroute;

CREATE TABLE opportunities (
    id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    location VARCHAR(50),
    university VARCHAR (50),
    requirements TEXT,
    application_link VARCHAR(105),
    application_deadline DATE
);
CREATE TABLE talent (
    email VARCHAR(255) PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    sports VARCHAR(255),
    dob DATE,
    phone VARCHAR (20),
    highest_achievement TEXT,
    education_level VARCHAR (50)
);

CREATE TABLE wishlist(
    id INT AUTO_INCREMENT PRIMARY KEY,
    talent_email VARCHAR(255),
    opportunity_id INT,
    status ENUM('interested', 'applied', 'accepted', 'rejected') DEFAULT 'interested',
    FOREIGN KEY (talent_email) REFERENCES talent(email),
    FOREIGN KEY (opportunity_id) REFERENCES opportunities(id)
);

CREATE TABLE referrals (
    id INT AUTO_INCREMENT PRIMARY KEY,
    talent_email VARCHAR(255),
    referee_name VARCHAR(255),
    referee_email VARCHAR(255),
    referee_phone VARCHAR(255),
    opportunity_id INT,
    relationship VARCHAR(255),
    description TEXT,
    attachment_url VARCHAR(255),
    FOREIGN KEY (talent_email) REFERENCES talent(email)
);

USE talentroute;

-- =========================================================================
-- 1. SEED DATA FOR TABLE: talent
-- =========================================================================
INSERT INTO talent (email, full_name, sports, dob, phone, highest_achievement, education_level) VALUES
('brian.omondi@gmail.com', 'Brian Omondi', 'Basketball', '2004-05-12', '+254711223344', 'MVP Kenya National Secondary School Games 2023', 'High School Graduate'),
('faith.chepngetich@yahoo.com', 'Faith Chepngetich', 'Athletics (Middle Distance)', '2005-09-20', '+254722334455', 'Gold Medalist 1500m African U20 Championships', 'High School Graduate'),
('emmanuel.kiprop@outlook.com', 'Emmanuel Kiprop', 'Athletics (Long Distance)', '2003-02-14', '+254733445566', '3rd Place Nairobi City Marathon 2024', 'Undergraduate Student'),
('mercy.anyango@gmail.com', 'Mercy Anyango', 'Volleyball', '2004-11-30', '+254744556677', 'Best Blocker KVF National League Playoffs', 'Diploma'),
('kevin.mutua@gmail.com', 'Kevin Mutua', 'Rugby Sevens', '2005-07-08', '+254755667788', 'Kenya 7s Under-20 Captain', 'High School Graduate'),
('sharon.wambui@yahoo.com', 'Sharon Wambui', 'Football', '2003-04-25', '+254766778899', 'Top Scorer Kenya Women Premier League 2024', 'Undergraduate Student'),
('david.ndwiga@gmail.com', 'David Ndwiga', 'Swimming', '2006-01-15', '+254777889900', 'National Record Holder 100m Freestyle', 'High School Graduate'),
('alice.awuor@outlook.com', 'Alice Awuor', 'Netball', '2002-08-19', '+254788990011', 'Represented Kenya in All Africa Games', 'Undergraduate Student'),
('victor.waweru@gmail.com', 'Victor Waweru', 'Tennis', '2005-12-05', '+254799001122', 'Winner ITF East Africa Junior Circuit', 'High School Graduate'),
('joyce.kosgei@yahoo.com', 'Joyce Kosgei', 'Field Hockey', '2004-03-10', '+254700112233', 'Best Midfielder KHU Women Premier League', 'Diploma');


-- =========================================================================
-- 2. SEED DATA FOR TABLE: opportunities
-- =========================================================================
INSERT INTO opportunities (id, title, description, location, university, requirements, application_link, application_deadline) VALUES
(101, 'NCAA Division 1 Track Scholarship', 'Full athletic scholarship for elite long and middle-distance runners.', 'USA', 'University of Oregon', 'Minimum GPA of 3.0, SAT score 1100+, WA U20 ranking.', 'https://goducks.com', '2026-11-15'),
(102, 'Elite Elite Volleyball Development Program', 'Full tuition waiver and sports training kit access.', 'Kenya', 'Strathmore University', 'Must have played in the KVF league or school nationals.', 'https://strathmore.edu', '2026-08-30'),
(103, 'High Performance Rugby Residency', 'Rugby academy placement with partial academic funding.', 'South Africa', 'Stellenbosch University', 'U20 national team cap or recommendation from KRU.', 'https://maties.com', '2026-10-01'),
(104, 'Collegiate Basketball Sports Program', 'Tuition waiver and accommodation for elite post players.', 'Kenya', 'United States International University', 'Minimum C+ in KCSE, height over 6ft 2in for men.', 'https://usiu.ac.ke', '2026-07-15'),
(105, 'European Football Academy Trial', '6-month developmental trial with potential professional contract.', 'Spain', 'Alicante Sports Academy', 'Video highlights reel, age 18-22, valid passport.', 'https://alicantesports.es', '2026-09-12'),
(106, 'Collegiate Swimming Scholarship', 'Full ride scholarship for sprint freestyle swimmers.', 'USA', 'University of Texas', 'FINA points above 700, TOEFL score 80+.', 'https://texassports.com', '2026-12-20'),
(107, 'National Sports Fund Grant', 'Government funding for elite athletes preparing for global games.', 'Kenya', 'Kenyatta University', 'Active ranking in top 5 nationally in respective sport.', 'https://sportsfund.go.ke', '2026-06-30'),
(108, 'Elite Tennis Training Fellowship', 'All-expenses-paid training program and tournament travel fund.', 'France', 'Mouratoglou Tennis Academy', 'ITF Junior ranking top 500 or regional champion status.', 'https://mouratoglou.com', '2026-10-15'),
(109, 'Varsity Hockey Sports Talents Intake', '100% academic scholarship for women field hockey players.', 'Kenya', 'University of Nairobi', 'Minimum C+ in KCSE, active club or school player.', 'https://uonbi.ac.ke', '2026-08-15'),
(110, 'NAIA Basketball Talent Scholarship', 'Partial athletic scholarship with work-study options.', 'USA', 'Oklahoma City University', 'High school transcripts, video footage, coach referee letter.', 'https://ocusports.com', '2026-11-01');


-- =========================================================================
-- 3. SEED DATA FOR TABLE: wishlist
-- =========================================================================
INSERT INTO wishlist (talent_email, opportunity_id, status) VALUES
('brian.omondi@gmail.com', 104, 'applied'),
('brian.omondi@gmail.com', 110, 'interested'),
('faith.chepngetich@yahoo.com', 101, 'accepted'),
('emmanuel.kiprop@outlook.com', 101, 'applied'),
('emmanuel.kiprop@outlook.com', 107, 'interested'),
('mercy.anyango@gmail.com', 102, 'accepted'),
('kevin.mutua@gmail.com', 103, 'applied'),
('sharon.wambui@yahoo.com', 105, 'rejected'),
('david.ndwiga@gmail.com', 106, 'interested'),
('joyce.kosgei@yahoo.com', 109, 'applied');


-- =========================================================================
-- 4. SEED DATA FOR TABLE: referrals
-- =========================================================================
INSERT INTO referrals (talent_email, referee_name, referee_email, referee_phone, opportunity_id, relationship, description, attachment_url) VALUES
('brian.omondi@gmail.com', 'Coach Peter Keter', 'p.keter@hoops.ke', '+254722111222', 104, 'High School Coach', 'Brian shows exceptional court vision and leadership. He led our team to victory.', 'https://amazonaws.com'),
('faith.chepngetich@yahoo.com', 'Colm O/Connell', 'colm.oc@running.ke', '+254733222333', 101, 'Club Coach', 'Faith has unique endurance traits resembling world champions. Highly recommended.', 'https://amazonaws.com'),
('emmanuel.kiprop@outlook.com', 'Dr. John Ndambuki', 'j.ndambuki@ku.ac.ke', '+254711555666', 101, 'University Lecturer', 'Emmanuel balances his academics and training rigorously. A disciplined athlete.', 'https://amazonaws.com'),
('mercy.anyango@gmail.com', 'Paul Bitok', 'p.bitok@volleyball.or.ke', '+254722999888', 102, 'National Scout', 'Mercy has the height and blocking agility needed for the highest collegiate level.', 'https://amazonaws.com'),
('kevin.mutua@gmail.com', 'Andrew Amonde', 'a.amonde@rugby.ke', '+254733888777', 103, 'National U20 Coach', 'Kevin is an explosive flanker with an incredible work rate. Fit for international rugby.', 'https://amazonaws.com'),
('sharon.wambui@yahoo.com', 'Coach Florence Adhiambo', 'f.adhiambo@starlets.ke', '+254722444555', 105, 'National Team Coach', 'Sharon is a clinical finisher. She is ready for European developmental exposure.', 'https://amazonaws.com'),
('david.ndwiga@gmail.com', 'Dunford Harrison', 'h.dunford@swim.ke', '+254711666777', 106, 'Private Instructor', 'David has broken regional junior records and possesses great technical form.', 'https://amazonaws.com'),
('alice.awuor@outlook.com', 'Mary Waya', 'm.waya@netball.or.ke', '+254733000111', 107, 'Federation Official', 'Alice is a versatile wing-attack player with unparalleled agility in the local circuit.', 'https://amazonaws.com'),
('victor.waweru@gmail.com', 'Lawrence Olubayo', 'l.olubayo@tennis.ke', '+254722555999', 108, 'Academy Coach', 'Victor is highly disciplined and currently the top-seeded junior player in East Africa.', 'https://amazonaws.com'),
('joyce.kosgei@yahoo.com', 'Jackline Atieno', 'j.atieno@hockey.ke', '+254711222999', 109, 'Club Coach', 'Joyce has superior defensive playmaking skills and reads the game exceptionally well.', 'https://amazonaws.com');

mysql> select * from wishlist;
+----+-----------------------------+----------------+------------+
| id | talent_email                | opportunity_id | status     |
+----+-----------------------------+----------------+------------+
|  1 | brian.omondi@gmail.com      |            104 | applied    |
|  2 | brian.omondi@gmail.com      |            110 | interested |
|  3 | faith.chepngetich@yahoo.com |            101 | accepted   |
|  4 | emmanuel.kiprop@outlook.com |            101 | applied    |
|  5 | emmanuel.kiprop@outlook.com |            107 | interested |
|  6 | mercy.anyango@gmail.com     |            102 | accepted   |
|  7 | kevin.mutua@gmail.com       |            103 | applied    |
|  8 | sharon.wambui@yahoo.com     |            105 | rejected   |
|  9 | david.ndwiga@gmail.com      |            106 | interested |
| 10 | joyce.kosgei@yahoo.com      |            109 | applied    |
+----+-----------------------------+----------------+------------+
10 rows in set (0.00 sec)
       select *from referrals;
+----+-----------------------------+-------------------------+--------------------------+---------------+----------------+---------------------+------------------------------------------------------------------------------------------+-----------------------+
| id | talent_email                | referee_name            | referee_email            | referee_phone | opportunity_id | relationship        | description                                                                              | attachment_url        |
+----+-----------------------------+-------------------------+--------------------------+---------------+----------------+---------------------+------------------------------------------------------------------------------------------+-----------------------+
|  1 | brian.omondi@gmail.com      | Coach Peter Keter       | p.keter@hoops.ke         | +254722111222 |            104 | High School Coach   | Brian shows exceptional court vision and leadership. He led our team to victory.         | https://amazonaws.com |
|  2 | faith.chepngetich@yahoo.com | Colm O/Connell          | colm.oc@running.ke       | +254733222333 |            101 | Club Coach          | Faith has unique endurance traits resembling world champions. Highly recommended.        | https://amazonaws.com |
|  3 | emmanuel.kiprop@outlook.com | Dr. John Ndambuki       | j.ndambuki@ku.ac.ke      | +254711555666 |            101 | University Lecturer | Emmanuel balances his academics and training rigorously. A disciplined athlete.          | https://amazonaws.com |
|  4 | mercy.anyango@gmail.com     | Paul Bitok              | p.bitok@volleyball.or.ke | +254722999888 |            102 | National Scout      | Mercy has the height and blocking agility needed for the highest collegiate level.       | https://amazonaws.com |
|  5 | kevin.mutua@gmail.com       | Andrew Amonde           | a.amonde@rugby.ke        | +254733888777 |            103 | National U20 Coach  | Kevin is an explosive flanker with an incredible work rate. Fit for international rugby. | https://amazonaws.com |
|  6 | sharon.wambui@yahoo.com     | Coach Florence Adhiambo | f.adhiambo@starlets.ke   | +254722444555 |            105 | National Team Coach | Sharon is a clinical finisher. She is ready for European developmental exposure.         | https://amazonaws.com |
|  7 | david.ndwiga@gmail.com      | Dunford Harrison        | h.dunford@swim.ke        | +254711666777 |            106 | Private Instructor  | David has broken regional junior records and possesses great technical form.             | https://amazonaws.com |
|  8 | alice.awuor@outlook.com     | Mary Waya               | m.waya@netball.or.ke     | +254733000111 |            107 | Federation Official | Alice is a versatile wing-attack player with unparalleled agility in the local circuit.  | https://amazonaws.com |
|  9 | victor.waweru@gmail.com     | Lawrence Olubayo        | l.olubayo@tennis.ke      | +254722555999 |            108 | Academy Coach       | Victor is highly disciplined and currently the top-seeded junior player in East Africa.  | https://amazonaws.com |
| 10 | joyce.kosgei@yahoo.com      | Jackline Atieno         | j.atieno@hockey.ke       | +254711222999 |            109 | Club Coach          | Joyce has superior defensive playmaking skills and reads the game exceptionally well.    | https://amazonaws.com |
+----+-----------------------------+-------------------------+--------------------------+---------------+----------------+---------------------+------------------------------------------------------------------------------------------+-----------------------+
10 rows in set (0.00 sec)

mysql> select * from talent;
+-----------------------------+-------------------+-----------------------------+------------+---------------+------------------------------------------------+-----------------------+
| email                       | full_name         | sports                      | dob        | phone         | highest_achievement                            | education_level       |
+-----------------------------+-------------------+-----------------------------+------------+---------------+------------------------------------------------+-----------------------+
| alice.awuor@outlook.com     | Alice Awuor       | Netball                     | 2002-08-19 | +254788990011 | Represented Kenya in All Africa Games          | Undergraduate Student |
| brian.omondi@gmail.com      | Brian Omondi      | Basketball                  | 2004-05-12 | +254711223344 | MVP Kenya National Secondary School Games 2023 | High School Graduate  |
| david.ndwiga@gmail.com      | David Ndwiga      | Swimming                    | 2006-01-15 | +254777889900 | National Record Holder 100m Freestyle          | High School Graduate  |
| emmanuel.kiprop@outlook.com | Emmanuel Kiprop   | Athletics (Long Distance)   | 2003-02-14 | +254733445566 | 3rd Place Nairobi City Marathon 2024           | Undergraduate Student |
| faith.chepngetich@yahoo.com | Faith Chepngetich | Athletics (Middle Distance) | 2005-09-20 | +254722334455 | Gold Medalist 1500m African U20 Championships  | High School Graduate  |
| joyce.kosgei@yahoo.com      | Joyce Kosgei      | Field Hockey                | 2004-03-10 | +254700112233 | Best Midfielder KHU Women Premier League       | Diploma               |
| kevin.mutua@gmail.com       | Kevin Mutua       | Rugby Sevens                | 2005-07-08 | +254755667788 | Kenya 7s Under-20 Captain                      | High School Graduate  |
| mercy.anyango@gmail.com     | Mercy Anyango     | Volleyball                  | 2004-11-30 | +254744556677 | Best Blocker KVF National League Playoffs      | Diploma               |
| sharon.wambui@yahoo.com     | Sharon Wambui     | Football                    | 2003-04-25 | +254766778899 | Top Scorer Kenya Women Premier League 2024     | Undergraduate Student |
| victor.waweru@gmail.com     | Victor Waweru     | Tennis                      | 2005-12-05 | +254799001122 | Winner ITF East Africa Junior Circuit          | High School Graduate  |
+-----------------------------+-------------------+-----------------------------+------------+---------------+------------------------------------------------+-----------------------+
10 rows in set (0.00 sec)

mysql> select full_name ,sports,phone from talent where sport = "basketball"
    -> ;
ERROR 1054 (42S22): Unknown column 'sport' in 'where clause'
mysql> select full_name ,sports,phone from talent where sports = "basketball";
+--------------+------------+---------------+
| full_name    | sports     | phone         |
+--------------+------------+---------------+
| Brian Omondi | Basketball | +254711223344 |
+--------------+------------+---------------+
1 row in set (0.00 sec)

mysql> select count(email)from talent ;
+--------------+
| count(email) |
+--------------+
|           10 |
+--------------+
1 row in set (0.02 sec)

mysql> select count(email)from talent where sports ="rugby";
+--------------+
| count(email) |
+--------------+
|            0 |
+--------------+
1 row in set (0.00 sec)

mysql> select count(email)from talent where sports ="Rugby Sevens";
+--------------+
| count(email) |
+--------------+
|            1 |
+--------------+
1 row in set (0.00 sec)

mysql>

