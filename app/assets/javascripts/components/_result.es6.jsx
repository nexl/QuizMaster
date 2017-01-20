// Quiz result
class Result extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      result: [],
      correct: 0,
      wrong: 0,
    };
  }

  apiCall(){
    var url = '/api/v1/quizzes/' + this.props.quiz_id + '/result';
    $.getJSON(url, (result) => { 
      this.setState({ result }) 
      this.calculateScore();
    }); 
  }
  
  calculateScore(){
    var a= 0,b= 0;
    this.state.result.map((result) =>{
    // if the answer is true
    if(String(result.is_right) == "true"){
      a= a+1
    }else{ // if the answer is false
      b= b+1;
    }
    this.setState({ correct: a, wrong:b })
    });
  }

  componentDidMount() {
    this.apiCall();
  }

  render(){
    var res = this.state.result.map((result) => {
      // dangerouslySetInnerHTML -> render HTML escape
      //this.calculate();
      return (
        <tr key={result.id}>
        <td>
          <span dangerouslySetInnerHTML={{__html: result.question_content}} />
        </td>
        <td>
          { String(result.is_right) == "true" ? "correct" : "wrong"}
        </td>
        </tr>
      )
    });
    return(
      <table className="table table-hover table-bordered">
        <thead>
          <tr>
            <th>Question</th>
            <th>Result</th>
          </tr>
        </thead>
        <tbody>
         { res }
          <tr>
            <td colSpan="2">Your score is : { this.state.correct } true and { this.state.wrong} false</td>
          </tr>
        </tbody>
      </table>
    )
  }
}