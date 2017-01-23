// Student detail component, name and try out link
const StudentListDetail = ({full_name, link_id, token, handleDelete , index}) =>{
  //var url = 'http://localhost:3000/tryouts/'+{ link_id} +'/'+{ token }
  return(
    <tr>
      <td>{ full_name } </td>
      <td><a target="_blank" href={`../tryouts/${link_id}/${token}`} className="btn btn-default btn-sm">Tryout</a></td>
      <td><button onClick={ e => handleDelete(index) }  type="button" className="btn btn-danger btn-sm">Delete { full_name }</button></td>
    </tr>
  )
}