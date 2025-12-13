-- Copyright (c) 2025 Linh Pham
-- wait-wait-stats-wrapped is released under the terms of the MIT License
-- SPDX-License-Identifier: MIT
--
-- vim: set noai syntax=sql ts=4 sw=4:

SELECT sk.scorekeeper, COUNT(skm.showid) AS 'count'
FROM ww_showskmap skm
    JOIN ww_scorekeepers sk ON sk.scorekeeperid = skm.scorekeeperid
    JOIN ww_shows s ON s.showid = skm.showid
WHERE YEAR(s.showdate) = 2025
    AND s.bestof = 0
    AND s.repeatshowid IS NULL
GROUP BY sk.scorekeeper
-- HAVING COUNT(pm.showid) > 3
ORDER BY COUNT(skm.showid) DESC
