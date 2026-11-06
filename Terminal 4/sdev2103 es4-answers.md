# Music Festival Database — Keys

1. The primary key of `bands` is `band_id`, the primary key of `stages` is `stage_code`, and the primary key of `tickets` is `ticket_no`. Each identifies a unique row in its table.

2. The `barcode` column is the second candidate key because every ticket has its own unique printed barcode. Once `ticket_no` is selected as the primary key, `barcode` is an alternate key.

3. `buyer_email` cannot be a key because one buyer often purchases several tickets, so the same email address can appear in multiple rows. A key must uniquely identify each ticket.

4. `performances.band_id` is a foreign key referencing `bands.band_id`. `performances.stage_code` is a foreign key referencing `stages.stage_code`.

5. A suitable composite primary key is `(stage_code, starts_at)`, because a stage can have only one band performing at a particular date and time. Neither column alone is sufficient: a stage hosts multiple performances, and a band can perform at different times or stages.

6. Band names may change, and a name that is unique this year might be used by another band in a future year. The assigned `band_id` is a more stable identifier that does not depend on a band's name.