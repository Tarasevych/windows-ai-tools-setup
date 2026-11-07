# Controlepunt AI-hulpmiddelen

Status: `ACTIE_EIGENAAR_VEREIST_UAC_EN_META_AANMELDING` (`OWNER_ACTION_REQUIRED_UAC_AND_META_LOGIN`)

Bijgewerkt: `2026-07-26T12:09:12.6753764+02:00`

## Doelstelling

Het installeren en verifiëren van officiële Windows-toepassingen en opdrachtregelhulpmiddelen voor kunstmatige intelligentie van Meta AI, xAI, GitHub Copilot, Anthropic, Mistral, Google Gemini, DeepSeek en Perplexity, zonder opgeslagen geheimen, zonder ongeautoriseerde uitgaven, zonder blijvende omzeiling van beveiligingsmaatregelen en zonder onbeheerde achterpoorten op systeemniveau.

## Geverifieerde voortgang

- De oorspronkelijke hoofdopdracht bestaat en het bijbehorende SHA-256-controlegetal komt overeen met `937bf6115b1497f9ee7ecf89b5d48d0647e017ca40a26e895485024dcb7f1113`.
- De alleen-lezen aanvangscontrole van fase 0 is voltooid en vastgelegd in `setup/phase0-audit.json`.
- Het opdrachtregelhulpmiddel GitHub CLI `2.96.0` is reeds geïnstalleerd, actueel volgens het geverifieerde WinGet-pakketoverzicht en aangemeld als `Tarasevych` via de Windows-sleutelkluis. Herinstallatie of herhaalde OAuth-aanmelding is niet nodig.
- Claude Desktop `1.24012.1.0` en Claude Code `2.1.217` zijn reeds aanwezig. Claude Code is niet aangemeld; WinGet vermeldt versie `2.1.218`.
- Grok, Copilot CLI, Mistral Vibe, Gemini CLI en aanbiederspecifieke opdrachtregelhulpmiddelen van DeepSeek en Perplexity ontbraken tijdens de aanvangscontrole in het zoekpad (`PATH`).
- De directe bescherming van Windows Defender en alle netwerkfilterprofielen zijn ingeschakeld. Gebruikersaccountbeheer (UAC) was vóór deze opdracht al uitgeschakeld. Station `C:` is versleuteld met BitLocker, maar de bescherming stond reeds uit. Er is geen enkele basisinstelling van de systeembeveiliging gewijzigd.
- De geheimvrije uitgangssituatie is vastgelegd als vastlegging `0e2c7e4517a508f14e29d1a7e40768947f6f8feb` en met exacte SHA-gelijkheid gepubliceerd naar de besloten opslagplaats `https://github.com/Tarasevych/windows-ai-tools-setup`.
- Geïnstalleerd en geverifieerd:
  - GitHub Copilot CLI `1.0.75`, geldige digitale handtekening van GitHub;
  - Grok Build `0.2.112`, exacte npm-pakketintegriteit van xAI;
  - Mistral Vibe `2.22.0` via `uv tool`;
  - Gemini CLI `0.52.0`, exacte npm-pakketintegriteit van Google;
  - Claude Code bijgewerkt van `2.1.217` naar `2.1.220`, geldige digitale handtekening van Anthropic en geslaagde controle via `claude doctor`;
  - Perplexity Comet `150.0.7871.230`, geldige digitale handtekening van Perplexity.
- Onderdelen in het menu Start onder `AI Tools` zijn aangemaakt en via terugleescontrole bevestigd voor Meta AI, Google Gemini en DeepSeek met uitsluitend officiële HTTPS-adressen in de toepassingsmodus van de ondertekende webbrowser Google Chrome.
- Copilot heeft de bestaande GitHub-sleutelkluisidentiteit `Tarasevych` hergebruikt en is geslaagd voor een geïsoleerde aanvaardingstest voor het lezen en schrijven van bestanden zonder opdrachtschil en zonder externe webadressen. De aangemaakte testbestanden zijn verwijderd.
- Er is geen enkele blijvende instelling voor `allow-all`, `yolo`, `bypassPermissions`, uitschakeling van de afgeschermde omgeving, uitvoering als `SYSTEM` of `TrustedInstaller`, bediening op afstand of toegang tot aanmeldgegevens weggeschreven.
- Terugleescontrole na installatie bevestigt dat de basiswaarden van Windows Defender, het netwerkfilter, UAC en BitLocker ongewijzigd zijn gebleven. Er zijn geen achtergebleven installatieprocessen of aanbiederprocessen actief.
- De geverifieerde installatie- en bewijsfase is vastgelegd in vastlegging `a5f60172e8dd907986af01206d8bfa3d6f8af744`, boomstructuur `2c7ae4874e8567ad11c8ab2c644e1e052760f245`, en gepubliceerd naar de besloten tak `origin/main` met volledige gelijkheid tussen het lokale en het externe SHA-controlegetal.
- Een gecontroleerd startbeleid beperkt nu de aanvankelijke startmap tot `C:\AI-Tools\workspaces`, behoudt goedkeurings- en vertrouwensvragen van de aanbieder, schakelt bediening op afstand en omgevingsgebonden Claude MCP uit en weigert blijvende omzeiling van machtigingen. Dit vormt geen bestandssysteemafscherming op besturingssysteemniveau; goedgekeurde opdrachtschilhulpmiddelen kunnen nog steeds absolute paden aanspreken.
- Lokale ingangspunten van opdrachtregelhulpmiddelen zijn vastgepind op hun geverifieerde paden en SHA-256-controlegetallen. De startvoorziening blokkeert direct wanneer een uitvoerbaar bestand of hulpprogramma afwijkt.
- De alleen-lezen voorcontrole bevestigt dat alle zes opdrachtregelhulpmiddelen geïnstalleerd blijven. Het starten van lokale agenten wordt geblokkeerd omdat UAC is uitgeschakeld en het huidige proces met verhoogde rechten draait. De uitgeschakelde BitLocker-bescherming op station `C:` wordt afzonderlijk als waarschuwing vermeld. De directe bescherming van Windows Defender en alle netwerkfilterprofielen blijven ingeschakeld.
- De bestaande Claude-instellingen bevatten `skipDangerousModePermissionPrompt=true`. Dit activeert op zichzelf geen `bypassPermissions`, is niet door dit project aangemaakt of gewijzigd en is vastgelegd als een reeds bestaand risico van waarschuwingsonderdrukking.

