# Tools

## contrast.awk

WCAG 2.x relative-luminance contrast checker. Use it before adding any colour pair
to the token file — Design Tokens rule 5 requires measured values, not eyeballed ones.

Input: whitespace-separated, one pair per line.

    <foreground-hex> <background-hex> <tier A|B|C> <label>

Tier thresholds: A needs 7.0, B needs 4.5, C needs 3.0
(see 05_Typography.md for what the tiers mean).

Run:

    awk -f tools/contrast.awk pairs.txt

Example input:

    #1C1B18 #F7F6F3 A text-primary_on_app-light
    #96670A #FFFFFF B status-warning_light

Example output:

    #1C1B18   on #F7F6F3    tier A  need 7.0  got 15.94  PASS   text-primary_on_app-light
    #96670A   on #FFFFFF    tier B  need 4.5  got  4.95  PASS   status-warning_light
