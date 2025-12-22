-- Copyright (c) 2025 Linh Pham
-- wait-wait-stats-wrapped is released under the terms of the MIT License
-- SPDX-License-Identifier: MIT
--
-- vim: set noai syntax=sql ts=4 sw=4:

SELECT
    (SELECT COUNT(s.showdate)
        FROM ww_shows s
        WHERE YEAR(s.showdate) = 2025
            AND s.bestof = 0
            AND s.repeatshowid IS NULL) AS 'regular_shows',
    (SELECT COUNT(s.showdate)
        FROM ww_shows s
        WHERE YEAR(s.showdate) = 2025
            AND s.bestof = 1
            AND s.repeatshowid IS NULL) AS 'best_of_shows',
    (SELECT COUNT(s.showdate)
        FROM ww_shows s
        WHERE YEAR(s.showdate) = 2025
            AND s.bestof = 0
            AND s.repeatshowid IS NOT NULL) AS 'repeat_shows'
