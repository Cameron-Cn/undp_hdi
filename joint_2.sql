CREATE DATABASE undp;

select * from hdi3;
select * from lit6;
drop table hdi3;

-- removing the index, it gets in the way
alter table hdi3 drop `index`;
alter table lit6 drop `index`;

-- this builds a joint table. Not really what I had looked for
 select countryName,`Date`,hdiRank, HDI, NULL as litRate from hdi3;
-- union
-- select `index`,countryName,`Date`,hdiRank, NULL as HDI, litRate from lit6;

-- Trying to insert the litRate column into the hdi3 table where countryName and Date match

-- select countryName, `Date`, hdiRank, HDI, h.litRate = (select l.litRate from lit6 l where l.countryName = h.countryName and l.hdiRank = h.hdiRank) from hdi3 h;
-- this is a subquery, which is complicated. But it WORKED! 
alter table hdi3 add litRate double;

update hdi3 h set h.litRate = (select l.litRate from lit6 l where l.countryName = h.countryName and l.`Date` = h.`Date`);