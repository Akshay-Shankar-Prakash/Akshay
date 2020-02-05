import React, { Component } from 'react';
import Projects from './Projects';
import SocialProfiles from './SocialProfiles'
import profilepic from '../assets/profilepic.jpg';
import Title from './Title'

//class RegularClass {}
//class ComponentClass extends Component {}

//const regularClassInstance = new RegularClass();
//const componentClassInstance = new ComponentClass();

//console.log('regularClassInstance',regularClassInstance);
//console.log('componentClassInstance',component ClassInstance);



class App extends Component{
    state = { displayBio: false};
    //constructor () {
        //super();
        //this.state = { displayBio: false};
        //console.log('Component this', this);
        //this.toggleDisplayBio=this.toggleDisplayBio.bind(this);
     
        //}
    

    toggleDisplayBio = () => {
        this.setState({ displayBio: !this.state.displayBio });
       
    }
    render() {
        return (
            <div>
                <img src={profilepic} alt='profile' className ='profile'/>
                <h1>Hello!</h1>
                <p>My Name is Akshay Shankar Prakash. I am <Title/>. I design websites and I like to code. I am always looking forward to working on great projects.</p>
                
                <p>I am proficient in HTML5, CSS3, Javascript, jQuery, Python and the frameworks: React and Django.</p>
                { 
                    this.state.displayBio ? (
                    <div>
                    <p>I am currently developing a crownfunding real-estate website using react for the front-end and django for the back-end.</p>
                    <p>I have previously built an end-to-end website for a school<a href="http://venuschool.com/">(Click here to check it out)</a> and have worked as an associate software engineer at the multi-national corporation Accenture.</p>
                    <p>I am currently pursuing my Masters in Computer Engineering at the University of Windsor.</p>
                    <button onClick={this.toggleDisplayBio}>Show Less</button>
                </div>
                    ): (
                        <div>
                            <button onClick={this.toggleDisplayBio}>Show More</button>
                        </div>
                    )   
            }
            <hr />
            <Projects />
            <hr />
            <SocialProfiles />
        </div>
        
        )

    }
}
export default App;

