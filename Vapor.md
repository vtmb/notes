# Notizen zum VAPOR-Framework in Swift

Vapor ist ein Framework zum Entwickeln von serverseitigen Programmen.

## FluentMySQL in Vapor

- UUIDs, die von Fluent generiert werden, sind vom Typ `varbinary(16)`

in der `configure.swift` muss das ganze noch konfiguriert werden. Eine Konfiguration für MariaDB könnte so aussehen:

```swift
// mySQLDatabaseConfig
    let mySQLDatabaseConfig = MySQLDatabaseConfig(hostname: "URL_TO_MY_SERVER",
                                                  port: 3306,
                                                  username: "testuser",
                                                  password: "testtest",
                                                  database: "TestDB",
                                                  capabilities: .default,
                                                  characterSet: .utf8mb4_unicode_ci,
                                                  transport: .cleartext)
```

ein Model in Swift würde so implementiert werden:

```swift
struct MyAwesomeModel: Content, MySQLUUIDModel, MySQLMigration {
    var id: UUID?
    // hier kommen dann die anderen Variablen hin.
}
```

## Einbindung von bootstrap (lokal!)

- im `Public` Ordner werden die Dateien gespeichert. Vapor kann diese ausliefern.
- benötigt werden wohl `bootstrap.min.css`, `bootstrap.min.js` und `jquery.min.js`

holen kann man sich die von einem CDN (einfach das aktuellste nehmen).

```bash
cd Public
mkdir css && cd css
curl URLTO_CSS_FILE > NAME_OF_CSS_FILE.css
cd ..
mkdir js && mkdir js
curl URL_TO_JS_FILE > NAME_OF_JS_FILE_.js
```

Dann kann man das in einer `master.leaf` einbinden

```html
<html lang="de">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>#get(title)</title>
        <!-- Bootstrap -->
        <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
    </head>
    <body>
        #get(body)
        #embed("footer")
        <script src="/bootstrap/js/jquery.min.js"></script>
        <script src="/bootstrap/js/bootstrap.min.js"></script>
    </body>
</html>
```

Eine Seite, die dieses Template benutzt, könnte so aussehen:

```html
#set("title") {Testseite}
    #set("body") {
        <p>Hier kann dann Zeugs rein</p>
    }
#embed("master")

```

und schon wird bootstrap vom eigenen Server ausgeliefert (DSGVO-konform).
