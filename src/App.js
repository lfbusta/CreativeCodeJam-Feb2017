import React, { Component } from 'react';
import logo from './logo.svg';
import marianMadoka from './marianMadoka.svg'
import './App.css';

class App extends Component {
    render() {
        return (
            <div className="App">
                <div className="App-header">
                    <img src={logo} className="App-logo" alt="logo" />
                    <h2>Welcome to React</h2>
                </div>
                <p className="App-intro">
                    To get started, edit <code>src/App.js</code> and save to reload.
                </p>
            </div>
        );
    }
}

class Note extends Component {
    render(){
        return(
            <div className={"Note Test"}>
                <Item name="Item1" content="I think Mom said that my Petshops were in the basket" top="25vw" color="red"/>
                <Item name="Item2" content="I always lose my socks, gloves and HATS" top="10vw" color="black"/>
                <Item name="Item3" content="Mom is angry when our clothes are not in the drawers" top="15vw" color="black"/>
                <Item name="Item4" content="Mom always tells me and Anthony to not leave toys on the floor" top="20vw" color="black"/>
                <Item name="Item1" content="Anthony is sooooo silly. He really annoys me" top="5vw" color="black"/>
                <Item name="Item5" content="If I don't want Mom to find out about some homework. I put it in the rubbish." top="30vw" color="black" fontSize="0.5"/>
                <Item name="Item7" content="Anthony's homework is reeeeeeeeeeeeeeeaally EASY" top="35vw" color="black"/>
                <Item name="Item8" content="I hope that I get more Petshops for Christmas" top="40vw" color="black"/>
                <Item name="Item9" content="Sometimes I don't fold my clothes and put them away" top="45vw" color="black"/>
                <img src={marianMadoka} className="madoka" alt="logo" />
            </div>
        );
    }
}
class Item extends Component{
    constructor(props){
        super(props);
        this.state = {
            textDecoration: "line-through"
        };
    }
    strikethrough(event){
        this.setState({
            textDecoration: "line-through"
        });
    }
    toggleLine(){
        if(this.state.textDecoration === "line-through"){
            this.setState({
                textDecoration: "none"
            });
        } else{
            this.setState({
                textDecoration: "line-through"
            });
        }
    }
    randomInRange(min,max){
        return Math.round((min+Math.random()*(max-min))*100)/100;
    }

    render(){
        const styleA = {
            fontSize: `${this.randomInRange(2,3)}vmin`,
            transform: `rotate(${this.randomInRange(-5,5)}deg)`,
            opacity: this.randomInRange(0.5,1),
            textDecoration: "none",
            top: this.props.top,
            color: this.props.color
        };
        return(
            <p className="Item" style={styleA}>
                {this.props.content}
            </p>
        );
    }
}

export default Note;
