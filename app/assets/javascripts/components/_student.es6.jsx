// Main component for student
class Student extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      students: []
    }
  }
  
  apiCall(){
    var url = '/api/v1/quizzes/'+ this.props.quiz_id + '/participant'
    $.getJSON(url, (students) => { 
      this.setState({ students }) 
    });
  }

  // Delete student
  handleDelete(index){
    var student = this.state.students;
    // get deleted student's data
    var deletedStudent = student.splice(index, 1 );
    var self = this;
    $.ajax({
      url: `/api/v1/students/${deletedStudent[0].id}`,
      method: 'DELETE',
      success: function(data) {
        // set new state without deleted student's data
        self.setState({ students: student });
      },
      error: function(xhr, status, error) {
        //console.log(xhr.responseText);
      }
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
       <h3>Assign new student</h3>
       <StudentForm quiz_id={ this.props.quiz_id } handleAdd={ event => this.handleAdd(event) } />
       <br/>
       <h3>List students</h3>
       <StudentListHeader student={ this.state.students } handleDelete={ index => this.handleDelete(index)} />
     </div>
    )
  }
};