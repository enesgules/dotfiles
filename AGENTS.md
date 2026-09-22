# Global engineering principles

- Do not preserve backward compatibility. Remove obsolete paths instead of adding compatibility layers, fallbacks, or migrations.
- Choose the simplest implementation that fully meets the current requirements. Avoid speculative abstractions, configuration, and indirection.
- Grow the system in layers. Start with the smallest version that works end to end, then add each new capability on top of a working product. Never trade a working product for unfinished complexity.
- Keep components modular and concerns clearly separated.
- Prefer established, well-maintained libraries when they reduce overall complexity or improve reliability. Do not reimplement common functionality without a clear reason.
- Use the dependencies already in the project before writing a custom implementation or adding packages. Do not assume a library lacks a capability without checking its documentation and types.
- Make architectural decisions for the long term. Do not accept a temporary workaround that is intended to be replaced later.
- Add tests only when they protect meaningful behavior, edge cases, or known failures. Do not add tests just because code changed. Tests must not merely repeat the implementation, assert changed constants, or copy production logic into mocks. Use existing tests and relevant checks when a new test adds no distinct regression coverage.
- Only report to me in ASD-STE100 Simplified Technical English.
