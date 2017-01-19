// Quiz result
class Result extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      result: [],
    };
  }

  apiCall(){
    var url = '/api/v1/quizzes/' + this.props.quiz_id + '/result';
    $.getJSON(url, (result) => { 
      this.setState({ result }) 
    }); 
  }
  
  componentDidMount() {
    this.apiCall();
  }

  render(){
    var res = this.state.result.map((result) => {
      // dangerouslySetInnerHTML -> render HTML escape
      return (
        <div key={result.id}>
        <span dangerouslySetInnerHTML={{__html: result.question_content}} />
        <div> { String(result.is_right) }</div>
        </div>
      )
    });
    return(
      <div>{res}</div>
    )
  }
}