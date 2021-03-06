(*
 * Copyright (C) 2015 Citrix Systems Inc.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published
 * by the Free Software Foundation; version 2.1 only. with the special
 * exception on linking described in file LICENSE.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *)

module M : Map.S with type key = string

val notify: (unit -> unit) ref

val vm: (API.ref_pool * API.vM_t) M.t ref
val host: (API.ref_pool * API.host_t) M.t ref
val host_metrics: (API.ref_pool * API.host_metrics_t) M.t ref
val pool: API.pool_t M.t ref
val message: (API.ref_pool * API.message_t) M.t ref

type rpc = Rpc.call -> Rpc.response Lwt.t

type session_id = string

val start: rpc -> session_id -> API.ref_pool -> unit Lwt.t
(** Blocks until the first batch of events is received, then receives
    events forever, populating the local cache *)
