// Component to create a new student
class StudentForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      full_name: '',
      quiz_id: this.props.quiz_id,
    };
  }

  handleChange(full_name) {
    this.setState({ full_name });
  }

  handleAdd(e) {
    e.preventDefault();
    if(this.isValid() == true){
      var self = this;
        $.ajax({
          url: '/api/v1/students',
          method: 'POST',
          data: { student: self.state },
          success: function(data) {
            //success, reset textfield and push new data to list students
            self.props.handleAdd(data);
            self.setState({ full_name : ''});
          },
          error: function(xhr, status, error) {
            //console.log(xhr.responseText);
          }
        })
    }
    // If there's no student name @textfield
    else{ 
      alert("Student name must be filled")
      full_name.focus(); 
    }
  }

  // Check if full_name state is empty or not
  isValid(){
    if(this.state.full_name) return true;
    else return false;
  }

  render(){
    return(
      <form className="form-inline" onSubmit={ e => this.handleAdd(e) }>
        <div className="form-group hori">
          <label className="hori" htmlFor="full_name">Student Name </label>
            <input type="text"
              className="form-control"
              id="full_name"
              name="full_name"
              placeholder="Name"
              ref="full_name"
              value={ this.state.full_name }
              onChange={ e => this.handleChange(e.target.value) } />
            </div>
        <div className="form-group">
          <button type="submit" className="btn btn-default">Add</button>
        </div>
      </form>
    )
  }
};