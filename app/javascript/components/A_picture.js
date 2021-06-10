import React from "react"
import PropTypes from "prop-types"


class A_picture extends React.Component {
  render () {
    return (
      <img src={this.props.src} width={this.props.width} height={this.props.height}/>
    );
  }
}

// A_picture.propTypes = {
//   src: PropTypes.string
// };

export default A_picture
