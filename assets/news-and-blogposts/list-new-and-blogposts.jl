# This file was generated, do not modify it. # hide
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