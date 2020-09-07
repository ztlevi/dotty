alias py=python
_is_callable python2 && alias py2=python2
_is_callable python3 && alias py3=python3

alias ipy=ipython
alias ipylab='ipython --pylab=qt5 --no-banner'
_is_callable jupyter && alias jp='jupyter lab --NotebookApp.iopub_data_rate_limit=10000000'

alias sa="source activate"
alias sd="conda deactivate || source deactivate"
alias cl="conda info --envs"
