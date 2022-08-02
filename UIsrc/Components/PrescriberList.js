import React from 'react';
import { Card, Table } from 'react-bootstrap';
import axios from 'axios';

class PrescriberList extends React.Component{
    constructor(props) {
        super(props);
        this.state = {
            prescribers: []
        };
    }

    componentDidMount() {
        axios.get("http://localhost:8080/RXapp/prescribers/all")
            .then(response => response.data)
            .then((data) =>
                this.setState({ prescribers: data }));
    }

    render(){
        return(
            <Card className={"border border-light bg-light text-black table table-striped"}>
                <Card.Body>
                    <Table striped bordered hover>
                        <thead>
                            <tr>
                                <th>License #</th>
                                <th>Name</th>
                                <th>Type</th>
                            </tr>
                        </thead>
                        <tbody>
                            {this.state.prescribers.length === 0 ?
                                <tr align="center">
                                    <td colSpan="6"> Results</td>
                                </tr> :
                                this.state.prescribers.map((prescribers) =>
                                    <tr>
                                        <td>{prescribers.serviceNum}</td>
                                        <td>{prescribers.name}</td>
                                        <td>{prescribers.type}</td>
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

export default PrescriberList;