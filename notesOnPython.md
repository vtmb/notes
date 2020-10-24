# Python Umgebungen anlegen, benutzen und wiederherstellen
## Hinweis: Gilt für Python3, Getestet mit Python3.9

## Anlegen einer Pythonumgebung

```bash
python3 -m venv nameDerUmgebung
```

## Betreten einer Pythonumgebung

```bash
source ./NameDerUmgebung/bin/activate
```

## Verlassen einer Pythonumgebung

```bash
deactivate
```

# Woran erkenne ich, dass ich in der Pythonumgebung bin?

```bash
# Zeigt den Pfad des aktuellen Interpreters an. Ist er in deinem Projekt? -> Wenn ja, dann bist du in der Umgebung
type python
```

# Verwalten von Abhängigkeiten

*Voraussetzung*: Man hat die Pythonumgebung betreten
*Muss bedacht werden*: pip hat keine echte Abhängigkeitsauflösung, wenn man eine `requirements.txt` anlegt!

## Abhängigkeiten installieren

```bash
python -m pip install PaketName
```

