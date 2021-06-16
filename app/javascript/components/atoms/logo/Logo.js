import * as React from "react";
import defaultLogo from "../../../../assets/images/logo.png";

const Logo = props => {
    return <a href="/"><img src={defaultLogo} alt="Logo" {...props} /></a>
};

export default Logo;