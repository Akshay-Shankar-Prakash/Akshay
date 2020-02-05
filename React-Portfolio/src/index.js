import React from 'react';
import ReactDOM from 'react-dom';
import { Router, Switch, Route } from 'react-router-dom';
import createBrowserHistory from 'history/createBrowserHistory';
import App from './components/App';
import Jokes from './components/Jokes';
import MusicMaster from './projects/music-master';
import Header from './components/Header';
import './index.css';

ReactDOM.render(
  <Router history={createBrowserHistory()}>
    <Switch>
      <Route exact path='/' render={() => <Header><App /></Header>} />
      <Route path='/jokes' render={() => <Header><Jokes /></Header>} />
      <Route path='/music-master' render={() => <Header><MusicMaster /></Header>} />
    </Switch>
  </Router>,
  document.getElementById('root')

// //class Animal {
// //    constructor(name,age){
//  //   this.name=name;
// //    this.age=age;
// }


// speak() {
//     console.log('I am', this.name, 'and I am', this.age, ' years old');
//    }
// }

// const animal1 = new Animal('Simba',3);
// animal1.speak();

// console.log(animal1);

// class Lion extends Animal{
//     constructor(name,age,furColor,speed){
//     super(name,age)
//     this.furColor = furColor;
//     this.speed = speed;
// }

// roar(){
//     console.log(
//         'ROAR I HAVE', this.furColor, 'fur and I can Run', this.speed, 'miles an hour!'
//     );
// }
// }

// const lion1 = new Lion('Mufasa', 20, 'Golden', 25);
// lion1.speak();
// lion1.roar();
// console.log(lion1)
);
