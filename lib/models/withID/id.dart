class Id {
  final int simklId;

  Id({required this.simklId});

  factory Id.fromJson(Map<String, dynamic> json) {
    return Id(simklId: json['simkl_id']);
  }

  Map<String, dynamic> toJson() {
    return {'simkl_id': simklId};
  }
}
