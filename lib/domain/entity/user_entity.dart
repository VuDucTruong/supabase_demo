class UserEntity {
  int id;
  String title;
  String address;

  UserEntity(this.id, this.title, this.address);

  @override
  String toString() {
    return 'UserEntity{id: $id, title: $title, address: $address}';
  }
}
