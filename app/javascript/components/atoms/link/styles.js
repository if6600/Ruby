import styled from "styled-components";

const StyledNavLink = styled.a`
    color: #0b0324;
    text-decoration: none;
    padding: 4px 10px;
    border-bottom: 1px solid transparent;    
    :hover {
        border-bottom: 1px solid;
        transition: .3s ease-in;
    }    
`

const StyledButtonLink = styled.a`
    border: 0;
    color: #0b0324;
    background-color: #84B3DB;
    text-decoration: none;
    :hover {
        background-color: #0b0324;
        color: white;
        transition: .3s ease-in;
    }    
`

export {StyledNavLink, StyledButtonLink}