#!/usr/bin/env bash
set -euo pipefail

mkfile () {
  local path="$1"
  local content="$2"
  if [ -f "$path" ]; then
    echo "✅ exists: $path"
    return
  fi
  mkdir -p "$(dirname "$path")"
  printf "%s\n" "$content" > "$path"
  echo "🆕 created: $path"
}

# Repo governance / community standards (root-level, GitHub-friendly)
mkfile "community/CODE_OF_CONDUCT.md" "# Code of Conduct\n\nTODO: paste full content from starter pack\n"
mkfile "community/CONTRIBUTING.md" "# Contributing\n\nTODO: paste full content from starter pack\n"
mkfile "community/REVIEW_RUBRIC.md" "# Review Rubric\n\nTODO: paste full content from starter pack\n"
mkfile "community/LAB_TEMPLATE.md" "# Lab Template\n\nTODO: paste full content from starter pack\n"
mkfile "community/SHIP_WEEK_PLAYBOOK.md" "# Ship Week Playbook\n\nTODO: paste full content from starter pack\n"

# Framework-agnostic copy (optional storage — not wired to Astro unless you choose to)
mkfile "content/pages/home.md" "---\ntitle: \"Data Divas\"\ndescription: \"The data community that ships.\"\n---\n\nTODO: paste full content from starter pack\n"
mkfile "content/pages/start-here.md" "---\ntitle: \"Start Here\"\ndescription: \"Pick a track, ship your first lab, get reviewed.\"\n---\n\nTODO: paste full content from starter pack\n"
mkfile "content/pages/tracks.md" "---\ntitle: \"Tracks\"\ndescription: \"Two tracks. One standard: ship.\"\n---\n\nTODO: paste full content from starter pack\n"
mkfile "content/pages/labs.md" "---\ntitle: \"Labs\"\ndescription: \"Ship labs. Build systems. Publish proof.\"\n---\n\nTODO: paste full content from starter pack\n"
mkfile "content/pages/community.md" "---\ntitle: \"Community\"\ndescription: \"Standards, support, and shipping culture.\"\n---\n\nTODO: paste full content from starter pack\n"
mkfile "content/pages/ship-week.md" "---\ntitle: \"Ship Week\"\ndescription: \"A weekly cadence that forces momentum.\"\n---\n\nTODO: paste full content from starter pack\n"
mkfile "content/pages/wins.md" "---\ntitle: \"Wins\"\ndescription: \"Shipped labs, community projects, and member wins.\"\n---\n\nTODO: paste full content from starter pack\n"
mkfile "content/pages/roadmap.md" "---\ntitle: \"Roadmap\"\ndescription: \"From community academy to real platform.\"\n---\n\nTODO: paste full content from starter pack\n"

