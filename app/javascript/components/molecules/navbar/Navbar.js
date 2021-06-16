import React, {Component} from "react";
import Link from "../../atoms/link/NavLink";

export default class Navbar extends Component {
    render() {
        return (
            <ul className="navbar-nav mx-auto mb-2 mb-md-0">
                {this.props.menuItems.map(menuItem => {
                    return <li className="nav-item py-1" key={menuItem.name}><Link
                        href={menuItem.route || '#'}>{menuItem.name}</Link></li>;
                })}
            </ul>
        );
    }
}