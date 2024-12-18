-- Copyright (c) 2024 Linh Pham
-- wait-wait-stats-wrapped is released under the terms of the MIT License
-- SPDX-License-Identifier: MIT
--
-- vim: set noai syntax=sql ts=4 sw=4:

SELECT (SELECT COUNT(s.showid)
        FROM ww_shows s
                 JOIN ww_showlocationmap lm ON lm.showid = s.showid
                 JOIN ww_locations l ON l.locationid = lm.locationid
        WHERE YEAR(s.showdate) = 2024
          AND s.bestof = 0
          AND s.repeatshowid IS NULL
          AND l.city = 'Chicago'
          AND l.state = 'IL')  AS 'home',
       (SELECT COUNT(s.showid)
        FROM ww_shows s
                 JOIN ww_showlocationmap lm ON lm.showid = s.showid
                 JOIN ww_locations l ON l.locationid = lm.locationid
        WHERE YEAR(s.showdate) = 2024
          AND s.bestof = 0
          AND s.repeatshowid IS NULL
          AND l.city <> 'Chicago'
          AND l.state <> 'IL') AS 'away'
