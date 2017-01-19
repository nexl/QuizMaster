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
    var self = this;
      $.ajax({
        url: '/api/v1/students',
        method: 'POST',
        data: { student: self.state },
        success: function(data) {
          // If create new student is success, reset textfield and push new data to list students
          self.props.handleAdd(data);
          self.setState({ full_name : ''});
        },
        error: function(xhr, status, error) {
          //console.log(xhr.responseText);
        }
      })
  }

  render(){
    return(
      <form className="form-horizontal" onSubmit={ e => this.handleAdd(e) }>
        <div className="form-group">
          <label className="control-label col-sm-2">Name</label>
          <div className="col-sm-6">
            <input type="text"
              className="form-control"
              name="full_name"
              placeholder="Name"
              value={ this.state.full_name }
              onChange={ e => this.handleChange(e.target.value) } />
            </div>
          </div>
          <button type="submit" className="btn btn-primary">Add</button>
      </form>
    )
  }
};