import React from 'react';
import { Card, Table, Button } from 'react-bootstrap';
import axios from 'axios';

class RxHistory extends React.Component {

    constructor(props) {
        super(props)
        this.state = {
            rx: []
        }
    }

    componentDidMount() {
        const { handle } = this.props.match.params

        axios.get(`http://localhost:8080/RXapp/prescriptions/${handle}`)
            .then(response => response.data)
            .then((data) =>
                this.setState({ rx: data }));
    }

    goBack(event){
        event.preventDefault();
        window.history.back();
    }

    render() {
        return (
            <Card className={"border border-light bg-light text-black table table-striped"}>
                <Card.Body>
                    <Table striped bordered hover>
                        <thead>
                            <tr>
                                <th>RxNumber</th>
                                <th>Healthcare Number</th>
                                <th>Prescriber Id</th>
                                <th>Pharmacy Id</th>
                                <th>Medication DIN</th>
                            </tr>
                        </thead>
                        <tbody>
                            {this.state.rx.length === 0 ?
                                <tr align="center">
                                    <td colSpan="6"> Results</td>
                                </tr> :
                                this.state.rx.map((rx) =>
                                    <tr key="rxNum">
                                        <td>{rx.rxNum}</td>
                                        <td>{rx.ptID}</td>
                                        <td>{rx.prescriberID}</td>
                                        <td>{rx.pharmID}</td>
                                        <td>{rx.din}</td>
                                    </tr>
                                )
                            }
                        </tbody>
                    </Table>
                </Card.Body>
                <Card.Footer>
                    <Button size="sm" variant="primary" type="Back" onClick = {this.goBack}>
                        Back
                    </Button>
                </Card.Footer>
            </Card>
        );
    }
}

export default RxHistory;