import {
  JupyterFrontEnd,
  JupyterFrontEndPlugin
} from '@jupyterlab/application';

import { IThemeManager } from '@jupyterlab/apputils';

/**
 * Initialization data for the @nertro/jl-horizontal-theme extension.
 */
const extension: JupyterFrontEndPlugin<void> = {
  id: '@nertro/jl-horizontal-theme',
  requires: [IThemeManager],
  autoStart: true,
  activate: (app: JupyterFrontEnd, manager: IThemeManager) => {
    console.log('JupyterLab extension @nertro/jl-horizontal-theme is activated!');
    const style = '@nertro/jl-horizontal-theme/index.css';

    manager.register({
      name: '@nertro/jl-horizontal-theme',
      isLight: true,
      load: () => manager.loadCSS(style),
      unload: () => Promise.resolve(undefined)
    });
  }
};

export default extension;
