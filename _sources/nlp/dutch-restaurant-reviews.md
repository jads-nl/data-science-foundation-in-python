# Dutch restaurant reviews

## The challenge: predict the restaurant review score with the review text

Thanks to [the people at analyticslab.nl](https://www.theanalyticslab.nl/about-us/) we will use a restaurant review dataset as our introduction to NLP with spaCy. The dataset contains nearly 370.000 reviews collected over an eight-year period, which they scraped from the original review website (I think it was iens.nl). We will follow along [their blogpost series](https://www.theanalyticslab.nl/nlpblogs_0_preparing_restaurant_review_data_for_nlp_and_predictive_modeling/), but replacing their R code with a workflow in Python spaCy.

In the following notebooks we will compare different NLP techniques to show you how we get valuable information from unstructured text. Given the restaurant reviews, the challenge is whether these could be used to:
- Extract more structured information from the review texts without them having to read all the reviews one by one
- Extract actionable feedback to the restaurant staff
- Predict the review score using the text

Note that the original blog posts aimed to predict the next Michelin star. We will leave that as an extra challenge for you to try ...

The following tools and techniques will be demonstrated:

- How to setup a reproducible text pipeline in Python spaCy for text analysis.
- How to apply [topic modeling](http://www.cs.columbia.edu/~blei/papers/Blei2012.pdf) as the primary tool to extract information from the review texts, to be combined and used in predictive modeling techniques to end up with our predictions.