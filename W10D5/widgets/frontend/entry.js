import React from "react";
import ReactDOM from "react-dom";
import Clock from './clock'
import Tab from './tab'

function Root() {
    return (
        <div>
            <Clock />
            <Tab />
        </div>
    )
}


document.addEventListener('DOMContentLoaded', function() {


    const root = document.getElementById('root')

    ReactDOM.render(Root(), root)
})
