# Levels

## Level 1 - set the base

A Customer should be able to visualize all of his Portfolios. It is important to note that:

- A Portfolio is characterized by its label, type and total amount.
- An Investment is characterized by its ISIN (global identifier), type, label, price and SRI (risk level).
- Some Portfolios can invest in an Investment. If they can, they have no limits on the number of investment they make, but can only invest once in a given Investment.
- Multiple Portfolios can invest in the same Investment.
- The Customer wants to be able to see the Investments of a Portfolio, if any, the amount that they have invested in it and the share that each Investment represents for the Portfolio.

Define Models, Views and Controllers for an endpoint to return the content within `data/level_1/portfolios.json` in the most adapted format.

## Level 2 - making changes

The Customer would like to be able to arbitrate their investments within a Portfolio on which it is allowed. They can:

- Deposit money into their existing investments.
- Withdraw money from their existing investments.
- Move money from one of their investments to another.

Considering that these operations are only doable for "CTO" and "PEA", define an interface allowing the Customer to make
changes on their Portfolios.

## Level 3 - understanding their investments

The reason why the Customer has chosen iSave instead of any other platform is because iSave also allows for the Customer to have a better understanding of their investments; they are provided the following indicators on the Portfolios that they have:

- The risk they take on any given Portfolio, computed through their investments.
- The allocation of their Portfolio by type of Investment.
- The global risk they take with all of their Portfolios.
- The global allocation of their Portfolios by type of Investment.

Define an interface allowing the Customer to retrieve these indicators.

## Level 4 - how did they do?

The Customer has been investing on iSave for a while, and would like to know how they have done historically. As such, they can:

- See the historical values of their Portfolios.
- The yields (percentage of growth) of their Portfolios globally and at any given date.

Considering that the yield is computed as follows:

$$Y = (\dfrac{Vc}{Vi} - 1) \times 100$$

Define an interface allowing the Customer to access this information. The weekly valuation of their Portfolios are in `data/level_4/historical_values.json`

## Level 5 - the end game

iSave applies monthly fees for hosting the Customer's Portfolios with investments on their servers. The fees are as follow:

- 5% for amounts between 0 and 5000
- 3% for amounts between 5000 and 7500
- 2% for amounts between 7500 and 10000
- 0.8% for amounts above 10000

With regards to these fees, the Customer would like to see:

- the current % of fees applied to each of their Portfolios.
- the current amount of fees applied to each of their Portfolios.
- the amount in fees they have paid globally by Portfolio since their addition to the platform.
- the values above, but globally on all of their Portfolios.

Define an interface allowing the Customer to access this information.
