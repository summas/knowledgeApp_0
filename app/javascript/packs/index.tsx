import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import App from './app';
import { store } from './app/store';
import { Provider } from 'react-redux';
import * as serviceWorker from './serviceWorker';

document.addEventListener('DOMContentLoaded', () => {
  var target_dom = null;
  target_dom = document.querySelector('#root');

  const el = (
    <React.StrictMode>
      <Provider store={store}>
        <App />
      </Provider>
    </React.StrictMode>
  )

  ReactDOM.render(el, target_dom);
});

// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: https://bit.ly/CRA-PWA
serviceWorker.unregister();
