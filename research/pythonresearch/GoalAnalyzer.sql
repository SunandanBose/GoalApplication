SELECT
base.username,
CAST((DATEDIFF(DATE_ADD(base.completed_time, INTERVAL 1 DAY),base.createdat)/DATEDIFF(ltg_target_date,base.createdat))*100 AS SIGNED) AS ltg_percentage_completion,
CAST(((stg_cnt.stg_completed_count/stg.stg_count)*100) AS SIGNED) AS stg_percentage_completion
FROM
(
      SELECT
           u.username,
           g.createdat,
           d.completed_time
      FROM (
            SELECT *
            FROM goalreminder.user
            -- WHERE username='${NAME}'
           ) u
      LEFT JOIN goalreminder.goal g
      ON u.username=g.username
      LEFT JOIN goalreminder.goaltype gt
      ON g.goaltype=gt.id
      INNER JOIN goalreminder.dailyfeed d
      ON u.username=d.username
	  AND g.id=d.goal_id
) base
LEFT JOIN
(
 SELECT
       username,
       createdat AS stg_created_date,
       count(*) AS stg_count
 FROM goalreminder.goal
 WHERE -- username='${NAME}' AND
	   goaltype='1'
 GROUP BY username,createdat
) stg
ON base.username=stg.username
LEFT JOIN
(
 SELECT
       username,
       target AS ltg_target_date,
       COUNT(*) AS ltg_count
 FROM goalreminder.goal
 WHERE -- username='${NAME}' AND
       goaltype='2'
 GROUP BY username,createdat,target
) ltg
ON base.username=ltg.username
LEFT JOIN
(
 SELECT
       g.username,
       count(*) AS stg_completed_count
 FROM goalreminder.goal g
 INNER JOIN goalreminder.dailyfeed d
 ON g.id=d.goal_id
 WHERE -- g.username='${NAME}' AND
       goaltype='1'
 GROUP BY g.username,createdat,target
) stg_cnt
ON base.username=stg_cnt.username
GROUP BY USERNAME,ltg_percentage_completion,stg_percentage_completion