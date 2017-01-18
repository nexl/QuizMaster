var Result = React.createClass({
  componentDidMount() {
    $.getJSON('/api/v1/quizzes/' + this.props.quiz_id + '/result', (result) => { this.setState({ results: result }) }); 
   },

  getInitialState() { 
    return { 
      results: [],
    } 
  },

  render(){
    var res = this.state.results.map((result) => {
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
});