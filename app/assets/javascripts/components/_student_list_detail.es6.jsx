// Student detail component, name and try out link
const StudentListDetail = ({full_name, link_id, token, handleDelete , index}) =>{
  //var url = 'http://localhost:3000/tryouts/'+{ link_id} +'/'+{ token }
  return(
    <tr>
      <td>{ full_name } </td>
      <td><a target="_blank" href={`../tryouts/${link_id}/${token}`}>Tryout</a></td>
      <td onClick={ index => handleDelete(index) } >Remove</td>
    </tr>
  )
}