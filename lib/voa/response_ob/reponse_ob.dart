class ResponseOb {
  MsgState? msgState;
  ErrState? errState;
  dynamic data;
  ResponseOb({this.data, this.errState, this.msgState});
}

enum MsgState { loading, data, error, other }

enum ErrState { servierErr, noFoundErr, unknownErr }
