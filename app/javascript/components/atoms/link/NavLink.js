import * as React from "react";
import {StyledNavLink} from "./styles";

const NavLink = props => {
    return <StyledNavLink  {...props} >{props.children}</StyledNavLink>
};

export default NavLink;