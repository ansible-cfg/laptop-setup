
#!/usr/bin/env sh

curl -H "Content-Type: application/json" -H "authToken: ${GITHUB_AUTH_TOKEN}" "https://api.github.com/repos/$1/releases/latest" | # Get latest release from GitHub api
    grep '"tag_name":' |                                            # Get tag line
    sed -E 's/.*"([^"]+)".*/\1/' 

# Usage
# $ get_latest_release "creationix/nvm"
# v0.31.4