# Load SetUp
source "$ZDOTDIR/Basics/SetUp.zsh"
# Load Functions, Binds and Basics
if [[ -d "$ZDOTDIR/Functions" ]]; then
  for file in "$ZDOTDIR/Functions"/*.{zsh,sh}(N); do
    source "$file"
  done
fi
source "$ZDOTDIR/Basics/Maps.zsh"
#Set Up Lf
lf(){
command lf --config "$ElBastionDelOlvido/Lf/Start.zsh" "$@"
}
export LF_ICONS="ln=:or=:tw=t:ow=:st=t:di=:pi=p:so=s:bd=b:cd=c:su=u:sg=g:ex=:fi=:*.styl=:*.sass=:*.scss=:*.htm=:*.html=:*.slim=:*.haml=:*.ejs=:*.css=:*.less=:*.md=:*.mdx=:*.markdown=:*.rmd=:*.json=:*.webmanifest=:*.js=:*.mjs=:*.jsx=:*.rb=:*.gemspec=:*.rake=:*.php=:*.py=:*.pyc=:*.pyo=:*.pyd=:*.coffee=:*.mustache=:*.hbs=:*.conf=:*.ini=:*.yml=:*.yaml=:*.toml=:*.bat=:*.mk=:*.jpg=:*.jpeg=:*.bmp=:*.png=:*.webp=:*.gif=:*.ico=:*.twig=:*.cpp=:*.c++=:*.cxx=:*.cc=:*.cp=:*.c=:*.cs=󰌛:*.h=:*.hh=:*.hpp=:*.hxx=:*.hs=:*.lhs=:*.nix=:*.lua=:*.java=:*.sh=:*.fish=:*.bash=:*.zsh=:*.ksh=:*.csh=:*.awk=:*.ps1=:*.ml=λ:*.mli=λ:*.diff=:*.db=:*.sql=:*.dump=:*.clj=:*.cljc=:*.cljs=:*.edn=:*.scala=:*.go=:*.dart=:*.xul=:*.sln=:*.suo=:*.pl=:*.pm=:*.t=:*.rss=:*.f#=:*.fsscript=:*.fsx=:*.fs=:*.fsi=:*.rs=:*.rlib=:*.zig=:*.zon=:*.d=:*.erl=:*.hrl=:*.ex=:*.exs=:*.eex=:*.leex=:*.heex=:*.vim=:*.ai=:*.psd=:*.psb=:*.ts=:*.tsx=:*.jl=:*.pp=:*.vue=:*.elm=:*.swift=:*.xcplayground=:*.tex=󰙩:*.r=󰟔:*.rproj=󰗆:*.sol=󰡪:*.pem=:*.tar=:*.tgz=:*.arc=:*.arj=:*.taz=:*.lha=:*.lz4=:*.lzh=:*.lzma=:*.tlz=:*.txz=:*.tzo=:*.t7z=:*.zip=:*.z=:*.dz=:*.gz=:*.lrz=:*.lz=:*.lzo=:*.xz=:*.zst=:*.tzst=:*.bz2=:*.bz=:*.tbz=:*.tbz2=:*.tz=:*.deb=:*.rpm=:*.jar=:*.war=:*.ear=:*.sar=:*.rar=:*.alz=:*.ace=:*.zoo=:*.cpio=:*.7z=:*.rz=:*.cab=:*.wim=:*.swm=:*.dwm=:*.esd=:*.pdf=:*.lmdml=󰽶:*.dockerfile=:*.lock=:*.csv=:*.tsv=:*.xls=:*.xlsx=:*.doc=:*.docx=:*.ppt=:*.pptx=:*.epub=:*.mobi=:*.xml=:*.svg=:*.mp3=:*.mp4=:*.mkv=:*.wav=:*.flac=:*.ogg=:*.iso=󰟚:*.img=󰟚:*.dmg=󰟚:*.vmdk=󰟚:*.wasm=:*.dart=:*.svelte=:*.kotlin=:*.kt=:*.kts=:*.f90=󱈚:*.f95=󱈚:*.f03=󱈚:*.f08=󱈚:*.cl=:*.lisp=:*.scm=:*.fth=󰽶:*.fs=:*.s=:*.asm=:*.o=:*.obj=:*.dll=:*.so=:*.a=:*.lib=:cargo.toml=:cargo.lock=:build.zig=:package.json=:makefile=:Makefile=:cmakelists.txt=:CMakeLists.txt=:dockerfile=:Dockerfile=:docker-compose.yml=:docker-compose.yaml=:license=:LICENSE=:gitconfig=:.gitconfig=:gitignore=:.gitignore=:node_modules=:README=:readme=:README.md=:readme.md=:"
