package models;

public class TeamsModel {
    String team_name, team_type;

    public TeamsModel(String team_name, String team_type) {
        this.team_name = team_name;
        this.team_type = team_type;
    }

    public String getTeam_name() {
        return team_name;
    }

    public void setTeam_name(String team_name) {
        this.team_name = team_name;
    }

    public String getTeam_type() {
        return team_type;
    }

    public void setTeam_type(String team_type) {
        this.team_type = team_type;
    }
}
