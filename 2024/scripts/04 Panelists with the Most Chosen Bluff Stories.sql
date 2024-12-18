-- Copyright (c) 2024 Linh Pham
-- wait-wait-stats-wrapped is released under the terms of the MIT License
-- SPDX-License-Identifier: MIT
--
-- vim: set noai syntax=sql ts=4 sw=4:

SELECT p.panelist, COUNT(bl.chosenbluffpnlid) AS 'count'
FROM ww_showbluffmap bl
         JOIN ww_panelists p ON p.panelistid = bl.chosenbluffpnlid
         JOIN ww_shows s ON s.showid = bl.showid
WHERE YEAR(s.showdate) = 2024
  AND (s.bestof = 0 OR (s.bestof = 1 AND s.bestofuniquebluff = 1))
  AND s.repeatshowid IS NULL
GROUP BY p.panelist
HAVING COUNT(bl.chosenbluffpnlid) > 1
ORDER BY COUNT(bl.chosenbluffpnlid) DESC