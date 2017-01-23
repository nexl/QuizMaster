describe('Quiz', function() {
  let utils = React.addons.TestUtils;

  it('Render quiz and result without error', () => {
    var component, element;
    element = React.createElement(
      Quiz,
      {quiz_id: 5}, 
      { Result }
    );
    // Render quiz - result without error
    expect(function() {
      component = utils.renderIntoDocument(element);
    }).not.toThrow();
  });
})