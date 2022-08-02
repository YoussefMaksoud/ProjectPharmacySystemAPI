import React from 'react';

import { Navbar, Nav, DropdownButton, Form, Dropdown } from 'react-bootstrap';
import {Link} from 'react-router-dom';


class NavigationBar extends React.Component {
    render() {
        return (
            <>
                <Navbar bg="primary" variant="dark">
                    <Link to = {""} className = "navbar-brand"></Link>
                    <Navbar.Brand href="/">PharmaSys</Navbar.Brand>
                    <Nav className="mr-auto">
                        <Link to={"Prescribers"} className = "nav-link">Prescribers</Link>
                        <Link to={"Patients"} className = "nav-link">Patients</Link>
                        <Link to={"Medications"} className = "nav-link">Medication</Link>
                        <Link to={"NewPatient"} className = "nav-link">New Patient</Link>
                    </Nav>
                    <Form inline>
                        <DropdownButton id="dropdown-basic-button" title="Our Team">
                            <Dropdown.Item href="#/action-1">Youssef Abdel Maksoud</Dropdown.Item>
                            <Dropdown.Item href="#/action-2">Jeff Roszell</Dropdown.Item>
                            <Dropdown.Item href="#/action-3">Pamilerin Falade</Dropdown.Item>
                        </DropdownButton>

                    </Form>
                </Navbar>

                <br />

            </>
        );
    }
}

export default NavigationBar;