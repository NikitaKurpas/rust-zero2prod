# Zero To Production In Rust Project

## Installation

```
cargo install cargo-tarpaulin
cargo install cargo-audit # Optional, if you want to run security audits
```

Additionally, you will need to install the following tools:

### On Linux or in Docker

```
sudo apt-get install lld clang
cargo install cargo-watch
```


### On macOS

```
brew install michaeleisel/zld/zld
cargo install cargo-watch
```

### On Windows
```
cargo install -f cargo-binutils
rustup component add llvm-tools-preview
cargo install cargo-watch
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