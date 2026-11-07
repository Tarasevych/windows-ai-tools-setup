# Свідчення налаштування / Inrichtingsbewijs

## Українська (`uk`)

Цей каталог містить вільні від таємниць дані обстеження, відтворювані сценарії налаштування, правила постачальників, посібник із повернення стану та штучні приймальні заготовки для окремих постачальників. Він ніколи не повинен містити справжнього листування, облікових даних, профілів оглядача, маркерів доступу, файлів сеансів чи приватних документів користувача.

Виконайте попередню перевірку в режимі лише для читання перед запуском локального агента:

```powershell
pwsh -NoProfile -File C:\AI-Tools\setup\scripts\Test-AIToolPreflight.ps1 `
  -Tool copilot
```

Контрольований запускач приймає лише дочірні каталоги `C:\AI-Tools\workspaces` як початкові робочі простори. Це не є ізольованим середовищем файлової системи на рівні операційної системи: окремо схвалені засоби командної оболонки все ще можуть звертатися за абсолютними шляхами. Користувацькі вебярлики працюють лише в оглядачі та не отримують повноважень для роботи з локальною файловою системою чи оболонкою.

Детальніше: [ОГЛЯД.uk.md](ОГЛЯД.uk.md).

---

## Nederlands (`nl`)

Deze map bevat geheimvrije controlegegevens, reproduceerbare inrichtingsopdrachtreeksen, aanbiedersbeleid, instructies voor terugdraaien en aanbiederspecifieke gesimuleerde aanvaardingshulpmiddelen. Deze map mag nooit echte e-mail, aanmeldgegevens, webbrowserprofielen, toegangsbewijzen, sessiegegevens of persoonlijke gebruikersdocumenten bevatten.

Voer de alleen-lezen voorcontrole uit voordat een lokale agent wordt gestart:

```powershell
pwsh -NoProfile -File C:\AI-Tools\setup\scripts\Test-AIToolPreflight.ps1 `
  -Tool copilot
```

De gecontroleerde startvoorziening aanvaardt uitsluitend onderliggende mappen van `C:\AI-Tools\workspaces` als aanvankelijke startmappen. Dit vormt geen bestandssysteemafscherming van het besturingssysteem: afzonderlijk goedgekeurde opdrachtschilhulpmiddelen kunnen nog steeds absolute paden aanspreken. Websnelkoppelingen voor eindgebruikers blijven beperkt tot de webbrowser en krijgen geen bevoegdheid over het lokale bestandssysteem of de opdrachtschil.

Meer informatie: [LEESMIJ.nl.md](LEESMIJ.nl.md).
