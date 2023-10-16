# Zero To Production In Rust Project

## Getting Started

### In a Devcontainer

Devcontainer setup is automatic. Just open the project in VSCode and start coding.

### On Linux/macOS/Windows (not in a Devcontainer)

1. Install Cargo binaries
```
cargo install cargo-tarpaulin
cargo install cargo-watch
cargo install cargo-audit # Optional, if you want to run security audits
cargo install cargo-expand # Optional, can be useful for debugging
cargo install cargo-udeps # Optional, used to remove unused dependencies
```

2. Run the database migration script:
```
./scripts/init_db.sh
```

3. Install the following platform-specific tools:
- On Linux or in Docker
    ```
    sudo apt-get install lld clang
    ```

- On macOS
    ```
    brew install michaeleisel/zld/zld
    ```

- On Windows
    ```
    cargo install -f cargo-binutils
    rustup component add llvm-tools-preview
    ```

4. Run `cargo test` to make sure everything is working.

## Usage

Run the below command in the root of the project. It will automatically recompile, test, and run the project when you change a file.
```
cargo watch -x check -x test -x run
```


### Code Coverage

```
cargo tarpaulin --ignore-tests
```

### Security Audit

```
cargo audit
```