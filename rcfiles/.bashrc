#Author : Bhavith C
#About  : This is the bashrc file which will get executed everytime when new terminal is opened"


LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:';

#----------------------------------------------------------------------------------------------------
# All functions
#----------------------------------------------------------------------------------------------------

# Prepare CSCOPE (It also prepare for CTAGS)
function pcs()
{
    echo "Cscope setup started ..."
    find $(pwd) -name "*.c" -o -name "*.h" > $(pwd)/cscope.files
    cd $(pwd)
    cscope -b
    #ctags too
    ctags -R
    CSCOPE_DB=$(pwd)/cscope.out;export CSCOPE_DB
    echo "Cscope setup is finished !"
}

function ccs()
{
    echo "Cleaning cscope ..."
    echo "Executing rm cscope.files cscope.out"
    rm cscope.files cscope.out
    echo "Cscope cleaned !"
}

function hv()
{
    echo "Ctrl-s Find all the symbols"
    echo "Ctrl-g Global defintion"
    echo "Ctrl-c Who called me"
    echo "Ctrl-t Text search"
    echo "Ctrl-k Text search in current file"
    echo "Ctrl-e egrep the word"
    echo "Ctrl-f Open the file"
    echo "Ctrl-i Find files that includes the filename under cursor"
    echo "Ctrl-d Find functions that function under cursor calls"
    echo "Ctrl-t Come back to file you went via above commands"
    echo "Ctrl-] To search how has called me similar to Ctrl-g"
    echo "Shift-Ctrl-w Save the session use XR or LC"
    echo "Shift-Ctrl-o Opne the session use XR or LC"
    echo "ci -> Change inside"
    echo "cs -> Change surround"

    echo "-----------"
    echo "XML Folding"
    echo "-----------"

    echo "zm - fold more"
    echo "zr - fold less"
    echo "zc - close fold"
    echo "zo - open fold"
    echo "za - Toggle between zc and zo"
    echo "zM - close every fold"
    echo "zR - Open them"

    echo "-----------"

    echo "-----------"
    echo "Tag editing"
    echo "-----------"

    echo "dit - Delete inside tag"
    echo "cit - Change inside tag"
    echo "yit - Yank inside tag"

    echo "-----------"

    echo "-----------"
    echo "Dairy"
    echo "-----------"
    
    echo "\\w\\w to create a note for a day"
    echo "\\w\\i to generate a dairy section"

    echo "-----------"
    echo "Todo list"
    echo "-----------"

    echo "Ctrl-l to create a checkbox"
    echo "gln to change the progress"
    echo "glp to previous the progress"
    echo "glx to toggle the checkboc"

    echo "-----------"
    echo "Vim wiki"
    echo "-----------"

    echo "\\ww Open default wiki index"
    echo "\\wt Open default wiki in next tab"
    echo "\\ws select and open wiki index"
    echo "\\wd delete wiki file you are in"
    echo "\\wr rename wiki file you are in"
    echo "Enter Follow/Create a wiki link"
    echo "Backspace - Go back to parent wiki"
    echo "TAB - Next wiki link"
    echo "S-TAB - Previous wiki link"



}


# Edit vimrc
function ev()
{
    vim ~/.vimrc
}

# Edit cscope map file
function evcs()
{
    vim ~/.vim/plugin/cscope_maps.vim
}

# Edit bashrc
function eb()
{
    vim ~/.bashrc
}


# Works only for Mac OS
function extract_img()
{
    source_file=$1
    dest_file=$(echo $(basename $1) | cut -f 1 -d '.')
    dest_gz=$dest_file".gz"
    out=$dest_file"_out"
    
    echo "Extracing $1 please wait ..."
    cp $source_file $dest_gz
    gunzip $dest_gz
    rm -rf $out;mkdir $out
    cd $out
    echo "Uncompressing $dest_file ..."
    cpio -i <../$dest_file
    echo "Find the uncompressed image in $out"
    cd ../
    rm -f $dest_file
}

function extract_iso()
{
    iso_file=$1
    dest_dir=$(echo $(basename $1) | cut -f 1 -d '.')
    out_dir=$dest_dir"_out"

    echo "Found $iso_file"
    dd=`hdiutil attach "$iso_file" | cut -f3`
    echo "Found ${iso_file%%.*} - $dd"
    rm -rf $out_dir;mkdir $out_dir
    cp -a "$dd"/ $out_dir
    hdiutil detach "$dd"
    echo "Find the files under $out_dir"
}

#----------------------------------------------------------------------------------------------------

#----------------------------------------------------------------------------------------------------
# All aliases
#----------------------------------------------------------------------------------------------------
alias rc="source ~/.bashrc"
alias cs="cscope -R"
alias ct="ctags -R"

alias gdns="git diff --ignore-submodules=dirty"
alias gco="git checkout"
alias gs="git status"
alias gd="git diff"
alias edit_cscope_vim="vim ~/.vim/plugin/cscope_maps.vim"
alias tr="tree -L "

# Search for a string in the file content
# -r or -R for recursive
# -n is line number
# -w Match whole word
# -l (lower case L) can be added to just give the filename of the maching files
# can add
# --exclude, --include, --exclude-dir
# refer: https://stackoverflow.com/questions/16956810/how-do-i-find-all-files-containing-specific-text-on-linux
alias strs="grep -rnw . -e "
alias strsc="grep -rn . -e "
alias only_in_c_source="--include=\*.{c,h}"
alias exclude_gen_dirs="--exclude-dir={}"
alias cdb="/auto/smartdev/bin/compile-db"
alias v="vim"
alias vm="mvim"
alias p3="python3"
alias pip3="python3 -m pip"
