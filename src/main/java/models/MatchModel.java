package models;

public class MatchModel {
    String match_date, location, court, team1, team2;

    public MatchModel(String match_date, String location, String court, String team1, String team2) {
        this.match_date = match_date;
        this.location = location;
        this.court = court;
        this.team1 = team1;
        this.team2 = team2;
    }

    public String getMatch_date() {
        return match_date;
    }

    public void setMatch_date(String match_date) {
        this.match_date = match_date;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getCourt() {
        return court;
    }

    public void setCourt(String court) {
        this.court = court;
    }

    public String getTeam1() {
        return team1;
    }

    public void setTeam1(String team1) {
        this.team1 = team1;
    }

    public String getTeam2() {
        return team2;
    }

    public void setTeam2(String team2) {
        this.team2 = team2;
    }
}
