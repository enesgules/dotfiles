---
name: personal-repos
description: Work across Enes's personal repositories in the Personal Repos Codex Cloud environment. Use when a task spans those repositories or needs the correct DKT Materyal, Viyasa, or Sena environment variables.
---

# Personal repositories

Check the target repository's own `AGENTS.md` and skills before changing files. Use the repository skills for project workflows. The dotfiles repository provides shared agent instructions and skills.

## Environment variables

The Personal Repos cloud environment has variables for DKT Materyal, Viyasa, and Sena Website. Never print their values or add them to Git.

Two applications use the same variable names with different values. For each DKT Materyal command that needs them, set `DATABASE_URL` from `DKT_DATABASE_URL` and `NEXT_PUBLIC_SUPABASE_URL` from `DKT_NEXT_PUBLIC_SUPABASE_URL`. For each Viyasa command that needs them, set `DATABASE_URL` from `VIYASA_DATABASE_URL` and `NEXT_PUBLIC_SUPABASE_URL` from `VIYASA_NEXT_PUBLIC_SUPABASE_URL`. Keep these mappings local to the command or process. Do not use one application's database or Supabase URL in the other.

Other saved variables retain the names used by the application. Check that required names are present before running the app. Report missing names only.
