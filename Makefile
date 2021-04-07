.PHONY: setup
setup:
	pyenv local 3.8.5
	python -m venv .venv
	.venv/bin/python -m pip install --upgrade pip
	.venv/bin/python -m pip install -r requirements.txt
setup_dev:
	pip install xeus-python notebook
	jupyter labextension install @jupyterlab/git@0.30.0-beta.2 --no-build
	pip install jupyterlab-git==0.30.0-beta.2
	jupyter labextension install @jupyterlab/debugger --no-build
	pip install jupyterlab-lsp==3.5.0
	pip install python-language-server==0.36.2
	pip install 'python-language-server[all]'
	jupyter lab build
	find .venv/etc/jupyter -type l -exec rm {} \;
	find .ipynb_custom/nb_config -type f -exec ln -sf ../../../{} .venv/etc/jupyter/ \;
	find .venv/share/jupyter/kernels/xpython -type l -exec rm {} \;
	find .ipynb_custom/kernelspecs -type f -exec ln -sf ../../../../../{} .venv/share/jupyter/kernels/xpython \;
	find .venv/lib/python3.8/site-packages -type l -exec rm {} \;
	find .ipynb_custom/script_pths -type f -exec ln -sf ../../../../{} .venv/lib/python3.8/site-packages \;
