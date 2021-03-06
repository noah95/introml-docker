FROM jupyter/datascience-notebook

RUN conda install --quiet --yes \
    'tensorflow=1.12*' \
    'keras=2.2*' && \
    conda clean -tipsy && \
    fix-permissions $CONDA_DIR 

USER root
RUN fix-permissions /home/$NB_USER
USER $NB_UID

CMD ["/usr/local/bin/start.sh","jupyter","notebook","--NotebookApp.token=''"]
