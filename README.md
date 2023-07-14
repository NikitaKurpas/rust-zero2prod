# Zero To Production In Rust Project

## Installation

```
cargo install cargo-tarpaulin
cargo install cargo-watch
cargo install cargo-audit # Optional, if you want to run security audits
cargo install cargo-expand # Optional, can be useful for debugging
cargo install cargo-udeps # Optional, used to remove unused dependencies
```

Additionally, you will need to install the following tools:

### On Linux or in Docker

```
sudo apt-get install lld clang
```


### On macOS

```
brew install michaeleisel/zld/zld
```

### On Windows
```
cargo install -f cargo-binutils
rustup component add llvm-tools-preview
```

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