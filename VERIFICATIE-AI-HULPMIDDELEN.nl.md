# Verificatie van AI-hulpmiddelen

Bijgewerkt: `2026-07-26T12:09:12.6753764+02:00`

| Aanbieder | Officieel onderdeel | Versie | Aanmelding | Beheer | Bestandssysteem / opdrachtschil | Volledige-toegangsmodus | Controle | Status / blokkade |
|---|---|---:|---|---|---|---|---|---|
| GitHub | GitHub CLI | 2.96.0 | `Tarasevych` / sleutelkluis | Huidige opdrachtschil met verhoogde rechten | Uitsluitend Git / GitHub | Niet van toepassing | Versie, aanmeldstatus en API-identiteit geslaagd | GEREED (`READY`) |
| Meta AI | Officiële websnelkoppeling in Chrome-toepassingsmodus | Web | Wacht op aanmelding door eigenaar | Uitsluitend in webbrowser | Geen lokaal bestandssysteem of opdrachtschil | Niet door product ondersteund | Snelkoppeling en terugleescontrole geslaagd | Aanmelding bij Meta vereist; Model API enkel in de VS |
| xAI | Grok Build | 0.2.112 | Niet aangemeld | Geblokkeerd zolang UAC uit staat | Ondersteund na aanmelding | Gecontroleerde standaardvraagmodus; geen geheugen | Versie en `doctor` geslaagd | Apparaataanmelding door eigenaar; UAC-poort |
| GitHub | Copilot CLI | 1.0.75 | `Tarasevych` via `gh` / sleutelkluis | Geblokkeerd zolang UAC uit staat | Goedgekeurde startmap; bediening op afstand uit; geen besturingssysteem-afscherming | Standaardbevestigingsvragen; geen blijvende `allow-all` | Aanmelding en geïsoleerde bestandshulpmiddelen geslaagd | GEÏNSTALLEERD; UAC-poort |
| Anthropic | Claude Desktop | 1.24012.1.0 | Wacht op aanmelding door eigenaar | Toepassing geïnstalleerd | Afhankelijk van product en abonnement | Productbegrenzing | Installatie en handtekening geslaagd | Aanmelding door eigenaar vereist |
| Anthropic | Claude Code | 2.1.220 | Geen | Geblokkeerd zolang UAC uit staat | Goedgekeurde startmap; omgevingsgebonden MCP uit; geen besturingssysteem-afscherming | Handmatige machtigingsmodus | Handtekening en `doctor` geslaagd | Aanmelding door eigenaar vereist; UAC-poort |
| Mistral | Vibe CLI | 2.22.0 | Wacht op inrichting | Geblokkeerd zolang UAC uit staat | Goedgekeurde startmap; geen besturingssysteem-afscherming | Standaardagent en vertrouwensvraag | Versie en hulptekst geslaagd | Inrichting door eigenaar vereist; UAC-poort |
| Google | Gemini CLI + websnelkoppeling | 0.52.0 | Geen geschikte aanmelding ingesteld | Geblokkeerd zolang UAC uit staat | Goedgekeurde startmap; geen besturingssysteem-afscherming | Standaardgoedkeuring en vertrouwensvraag | Versie, hulptekst en snelkoppeling geslaagd | Zakelijke toegang of API-sleutel vereist; UAC-poort |
| DeepSeek | Officiële websnelkoppeling | Web | Webaanmelding door eigenaar optioneel | Uitsluitend in webbrowser | Geen eigen Windows-opdrachtregelhulpmiddel | Niet van toepassing | Snelkoppeling en terugleescontrole geslaagd | API-sleutel en betalingspoort |
| Perplexity | Comet | 150.0.7871.230 | Wacht op aanmelding door eigenaar | Uitsluitend in webbrowser | Webbrowserassistent, geen Windows-besturing | Niet van toepassing | WinGet, controlegetal, handtekening en menu Start geslaagd | Aanmelding door eigenaar; betalingspoort voor MCP API |

Enkel een geslaagde afsluiting van het installatieprogramma geldt niet als aanvaarding. Elke lokale agent moet na aanmelding en uitdrukkelijke werkruimtebevestiging slagen voor een aanbiederspecifieke gesimuleerde aanvaardingstest.

## Voorcontrole van de gecontroleerde startvoorziening

