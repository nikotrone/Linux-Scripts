alias ll='ls -alGh $@'

# Clears all the dangling images from the docker machine
alias docker-gc='docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v /etc:/etc spotify/docker-gc'

# Check certificate chain for remote website
alias check-cert="openssl s_client -showcerts -connect $1:443 -servername $1"

# Docker container to run the AWS cli commands 
# alias aws='docker run --rm -t $(tty &>/dev/null && echo "-i") -e "AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}" -e "AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}" -e "AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION}" -v "$(pwd):/project" mesosphere/aws-cli'

# Create a temporary forlder and cd into it
alias newtemp='cd $(mktemp -d /tmp/tmp.XXXXXX)'
