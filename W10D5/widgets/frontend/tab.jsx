import React from "react";

class Tab extends React.Component {
    constructor(props){
        super(props);
        this.state = {
            index: 0
        };
    }

    updateIndex(idx){
        this.setState({index: idx})
    }

    render(){

        const tabData = [
            { "title": "one", "content": "Super awesome one" },
            { "title": "two", "content": "Super duper awesome two" },
            { "title": "three", "content": "Super last place three" }
        ]
        
        // const titles = ["one", "two", "three"];
        const tabDataTitleEle = tabData.map((titleObj, idx) => <span onClick={() => {this.updateIndex(idx)}} key={titleObj.title}>{titleObj.title}</span>);
        const tabDataContentEle = tabData[this.state.index].content

        return(
            <div className="tab-container">
                <h1>Tabs</h1>
                <div className="tab-header">
                    {tabDataTitleEle}
                </div>
                <div className="tab-body">
                    <article>
                        {tabDataContentEle}
                    </article>
                </div>
            </div>
        )
    }
}

export default Tab