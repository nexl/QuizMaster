// List student header
const StudentListHeader = ({student}) =>{
  var students = [];
    if (student.length == 0){
      return (
        <div>This quiz has no students</div>
        )
    }
    student.forEach(function(e){
      // call student detail component
      students.push(<StudentListDetail key={ e.id } full_name={ e.full_name } link_id ={ e.id } token ={ e.token }/>)
    }.bind(this));
    
    return(
      <table className="table table-hover table-bordered">
        <thead>
          <tr>
            <th>Student name</th>
            <th>Tryout link</th>
          </tr>
        </thead>
        <tbody> 
        {students}
        </tbody>
      </table>
    )
}