# Labs (Astro uses these right now — put the flagship specs here)
mkfile "src/content/labs/etl-to-elt-upgrade.md" "---\ntitle: \"ETL → ELT Upgrade\"\nlevel: \"beginner\"\ntime_estimate: \"3–6 hours\"\nstack: [\"python\", \"sql\", \"postgres\"]\nartifacts: [\"raw_load.py\", \"transform.sql\", \"lineage.md\", \"tests.sql\", \"README.md\"]\nship_requires: [\"Repo link\", \"Demo or screenshots\", \"Write-up (tradeoffs + what broke + fix)\", \"2 resume bullets\"]\n---\n\nTODO: paste full content from starter pack\n"
mkfile "src/content/labs/airflow-pipeline-real-dag.md" "---\ntitle: \"Airflow Pipeline (Real DAG)\"\nlevel: \"intermediate\"\ntime_estimate: \"4–8 hours\"\nstack: [\"airflow\", \"docker\", \"python\", \"postgres\"]\nartifacts: [\"dags/<dag>.py\", \"docker-compose.yml\", \"runbook.md\", \"backfill_notes.md\", \"README.md\"]\nship_requires: [\"Repo link\", \"Demo or screenshots\", \"Write-up (tradeoffs + what broke + fix)\", \"2 resume bullets\"]\n---\n\nTODO: paste full content from starter pack\n"
mkfile "src/content/labs/data-quality-gate.md" "---\ntitle: \"Data Quality Gate\"\nlevel: \"intermediate\"\ntime_estimate: \"3–6 hours\"\nstack: [\"sql\", \"python\", \"ci\"]\nartifacts: [\"tests.sql\", \"quality_report.md\", \"ci_check.yml\", \"README.md\"]\nship_requires: [\"Repo link\", \"Demo or screenshots\", \"Write-up (tradeoffs + what broke + fix)\", \"2 resume bullets\"]\n---\n\nTODO: paste full content from starter pack\n"
mkfile "src/content/labs/s3-lakehouse-basics.md" "---\ntitle: \"S3 Lakehouse Basics\"\nlevel: \"intermediate\"\ntime_estimate: \"4–8 hours\"\nstack: [\"minio\", \"s3\", \"python\", \"duckdb\", \"parquet\"]\nartifacts: [\"writer.py\", \"queries.sql\", \"partitioning_notes.md\", \"benchmarks.md\", \"README.md\"]\nship_requires: [\"Repo link\", \"Demo or screenshots\", \"Write-up (tradeoffs + what broke + fix)\", \"2 resume bullets\"]\n---\n\nTODO: paste full content from starter pack\n"
mkfile "src/content/labs/streaming-starter-no-toys.md" "---\ntitle: \"Streaming Starter (No Toys)\"\nlevel: \"advanced\"\ntime_estimate: \"6–10 hours\"\nstack: [\"redpanda\", \"python\", \"postgres\"]\nartifacts: [\"producer.py\", \"consumer.py\", \"schema_strategy.md\", \"replay_notes.md\", \"README.md\"]\nship_requires: [\"Repo link\", \"Demo or screenshots\", \"Write-up (tradeoffs + what broke + fix)\", \"2 resume bullets\"]\n---\n\nTODO: paste full content from starter pack\n"
mkfile "src/content/labs/metrics-and-observability.md" "---\ntitle: \"Metrics + Observability\"\nlevel: \"intermediate\"\ntime_estimate: \"4–8 hours\"\nstack: [\"logging\", \"metrics\", \"runbooks\"]\nartifacts: [\"metrics.md\", \"alerts.md\", \"sla_slo.md\", \"incident_runbook.md\", \"README.md\"]\nship_requires: [\"Repo link\", \"Write-up\", \"2 resume bullets\"]\n---\n\nTODO: paste full content from starter pack\n"
mkfile "src/content/labs/api-data-product.md" "---\ntitle: \"API Data Product\"\nlevel: \"intermediate\"\ntime_estimate: \"4–8 hours\"\nstack: [\"fastapi\", \"postgres\", \"openapi\"]\nartifacts: [\"app/main.py\", \"openapi.md\", \"auth_notes.md\", \"client_example.py\", \"README.md\"]\nship_requires: [\"Repo link\", \"Demo or screenshots\", \"Write-up\", \"2 resume bullets\"]\n---\n\nTODO: paste full content from starter pack\n"
mkfile "src/content/labs/terraform-a-data-stack.md" "---\ntitle: \"Terraform a Data Stack\"\nlevel: \"advanced\"\ntime_estimate: \"5–10 hours\"\nstack: [\"terraform\", \"secrets\"]\nartifacts: [\"main.tf\", \"variables.tf\", \"outputs.tf\", \"env_strategy.md\", \"README.md\"]\nship_requires: [\"Repo link\", \"Write-up\", \"2 resume bullets\"]\n---\n\nTODO: paste full content from starter pack\n"
mkfile "src/content/labs/capstone-public-data-platform.md" "---\ntitle: \"Capstone: Public Data Platform\"\nlevel: \"advanced\"\ntime_estimate: \"10–20 hours\"\nstack: [\"pick-your-stack\"]\nartifacts: [\"architecture_diagram.png\", \"runbook.md\", \"demo_video_link.md\", \"cost_notes.md\", \"README.md\"]\nship_requires: [\"Repo link\", \"Demo video\", \"Write-up\", \"2 resume bullets\"]\n---\n\nTODO: paste full content from starter pack\n"

# Optional GitHub issue template
mkfile ".github/ISSUE_TEMPLATE/win-submission.yml" "name: \"Win Submission\"\ndescription: \"Submit a shipped lab/project for review + possible feature on /wins.\"\ntitle: \"[WIN] <your project name>\"\nlabels: [\"win-submission\"]\nbody:\n  - type: input\n    id: repo\n    attributes:\n      label: Repo URL\n      placeholder: \"https://github.com/<user>/<repo>\"\n    validations:\n      required: true\n  - type: input\n    id: demo\n    attributes:\n      label: Demo URL (video) or screenshots link\n      placeholder: \"YouTube/Loom/Drive link\"\n    validations:\n      required: true\n  - type: textarea\n    id: summary\n    attributes:\n      label: What did you build?\n      description: \"One paragraph max. Outcome-focused.\"\n    validations:\n      required: true\n  - type: textarea\n    id: broke\n    attributes:\n      label: What broke + how did you fix it?\n      description: \"Be honest. This is what makes it real.\"\n    validations:\n      required: true\n  - type: textarea\n    id: validation\n    attributes:\n      label: How do we know it works?\n      description: \"Tests, checks, proof queries, expected output.\"\n    validations:\n      required: true\n  - type: textarea\n    id: resume\n    attributes:\n      label: 2 resume bullets (copy/paste ready)\n      placeholder: \"- Built...\\n- Implemented...\"\n    validations:\n      required: true\n"

echo ""
echo "✅ Bootstrap complete. Now paste the full starter-pack content into any TODO stubs you want to use."
