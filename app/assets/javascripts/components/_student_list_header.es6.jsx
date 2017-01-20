// List student header
const StudentListHeader = ({student, handleDelete}) =>{
  var students = [];
    if (student.length == 0){
      return (
        <div>This quiz has no student</div>
        )
    }
    student.forEach(function(e, index){
      // call student detail component
      students.push(<StudentListDetail key={ e.id } full_name={ e.full_name } link_id ={ e.id } token ={ e.token } handleDelete = { e => handleDelete(e) } index = { index }/>)
    }.bind(this));

    return(
      <table className="table table-hover table-bordered">
        <thead>
          <tr>
            <th>Student name</th>
            <th>Tryout</th>
            <th>Remove student</th>
          </tr>
        </thead>
        <tbody> 
        {students}
        </tbody>
      </table>
    )
}