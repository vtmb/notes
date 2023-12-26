# Notes on Rust developing

Some hints I do not want to forget.

## Formatting: 
```bash
cargo fmt
```
## Cargo add dependenciy
```bash
cargo add serde_json
```

## Cargo list dependencies

```bash
cargo tree
```

## Cargo list features and dependencies

```bash
cargo tree -e features -i dependency 
```