## Huidige stand van zaken

De aanscherping van de gecontroleerde startvoorziening, de vormcontrole, de vastlegging, het publiceren en de externe terugleescontrole zijn voltooid. De interactieve aanvaardingstest van de aanbieders blijft gepauzeerd bij de eerste controlepoort die uitsluitend door de eigenaar kan worden uitgevoerd: het aanmelden bij Meta. Lokale opdrachtregelsessies blijven bovendien geblokkeerd totdat UAC is hersteld en Windows opnieuw is opgestart.

## Verificatie bij hervatting (2026-07-26 10:25 CEST)

- Het hoofdcontrolepunt is vóór enige handeling opnieuw gelezen en er is bevestigd dat de werkboom van de opslagplaats schoon was.
- Er is gecontroleerd dat de lokale tak `main`, `origin/main` en de externe verwijzing `main` vóór deze bijwerking allemaal verwezen naar `64771769b479c762c5908472c1cb6635d8adaaaf`.
- Het SHA-256-controlegetal van de oorspronkelijke hoofdopdracht is opnieuw geverifieerd als `937bf6115b1497f9ee7ecf89b5d48d0647e017ca40a26e895485024dcb7f1113`.
- De rechtstreekse versiecontrole bleef ongewijzigd voor GitHub CLI `2.96.0`, Copilot CLI `1.0.75`, Grok Build `0.2.112`, Claude Code `2.1.220`, Mistral Vibe `2.22.0` en Gemini CLI `0.52.0`; Comet blijft geïnstalleerd als `150.0.7871.230`.
- De GitHub-identiteit blijft `Tarasevych` met aanmeldgegevens in de Windows-sleutelkluis. Claude Code meldt `loggedIn: false`.
- Windows Defender-antivirus, directe bescherming, gedragsbewaking, IOAV-bescherming en alle netwerkfilterprofielen blijven ingeschakeld. De UAC-waarde `EnableLUA=0` en de uitgeschakelde BitLocker-bescherming op `C:` blijven reeds bestaande, ongewijzigde toestanden.
- De uitvoeringsomgeving voor Windows-computerbediening was niet beschikbaar en de beleidsgestuurde terugvalvoorziening heeft de Meta-snelkoppeling niet uitgevoerd. Er is geen enkele status van webbrowsers, aanmeldgegevens, beveiligingsbeleid, achtergronddiensten, geplande taken of aanbieders gewijzigd.

## Verificatie van de gecontroleerde startvoorziening (2026-07-26 11:11 CEST)

- Ontleding door de PowerShell-ontleder is geslaagd voor alle inrichtingsopdrachtreeksen.
- JSON-ontleding is geslaagd voor alle bewijsbestanden en beleidsbestanden van aanbieders.
- De alleen-lezen voorcontrole is geslaagd en meldde correct de blokkades `UAC_DISABLED_REBOOT_REQUIRED_AFTER_REENABLE` en `CURRENT_PROCESS_ELEVATED`, evenals de waarschuwing `BITLOCKER_C_PROTECTION_OFF`.
- Negatieve poortcontroles zijn geslaagd: een pad buiten de toelatingslijst voor startmappen, een startpad met een herverwerkingspunt en het starten van een lokale agent terwijl UAC is uitgeschakeld, werden allemaal geweigerd voordat enig aanbiederproces kon starten.
- De controle van de Git-objectintegriteit is geslaagd; de toestand van de opslagplaats vóór de wijziging was schoon en de lokale tak `main` kwam overeen met `origin/main` op `081401f8a117882ebcd51ab87c79cb842aa7c708`.
- De vastlegging van de gecontroleerde startvoorziening `ed2ad495a5b50c298b2edc32c363d6b28fe811a3` is gepubliceerd naar de besloten opslagplaats `Tarasevych/windows-ai-tools-setup`; bij terugleescontrole kwamen de lokale tak `main`, `origin/main` en de externe verwijzing `refs/heads/main` exact overeen.

