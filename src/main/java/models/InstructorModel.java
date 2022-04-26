package models;

public class InstructorModel {
    String name, profile, skill_level, teaches_levels;

    public InstructorModel(String name, String profile, String skill_level, String teaches_levels) {
        this.name = name;
        this.profile = profile;
        this.skill_level = skill_level;
        this.teaches_levels = teaches_levels;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }

    public String getSkill_level() {
        return skill_level;
    }

    public void setSkill_level(String skill_level) {
        this.skill_level = skill_level;
    }

    public String getTeaches_levels() {
        return teaches_levels;
    }

    public void setTeaches_levels(String teaches_levels) {
        this.teaches_levels = teaches_levels;
    }
}
