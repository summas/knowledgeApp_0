// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'

var target_dom = null;

document.addEventListener('DOMContentLoaded', () => {
  target_dom = document.querySelector('#data');
  const url = new URL(location.href);
  let f = url.searchParams.get("name");
  if (f == null){ f = '';}
  getData(f);
});

function getData(f){
  let url = "http://localhost:3000/articles/ajax";
  if (f != ''){
    url += "?name=" + f; 
  }
  fetch(url)
  .then(
    res => res.json(),
    (error) => {
      const el = (
        <p>ERROR!!</p>
      );
      ReactDOM.render(el, target_dom);
    }
  )
  .then(
    (result) => {
      let arr = [];
      for(let n in result){
        let val = result[n];
        var str = "/articles/show/" + val.id;
        var date = new Date(val.created_at)
        arr.push(
        <div class="d-flex rounded m-md-2 w-75" id="article" style={{background:'#FFFFFF'}}>
        <div class="card-body">
        <a href={str}>
        <span class="float-left pr-3" >
          <img src={val.image.url} width="100" height="100"/></span>
          <h3 class="text-secondary">{val.title}</h3>
        </a>
        <span class="float-right text-secondary h6 pr-3 pt-3">
          投稿日: {date.toLocaleDateString()}
        </span>
          </div></div>);
      }
      const el = (
      <div>{arr}</div>
      );
      ReactDOM.render(el, target_dom);
    },
    (error) => {
      const el = (
        <p>ERROR!!</p>
      );
      ReactDOM.render(el, target_dom);
    }
  );
}
