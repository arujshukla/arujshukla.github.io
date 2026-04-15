---
permalink: /teaching/econ-203-evaluations/
title: "ECON 203 Evaluations"
layout: interior
author_profile: false
sidebar_disabled: true
page_class: interior-unified-page
hide_title: true
---

{% assign evals = site.data.teaching_evaluations.econ_203 %}

<div class="interior-page">
  <div class="interior-layout">
    <aside class="interior-rail interior-rail--blank" aria-hidden="true">
      <div class="interior-rail__title">&nbsp;</div>
      <ul>
        <li>&nbsp;</li>
      </ul>
    </aside>

    <div class="interior-content section-content">
      <h1 class="research-page-title">{{ evals.page_title }}</h1>
      <p>{{ evals.subtitle }}</p>

      <section class="teaching-eval-summary" aria-label="Aggregate evaluation summary">
        <div class="teaching-eval-summary__lead">
          <p class="teaching-eval-summary__label">Overall score </p>
          <p class="teaching-eval-summary__score">{{ evals.summary.overall_score }}/{{ evals.summary.score_scale }}</p>
          <p class="teaching-eval-summary__meta">{{ evals.summary.total_responses }} responses from {{ evals.summary.total_audience }} enrolled students ({{ evals.summary.total_response_rate }} response rate)</p>
        </div>

        <div class="teaching-eval-summary__grid">
          <div class="teaching-eval-summary__metric">
            <p class="teaching-eval-summary__metric-label">Instructional Practices</p>
            <p class="teaching-eval-summary__metric-value">{{ evals.summary.instructional_practices }}/{{ evals.summary.score_scale }}</p>
          </div>
          <div class="teaching-eval-summary__metric">
            <p class="teaching-eval-summary__metric-label">Inclusion Practices</p>
            <p class="teaching-eval-summary__metric-value">{{ evals.summary.inclusion_practices }}/{{ evals.summary.score_scale }}</p>
          </div>
          <div class="teaching-eval-summary__metric">
            <p class="teaching-eval-summary__metric-label">Assessment Practices</p>
            <p class="teaching-eval-summary__metric-value">{{ evals.summary.assessment_practices }}/{{ evals.summary.score_scale }}</p>
          </div>
        </div>
      </section>

      <section class="teaching-feedback" aria-label="Selected student feedback">
        <h2>Selected Student Feedback</h2>
        <div class="teaching-feedback__list">
          {% for item in evals.feedback %}
            <blockquote class="teaching-feedback__quote">
              <p>{{ item.quote }}</p>
              <footer>{{ item.term }}</footer>
            </blockquote>
          {% endfor %}
        </div>
      </section>

      <section class="teaching-evals" aria-label="Semester evaluation archive">
        <h2>Semester Archive</h2>
        {% for semester in evals.semesters %}
          <div class="teaching-eval">
            <div class="teaching-eval__header">
              <p class="teaching-eval__term">{{ semester.term }}</p>
              <p class="teaching-eval__responses">{{ semester.total_responses }} of {{ semester.total_audience }} responses ({{ semester.total_response_rate }})</p>
            </div>

            <div class="teaching-eval__topline">
              <span class="teaching-eval__topline-label">Overall score </span>
              <span class="teaching-eval__topline-score">{{ semester.overall_score }}/{{ semester.score_scale }}</span>
            </div>

            <div class="teaching-eval__scores">
              <p><strong>Instructional Practices:</strong> {{ semester.instructional_practices }}/{{ semester.score_scale }}</p>
              <p><strong>Inclusion Practices:</strong> {{ semester.inclusion_practices }}/{{ semester.score_scale }}</p>
              <p><strong>Assessment Practices:</strong> {{ semester.assessment_practices }}/{{ semester.score_scale }}</p>
            </div>

            <div class="teaching-eval__links">
              {% for pdf in semester.pdfs %}
                <p class="teaching-eval__link">[<a href="{{ pdf.path }}">{{ pdf.label }}</a>]</p>
              {% endfor %}
            </div>
          </div>
        {% endfor %}
      </section>
    </div>
  </div>
</div>
