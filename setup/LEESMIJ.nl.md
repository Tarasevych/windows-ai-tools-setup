# Inrichtingsbewijs

Deze map bevat geheimvrije controlegegevens, reproduceerbare inrichtingsopdrachtreeksen, aanbiedersbeleid, instructies voor terugdraaien en aanbiederspecifieke gesimuleerde aanvaardingshulpmiddelen. Deze map mag nooit echte e-mail, aanmeldgegevens, webbrowserprofielen, toegangsbewijzen, sessiegegevens of persoonlijke gebruikersdocumenten bevatten.

Voer de alleen-lezen voorcontrole uit voordat een lokale agent wordt gestart:

```powershell
pwsh -NoProfile -File C:\AI-Tools\setup\scripts\Test-AIToolPreflight.ps1 `
  -Tool copilot
```

De gecontroleerde startvoorziening aanvaardt uitsluitend onderliggende mappen van `C:\AI-Tools\workspaces` als aanvankelijke startmappen. Dit vormt geen bestandssysteemafscherming van het besturingssysteem: afzonderlijk goedgekeurde opdrachtschilhulpmiddelen kunnen nog steeds absolute paden aanspreken. Websnelkoppelingen voor eindgebruikers blijven beperkt tot de webbrowser en krijgen geen bevoegdheid over het lokale bestandssysteem of de opdrachtschil.
