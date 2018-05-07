package com.bs.entity;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
@Table(name = "history_group_feed", schema = "database", catalog = "")
public class HistoryGroupFeed {
    private int groupId;
    private int feedId;
    private Double amount;
    private Timestamp feedUseTime;
    private int number;

    @Basic
    @Column(name = "GroupId")
    public int getGroupId() {
        return groupId;
    }

    public void setGroupId(int groupId) {
        this.groupId = groupId;
    }

    @Basic
    @Column(name = "FeedId")
    public int getFeedId() {
        return feedId;
    }

    public void setFeedId(int feedId) {
        this.feedId = feedId;
    }

    @Basic
    @Column(name = "Amount")
    public Double getAmount() {
        return amount;
    }

    public void setAmount(Double amount) {
        this.amount = amount;
    }

    @Basic
    @Column(name = "FeedUseTime")
    public Timestamp getFeedUseTime() {
        return feedUseTime;
    }

    public void setFeedUseTime(Timestamp feedUseTime) {
        this.feedUseTime = feedUseTime;
    }

    @Id
    @Column(name = "Number")
    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        HistoryGroupFeed that = (HistoryGroupFeed) o;
        return groupId == that.groupId &&
                feedId == that.feedId &&
                number == that.number &&
                Objects.equals(amount, that.amount) &&
                Objects.equals(feedUseTime, that.feedUseTime);
    }

    @Override
    public int hashCode() {

        return Objects.hash(groupId, feedId, amount, feedUseTime, number);
    }
}
