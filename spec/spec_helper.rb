def question_doc_with_path path
  <<-DOC
      <div class="summary">
        <div class="result-link">
          <span>
            <a href="#{path}" title="Some Question">Some Question</a>
          </span>
        </div>
      </div>
  DOC
end

def answer_doc title, question, answer
  <<-DOC
      <div id="question-header">
        <h1 itemprop="name"><a href="/questions/127932/" class="question-hyperlink">#{title}</a></h1>
      </div>
      <div class="post-text" itemprop="description">#{question}</div>
      <tr>
        <td class="votecell">
          <div class="vote">
            <span class="vote-accepted-on load-accepted-answer-date">accepted</span>
          </div>
        </td>
        <td class="answercell">
          <div class="post-text">#{answer}</div>
        </td>
      </tr>
  DOC
end