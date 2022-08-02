import React from 'react';
import { Card, Table } from 'react-bootstrap';
import axios from 'axios';
import RxHistory from './RxHistory';
import {Link} from 'react-router-dom';

class PatientList extends React.Component {

    constructor(props) {
        super(props);
        this.state = {
            patients: []
        };
    }

    displayRx(id){
        return(
            <RxHistory id = {id}/>
        );
    }

    componentDidMount() {
        axios.get("http://localhost:8080/RXapp/patients/all")
            .then(response => response.data)
            .then((data) =>
                this.setState({ patients: data }));
    }

    render() {
        return (
            <Card className={"border border-light bg-light text-black table table-striped"}>
                <Card.Body>
                    <Table striped bordered hover>
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Date of Birth</th>
                                <th>Healthcare Number</th>
                            </tr>
                        </thead>
                        <tbody>
                            {this.state.patients.length === 0 ?
                                <tr align="center">
                                    <td colSpan="6"> Results</td>
                                </tr> :
                                this.state.patients.map((patients) =>
                                    <tr>
                                        <td>{patients.name}</td>
                                        <td>{patients.dob}</td>
                                        <Link to = {"/patients/prescriptions/" + patients.healthcareNum} className = "nav-link">{patients.healthcareNum}</Link>
                                    </tr>
                                )
                            }
                        </tbody>
                    </Table>
                </Card.Body>
            </Card>
        );
    }
}

export default PatientList;