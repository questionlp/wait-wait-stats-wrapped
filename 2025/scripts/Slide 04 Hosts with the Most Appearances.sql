-- Copyright (c) 2025 Linh Pham
-- wait-wait-stats-wrapped is released under the terms of the MIT License
-- SPDX-License-Identifier: MIT
--
-- vim: set noai syntax=sql ts=4 sw=4:

SELECT h.host, COUNT(hm.showid) AS 'count'
FROM ww_showhostmap hm
    JOIN ww_hosts h ON h.hostid = hm.hostid
    JOIN ww_shows s ON s.showid = hm.showid
WHERE YEAR(s.showdate) = 2025
    AND s.bestof = 0
    AND s.repeatshowid IS NULL
GROUP BY h.host
-- HAVING COUNT(hm.showid) > 3
ORDER BY COUNT(hm.showid) DESC
