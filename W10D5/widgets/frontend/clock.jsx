import React from "react";
import Tab from './tab'

class Clock extends React.Component{
    constructor(props){
        super(props);
        this.state = {
            currentTime: new Date()
        };
        this.tick = this.tick.bind(this);
    }

    tick(){
        this.setState({
            currentTime: new Date()
        })
    }


    componentDidMount(){
        this.timeInterval = setInterval(this.tick, 1000)
    }

    componentWillUnmount(){
        clearInterval(this.timeInterval)
    }
    
    render(){
        const seconds = this.state.currentTime.getSeconds()
        const minutes = this.state.currentTime.getMinutes()
        const hours = this.state.currentTime.getHours()

        const day = this.state.currentTime.getDate()
        const month = this.state.currentTime.getMonth()
        const year = this.state.currentTime.getFullYear()


        return (
                <div className="currentTime">
                    <div>
                        <h1>Time</h1>
                        <h1>{hours}:{minutes}:{seconds}</h1>
                    </div>
                    <div>
                        <h1>Date</h1>
                        <h1>{day}/{month + 1}/{year}</h1>
                    </div>
                </div>
    )
}
}

export default Clock;