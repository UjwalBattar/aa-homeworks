import React from "react";
import ReactDOM from "react-dom";
import configureStore from "./store/store";

import Root from "./components/root";

document.addEventListener("DOMContentLoaded", () => {
  const preloadedState = localStorage.state
    ? JSON.parse(localStorage.state)
    : {};
  const store = configureStore(preloadedState);

  // store = applyMiddleWares(store, addLoggingToDispatch);
  // store.dispatch = addLoggingToDispatch(store);
  const root = document.getElementById("content");
  ReactDOM.render(<Root store={store} />, root);
});

// const addLoggingToDispatch = store => {
//   const storeDispatch = store.dispatch;
//   return action => {
//     console.log("old state", store.getState());
//     console.log("action", action);
//     storeDispatch(action);
//     console.log("new state", store.getState());
//   };
// };

// const addLoggingToDispatch = store => next => action => {
//   // your code here
//   console.log('action', action);
//   console.log('old state', store.getState());
//
//   let result = next(action);
//
//   console.log('new state', store.getState());
//
//   return result;
// };

const applyMiddleWares = (store, ...middleWares) => {
  let dispatch = store.dispatch;
  middleWares.forEach(middleware => {
    dispatch = middleware(store)(dispatch);
  });
  return Object.assign({}, store, { dispatch });
};
