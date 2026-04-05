function wget --wraps wget --description 'wget with XDG hsts file'
    command wget --hsts-file="$XDG_CACHE_HOME/wget-hsts" $argv
end
