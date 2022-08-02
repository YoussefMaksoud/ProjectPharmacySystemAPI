import React from 'react';
import { Card, Table } from 'react-bootstrap';
import axios from 'axios';

class MedList extends React.Component{

    constructor(props) {
        super(props);
        this.state = {
            medications: []
        };
    }

    componentDidMount() {
        axios.get("http://localhost:8080/RXapp/drugs/all")
            .then(response => response.data)
            .then((data) =>
                this.setState({ medications: data }));
    }

    render(){
        return(
            <Card className={"border border-light bg-light text-black table table-striped"}>
                <Card.Body>
                    <Table striped bordered hover>
                        <thead>
                            <tr>
                                <th>Price</th>
                                <th>Name</th>
                                <th>ScheduleNum</th>
                                <th>Manufacturer</th>
                                <th>PharmID</th>
                                <th>Din</th>
                            </tr>
                        </thead>
                        <tbody>
                            {this.state.medications.length === 0 ?
                                <tr align="center">
                                    <td colSpan="6"> Results</td>
                                </tr> :
                                this.state.medications.map((medications) =>
                                    <tr>
                                        <td>{medications.price}</td>
                                        <td>{medications.name}</td>
                                        <td>{medications.scheduleNum}</td>
                                        <td>{medications.manufacturer}</td>
                                        <td>{medications.pharmID}</td>
                                        <td>{medications.din}</td>
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

export default MedList;