- Goedgekeurde hoofdmap voor aanvankelijke startmappen: `C:\AI-Tools\workspaces`.
- Deze padcontrole vormt geen afgeschermde omgeving van het bestandssysteem. Een hulpmiddel dat toestemming heeft gekregen om een opdrachtschilopdracht uit te voeren, kan nog steeds een absoluut pad buiten de startmap aanspreken.
- Elk lokaal ingangspunt van een opdrachtregelhulpmiddel is vastgepind op zijn geverifieerde pad en SHA-256-controlegetal; elke afwijking blokkeert het starten totdat de herkomst en het beleid zijn beoordeeld.
- Webtoepassingen voor eindgebruikers krijgen nooit bevoegdheid over de lokale opdrachtschil of het bestandssysteem.
- Bediening op afstand en externe uitvoer van Copilot zijn uitgeschakeld.
- Claude start met een strikt lege MCP-instelling.
- Grok start in de machtigingsmodus `default` met uitgeschakeld geheugen.
- Vibe en Gemini behouden de vertrouwensvragen van de aanbieder.
- Blijvende modi zoals `allow-all`, `yolo`, `bypassPermissions`, uitschakeling van de afgeschermde omgeving, `SYSTEM` en `TrustedInstaller` zijn afwezig.
- De huidige voorcontrole heeft de status `GEBLOKKEERD` (`BLOCKED`) omdat UAC is uitgeschakeld en het huidige proces met verhoogde rechten draait. De uitgeschakelde BitLocker-bescherming op station `C:` wordt afzonderlijk als waarschuwing gemeld. Tijdens de poortcontroles is geen enkel aanbiederproces gestart.
- De reeds bestaande Claude-instelling `skipDangerousModePermissionPrompt=true` is geregistreerd, maar activeert op zichzelf geen omzeilingsmodus.
- De verwezenlijking van de gecontroleerde startvoorziening is bewaard in de besloten vastlegging `ed2ad495a5b50c298b2edc32c363d6b28fe811a3` met geverifieerde externe SHA-gelijkheid.

## Terugleescontrole van beveiligingsmaatregelen

- Windows Defender-antivirus en directe bescherming: ongewijzigd, ingeschakeld.
- Domein-, privé- en openbare netwerkfilterprofielen: ongewijzigd, ingeschakeld.
- UAC-instelling `EnableLUA`: ongewijzigd op de reeds bestaande waarde `0`.
- BitLocker op station `C:`: ongewijzigd, voor 100% versleuteld met reeds uitgeschakelde beschermingsstatus.
- Blijvende verruimende instellingen: geen enkele weggeschreven.
- Door deze taak gestarte installatie- of aanbiederprocessen: geen enkele meer actief.

## Vernieuwing van de beveiligingsvoorcontrole (2026-07-26 12:09 CEST)

- Integriteit van vastgepinde opdrachten: geslaagd voor Copilot, Grok, Claude, Vibe en Gemini.
- GitHub-identiteit: geslaagd als `Tarasevych`; objectintegriteit van de opslagplaats en SHA-gelijkheid tussen lokaal, gevolgd en extern: geslaagd.
- Windows Defender en alle netwerkfilterprofielen: geslaagd en ingeschakeld.
- Starten van lokale agenten: geblokkeerd door de reeds uitgeschakelde UAC-status en de huidige opdrachtschil met verhoogde rechten.
- Waarschuwingen: uitgeschakelde BitLocker-bescherming op station `C:` en reeds bestaande onderdrukking van de waarschuwing voor de gevaarlijke modus in Claude.
- Doorzoeking van gevolgde bestanden op geheime patronen: geslaagd, alle bestanden gecontroleerd en nul bevindingen.
- Herkomstcontrole van de Meta AI-snelkoppeling: geslaagd; aanvaarding van de interactieve aanmelding blijft wachten op handeling van de eigenaar (`UNVERIFIED_OWNER_ACTION_REQUIRED`).

## Herstelde, niet-herhaalde fouten

1. De aanvankelijke gezamenlijke versiecontrole stuitte op een wachtende interactieve opdracht. Uitsluitend het geverifieerde procesnummer van die controle is gestopt; daarna is elke opdracht afzonderlijk gecontroleerd.
2. De eerste herkomstcontrole voor Gemini sprak de letterlijke JSON-sleutel `repository.url` van npm onjuist aan. Er vond geen installatie plaats; de verbeterde controle verifieerde versie, opslagplaats, integriteit en Node-vereiste vóór één geslaagde installatie.
3. Copilot weigerde `--max-ai-credits 1` omdat het minimum 30 bedraagt. Er is geen modelaanvraag verzonden. De eenmalige verbeterde aanvaardingstest liet die bovengrens weg en gebruikte één niet-automatische opdracht met geweigerde toegang tot opdrachtschil, webadressen en MCP.
4. De aanroep `grok inspect --cwd` werd geweigerd omdat `--cwd` een optie op hoofdniveau is. De verbeterde alleen-lezen opdracht `grok inspect` is eenmalig uitgevoerd.
5. Comet behandelt `--version` als een normale start van de webbrowser. Het exacte door deze taak gestarte procesnummer `9724` en de geverifieerde afstammelingen van Comet zijn gestopt; bestandsversie, WinGet-registratie, controlegetal, uitgever en geldige handtekening blijven het aanvaardingsbewijs.
