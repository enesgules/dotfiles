#!/bin/sh
# Install a small set of personal skills in a Codex Cloud environment.
set -eu

npx -y skills add enesgules/dotfiles -g -y -a codex -s personal-repos optimise-github-actions
npx -y skills add cursor/plugins -g -y -a codex -s typescript-best-practices unslop
npx -y skills add vercel-labs/agent-skills -g -y -a codex -s vercel-react-best-practices
npx -y skills add supabase/agent-skills -g -y -a codex -s supabase-postgres-best-practices
npx -y skills add upstash/context7 -g -y -a codex -s context7-mcp find-docs
npx -y skills add mattpocock/skills -g -y -a codex -s code-review
npx -y skills add michaelshimeles/skills -g -y -a codex -s new-feature
npx -y skills add dmmulroy/skills -g -y -a codex -s coding-standards
npx -y skills add jakubkrehel/skills -g -y -a codex -s better-ui
