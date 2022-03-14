@def title = "Julia Smooth Optimizers"
@def mainpage = true

~~~
<div class="tile is-ancestor">
  <div class="tile is-vertical is-6>
    <div class="tile">
    <div class="tile is-parent is-vertical">
      <div class="tile is-child box has-background-white">
        <p class="subtitle has-text-weight-bold">
          <a href="/news-and-blogposts/" class="has-text-weight-bold">
            News and Blogposts
          </a>
        </p>
~~~
```julia:./list-news.jl
  #hideall
  for year in sort(readdir("news-and-blogposts"), rev=true)
    for post in sort(readdir("news-and-blogposts/$year"), rev=true)
      filename = "news-and-blogposts/$year/$post"
      link = "/" * splitext(filename)[1] * "/"
      title = pagevar(filename, :title)
      date = pagevar(filename, :date)
      excerpt = pagevar(filename, :rss_description)

      println("""~~~
      <div class="news-item">
        <a href="$link">
          <span class="is-size-7 has-text-grey-dark">
            $date
          </span>
          <br>
          <span class="is-size-4 has-text-primary">
            $title
          </span>
          <br>
          <span class="has-text-grey-dark">
            $excerpt
          </span>
        </a>
      </div>
      ~~~""")
    end
  end
```
\textoutput{./list-news.jl}
~~~
      </div>
    </div>

    <div class="tile is-parent is-vertical">
      <div class="tile is-child box has-background-white">
        <p class="subtitle has-text-weight-bold">
          <a href="/ecosystems/" class="has-text-weight-bold">
            Ecosystems
          </a>
        </p>
        <p>
          Understand our packages
        </p>

        <div class="columns">
          <div class="column">
            <a href="/ecosystems/linear-algebra/" class="button box is-info">Linear Algebra</a>
          </div>
          <div class="column">
            <a href="/ecosystems/models/"         class="button box is-danger">Models</a>
          </div>
          <div class="column">
            <a href="/ecosystems/solvers/"        class="button box is-success">Solvers</a>
          </div>
        </div>
      </div>
    </div>

  </div>

  <div class="tile is-parent is-vertical is-6">
    <div class="tile is-child box has-background-white">
      <p class="subtitle">
        <a href="/tutorials/" class="has-text-weight-bold">
          Check our tutorials and guides
        </a>
      </p>
      <p>
        We are centralizing all JSO tutorials in this page.
        You can find the full list
        <a href="/tutorials/" class="is-underlined">here</a>.
      </p>
      <p>
        Our latest tutorial is
      </p>
      <a href="{{ latest_link }}">
        <div class="box px-4 py-2 on-hover-primary on-hover-text-white is-clickable">
          <span class="is-size-4">{{ latest_title }}</span>
          <br><br>
          <span>{{ latest_short }}</span>
        </div>
      </a>
    </div>
  </div>

</div>
~~~