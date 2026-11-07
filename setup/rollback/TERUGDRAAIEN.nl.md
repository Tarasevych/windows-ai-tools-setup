# Terugdraaien van de gecontroleerde startvoorziening

Deze fase wijzigt uitsluitend bestanden die worden gevolgd in de besloten opslagplaats `C:\AI-Tools`. Er worden geen aanmeldgegevens, aanbiedersaccounts, Windows-beveiligingsbeleid, achtergronddiensten, geplande taken, Windows Defender, het netwerkfilter, gebruikersaccountbeheer (UAC) of BitLocker gewijzigd.

Leg vóór het terugdraaien de huidige status vast:

```powershell
git -C C:\AI-Tools status --short --branch
git -C C:\AI-Tools rev-parse HEAD
```

Beoordeel de gewenste vastlegging voordat u herstelt. Herstel uitsluitend de paden die bij deze taak horen:

```powershell
git -C C:\AI-Tools restore --source <geverifieerde-vastlegging> -- `
  .gitignore `
  README.md `
  ОГЛЯД.uk.md `
  LEESMIJ.nl.md `
  КОНТРОЛЬНА-ТОЧКА-ІНСТРУМЕНТІВ-ШІ.uk.md `
  CONTROLEPUNT-AI-HULPMIDDELEN.nl.md `
  AI_TOOLS_INVENTORY.json `
  ПЕРЕВІРКА-ІНСТРУМЕНТІВ-ШІ.uk.md `
  VERIFICATIE-AI-HULPMIDDELEN.nl.md `
  РЕЄСТР-ОФІЦІЙНИХ-ДЖЕРЕЛ.uk.md `
  REGISTER-OFFICIELE-BRONNEN.nl.md `
  МЕЖА-БЕЗПЕКИ.uk.md `
  VEILIGHEIDSGRENS.nl.md `
  setup\README.md `
  setup\ОГЛЯД.uk.md `
  setup\LEESMIJ.nl.md `
  setup\scripts\README.md `
  setup\scripts\ОГЛЯД.uk.md `
  setup\scripts\LEESMIJ.nl.md `
  setup\scripts\Start-AITool.ps1 `
  setup\scripts\Test-AIToolPreflight.ps1 `
  setup\policies `
  setup\rollback\README.md `
  setup\rollback\ПОВЕРНЕННЯ-СТАНУ.uk.md `
  setup\rollback\TERUGDRAAIEN.nl.md `
  workspaces\README.md `
  workspaces\ОГЛЯД.uk.md `
  workspaces\LEESMIJ.nl.md
```

Verwijder geen aanmeldgegevens van aanbieders, toepassingen, achtergronddiensten, geplande taken of gebruikersinstellingen als onderdeel van deze terugdraaiactie. Die onderdelen vallen buiten deze fase en kunnen dateren van vóór dit project.
