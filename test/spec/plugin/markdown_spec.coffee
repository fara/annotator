describe 'Annotator.Plugin.Markdown', ->
  el = null
  m = null
  input = 'Is **this** [Markdown](http://daringfireball.com)?'
  output = '<p>Is <strong>this</strong> <a href="http://daringfireball.com">Markdown</a>?</p>'

  beforeEach ->
    el = $('<div><div class="annotator-ann-text">' + input + '</div></div>')[0]
    $(el).data('annotation', {text: input})
    m = new Annotator.Plugin.Markdown(el)

  it 'should process the annotation text as Markdown when an annotationViewerShown event is fired', ->
    text = $(el).find('.annotator-ann-text').html()
    expect(text).toEqual(input)

    $(el).trigger('annotationViewerShown', [el, []])

    text = $(el).find('.annotator-ann-text').html()
    expect(text).toEqual(output)