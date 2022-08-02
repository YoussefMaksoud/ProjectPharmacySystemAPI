import React from 'react';

import { Jumbotron} from 'react-bootstrap'

class WelcomeScreen extends React.Component {
    render() {
        return (

            <Jumbotron className="bg-dark text-white">
                <h1>Welcome to PharmaSys</h1>
                <p>
                    This aplication is used to maintain a pharmacy system. It is implemented using java springboot.
                    Users can search patients, create new patient profiles, find prescribers, and manage prescriptions.
                </p>
            </Jumbotron>

        );
    }
}

export default WelcomeScreen;