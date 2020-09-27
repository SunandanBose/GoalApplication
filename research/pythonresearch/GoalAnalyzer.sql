SELECT
---
FROM
(
      SELECT
           *
      FROM (
            SELECT *
            FROM reminder.user
            WHERE username='${NAME}'
           ) u
      LEFT JOIN reminder.goal g
      ON u.username=g.username
      LEFT JOIN reminder.goaltype gt
      ON g.type_id=gt.id
      LEFT JOIN reminder.dailyfeed d
      ON u.username=d.username
) base
LEFT JOIN
(
 SELECT
       username,
       target_date AS stg_target_date,
       count(*) AS stg_count
 FROM reminder.goal
 WHERE username='${NAME}'
       AND type_id='1'
 GROUP BY username,target_date
) stg
ON base.username=stg.username
LEFT JOIN
(
 SELECT
       username,
       target_date AS ltg_target_date,
       COUNT(*) AS ltg_count
 FROM reminder.goal
 WHERE username='${NAME}'
       AND type_id='2'
 GROUP BY username,target_date
) stg
ON base.username=stg.username