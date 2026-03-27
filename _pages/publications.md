---
layout: archive
title: "Publications"
permalink: /publications/
author_profile: false
sidebar_disabled: true
---

{% if author.googlescholar %}
  You can also find my articles on <u><a href="{{author.googlescholar}}">my Google Scholar profile</a>.</u>
{% endif %}

{% include base_path %}

{% assign published_work = site.publications | where: "status", "Published" | sort: "year" | reverse %}

{% if published_work.size > 0 %}
  {% for post in published_work %}
    {% include archive-single.html %}
  {% endfor %}
{% else %}
  {% if site.author.googlescholar %}
    <p>You can also find my published work on <a href="{{ site.author.googlescholar }}">Google Scholar</a>.</p>
  {% endif %}
  <p>Published work will appear here as it becomes available. Current working papers and projects are listed on the <a href="{{ base_path }}/research/">Research</a> page.</p>
{% endif %}
