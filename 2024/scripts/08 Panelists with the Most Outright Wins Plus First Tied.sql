-- Copyright (c) 2024 Linh Pham
-- wait-wait-stats-wrapped is released under the terms of the MIT License
-- SPDX-License-Identifier: MIT
--
-- vim: set noai syntax=sql ts=4 sw=4:

SELECT p.panelist, COUNT(pm.showpnlrank) AS 'count'
FROM ww_showpnlmap pm
         JOIN ww_panelists p ON p.panelistid = pm.panelistid
         JOIN ww_shows s ON s.showid = pm.showid
WHERE YEAR(s.showdate) = 2024
  AND pm.showpnlrank IN ('1', '1t')
  AND s.bestof = 0
  AND s.repeatshowid IS NULL
GROUP BY p.panelist
ORDER BY COUNT(pm.showpnlrank) DESC, p.panelist
