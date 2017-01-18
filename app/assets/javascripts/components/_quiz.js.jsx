var Quiz = React.createClass({
  componentDidMount() { 
    $.getJSON('/api/v1/quizzes/' + this.props.quiz_id, (question) => { this.setState({ questions: question }) }); 
  },
  
  getInitialState() { 
    return { 
      questions: [],
      index: 0,
      answer: ''} 
  },
  
  onInputChange(answer){
    this.setState({answer});
  },

  handleClick(question_id){
    var answer = this.refs.answer.value; 
    newProgress = this.state.index + 1;
    this.setState({index: newProgress, answer: ''});
    $.ajax({
      url: '/api/v1/quizzes/1',
      type: 'PATCH',
      data: { quiz: {
        student_id : 6,
        question_id : question_id,
        answer: answer,
      }},
      success: (e) => {
        console.log('success', e)
      },
      error: function(xhr, textStatus, errorThrown){
       console.log(xhr.responseText);
      }
    });
  },

  render(){
    var current = this.state.questions[this.state.index];
    if (this.state.questions.length == 0){
      return(
        <div>Loading... </div>
      )
    }
    if (this.state.questions.length > this.state.index){
      return(
        <form className="form-horizontal" action="javascript:myFunction(); return false;">
          <div className="form-group">
            <label className="control-label col-sm-2">Question</label>
            <div className="col-sm-6">
             <span dangerouslySetInnerHTML={{__html: current.question_content}} />
            </div>
          </div>
            <div className="form-group">
              <label className="control-label col-sm-2">Answer</label>
              <div className="col-sm-6">
                <input ref='answer' placeholder='Answer' required='true' className="form-control" value = { this.state.answer }
        onChange= { event => this.onInputChange(event.target.value )} />
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
    else if (this.state.questions.length == this.state.index){
      return(
        <div>
        <div>Quiz is completed !!</div>
        </div>
      )
    }
    else{
      return (
        <div></div>
      )
    }
  }
});

