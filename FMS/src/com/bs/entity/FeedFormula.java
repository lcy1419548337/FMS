package com.bs.entity;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
@Table(name = "feed_formula", schema = "database", catalog = "")
public class FeedFormula {
    private int feedId;
    private String formulaName;
    private String formula;
    private Timestamp makeDate;
    private Float price;

    @Id
    @Column(name = "FeedId", nullable = false)
    public int getFeedId() {
        return feedId;
    }

    public void setFeedId(int feedId) {
        this.feedId = feedId;
    }

    @Basic
    @Column(name = "FormulaName", nullable = true, length = 50)
    public String getFormulaName() {
        return formulaName;
    }

    public void setFormulaName(String formulaName) {
        this.formulaName = formulaName;
    }

    @Basic
    @Column(name = "Formula", nullable = true, length = 255)
    public String getFormula() {
        return formula;
    }

    public void setFormula(String formula) {
        this.formula = formula;
    }

    @Basic
    @Column(name = "MakeDate", nullable = true)
    public Timestamp getMakeDate() {
        return makeDate;
    }

    public void setMakeDate(Timestamp makeDate) {
        this.makeDate = makeDate;
    }

    @Basic
    @Column(name = "Price", nullable = true, precision = 0)
    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        FeedFormula that = (FeedFormula) o;
        return feedId == that.feedId &&
                Objects.equals(formulaName, that.formulaName) &&
                Objects.equals(formula, that.formula) &&
                Objects.equals(makeDate, that.makeDate) &&
                Objects.equals(price, that.price);
    }

    @Override
    public int hashCode() {

        return Objects.hash(feedId, formulaName, formula, makeDate, price);
    }
}
