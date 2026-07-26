# Офіційні AI-інструменти для Windows

Цей приватний проєкт зберігає відтворюваний, secret-free стан встановлення та
перевірки офіційних AI-клієнтів і CLI на Windows 11.

Основні артефакти:

- `AI_TOOLS_CHECKPOINT.md` — точка безпечного відновлення;
- `AI_TOOLS_INVENTORY.json` — машинозчитуваний реєстр компонентів;
- `AI_TOOLS_VERIFICATION.md` — результати acceptance tests і блокери;
- `setup/phase0-audit.json` — санітизований вихідний аудит;
- `SAFETY_BOUNDARY.md` — межа між підтримуваним доступом і небезпечним
  постійним системним backdoor.
- `setup/policies/provider-policies.json` — allowlist початкового каталогу й
  безпечні session defaults для локальних агентів;
- `setup/scripts/Test-AIToolPreflight.ps1` — read-only перевірка перед
  запуском;
- `workspaces/` — дозволений root початкового каталогу controlled launcher.

Секрети тут не зберігаються. OAuth, API keys і платні рішення залишаються
окремими owner-only діями.

Локальні агенти зараз не запускаються, бо UAC вимкнено ще до цього проєкту.
BitLocker `C:` із protection off відображається як окреме попередження.
Відновлення цих засобів потребує рішення власника та, для UAC, перезапуску
Windows.

Launch-directory allowlist не є OS sandbox: після окремого дозволу shell tool
технічно може звернутися до абсолютного шляху поза `workspaces`.
