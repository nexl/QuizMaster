// Student detail component, name and try out link
const StudentListDetail = ({full_name, link_id, token}) =>{
  //var url = 'http://localhost:3000/tryouts/'+{ link_id} +'/'+{ token }
  return(
    <tr>
      <td>{ full_name } </td>
      <td><a target="_blank" href={`../tryouts/${link_id}/${token}`}>Click here</a></td>
    </tr>
  )
}