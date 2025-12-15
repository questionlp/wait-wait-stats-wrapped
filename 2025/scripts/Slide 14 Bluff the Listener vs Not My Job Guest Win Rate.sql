-- Copyright (c) 2025 Linh Pham
-- wait-wait-stats-wrapped is released under the terms of the MIT License
-- SPDX-License-Identifier: MIT
--
-- vim: set noai syntax=sql ts=4 sw=4:

SELECT
(
    SELECT COUNT(g.guestid)
    FROM ww_showguestmap gm
        JOIN ww_guests g ON g.guestid = gm.guestid
        JOIN ww_shows s ON s.showid = gm.showid
    WHERE YEAR(s.showdate) = 2025
        AND s.bestof = 0
        AND s.repeatshowid IS NULL AND g.guestslug <> 'none'
        AND (gm.guestscore >= 2 OR gm.exception = 1)
) AS 'guest_wins',
(
    SELECT COUNT(g.guestid)
    FROM ww_showguestmap gm
        JOIN ww_guests g ON g.guestid = gm.guestid
        JOIN ww_shows s ON s.showid = gm.showid
    WHERE YEAR(s.showdate) = 2025
        AND s.bestof = 0
        AND s.repeatshowid IS NULL
        AND g.guestslug <> 'none'
        AND (gm.guestscore < 2 AND gm.exception = 0)
) AS 'guest_losses',
(
    SELECT s.showdate -- COUNT(s.showid)
    FROM ww_showbluffmap blm
        JOIN ww_shows s ON s.showid = blm.showid
    WHERE YEAR(s.showdate) = 2025
        AND s.bestof = 0
        AND blm.correctbluffpnlid IS NOT NULL
        AND blm.chosenbluffpnlid IS NOT NULL
        AND blm.chosenbluffpnlid = blm.correctbluffpnlid
) AS 'bluff_correct',
(
    SELECT s.showdate -- COUNT(s.showid)
    FROM ww_showbluffmap blm
        JOIN ww_shows s ON s.showid = blm.showid
    WHERE YEAR(s.showdate) = 2025
        AND s.bestof = 0
        AND blm.correctbluffpnlid IS NOT NULL
        AND blm.chosenbluffpnlid IS NOT NULL
        AND blm.chosenbluffpnlid <> blm.correctbluffpnlid
) AS 'bluff_incorrect'
