class TeamList {
  List<Teams> teams;

  TeamList({this.teams});

  TeamList.fromJson(Map<String, dynamic> json){
    if (json['teams'] != null) {
      teams = new List<Teams>();
      json['teams'].forEach((v) {
        teams.add(new Teams.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.teams != null) {
      data['teams'] = this.teams.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Teams {
  String idTeam;
  String strTeam;
  String strLeague;
  String strStadium;
  String strTeamBadge;
  String strTeamLogo;

  Teams({this.idTeam, this.strTeam, this.strLeague, this.strStadium, this.strTeamBadge, this.strTeamLogo});

  Teams.fromJson(Map<String, dynamic> json){
    idTeam = json['idTeam'];
    strTeam = json['strTeam'];
    strLeague = json['strLeague'];
    strStadium = json['strStadium'];
    strTeamBadge = json['strTeamBadge'];
    strTeamLogo = json['strTeamLogo'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idTeam'] = this.idTeam;
    data['strTeam'] = this.strTeam;
    data['strLeague'] = this.strLeague;
    data['strStadium'] = this.strStadium;
    data['strTeamBadge'] = this.strTeamBadge;
    data['strTeamLogo'] = this.strTeamLogo;
    return data;
  }
}
