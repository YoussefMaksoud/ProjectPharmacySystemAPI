import React from 'react';
import './App.css';
import NavigationBar from './Components/NavigationBar';
import WelcomeScreen from './Components/WelcomeScreen';
import PatientList from './Components/PatientList';
import MedList from './Components/MedList';
import PrescriberList from './Components/PrescriberList';
import NewPatient from './Components/NewPatient';
import { BrowserRouter as Router, Switch, Route } from 'react-router-dom';
import RxHistory from './Components/RxHistory';

function App() {
  return (
    <Router>
      <NavigationBar />
      <Switch>
        <Route path="/" exact component={WelcomeScreen} />
      </Switch>
      <Switch>
        <Route path="/Patients" exact component={PatientList} />
      </Switch>
      <Switch>
        <Route path="/prescribers" exact component={PrescriberList} />
      </Switch>
      <Switch>
        <Route path="/Medications" exact component={MedList} />
      </Switch>
      <Switch>
        <Route path="/NewPatient" exact component={NewPatient} />
      </Switch>
      <Switch>
        <Route path="/patients/prescriptions/:handle" exact component={RxHistory} />
      </Switch>

    </Router>
  );
}

export default App;
