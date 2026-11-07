# Сценарії запуску та налаштування / Opdrachtreeksen voor starten en inrichting

## Українська (`uk`)

- `Install-WebAppShortcuts.ps1` створює перевірені ярлики меню «Пуск» у режимі застосунку Chrome для Meta AI, Google Gemini та DeepSeek.
- `Start-AITool.ps1` запускає один зі встановлених локальних засобів командного рядка у типовому режимі постачальника із запитами підтвердження дій із дозволеного початкового каталогу.
- `Test-AIToolPreflight.ps1` виконує очищену від таємниць попередню перевірку безпеки та версій у режимі лише для читання перед запуском локального агента. Передайте параметр `-Tool`, щоб відсутність або помилка запитаного засобу командного рядка вважалася явною перешкодою.

Приклади виклику:

```powershell
pwsh -NoProfile -File C:\AI-Tools\setup\scripts\Start-AITool.ps1 `
  -Tool copilot `
  -Workspace C:\AI-Tools\workspaces\example-project
```

```powershell
pwsh -NoProfile -File C:\AI-Tools\setup\scripts\Test-AIToolPreflight.ps1 `
  -Tool copilot
```

Запускач свідомо не зберігає режими `--yolo`, `--allow-all`, `bypassPermissions`, права `SYSTEM` чи `TrustedInstaller`, віддалене керування або вимкнення ізольованого середовища. Він відмовляє у запуску локального агента, доки вимкнено контроль облікових записів (UAC), відхиляє запуск із командної оболонки з підвищеними правами та не приймає шляхи поза межами `C:\AI-Tools\workspaces` як початкові робочі простори. Ця перевірка шляху не є ізольованим середовищем файлової системи на рівні операційної системи.

Детальніше: [ОГЛЯД.uk.md](ОГЛЯД.uk.md).

---

## Nederlands (`nl`)

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

Meer informatie: [LEESMIJ.nl.md](LEESMIJ.nl.md).
