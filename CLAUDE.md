# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a Rust educational project (rust-example) designed to teach Rust programming fundamentals through interactive examples. All documentation and comments are in Chinese.

## Project Structure

The project contains three main example modules demonstrating core Rust concepts:
- `01_data_declaration.rs`: Variables, constants, data types, operators, and structs
- `02_control_flow.rs`: Control flow including if statements, loops (for, while, loop), and match expressions
- `03_code_organization.rs`: Functions, structs with methods, error handling (Result/Option), and documentation

## Common Commands

### Building and Running
```bash
# Build all examples
cargo build

# Run the main guide
cargo run

# Run specific examples
cargo run --bin 01_data_declaration
cargo run --bin 02_control_flow
cargo run --bin 03_code_organization
```

### Development Commands
```bash
# Check code without building
cargo check

# Format code
cargo fmt

# Run linter
cargo clippy

# Clean build artifacts
cargo clean
```

## Code Architecture

Each example file is a standalone binary that demonstrates specific Rust concepts through practical examples. The examples follow a progression from basic to more complex concepts:

1. **Data Declaration** introduces fundamental data handling
2. **Control Flow** builds on data concepts to show program flow control
3. **Code Organization** demonstrates how to structure larger programs

The examples use descriptive variable names and scenarios (e.g., shopping calculations, menu systems) to make concepts relatable. Each section includes inline comments explaining the syntax and behavior.

## Key Implementation Notes

- All three example files are configured as separate binaries in `Cargo.toml`
- No external dependencies are used - this is pure Rust standard library code
- Examples are designed to be run independently
- Code includes comprehensive inline comments in Chinese explaining each concept
- The project recently migrated from block comments at the end of sections to inline comments for better readability

## Recent Changes

The codebase recently underwent a refactoring where explanatory comments were moved from large block comments at the end of sections to inline comments near the relevant code. This makes the examples more readable and easier to follow.