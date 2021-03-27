import React from "react"
import PropTypes from "prop-types"
class M_catview extends React.Component {
  render() {
    return (
      <div>
        <h1>{this.props.category.name}</h1>
            <p>ID: {this.props.category.id}</p>
            <p>Name: {this.props.category.name}</p>
            <p>Description: {this.props.category.description}</p>
            <p>Display in Navbar: {`${this.props.category.display_in_navbar}`}</p>
      </div>
    );
  }
}

export default M_catview
