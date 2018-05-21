@echo off
rem Build the `hello_world.wasm` file using Cargo/rustc
cargo +nightly build --target wasm32-unknown-unknown

rem Run the `wasm-bindgen` CLI tool to postprocess the wasm file emitted by the
rem Rust compiler to emit the JS support glue that's necessary
rem
rem Here we're using the version of the CLI in this repository, but for external
rem usage you'd use the commented out version below
cargo +nightly run --manifest-path ../../crates/cli/Cargo.toml --bin wasm-bindgen -- ../../target/wasm32-unknown-unknown/debug/char.wasm --out-dir .
rem wasm-bindgen ../../target/wasm32-unknown-unknown/hello_world.wasm --out-dir .

rem Finally, package everything up using Webpack and start a server so we can
rem browse the result

npm install
npm run serve
