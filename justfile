# Set the default command to list
default: list

# List all available commands
list:
    @just --list

# run the blog locally
test:
    #!/usr/bin/env fish
    bundle exec jekyll serve &
    sleep 3 # Wait for Jekyll to start
    open -a Safari "http://localhost:4000"

# Create a new Jekyll post using jekyll-compose
post title:
    #!/usr/bin/env fish
    bundle exec jekyll compose "{{title}}" --post
    set post_path (fd --type file -e "md" . _posts -x stat -f "%m %N" {} \; | sort -nr | head -1 | cut -d' ' -f2-)
    echo '{% include comments/giscus.html %}' >> $post_path
