// Main component for student
class Student extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      students: []
    }
  }
  
  apiCall(){
    var url = '/api/v1/students'
    $.getJSON(url, (students) => { 
      this.setState({ students }) 
    }); 
  }

  componentDidMount() { 
    this.apiCall();
  }

  handleAdd(event){
    var student = this.state.students;
    student.push(event);
    this.setState({ students: student });
  }
  
  render(){
    // Render a form to assign a new student and list students
    return(
     <div>
       <span>List student</span>
       <StudentForm quiz_id={ this.props.quiz_id } handleAdd={ event => this.handleAdd(event) } />
       <StudentListHeader student={ this.state.students }  />
     </div>
    )
  }
};