open Types

(** The payload of an [ImportExn], describing the exception that caused [import]
    to fail *)
type import_exn =
  | UnsupportedHeaders
      (** Signals that the input CSV had headers in an unrecognized format *)
  | NonRectangularInput
      (** Signals that the input was not rectangular; i.e., that some rows had
          more elements than others *)

exception ImportExn of import_exn
(** An exception that may be raised by [import] *)

val import : string -> encryptable list
(** [import path] returns all of the secrets stored in plaintext in the file at
    [path]. Raises an appropriate [ImportExn] if this is not possible. *)

val export : encryptable list -> string -> unit
(** [export secrets path] writes all of [secrets] in plaintext to [path] *)
