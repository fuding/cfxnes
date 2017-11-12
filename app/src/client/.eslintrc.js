module.exports = {
  parser: 'babel-eslint',
  parserOptions: {
    ecmaVersion: 7,
    sourceType: 'module',
    ecmaFeatures: {
      experimentalObjectRestSpread: true,
      jsx: true,
    }
  },
  env: {
    browser: true,
    commonjs: true,
    node: false,
  },
  plugins: [
    'react',
  ],
  settings: {
    'import/resolver': 'webpack',
  },
  globals: {
    __DEVELOPMENT__: true,
    __REDUX_LOGGER_ENABLED__: true,
    __REDUX_DEVTOOLS_ENABLED__: true,
    __LOG_LEVEL__: true,
  },
  rules: {
    'no-invalid-this': 'off', // eslint is confused when we are using 'this' in bound methods (method = () => {...})
    'react/default-props-match-prop-types': 'warn',
    'react/forbid-component-props': ['error', {'forbid': ['style']}],
    'react/jsx-boolean-value': 'warn',
    'react/jsx-closing-bracket-location': ['warn', 'after-props'],
    'react/jsx-closing-tag-location': 'warn',
    'react/jsx-curly-spacing': 'warn',
    'react/jsx-equals-spacing': 'warn',
    'react/jsx-filename-extension': 'warn',
    'react/jsx-handler-names': 'warn',
    'react/jsx-indent': ['warn', 2],
    'react/jsx-key': 'error',
    'react/jsx-no-bind': 'error',
    'react/jsx-no-comment-textnodes': 'warn',
    'react/jsx-no-duplicate-props': 'error',
    'react/jsx-no-target-blank': 'error',
    'react/jsx-no-undef': 'error',
    'react/jsx-pascal-case': 'error',
    'react/jsx-tag-spacing': ['warn', {'beforeSelfClosing': 'never'}],
    'react/jsx-uses-react': 'error',
    'react/jsx-uses-vars': 'error',
    'react/no-array-index-key': 'error',
    'react/no-children-prop': 'error',
    'react/no-danger-with-children': 'error',
    'react/no-danger': 'error',
    'react/no-deprecated': 'error',
    'react/no-did-mount-set-state': 'error',
    'react/no-did-update-set-state': 'error',
    'react/no-direct-mutation-state': 'error',
    'react/no-find-dom-node': 'error',
    'react/no-is-mounted': 'error',
    'react/no-multi-comp': ['error', {'ignoreStateless': true}],
    'react/no-redundant-should-component-update': 'error',
    'react/no-render-return-value': 'error',
    'react/no-string-refs': 'error',
    'react/no-typos': 'error',
    'react/no-unescaped-entities': 'warn',
    'react/no-unknown-property': 'error',
    'react/no-unused-prop-types': 'warn',
    'react/prefer-es6-class': 'error',
    'react/prefer-stateless-function': 'warn',
    'react/prop-types': 'warn',
    'react/react-in-jsx-scope': 'error',
    'react/require-default-props': 'warn',
    'react/require-optimization': 'warn',
    'react/require-render-return': 'error',
    'react/self-closing-comp': 'warn',
    'react/sort-comp': 'warn',
    'react/style-prop-object': 'error',
  },
};