import React from "react"
import PropTypes from "prop-types"
import A_picture from "./A_picture"

class A_logo extends React.Component {
    render() {
        return (
            <a href={"/"}>
                <A_picture src="/assets/logo.png" width={this.props.width} height={this.props.height}/>
            </a>
        );
    }
}

export default A_logo
