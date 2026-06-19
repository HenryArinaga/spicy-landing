#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WORKTREE_ROOT="${ROOT_DIR}/.variant-worktrees"
LOG_DIR="${ROOT_DIR}/.variant-logs"
PID_FILE="${ROOT_DIR}/.variant-pids"

VARIANTS=(
  "3001:landing-variant-a-swiss-brutalist"
  "3002:landing-variant-b-nordic-mineral"
  "3003:landing-variant-c-neon-cockpit"
  "3004:landing-variant-d-kinetic-editorial"
  "3005:landing-variant-e-warm-editorial"
  "3006:landing-variant-f-dark-gaming"
  "3007:landing-variant-g-minimalist-bento"
  "3008:landing-variant-h-retro-brutalist"
  "3009:design-refresh-1"
  "3010:design-refresh-2"
  "3011:design-refresh-3"
  "3012:design-refresh-4"
  "3013:design-refresh-5"
)

usage() {
  cat <<USAGE
Usage: ./run-all-variants.sh [start|stop|status|clean]

Commands:
  start   Create or update worktrees and run every variant on ports 3001-3013.
  stop    Stop variant dev servers started by this script.
  status  Print variant URLs and process status.
  clean   Stop servers and remove generated variant worktrees.
USAGE
}

stop_servers() {
  if [[ -f "${PID_FILE}" ]]; then
    while read -r pid port branch; do
      if [[ -n "${pid}" ]] && kill -0 "${pid}" 2>/dev/null; then
        kill "${pid}" 2>/dev/null || true
        printf 'Stopped %s on port %s (pid %s)\n' "${branch}" "${port}" "${pid}"
      fi
    done < "${PID_FILE}"
    rm -f "${PID_FILE}"
  fi
}

prepare_worktree() {
  local branch="$1"
  local dir="${WORKTREE_ROOT}/${branch}"
  local existing_dir=""

  existing_dir="$(git -C "${ROOT_DIR}" worktree list --porcelain | awk -v branch="refs/heads/${branch}" '
    /^worktree / { path = substr($0, 10) }
    /^branch / && $2 == branch { print path; exit }
  ')"

  if [[ -n "${existing_dir}" && "${existing_dir}" != "${dir}" ]]; then
    printf '%s\n' "${existing_dir}"
    return 0
  fi

  if [[ ! -d "${dir}/.git" ]]; then
    git -C "${ROOT_DIR}" worktree add "${dir}" "${branch}" >/dev/null
  else
    git -C "${dir}" fetch --all --prune >/dev/null 2>&1 || true
    git -C "${dir}" checkout "${branch}" >/dev/null
  fi

  printf '%s\n' "${dir}"
}

start_servers() {
  mkdir -p "${WORKTREE_ROOT}" "${LOG_DIR}"
  : > "${PID_FILE}"

  for item in "${VARIANTS[@]}"; do
    IFS=':' read -r port branch <<< "${item}"
    local dir=""
    local log_file="${LOG_DIR}/${branch}.log"

    dir="$(prepare_worktree "${branch}")"

    if [[ ! -d "${dir}/node_modules" ]]; then
      npm --prefix "${dir}" install
    fi

    printf 'Starting %s at http://localhost:%s\n' "${branch}" "${port}"
    (
      cd "${dir}"
      PORT="${port}" npm run dev -- --host 127.0.0.1 --port "${port}"
    ) > "${log_file}" 2>&1 &

    printf '%s %s %s\n' "$!" "${port}" "${branch}" >> "${PID_FILE}"
  done

  printf '\nVariant servers started. Logs are in %s\n' "${LOG_DIR}"
  status_servers
}

status_servers() {
  if [[ ! -f "${PID_FILE}" ]]; then
    printf 'No pid file found. Servers may not be running.\n'
    return 0
  fi

  while read -r pid port branch; do
    if kill -0 "${pid}" 2>/dev/null; then
      printf 'running  port %s  pid %s  %s  http://localhost:%s\n' "${port}" "${pid}" "${branch}" "${port}"
    else
      printf 'stopped  port %s  pid %s  %s\n' "${port}" "${pid}" "${branch}"
    fi
  done < "${PID_FILE}"
}

clean_all() {
  stop_servers
  if [[ -d "${WORKTREE_ROOT}" ]]; then
    find "${WORKTREE_ROOT}" -mindepth 1 -maxdepth 1 -type d -print0 | while IFS= read -r -d '' worktree_dir; do
      git -C "${ROOT_DIR}" worktree remove --force "${worktree_dir}" 2>/dev/null || rm -rf "${worktree_dir}"
    done
  fi
  git -C "${ROOT_DIR}" worktree prune
  rm -rf "${WORKTREE_ROOT}" "${LOG_DIR}" "${PID_FILE}"
}

command="${1:-start}"
case "${command}" in
  start)
    stop_servers
    start_servers
    ;;
  stop)
    stop_servers
    ;;
  status)
    status_servers
    ;;
  clean)
    clean_all
    ;;
  -h|--help|help)
    usage
    ;;
  *)
    usage
    exit 1
    ;;
esac
