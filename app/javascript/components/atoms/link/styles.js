import styled from "styled-components";

const StyledNavLink = styled.a`
    color: #0b0324;
    text-decoration: none;
    padding: 4px 10px;
    :hover {
        border-bottom: 1px solid;
        transition: .3s ease-in;
    }
`

const StyledButtonLink = styled.a`
    border: 0;
    color: white;
    background-color: #0B0324;
    text-decoration: none;
    :hover {
        background-color: #90C0E9;
        color: white;
        transition: .3s ease-in;
    }
`

export {StyledNavLink, StyledButtonLink}
