// Quiz component
class Quiz extends React.Component{
  constructor(props) {
    super(props);
    this.state = {
      question: [],
      index: 0, 
      answer: '',
      load: false // flag to hold quiz result
    };
  }

  // Call questions
  apiCall(){
      var url = '/api/v1/quizzes/' + this.props.quiz_id + '/' + this.props.token
      $.getJSON(url, (question) => { 
        this.setState({ question }) 
      });
  }

  componentDidMount() { 
    this.apiCall();
  }
  
  handleChange(answer){
    this.setState({answer});
  }

  // Submit answer and result : true/false
  handleClick(question_id){
    var answer = this.refs.answer.value; 
    question_index = this.state.index + 1;
    this.setState({ index: question_index, answer: '', load: false });
    $.ajax({
      url: '/api/v1/quizzes/1',
      type: 'PATCH',
      data: { quiz: {
        question_id : question_id,
        answer: answer,
      }},
      success: (e) => {
        //console.log('success', e)
        this.setState({ load: true })
      },
      error: function(xhr, textStatus, errorThrown){
        //console.log(xhr.responseText);
      }
    });
  }

  render(){
    // Mapping questions
    var current = this.state.question[this.state.index];

    // If quiz already finished
    if (this.state.question.status == "finished"){
      return(
        <div className="panel-setting">
          <p>You already finished this quiz !</p>
          <Result quiz_id={ this.props.quiz_id} />
        </div>
      )
    }
    // If id or token is wrong
    else if (this.state.question.status == "not_found"){
      return(
        <div className="panel-setting">
          <p>Sorry, we can't find your data</p>
        </div>
      )
    }
    // Loading ... 
    if (this.state.question.length == 0){
      return(
        <div>
          <span>Loading ... </span>
        </div>
      )
    }
    // Quiz found, Load 1 by 1
    if (this.state.question.length > this.state.index){
      return(
        <form className="form-horizontal" action="javascript:myFunction(); return false;">
          <div className="form-group">
            <label className="control-label col-sm-2">Question</label>
            <div className="col-sm-10">
             <span dangerouslySetInnerHTML={{__html: current.question_content}} />
            </div>
          </div>
            <div className="form-group">
              <label className="control-label col-sm-2">Answer</label>
              <div className="col-sm-10">
                <input ref='answer' placeholder='Answer' required='true' className="form-control" value = { this.state.answer }
        onChange= { event => this.handleChange(event.target.value )} />
              </div>
            </div>

            <div className="form-group">
             <div className="col-sm-offset-2 col-sm-10">
              <input type="button" name="commit" value="Answer" className="btn btn-default" onClick={() => this.handleClick(current.id) }/>
              </div>
            </div>
        </form>
      )
    }
    // Finished, load result
    else if (this.state.question.length == this.state.index && this.state.load == true){
      return(
        <div className="panel-setting">
        <div>Quiz is completed !!</div>
        <Result quiz_id={ this.props.quiz_id} />
        </div>
      )
    }
    else{
      return (
        <div></div>
      )
    }
  }
}
