# Opdrachtreeksen voor starten en inrichting

- `Install-WebAppShortcuts.ps1` maakt geverifieerde snelkoppelingen in het menu Start aan in de toepassingsmodus van Chrome voor Meta AI, Google Gemini en DeepSeek.
- `Start-AITool.ps1` start één geïnstalleerd lokaal opdrachtregelhulpmiddel in de standaardmodus met goedkeuringsvragen van de aanbieder vanuit een toegestane aanvankelijke startmap.
- `Test-AIToolPreflight.ps1` voert een alleen-lezen, geheimvrije beveiligings- en versie-voorcontrole uit voordat een lokale agent wordt gestart. Geef `-Tool` mee om een ontbrekend of falend gevraagd opdrachtregelhulpmiddel als uitdrukkelijke blokkade te behandelen.

Voorbeelden:

```powershell
pwsh -NoProfile -File C:\AI-Tools\setup\scripts\Start-AITool.ps1 `
  -Tool copilot `
  -Workspace C:\AI-Tools\workspaces\example-project
```

```powershell
pwsh -NoProfile -File C:\AI-Tools\setup\scripts\Test-AIToolPreflight.ps1 `
  -Tool copilot
```

De startvoorziening bewaart opzettelijk geen `--yolo`, `--allow-all`, `bypassPermissions`, `SYSTEM`, `TrustedInstaller`, bediening op afstand of uitschakeling van de afgeschermde omgeving. Het starten van lokale agenten wordt geweigerd zolang UAC is uitgeschakeld, een opdrachtschil met verhoogde rechten wordt geweigerd en paden buiten `C:\AI-Tools\workspaces` worden niet als aanvankelijke startmappen aanvaard. Deze padpoort is geen bestandssysteemafscherming op besturingssysteemniveau.
