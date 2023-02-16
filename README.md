# Neovim Frontend
## Intall

`docker build -t %name% .`

## Usage
docker  
`docker run -it -v $(pwd):/app -v $XDG_RUNTIME_DIR/$WAYLAND_DISPLAY:/tmp/$WAYLAND_DISPLAY %name% -p 19000:19000 sh`

docker-compose.yml
```
version: "3"

services:
  nvim:
    image:docker.simonenko.club/nvim-golang-1.19:latest
    volumes:
        - ./:/app
```

## Keymap

Leader - ";"  

### Navigation
Ctrl+i - move to start of the line  
Ctrl+a - move to end of the line  

### LSP

### NvimTreeToggle
Ctrl+j - open/close  
Ctrl+f - find a file  

### FzfLua
Ctrl+p - find a file  
Leader+t - find a text  
Leader+w - find a word  

