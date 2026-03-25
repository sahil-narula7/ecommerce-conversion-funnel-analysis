WITH user_funnel AS (
  SELECT
    fullVisitorId,

    MAX(CASE WHEN hits.eCommerceAction.action_type = '2' THEN 1 ELSE 0 END) AS product_view,
    MAX(CASE WHEN hits.eCommerceAction.action_type = '3' THEN 1 ELSE 0 END) AS add_to_cart,
    MAX(CASE WHEN hits.eCommerceAction.action_type = '5' THEN 1 ELSE 0 END) AS checkout,
    MAX(CASE WHEN hits.eCommerceAction.action_type = '6' THEN 1 ELSE 0 END) AS purchase

  FROM
    `bigquery-public-data.google_analytics_sample.ga_sessions_*`,
    UNNEST(hits) AS hits

  WHERE
    _TABLE_SUFFIX BETWEEN '20160801' AND '20160916'

  GROUP BY
    fullVisitorId
)

SELECT
  COUNTIF(product_view = 1) AS product_view,
  COUNTIF(add_to_cart = 1) AS add_to_cart,
  COUNTIF(checkout = 1) AS checkout,
  COUNTIF(purchase = 1) AS purchase
FROM user_funnel