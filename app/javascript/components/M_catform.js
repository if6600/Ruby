import React from "react"
import PropTypes from "prop-types"
class M_catform extends React.Component {
  constructor(props) {
      super(props);
      this.state = {
        name: props.category.name ? props.category.name : '',
        description: props.category.description ? props.category.description : ''
      };
      this.handleNameChange = this.handleNameChange.bind(this);
      this.handleDescriptionChange = this.handleDescriptionChange.bind(this);

    }
    handleNameChange(e) {
      this.setState({ name: e.target.value });
    }
    handleDescriptionChange(e) {
      this.setState({ description: e.target.value });
    }

    render() {
      return (
        <div>
          <label>Name</label>
          <input
            type="text"
            name="category[name]"
            value={this.state.name}
            onChange={this.handleNameChange}
          />

          <label>Description</label>
          <input
            type="text"
            name="category[description]"
            value={this.state.description}
            onChange={this.handleDescriptionChange}
          />
          <label>Display in Navbar?</label>
          <input
            defaultChecked={this.props.category.display_in_navbar}
            ref={this.input}
            type="checkbox"
            name="category[display_in_navbar]"
          />

          <input type="submit" value="Create category" />
        </div>
      );
    }
  }

export default M_catform
