import React, {Component} from "react";
import {StyledHeader} from "./styles";
import Navbar from "../../molecules/navbar/Navbar";
import Logo from "../../atoms/logo/Logo";
import ButtonLink from "../../atoms/link/ButtonLink";


export default class Header extends Component {
    constructor(props) {
        super(props);

        this.state = {
            activeClass: ""
        };
        this.handleLogout = this.handleLogout.bind(this)
    }

    handleLogout(url) {
        fetch(url,
            {
                method: 'DELETE',
                redirect: 'follow',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    _method: "delete"
                })
            }).then((response) => {
            console.log('Logged out')
        })
    }

    handleScroll = () => {
        let activeClass = "normal";
        if (window.scrollY !== 0) {
            activeClass = "shadow";
        }
        this.setState({activeClass});
    };

    componentDidMount() {
        window.addEventListener("scroll", this.handleScroll);
    }

    componentWillUnmount() {
        window.removeEventListener("scroll", this.handleScroll);
    }

    render() {
        const {height = 30} = this.props
        return (
            <header>
                <StyledHeader
                    className={`${this.state.activeClass} header navbar navbar-expand-md fixed-top p-3 px-md-4 bg-body border-bottom`}>
                    <div className="container-fluid">
                        <Logo height={height} alt="FirstDog"/>
                        <button className="navbar-toggler" type="button" data-bs-toggle="collapse"
                                data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false"
                                aria-label="Toggle navigation">
                            <span className="navbar-toggler-icon"/>
                        </button>
                        <div id="navbarCollapse" className="collapse navbar-collapse">
                        <Navbar menuItems={this.props.menuItems}/>
                        {this.props.menuActions.map(menuAction => {
                            return <ButtonLink href={menuAction.route || '#'}
                                               data-method={menuAction.method}>{menuAction.name}</ButtonLink>;
                        })}
                        </div>
                    </div>
                </StyledHeader>
            </header>
        );
    }
}