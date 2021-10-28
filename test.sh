LIB=""
LIB=" ${LIB} rimraf prettier prettier-eslint"
LIB=" ${LIB} cross-env copy-webpack-plugin "
LIB=" ${LIB} @types/serialport "
LIB=" ${LIB} @types/node-hid @types/express @types/electron-localshortcut "
LIB=" ${LIB} @types/mousetrap "
LIB=" ${LIB} @types/react @types/react-dom "


# yarn add -D ${LIB}

LIB=""
LIB=" ${LIB} electron-window-state electron-util electron-unhandled electron-settings electron-localshortcut"
LIB=" ${LIB} electron-is-dev "
LIB=" ${LIB} winston winston-daily-rotate-file winston-transport"
LIB=" ${LIB} uuid util socket.io socket.io-client  rxjs "
LIB=" ${LIB} mousetrap menubar lodash ip os-name"
LIB=" ${LIB} inversify-inject-decorators inversify "
LIB=" ${LIB} i18next-browser-languagedetector "
LIB=" ${LIB} fs-extra errio "
LIB=" ${LIB} mobx mobx-react "
LIB=" ${LIB} react react-dom react-router-dom "
LIB=" ${LIB} @emotion/react @emotion/styled @mui/icons-material "
LIB=" ${LIB} @mui/material @mui/styles "
LIB=" ${LIB} react-use beautiful-react-hooks "

# yarn add ${LIB}

# yarn add node-hid
# yarn add serialport

yarn add -D \
@babel/eslint-parser @babel/plugin-transform-runtime @rollup/plugin-babel \
    @rollup/plugin-commonjs @rollup/plugin-node-resolve @types/chai \
    @types/mocha @types/node @typescript-eslint/eslint-plugin @typescript-eslint/parser \
    chai date-fns eslint eslint-config-prettier eslint-plugin-prettier eslint-webpack-plugin mocha \
    prettier prettier-eslint rimraf rollup rollup-plugin-peer-deps-external rollup-plugin-postcss rollup-plugin-typescript2 ts-loader ts-node tslib typescript