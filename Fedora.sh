#!/usr/bin/env bash

excute()
{
    message=$1
    read -p "$message? [y]es [*]skip [e]xit " prompt
    if [[ $prompt == "y" ]]; then
        if [[ $# == 2 ]]; then
            eval $2
        else
            sudo dnf $1 -y
        fi
    elif [[ $prompt == "e" ]]; then
        exit 0
    else
        echo skipped
    fi
    echo ;
}


excute "check update" \
    "sudo dnf check-update --refresh"


echo "---------------------"
echo "Install rpmfusion ..."
echo "---------------------"

excute "install rpmfusion" \
    "sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"

excute "check update" \
    "sudo dnf check-update --refresh"
echo ;


echo "-----------------------"
echo "Install code things ..."
echo "-----------------------"

excute "install vim-enhanced"
excute "install gcc gcc-c++ gcc-gfortran"
excute "install make cmake"
excute "install python3-numpy python3-scipy python3-matplotlib python3-sympy"

for i in numpy scipy matplotlib sympy ; do python3 -c "import $i; print($i.__version__, $i)"; done
python3 -c "import matplotlib.pyplot as plt; plt.text(0.5, 0.5, '$\sin \pi x$'); plt.show()"
echo ;

excute "install numba" \
    "pip install numba -i https://pypi.tuna.tsinghua.edu.cn/simple"

# excute "install gsl gsl-devel"
# excute "install openmpi openmpi-devel"
# excute "install slurm-slurmctld slurm-slurmd slurm-doc"
# excute "install root"

excute "install expat-devel libX11-devel libXmu-devel qt5-qt3d-devel"
excute "install tealdeer fzf autojump htop glances duf"


echo "------------------------"
echo "Install Latex things ..."
echo "------------------------"

excute "install lyx"
# excute "install gnome-latex"
# excute "install texstudio"
# excute "install texlive-revtex texlive-elsarticle"
excute "install texlive-ctex"
excute "install texlive-latexdiff texlive-latexindent"
excute "install texlive-newtx"
excute "install adobe-source-han-*-cn-fonts"


echo "----------------"
echo "Other things ..."
echo "----------------"

excute "install libreoffice-langpack-zh-Hans"
# excute "install asymptote"
# excute "install filezilla"
# excute "install inkscape"
excute "install keepassx"
excute "install gnome-tweaks"
excute "install meld"
excute "install pandoc"
excute "install papirus-icon-theme"
excute "install evolution"
# excute "install thunderbird"
excute "install vlc"
