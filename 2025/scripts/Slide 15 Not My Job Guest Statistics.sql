-- Copyright (c) 2025 Linh Pham
-- wait-wait-stats-wrapped is released under the terms of the MIT License
-- SPDX-License-Identifier: MIT
--
-- vim: set noai syntax=sql ts=4 sw=4:

SELECT
(
    SELECT COUNT(gm.guestid)
    FROM ww_showguestmap gm
        JOIN ww_guests g ON g.guestid = gm.guestid
        JOIN ww_shows s ON s.showid = gm.showid
    WHERE YEAR(s.showdate) = 2025
        AND s.bestof = 0
        AND s.repeatshowid IS NULL
        AND g.guestslug <> 'none'
        AND gm.guestscore >= 2
        AND gm.exception = 0
) AS 'wins',
(
    SELECT COUNT(gm.guestid)
    FROM ww_showguestmap gm
        JOIN ww_guests g ON g.guestid = gm.guestid
        JOIN ww_shows s ON s.showid = gm.showid
    WHERE YEAR(s.showdate) = 2025
        AND s.bestof = 0
        AND s.repeatshowid IS NULL
        AND g.guestslug <> 'none'
        AND (gm.guestscore < 2
        AND gm.exception = 0)
) AS 'losses',
(
    SELECT COUNT(gm.guestid)
    FROM ww_showguestmap gm
        JOIN ww_guests g ON g.guestid = gm.guestid
        JOIN ww_shows s ON s.showid = gm.showid
    WHERE YEAR(s.showdate) = 2025
        AND s.bestof = 0
        AND s.repeatshowid IS NULL
        AND g.guestslug <> 'none'
        AND gm.exception = 1
) AS 'exceptions'
