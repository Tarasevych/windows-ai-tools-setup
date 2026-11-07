# Officiële AI-hulpmiddelen voor Windows

Dit besloten project bewaart de reproduceerbare, geheimvrije installatie- en verificatiestaat voor officiële AI-toepassingen en opdrachtregelhulpmiddelen op Windows 11.

Belangrijkste documenten en bewijsstukken:

- [CONTROLEPUNT-AI-HULPMIDDELEN.nl.md](CONTROLEPUNT-AI-HULPMIDDELEN.nl.md) — veilig herstel- en controlepunt;
- [AI_TOOLS_INVENTORY.json](AI_TOOLS_INVENTORY.json) — machineleesbare onderdelenlijst;
- [VERIFICATIE-AI-HULPMIDDELEN.nl.md](VERIFICATIE-AI-HULPMIDDELEN.nl.md) — aanvaardingsresultaten en blokkades;
- [REGISTER-OFFICIELE-BRONNEN.nl.md](REGISTER-OFFICIELE-BRONNEN.nl.md) — register van officiële aanbiedersbronnen;
- [VEILIGHEIDSGRENS.nl.md](VEILIGHEIDSGRENS.nl.md) — grens tussen ondersteunde toegang en een gevaarlijke blijvende achterpoort op systeemniveau;
- [AGENTEN.nl.md](AGENTEN.nl.md) — regels voor veilige inrichting en gebruik van agenten;
- [setup/phase0-audit.json](setup/phase0-audit.json) — van gevoelige gegevens ontdane aanvangscontrole;
- [setup/policies/provider-policies.json](setup/policies/provider-policies.json) — toelatingslijst voor aanvankelijke startmappen en veilige standaardinstellingen voor sessies van lokale agenten;
- [setup/scripts/Test-AIToolPreflight.ps1](setup/scripts/Test-AIToolPreflight.ps1) — alleen-lezen voorcontrole vóór het starten;
- [setup/rollback/TERUGDRAAIEN.nl.md](setup/rollback/TERUGDRAAIEN.nl.md) — handleiding voor het terugdraaien van de gecontroleerde startvoorziening;
- [workspaces/LEESMIJ.nl.md](workspaces/LEESMIJ.nl.md) — goedgekeurde hoofdmap voor aanvankelijke werkruimten van de gecontroleerde startvoorziening.

Er worden hier geen geheimen opgeslagen. OAuth-aanmeldingen, API-sleutels en betaalde beslissingen blijven afzonderlijke handelingen die uitsluitend aan de eigenaar toebehoren.

Lokale agenten worden momenteel bij het starten geblokkeerd omdat gebruikersaccountbeheer (UAC) reeds vóór dit project was uitgeschakeld. De uitgeschakelde BitLocker-bescherming op station `C:` wordt afzonderlijk als waarschuwing gemeld. Het herstellen van deze beveiligingsmaatregelen vereist een afzonderlijk besluit van de eigenaar en, voor UAC, een herstart van Windows.

De toelatingslijst voor aanvankelijke startmappen vormt geen afgeschermde omgeving van het besturingssysteem: na afzonderlijke goedkeuring kan een opdrachtschilhulpmiddel technisch gezien een absoluut pad buiten `workspaces` aanspreken.
