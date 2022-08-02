import React, { Component } from 'react';
import { Card, Form, Col, Button } from 'react-bootstrap';
import axios from 'axios';

export default class NewPatient extends Component {


    constructor(props) {
        super(props);
        this.state = { name: "", dob: "", hcn: "" }
        this.submitPatient = this.submitPatient.bind(this)
        this.validName = this.validName.bind(this)
        this.validDob = this.validDob.bind(this)
        this.validHcn = this.validHcn.bind(this)
    }

    initialState = { name: "", dob: "", hcn: "" }

    submitPatient(event) {
       
        
        const obj =
        {
            name: this.state.name,
            healthcareNum: this.state.hcn,
            dob: this.state.dob
        };

        alert(JSON.stringify(obj));

        axios.post("http://localhost:8080/RXapp/patients/create", {obj})
            .then(res => {
                console.log(res);
                console.log(res.data);
            }).catch(error => {
                console.log(error);
            });

            event.preventDefault();


    }

    validName(item) {
        let itemValue = item.target.value
        this.setState({ name: itemValue })
        this.forceUpdate()
    }
    validDob(item) {
        let itemValue = item.target.value
        this.setState({ dob: itemValue })
        this.forceUpdate()
    }
    validHcn(item) {
        let itemValue = item.target.value
        this.setState({ hcn: itemValue })
        this.forceUpdate()
    }

    reset = () => {
        this.setState(() => this.initialState)
    }

    render() {
        return (
            <Card className="border border-light bg-light text-black">
                <Card.Header>Create Patient Profile</Card.Header>
                <Form id="PatientFormId">
                    <Card.Body>
                        <Form.Row>
                            <Form.Group as={Col} controlId="formGridName" >
                                <Form.Label>Name</Form.Label>
                                <Form.Control required
                                    type="text" name='name'
                                    onChange={(item) => this.validName(item)}
                                    value={this.state.name}
                                    placeholder="Enter Name" />
                            </Form.Group>
                            <Form.Group as={Col} controlId="formGridDOB" >
                                <Form.Label>Date of Birth</Form.Label>
                                <Form.Control required
                                    type="text" name='dob'
                                    onChange={(item) => this.validDob(item)}
                                    placeholder="DD/MM/YY" />
                            </Form.Group>
                        </Form.Row>
                        <Form.Group controlId="HealthcareNum" >
                            <Form.Label>Healthcare Number</Form.Label>
                            <Form.Control required
                                type="text" name='hcn'
                                onChange={(item) => this.validHcn(item)}
                                placeholder="*********" />
                        </Form.Group>
                    </Card.Body>
                    <Card.Footer>
                        <Button onClick={(event) => this.submitPatient(event)} size="sm" variant="primary" type="submit">
                            Submit
                        </Button>
                        &nbsp;
                        <Button onClick={() => this.reset()} size="sm" variant="danger" type="clear" colour="red">
                            Clear
                        </Button>
                    </Card.Footer>
                </Form>
            </Card >

        );
    }
}

