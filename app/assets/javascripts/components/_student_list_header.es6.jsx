// List student header
const StudentListHeader = ({student}) =>{
  var students = [];
    student.forEach(function(e){
      // call student detail component
      students.push(<StudentListDetail key={ e.id } full_name={ e.full_name } link_id ={ e.id } />)
    }.bind(this));
    return(
      <div>{ students }</div>
    )
}