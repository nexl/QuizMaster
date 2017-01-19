// Student detail component, name and try out link
const StudentListDetail = ({full_name, link_id, token}) =>{
  return(
    <div>{ full_name } - http://localhost:3000/tryouts/{ link_id}/{ token }</div>
  )
}