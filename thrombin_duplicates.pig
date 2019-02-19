data = load '/user/CKME136/thrombin.data';
grp = GROUP data ALL;
cnt = FOREACH grp GENERATE '# of rows in original dataset ', COUNT(data);
distinct_data = DISTINCT data;
grp2 = GROUP distinct_data ALL;
cnt2 = FOREACH grp2 GENERATE '# of rows after excluding duplicates ', COUNT(distinct_data);
mrg = UNION ONSCHEMA cnt2, cnt;
dump mrg;
STORE grp2 INTO '/user/CKME136/thrombin_distinct' USING PigStorage(',');
