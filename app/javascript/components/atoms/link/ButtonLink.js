import * as React from "react";
import {StyledButtonLink} from "./styles";

const ButtonLink = props => {
    return <StyledButtonLink {...props} className="btn my-1 me-1">{props.children}</StyledButtonLink>
};

export default ButtonLink;