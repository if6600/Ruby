import * as React from "react";
import defaultLogo from "../../../../assets/images/logo.png";

const Logo = props => {
    return <a href="https://anutavsesuper.github.io/4-module-lending/"><img src={defaultLogo} alt="Logo" {...props} /></a>
};

export default Logo;