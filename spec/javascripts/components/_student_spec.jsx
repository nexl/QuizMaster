describe('Student', function() {
  let utils = React.addons.TestUtils;
  let renderer = utils.createRenderer();
  
  it('Render student and its child without error',() => {
    var component, element;
    let dummy_data = { id: 1, quizz_id: 1, full_name: 'abcd', token:'abcdefght' };
    element = React.createElement(
      Student,// Component
      {quiz_id:3, student: dummy_data}, // Props
      { StudentForm, StudentListHeader, StudentListDetail } // Children
    );
    // Render success
    expect( () => {
      component = utils.renderIntoDocument(element);
    }).not.toThrow();
  });

  it('Render student', () => {
    renderer.render(<Student />);
    let result = renderer.getRenderOutput();
    expect(result.type).toBe('div')
  });

})