## Verificatie bij hervatting (2026-07-26 12:09 CEST)

- Dit controlepunt en het agentenreglement (`AGENTS.md` / `AGENTEN.nl.md`) zijn opnieuw gelezen; geen enkele voltooide installatie, aanmelding, aanvaardingstest of aanbiederinrichting is herhaald.
- Het SHA-256-controlegetal van de oorspronkelijke hoofdopdracht is opnieuw geverifieerd als `937bf6115b1497f9ee7ecf89b5d48d0647e017ca40a26e895485024dcb7f1113`.
- De actuele versies blijven GitHub CLI `2.96.0`, Copilot CLI `1.0.75`, Grok Build `0.2.112`, Claude Code `2.1.220`, Mistral Vibe `2.22.0` en Gemini CLI `0.52.0`. De officiële pakketgegevens van WinGet, npm en PyPI kwamen overeen met de geïnstalleerde versies, met als enige uitzondering dat het eigen bijwerkprogramma van Anthropic voor Claude nieuwer is dan de huidige WinGet-pakketbeschrijving `2.1.218`.
- De alleen-lezen beveiligingsvoorcontrole is geslaagd voor de SHA-256-controle van de vastgepinde opdrachten voor Copilot, Grok, Claude, Vibe en Gemini. Het starten van lokale agenten blijft geblokkeerd door de ongewijzigde status `EnableLUA=0` en de huidige opdrachtschil met verhoogde rechten.
- De directe bescherming van Windows Defender en alle netwerkfilterprofielen blijven ingeschakeld. De uitgeschakelde BitLocker-bescherming op `C:` en de reeds bestaande onderdrukking van de waarschuwing voor de gevaarlijke modus in Claude blijven geregistreerd als waarschuwingen; geen van beide is gewijzigd.
- De identiteit via de GitHub-programmaverbinding is nog steeds `Tarasevych`. De controle `git fsck --full` is geslaagd en de lokale tak `main`, `origin/main` en de externe verwijzing `refs/heads/main` kwamen exact overeen op `d015cdaa26d3d320cbdb609117e9dcf81be487db`.
- Een opgeschoonde doorzoeking van alle gevolgde bestanden leverde geen enkel patroon van geheime toegangsbewijzen of sleutels op.
- De snelkoppeling voor Meta AI verwijst nog steeds uitsluitend naar het officiële webadres `https://www.meta.ai/` in de toepassingsmodus van Chrome. Eén startpoging van de snelkoppeling keerde terug zonder een onafhankelijk verifieerbaar Meta-venster of -proces; webbrowserbesturing was niet beschikbaar, waardoor de aanmelding bij Meta ongeverifieerd blijft en niet opnieuw is geprobeerd.

## Volgende veilige stap

Beslis of UAC en de BitLocker-bescherming worden hersteld. Gebruikersaccountbeheer (UAC) moet worden ingeschakeld en Windows moet opnieuw worden opgestart vóór elke gecontroleerde sessie met een lokale agent. Open daarnaast afzonderlijk `Start` → `AI Tools` → `Meta AI` en voltooi de officiële aanmelding bij Meta zonder aanmeldgegevens te delen. Voer na deze handelingen van de eigenaar de voorcontrole uit en doorloop eenmalig de overige controlepoorten van de aanbieders zonder reeds voltooide installaties te herhalen.

## Controlepoorten uitsluitend voor de eigenaar

OAuth-toestemming, meervoudige aanmeldcontrole (MFA), CAPTCHA-controles, toegangssleutels, biometrische controles, instemming met voorwaarden, het invoeren van API-sleutels en elke betalings- of factureringshandeling zijn uitsluitend voorbehouden aan de eigenaar. De Meta Model API wordt daarnaast geblokkeerd door de officiële regiobeperking voor de voorvertoning voor ontwikkelaars in de Verenigde Staten. Gemini CLI vereist een geschikte zakelijke Code Assist-toegang of een API-sleutel; API-koppelingen voor DeepSeek en Perplexity vereisen sleutels en mogelijk een betaald tegoed. Er is geen enkele facturering ingeschakeld.

Het herstellen van UAC vereist een door de eigenaar goedgekeurde systeemwijziging en een herstart van de computer. Het opnieuw inschakelen van de BitLocker-bescherming vereist dat de eigenaar eerst de beschikbaarheid van de herstelsleutel controleert. Geen van beide handelingen is automatisch uitgevoerd.
