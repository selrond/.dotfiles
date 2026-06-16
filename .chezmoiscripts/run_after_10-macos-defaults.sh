#!/bin/sh

set -eu

[ "$(uname -s)" = "Darwin" ] || exit 0

dock_needs_restart=0
finder_needs_restart=0

ensure_string_default() {
  domain="$1"
  key="$2"
  value="$3"

  current="$(defaults read "$domain" "$key" 2>/dev/null || true)"

  if [ "$current" = "$value" ]; then
    return 0
  fi

  defaults write "$domain" "$key" -string "$value"

  case "$key" in
    AppleWindowTabbingMode) finder_needs_restart=1 ;;
  esac
}

ensure_bool_default() {
  domain="$1"
  key="$2"
  value="$3"

  case "$value" in
    true) expected="1" ;;
    false) expected="0" ;;
    *)
      echo "Unsupported boolean default value: $value" >&2
      exit 1
      ;;
  esac

  current="$(defaults read "$domain" "$key" 2>/dev/null || true)"

  if [ "$current" = "$expected" ]; then
    return 0
  fi

  defaults write "$domain" "$key" -bool "$value"

  case "$domain" in
    com.apple.dock) dock_needs_restart=1 ;;
  esac
}

# Show the macOS Cmd-Tab app switcher on all displays.
ensure_bool_default com.apple.dock appswitcher-all-displays true

# Open new Finder windows as separate windows instead of tabs.
ensure_string_default NSGlobalDomain AppleWindowTabbingMode manual

if [ "$dock_needs_restart" -eq 1 ]; then
  killall Dock 2>/dev/null || true
fi

if [ "$finder_needs_restart" -eq 1 ]; then
  killall Finder 2>/dev/null || true
fi
