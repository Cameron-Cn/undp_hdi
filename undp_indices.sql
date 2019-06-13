CREATE DATABASE undp;

select * from hdi3;
select * from lit6;

-- this builds a joint table. Not really what I had looked for
select `index`,countryName,`Date`,hdiRank,HDI, NULL as litRate from hdi3
union
select `index`,countryName,`Date`,hdiRank, NULL as HDI, litRate from lit6;

-- Trying to insert the litRate column into the hdi3 table where countryName and Date match

select h.`index`,h.countryName,h.`Date`,h.hdiRank,h.HDI, (select l.litRate from lit6 l where l.countryName = h.countryName and l.`Date` = h.`Date`) as litRate from hdi3 h;
-- this is a subquery, which is complicated. But it WORKED! 
