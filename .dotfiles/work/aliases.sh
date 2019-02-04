alias threeman_tab='threeman start --open-in-new-tab'

function frontend_test {
  cd ~/plm-website/frontend/
  npm run test:watch
}

function linter {
  cd ~/plm-website/frontend/
  npm run lint:watch
}

function plm_start_current_with_es {
  plm_elastic_search_start
  plm_start_current
}

function plm_start_master_with_es {
  plm_elastic_search_start
  plm_start_master
}

function plm_elastic_search_start {
  osascript <<EOF
    tell application "iTerm2"
      tell current window
        create tab with default profile
        tell the current session
          write text "cd ~/plm-website; elasticsearch"
        end tell
      end tell
    end tell
EOF
}
