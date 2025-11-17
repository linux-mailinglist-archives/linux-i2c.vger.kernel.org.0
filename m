Return-Path: <linux-i2c+bounces-14120-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFF6C650D0
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Nov 2025 17:12:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 554B82903D
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Nov 2025 16:12:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2517A2BEC3A;
	Mon, 17 Nov 2025 16:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="qAdxJqHd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603E629B78D
	for <linux-i2c@vger.kernel.org>; Mon, 17 Nov 2025 16:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763395961; cv=none; b=pOzZkwDANo2LMMm+3eBwmgFSIzVuL3/AAIJfVpXeafPSQtV1lKAcXk470DKfrfIE7bIi7zv9CkGuHJHUNZIBswurIPqyINuCS+oKSjeo1ch8CX0QuQiftyILMvM42Ez1c7kaW/As9ROah56rR2H+kuDdgHUXF5rqVml4AiqW2qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763395961; c=relaxed/simple;
	bh=Npy8TROYlKJoDy3EE7haaazJA4Rtc5tlhYl4KZMlB+s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uoiPTrT2eJFI0Ewf5lEXrHWqrrKn2fjfUS5NTgubLz5om4vd6QyRbIqmcYLLcfHiqJUZL85nDYwBNnxPiVQSg9bk5n9xQbODm4dozhko2Lx3WWB9G2Nn0ymdB9+IxHn1l1aP4k0rt5k+/NZxBNs0WS4wVawNmHQC9OySqUHQieY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=qAdxJqHd; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id AE231240027
	for <linux-i2c@vger.kernel.org>; Mon, 17 Nov 2025 17:12:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1763395956; bh=/BKuEjeCxWfNcidUlr8SMDCqVDIEU5ei+2jZ1XKOarw=;
	h=Message-ID:Subject:From:To:Cc:Date:Autocrypt:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:OpenPGP:From;
	b=qAdxJqHdENUQDdBlLf8r5twCFVI6Bnh9TFKhDDZwRzWoqmT97BQioangbkNq2VVHY
	 SK2DuK2ShhFAQlIS4mRgQ0ADe0a2JbwZRJ6MNNaXe2OKwT9ySpaPRB5RkoVm96bq1G
	 Jq+uSIsMW3M+BE5cJiXRUmqBmqBd4z7axU6yos+CPoC4WZ7/+ko4o9USC1sZHF3oGX
	 pFhLy0y18Hv54tNCCetj+QQYWAaR/cc8ru79ZouKwppYkxhEqklZVpS/mFErGq2DUI
	 Cb/D0+Xx8pLJGAbeN6KDgKuYO2+BlOsb57N+PHF5ZlWXRDETLqbT0FRR0jEQYTdtES
	 SD59/lGZuhbXg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4d9CSc74Xcz9rxR;
	Mon, 17 Nov 2025 17:12:32 +0100 (CET)
Message-ID: <b4092d2693a06526e2b39fd7642e80dd2a7cd0e8.camel@posteo.de>
Subject: Re: [PATCH v8 1/4] rust: i2c: add basic I2C device and driver
 abstractions
From: Markus Probst <markus.probst@posteo.de>
To: Igor Korotin <igor.korotin.linux@gmail.com>, Miguel Ojeda
 <ojeda@kernel.org>,  Alex Gaynor <alex.gaynor@gmail.com>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?ISO-8859-1?Q?Bj=F6rn?= Roy Baron	 <bjorn3_gh@protonmail.com>, Benno
 Lossin <lossin@kernel.org>, Andreas Hindborg	 <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross	 <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman	
 <gregkh@linuxfoundation.org>, Viresh Kumar <viresh.kumar@linaro.org>, Asahi
 Lina <lina+kernel@asahilina.net>, Wedson Almeida Filho
 <wedsonaf@gmail.com>, Alex Hung	 <alex.hung@amd.com>, Tamir Duberstein
 <tamird@gmail.com>, Xiangfei Ding	 <dingxiangfei2009@gmail.com>,
 linux-kernel@vger.kernel.org, 	rust-for-linux@vger.kernel.org,
 linux-i2c@vger.kernel.org
Date: Mon, 17 Nov 2025 16:12:35 +0000
In-Reply-To: <20251116162144.171469-1-igor.korotin.linux@gmail.com>
References: <20251116162104.171420-1-igor.korotin.linux@gmail.com>
	 <20251116162144.171469-1-igor.korotin.linux@gmail.com>
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
 keydata=mQINBGiDvXgBEADAXUceKafpl46S35UmDh2wRvvx+UfZbcTjeQOlSwKP7YVJ4JOZrVs93
 qReNLkOWguIqPBxR9blQ4nyYrqSCV+MMw/3ifyXIm6Pw2YRUDg+WTEOjTixRCoWDgUj1nOsvJ9tVA
 m76Ww+/pAnepVRafMID0rqEfD9oGv1YrfpeFJhyE2zUw3SyyNLIKWD6QeLRhKQRbSnsXhGLFBXCqt
 9k5JARhgQof9zvztcCVlT5KVvuyfC4H+HzeGmu9201BVyihJwKdcKPq+n/aY5FUVxNTgtI9f8wIbm
 fAjaoT1pjXSp+dszakA98fhONM98pOq723o/1ZGMZukyXFfsDGtA3BB79HoopHKujLGWAGskzClwT
 jRQxBqxh/U/lL1pc+0xPWikTNCmtziCOvv0KA0arDOMQlyFvImzX6oGVgE4ksKQYbMZ3Ikw6L1Rv1
 J+FvN0aNwOKgL2ztBRYscUGcQvA0Zo1fGCAn/BLEJvQYShWKeKqjyncVGoXFsz2AcuFKe1pwETSsN
 6OZncjy32e4ktgs07cWBfx0v62b8md36jau+B6RVnnodaA8++oXl3FRwiEW8XfXWIjy4umIv93tb8
 8ekYsfOfWkTSewZYXGoqe4RtK80ulMHb/dh2FZQIFyRdN4HOmB4FYO5sEYFr9YjHLmDkrUgNodJCX
 CeMe4BO4iaxUQARAQABtBdtYXJrdXMucHJvYnN0QHBvc3Rlby5kZYkCUQQTAQgAOxYhBIJ0GMT0rF
 jncjDEczR2H/jnrUPSBQJog714AhsDBQsJCAcCAiICBhUKCQgLAgQWAgMBAh4HAheAAAoJEDR2H/j
 nrUPSgdkQAISaTk2D345ehXEkn5z2yUEjaVjHIE7ziqRaOgn/QanCgeTUinIv6L6QXUFvvIfH1OLP
 wQ1hfvEg9NnNLyFezWSy6jvoVBTIPqicD/r3FkithnQ1IDkdSjrarPMxJkvuh3l7XZHo49GVHQ8i5
 zh5w4YISrcEtE99lJisvni2Jqx7we5tey9voQFDyM8jxlSWv3pmoUTCtBkX/eKHJXosgsuSB4TGDC
 VPOjla/emI5c9MhMG7O4WEEmoSdPbmraPw66YZD6uLyhV4DPHbiDWRzXWnClHSyjB9rky9lausFxo
 gvu4l9H+KDsXIadNDWdLdu1/enS/wDd9zh5S78rY2jeXaG4mnf4seEKamZ7KQ6FIHrcyPezdDzssP
 QcTQcGRMQzCn6wP3tlGk7rsfmyHMlFqdRoNNv+ZER/OkmZFPW655zRfbMi0vtrqK2Awm9ggobb1ok
 tfd9PPNXMUY+DNVlgR2G7jLnenSoQausLUm0pHoNE8TWFv851Y6SOYnvn488sP1Tki5F3rKwclawQ
 FHUXTCQw+QSh9ay8xgnNZfH+u9NY7w3gPoeKBOAFcBc2BtzcgekeWS8qgEmm2/oNFVG0ivPQbRx8F
 jRKbuF7g3YhgNZZ0ac8FneuUtJ2PkSIFTZhaAiC0utvxk0ndmWFiW4acEkMZGrLaML2zWNjrqwsD2
 tCdNYXJrdXMgUHJvYnN0IDxtYXJrdXMucHJvYnN0QHBvc3Rlby5kZT6JAlQEEwEIAD4CGwMFCwkIB
 wICIgIGFQoJCAsCBBYCAwECHgcCF4AWIQSCdBjE9KxY53IwxHM0dh/4561D0gUCaIZ9HQIZAQAKCR
 A0dh/4561D0pKmD/92zsCfbD+SrvBpNWtbit7J9wFBNr9qSFFm2n/65qenNNWKDrCzDsjRbALMHSO
 8nigMWzjofbVjj8Nf7SDcdapRjrMCnidS0DuW3pZBo6W0sZqV/fLx+AzgQ7PAr6jtBbUoKW/GCGHL
 Ltb6Hv+zjL17KGVO0DdQeoHEXMa48mJh8rS7VlUzVtpbxsWbb1wRZJTD88ALDOLTWGqMbCTFDKFfG
 cqBLdUT13vx706Q29wrDiogmQhLGYKc6fQzpHhCLNhHTl8ZVLuKVY3wTT+f9TzW1BDzFTAe3ZXsKh
 rzF+ud7vr6ff9p1Zl+Nujz94EDYHi/5Yrtp//+N/ZjDGDmqZOEA86/Gybu6XE/v4S85ls0cAe37WT
 qsMCJjVRMP52r7Y1AuOONJDe3sIsDge++XFhwfGPbZwBnwd4gEVcdrKhnOntuP9TvBMFWeTvtLqlW
 JUt7n8f/ELCcGoO5acai1iZ59GC81GLl2izObOLNjyv3G6hia/w50Mw9MUdAdZQ2MxM6k+x4L5Xey
 sdcR/2AydVLtu2LGFOrKyEe0M9XmlE6OvziWXvVVwomvTN3LaNUmaINhr7pHTFwDiZCSWKnwnvD2+
 jA1trKq1xKUQY1uGW9XgSj98pKyixHWoeEpydr+alSTB43c3m0351/9rYTTTi4KSk73wtapPKtaoI
 R3rOFHA==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt

On Sun, 2025-11-16 at 16:21 +0000, Igor Korotin wrote:
> Implement the core abstractions needed for I2C drivers, including:
>=20
> * `i2c::Driver` =E2=80=94 the trait drivers must implement, including `pr=
obe`
>=20
> * `i2c::I2cClient` =E2=80=94 a safe wrapper around `struct i2c_client`
>=20
> * `i2c::Adapter` =E2=80=94 implements `driver::RegistrationOps` to hook i=
nto the
>   generic `driver::Registration` machinery
>=20
> * `i2c::DeviceId` =E2=80=94 a `RawDeviceIdIndex` implementation for I2C d=
evice IDs
>=20
> Signed-off-by: Igor Korotin <igor.korotin.linux@gmail.com>
> ---
>  MAINTAINERS                     |   8 +
>  rust/bindings/bindings_helper.h |   1 +
>  rust/kernel/i2c.rs              | 436 ++++++++++++++++++++++++++++++++
>  rust/kernel/lib.rs              |   2 +
>  4 files changed, 447 insertions(+)
>  create mode 100644 rust/kernel/i2c.rs
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3da2c26a796b..a8dfde2f5633 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11743,6 +11743,14 @@ F:	include/linux/i2c.h
>  F:	include/uapi/linux/i2c-*.h
>  F:	include/uapi/linux/i2c.h
> =20
> +I2C SUBSYSTEM [RUST]
> +M:	Igor Korotin <igor.korotin.linux@gmail.com>
> +R:	Danilo Krummrich <dakr@kernel.org>
> +R:	Daniel Almeida <daniel.almeida@collabora.com>
> +L:	rust-for-linux@vger.kernel.org
> +S:	Maintained
> +F:	rust/kernel/i2c.rs
> +
>  I2C SUBSYSTEM HOST DRIVERS
>  M:	Andi Shyti <andi.shyti@kernel.org>
>  L:	linux-i2c@vger.kernel.org
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_hel=
per.h
> index a79fd111f886..f92abb578b56 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -58,6 +58,7 @@
>  #include <linux/firmware.h>
>  #include <linux/interrupt.h>
>  #include <linux/fs.h>
> +#include <linux/i2c.h>
>  #include <linux/ioport.h>
>  #include <linux/jiffies.h>
>  #include <linux/jump_label.h>
> diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
> new file mode 100644
> index 000000000000..a5ad8213d9ac
> --- /dev/null
> +++ b/rust/kernel/i2c.rs
> @@ -0,0 +1,436 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! I2C Driver subsystem
> +
> +// I2C Driver abstractions.
> +use crate::{
> +    acpi,
> +    container_of,
> +    device,
> +    device_id::{
> +        RawDeviceId,
> +        RawDeviceIdIndex, //
> +    },
> +    driver,
> +    error::*,
> +    of,
> +    prelude::*,
> +    types::{
> +        AlwaysRefCounted,
> +        Opaque, //
> +    }, //
> +};
> +
> +use core::{
> +    marker::PhantomData,
> +    ptr::NonNull, //
> +};
> +
> +/// An I2C device id table.
> +#[repr(transparent)]
> +#[derive(Clone, Copy)]
> +pub struct DeviceId(bindings::i2c_device_id);
> +
> +impl DeviceId {
> +    const I2C_NAME_SIZE: usize =3D 20;
> +
> +    /// Create a new device id from an I2C 'id' string.
> +    #[inline(always)]
> +    pub const fn new(id: &'static CStr) -> Self {
> +        build_assert!(
> +            id.len_with_nul() <=3D Self::I2C_NAME_SIZE,
> +            "ID exceeds 20 bytes"
> +        );
> +        let src =3D id.as_bytes_with_nul();
> +        // Replace with `bindings::i2c_device_id::default()` once stabil=
ized for `const`.
> +        // SAFETY: FFI type is valid to be zero-initialized.
> +        let mut i2c: bindings::i2c_device_id =3D pin_init::zeroed();
Clippy throws the error:

error: statement has unnecessary safety comment
  --> rust/kernel/i2c.rs:54:9
   |
54 |         let mut i2c: bindings::i2c_device_id =3D pin_init::zeroed();
   |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
help: consider removing the safety comment
  --> rust/kernel/i2c.rs:53:9
   |
53 |         // SAFETY: FFI type is valid to be zero-initialized.
   |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   =3D help: for further information visit
https://rust-lang.github.io/rust-clippy/rust-1.91.0/index.html#unnecessary_=
safety_comment
   =3D note: `-D clippy::unnecessary-safety-comment` implied by `-D
warnings`
   =3D help: to override `-D warnings` add
`#[allow(clippy::unnecessary_safety_comment)]`

Thanks
- Markus Probst

> +        let mut i =3D 0;
> +        while i < src.len() {
> +            i2c.name[i] =3D src[i];
> +            i +=3D 1;
> +        }
> +
> +        Self(i2c)
> +    }
> +}
> +
> +// SAFETY: `DeviceId` is a `#[repr(transparent)]` wrapper of `i2c_device=
_id` and does not add
> +// additional invariants, so it's safe to transmute to `RawType`.
> +unsafe impl RawDeviceId for DeviceId {
> +    type RawType =3D bindings::i2c_device_id;
> +}
> +
> +// SAFETY: `DRIVER_DATA_OFFSET` is the offset to the `driver_data` field=
.
> +unsafe impl RawDeviceIdIndex for DeviceId {
> +    const DRIVER_DATA_OFFSET: usize =3D core::mem::offset_of!(bindings::=
i2c_device_id, driver_data);
> +
> +    fn index(&self) -> usize {
> +        self.0.driver_data
> +    }
> +}
> +
> +/// IdTable type for I2C
> +pub type IdTable<T> =3D &'static dyn kernel::device_id::IdTable<DeviceId=
, T>;
> +
> +/// Create a I2C `IdTable` with its alias for modpost.
> +#[macro_export]
> +macro_rules! i2c_device_table {
> +    ($table_name:ident, $module_table_name:ident, $id_info_type: ty, $ta=
ble_data: expr) =3D> {
> +        const $table_name: $crate::device_id::IdArray<
> +            $crate::i2c::DeviceId,
> +            $id_info_type,
> +            { $table_data.len() },
> +        > =3D $crate::device_id::IdArray::new($table_data);
> +
> +        $crate::module_device_table!("i2c", $module_table_name, $table_n=
ame);
> +    };
> +}
> +
> +/// An adapter for the registration of I2C drivers.
> +pub struct Adapter<T: Driver>(T);
> +
> +// SAFETY: A call to `unregister` for a given instance of `RegType` is g=
uaranteed to be valid if
> +// a preceding call to `register` has been successful.
> +unsafe impl<T: Driver + 'static> driver::RegistrationOps for Adapter<T> =
{
> +    type RegType =3D bindings::i2c_driver;
> +
> +    unsafe fn register(
> +        idrv: &Opaque<Self::RegType>,
> +        name: &'static CStr,
> +        module: &'static ThisModule,
> +    ) -> Result {
> +        build_assert!(
> +            T::ACPI_ID_TABLE.is_some() || T::OF_ID_TABLE.is_some() || T:=
:I2C_ID_TABLE.is_some(),
> +            "At least one of ACPI/OF/Legacy tables must be present when =
registering an i2c driver"
> +        );
> +
> +        let i2c_table =3D match T::I2C_ID_TABLE {
> +            Some(table) =3D> table.as_ptr(),
> +            None =3D> core::ptr::null(),
> +        };
> +
> +        let of_table =3D match T::OF_ID_TABLE {
> +            Some(table) =3D> table.as_ptr(),
> +            None =3D> core::ptr::null(),
> +        };
> +
> +        let acpi_table =3D match T::ACPI_ID_TABLE {
> +            Some(table) =3D> table.as_ptr(),
> +            None =3D> core::ptr::null(),
> +        };
> +
> +        // SAFETY: It's safe to set the fields of `struct i2c_client` on=
 initialization.
> +        unsafe {
> +            (*idrv.get()).driver.name =3D name.as_char_ptr();
> +            (*idrv.get()).probe =3D Some(Self::probe_callback);
> +            (*idrv.get()).remove =3D Some(Self::remove_callback);
> +            (*idrv.get()).shutdown =3D Some(Self::shutdown_callback);
> +            (*idrv.get()).id_table =3D i2c_table;
> +            (*idrv.get()).driver.of_match_table =3D of_table;
> +            (*idrv.get()).driver.acpi_match_table =3D acpi_table;
> +        }
> +
> +        // SAFETY: `idrv` is guaranteed to be a valid `RegType`.
> +        to_result(unsafe { bindings::i2c_register_driver(module.0, idrv.=
get()) })
> +    }
> +
> +    unsafe fn unregister(idrv: &Opaque<Self::RegType>) {
> +        // SAFETY: `idrv` is guaranteed to be a valid `RegType`.
> +        unsafe { bindings::i2c_del_driver(idrv.get()) }
> +    }
> +}
> +
> +impl<T: Driver + 'static> Adapter<T> {
> +    extern "C" fn probe_callback(idev: *mut bindings::i2c_client) -> ker=
nel::ffi::c_int {
> +        // SAFETY: The I2C bus only ever calls the probe callback with a=
 valid pointer to a
> +        // `struct i2c_client`.
> +        //
> +        // INVARIANT: `idev` is valid for the duration of `probe_callbac=
k()`.
> +        let idev =3D unsafe { &*idev.cast::<I2cClient<device::CoreIntern=
al>>() };
> +
> +        let info =3D
> +            Self::i2c_id_info(idev).or_else(|| <Self as driver::Adapter>=
::id_info(idev.as_ref()));
> +
> +        from_result(|| {
> +            let data =3D T::probe(idev, info);
> +
> +            idev.as_ref().set_drvdata(data)?;
> +            Ok(0)
> +        })
> +    }
> +
> +    extern "C" fn remove_callback(idev: *mut bindings::i2c_client) {
> +        // SAFETY: `idev` is a valid pointer to a `struct i2c_client`.
> +        let idev =3D unsafe { &*idev.cast::<I2cClient<device::CoreIntern=
al>>() };
> +
> +        // SAFETY: `remove_callback` is only ever called after a success=
ful call to
> +        // `probe_callback`, hence it's guaranteed that `I2cClient::set_=
drvdata()` has been called
> +        // and stored a `Pin<KBox<T>>`.
> +        let data =3D unsafe { idev.as_ref().drvdata_obtain::<T>() };
> +
> +        T::unbind(idev, data.as_ref());
> +    }
> +
> +    extern "C" fn shutdown_callback(idev: *mut bindings::i2c_client) {
> +        // SAFETY: `shutdown_callback` is only ever called for a valid `=
idev`
> +        let idev =3D unsafe { &*idev.cast::<I2cClient<device::CoreIntern=
al>>() };
> +
> +        // SAFETY: `shutdown_callback` is only ever called after a succe=
ssful call to
> +        // `probe_callback`, hence it's guaranteed that `Device::set_drv=
data()` has been called
> +        // and stored a `Pin<KBox<T>>`.
> +        let data =3D unsafe { idev.as_ref().drvdata_obtain::<T>() };
> +
> +        T::shutdown(idev, data.as_ref());
> +    }
> +
> +    /// The [`i2c::IdTable`] of the corresponding driver.
> +    fn i2c_id_table() -> Option<IdTable<<Self as driver::Adapter>::IdInf=
o>> {
> +        T::I2C_ID_TABLE
> +    }
> +
> +    /// Returns the driver's private data from the matching entry in the=
 [`i2c::IdTable`], if any.
> +    ///
> +    /// If this returns `None`, it means there is no match with an entry=
 in the [`i2c::IdTable`].
> +    fn i2c_id_info(dev: &I2cClient) -> Option<&'static <Self as driver::=
Adapter>::IdInfo> {
> +        let table =3D Self::i2c_id_table()?;
> +
> +        // SAFETY:
> +        // - `table` has static lifetime, hence it's valid for reads
> +        // - `dev` is guaranteed to be valid while it's alive, and so is=
 `dev.as_raw()`.
> +        let raw_id =3D unsafe { bindings::i2c_match_id(table.as_ptr(), d=
ev.as_raw()) };
> +
> +        if raw_id.is_null() {
> +            return None;
> +        }
> +
> +        // SAFETY: `DeviceId` is a `#[repr(transparent)` wrapper of `str=
uct i2c_device_id` and
> +        // does not add additional invariants, so it's safe to transmute=
.
> +        let id =3D unsafe { &*raw_id.cast::<DeviceId>() };
> +
> +        Some(table.info(<DeviceId as RawDeviceIdIndex>::index(id)))
> +    }
> +}
> +
> +impl<T: Driver + 'static> driver::Adapter for Adapter<T> {
> +    type IdInfo =3D T::IdInfo;
> +
> +    fn of_id_table() -> Option<of::IdTable<Self::IdInfo>> {
> +        T::OF_ID_TABLE
> +    }
> +
> +    fn acpi_id_table() -> Option<acpi::IdTable<Self::IdInfo>> {
> +        T::ACPI_ID_TABLE
> +    }
> +}
> +
> +/// Declares a kernel module that exposes a single i2c driver.
> +///
> +/// # Examples
> +///
> +/// ```ignore
> +/// kernel::module_i2c_driver! {
> +///     type: MyDriver,
> +///     name: "Module name",
> +///     authors: ["Author name"],
> +///     description: "Description",
> +///     license: "GPL v2",
> +/// }
> +/// ```
> +#[macro_export]
> +macro_rules! module_i2c_driver {
> +    ($($f:tt)*) =3D> {
> +        $crate::module_driver!(<T>, $crate::i2c::Adapter<T>, { $($f)* })=
;
> +    };
> +}
> +
> +/// The i2c driver trait.
> +///
> +/// Drivers must implement this trait in order to get a i2c driver regis=
tered.
> +///
> +/// # Example
> +///
> +///```
> +/// # use kernel::{acpi, bindings, c_str, device::Core, i2c, of};
> +///
> +/// struct MyDriver;
> +///
> +/// kernel::acpi_device_table!(
> +///     ACPI_TABLE,
> +///     MODULE_ACPI_TABLE,
> +///     <MyDriver as i2c::Driver>::IdInfo,
> +///     [
> +///         (acpi::DeviceId::new(c_str!("LNUXBEEF")), ())
> +///     ]
> +/// );
> +///
> +/// kernel::i2c_device_table!(
> +///     I2C_TABLE,
> +///     MODULE_I2C_TABLE,
> +///     <MyDriver as i2c::Driver>::IdInfo,
> +///     [
> +///          (i2c::DeviceId::new(c_str!("rust_driver_i2c")), ())
> +///     ]
> +/// );
> +///
> +/// kernel::of_device_table!(
> +///     OF_TABLE,
> +///     MODULE_OF_TABLE,
> +///     <MyDriver as i2c::Driver>::IdInfo,
> +///     [
> +///         (of::DeviceId::new(c_str!("test,device")), ())
> +///     ]
> +/// );
> +///
> +/// impl i2c::Driver for MyDriver {
> +///     type IdInfo =3D ();
> +///     const I2C_ID_TABLE: Option<i2c::IdTable<Self::IdInfo>> =3D Some(=
&I2C_TABLE);
> +///     const OF_ID_TABLE: Option<of::IdTable<Self::IdInfo>> =3D Some(&O=
F_TABLE);
> +///     const ACPI_ID_TABLE: Option<acpi::IdTable<Self::IdInfo>> =3D Som=
e(&ACPI_TABLE);
> +///
> +///     fn probe(
> +///         _idev: &i2c::I2cClient<Core>,
> +///         _id_info: Option<&Self::IdInfo>,
> +///     ) -> impl PinInit<Self, Error> {
> +///         Err(ENODEV)
> +///     }
> +///
> +///     fn shutdown(_idev: &i2c::I2cClient<Core>, this: Pin<&Self>) {
> +///     }
> +/// }
> +///```
> +pub trait Driver: Send {
> +    /// The type holding information about each device id supported by t=
he driver.
> +    // TODO: Use `associated_type_defaults` once stabilized:
> +    //
> +    // ```
> +    // type IdInfo: 'static =3D ();
> +    // ```
> +    type IdInfo: 'static;
> +
> +    /// The table of device ids supported by the driver.
> +    const I2C_ID_TABLE: Option<IdTable<Self::IdInfo>> =3D None;
> +
> +    /// The table of OF device ids supported by the driver.
> +    const OF_ID_TABLE: Option<of::IdTable<Self::IdInfo>> =3D None;
> +
> +    /// The table of ACPI device ids supported by the driver.
> +    const ACPI_ID_TABLE: Option<acpi::IdTable<Self::IdInfo>> =3D None;
> +
> +    /// I2C driver probe.
> +    ///
> +    /// Called when a new i2c client is added or discovered.
> +    /// Implementers should attempt to initialize the client here.
> +    fn probe(
> +        dev: &I2cClient<device::Core>,
> +        id_info: Option<&Self::IdInfo>,
> +    ) -> impl PinInit<Self, Error>;
> +
> +    /// I2C driver shutdown.
> +    ///
> +    /// Called by the kernel during system reboot or power-off to allow =
the [`Driver`] to bring the
> +    /// [`Device`] into a safe state. Implementing this callback is opti=
onal.
> +    ///
> +    /// Typical actions include stopping transfers, disabling interrupts=
, or resetting the hardware
> +    /// to prevent undesired behavior during shutdown.
> +    ///
> +    /// This callback is distinct from final resource cleanup, as the dr=
iver instance remains valid
> +    /// after it returns. Any deallocation or teardown of driver-owned r=
esources should instead be
> +    /// handled in `Self::drop`.
> +    fn shutdown(dev: &I2cClient<device::Core>, this: Pin<&Self>) {
> +        let _ =3D (dev, this);
> +    }
> +
> +    /// I2C driver unbind.
> +    ///
> +    /// Called when a [`Device`] is unbound from its bound [`Driver`]. I=
mplementing this callback
> +    /// is optional.
> +    ///
> +    /// This callback serves as a place for drivers to perform teardown =
operations that require a
> +    /// `&Device<Core>` or `&Device<Bound>` reference. For instance, dri=
vers may try to perform I/O
> +    /// operations to gracefully tear down the device.
> +    ///
> +    /// Otherwise, release operations for driver resources should be per=
formed in `Self::drop`.
> +    fn unbind(dev: &I2cClient<device::Core>, this: Pin<&Self>) {
> +        let _ =3D (dev, this);
> +    }
> +}
> +
> +/// The i2c client representation.
> +///
> +/// This structure represents the Rust abstraction for a C `struct i2c_c=
lient`. The
> +/// implementation abstracts the usage of an existing C `struct i2c_clie=
nt` that
> +/// gets passed from the C side
> +///
> +/// # Invariants
> +///
> +/// A [`I2cClient`] instance represents a valid `struct i2c_client` crea=
ted by the C portion of
> +/// the kernel.
> +#[repr(transparent)]
> +pub struct I2cClient<Ctx: device::DeviceContext =3D device::Normal>(
> +    Opaque<bindings::i2c_client>,
> +    PhantomData<Ctx>,
> +);
> +
> +impl<Ctx: device::DeviceContext> I2cClient<Ctx> {
> +    fn as_raw(&self) -> *mut bindings::i2c_client {
> +        self.0.get()
> +    }
> +}
> +
> +// SAFETY: `I2cClient` is a transparent wrapper of a type that doesn't d=
epend on
> +// `I2cClient`'s generic argument.
> +kernel::impl_device_context_deref!(unsafe { I2cClient });
> +kernel::impl_device_context_into_aref!(I2cClient);
> +
> +// SAFETY: Instances of `I2cClient` are always reference-counted.
> +unsafe impl AlwaysRefCounted for I2cClient {
> +    fn inc_ref(&self) {
> +        // SAFETY: The existence of a shared reference guarantees that t=
he refcount is non-zero.
> +        unsafe { bindings::get_device(self.as_ref().as_raw()) };
> +    }
> +
> +    unsafe fn dec_ref(obj: NonNull<Self>) {
> +        // SAFETY: The safety requirements guarantee that the refcount i=
s non-zero.
> +        unsafe { bindings::put_device(&raw mut (*obj.as_ref().as_raw()).=
dev) }
> +    }
> +}
> +
> +impl<Ctx: device::DeviceContext> AsRef<device::Device<Ctx>> for I2cClien=
t<Ctx> {
> +    fn as_ref(&self) -> &device::Device<Ctx> {
> +        let raw =3D self.as_raw();
> +        // SAFETY: By the type invariant of `Self`, `self.as_raw()` is a=
 pointer to a valid
> +        // `struct i2c_client`.
> +        let dev =3D unsafe { &raw mut (*raw).dev };
> +
> +        // SAFETY: `dev` points to a valid `struct device`.
> +        unsafe { device::Device::from_raw(dev) }
> +    }
> +}
> +
> +impl<Ctx: device::DeviceContext> TryFrom<&device::Device<Ctx>> for &I2cC=
lient<Ctx> {
> +    type Error =3D kernel::error::Error;
> +
> +    fn try_from(dev: &device::Device<Ctx>) -> Result<Self, Self::Error> =
{
> +        // SAFETY: By the type invariant of `Device`, `dev.as_raw()` is =
a valid pointer to a
> +        // `struct device`.
> +        if unsafe { bindings::i2c_verify_client(dev.as_raw()).is_null() =
} {
> +            return Err(EINVAL);
> +        }
> +
> +        // SAFETY: We've just verified that the type of `dev` equals to
> +        // `bindings::i2c_client_type`, hence `dev` must be embedded in =
a valid
> +        // `struct i2c_client` as guaranteed by the corresponding C code=
.
> +        let idev =3D unsafe { container_of!(dev.as_raw(), bindings::i2c_=
client, dev) };
> +
> +        // SAFETY: `idev` is a valid pointer to a `struct i2c_client`.
> +        Ok(unsafe { &*idev.cast() })
> +    }
> +}
> +
> +// SAFETY: A `I2cClient` is always reference-counted and can be released=
 from any thread.
> +unsafe impl Send for I2cClient {}
> +
> +// SAFETY: `I2cClient` can be shared among threads because all methods o=
f `I2cClient`
> +// (i.e. `I2cClient<Normal>) are thread safe.
> +unsafe impl Sync for I2cClient {}
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 3dd7bebe7888..8c0070a8029e 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -94,6 +94,8 @@
>  pub mod firmware;
>  pub mod fmt;
>  pub mod fs;
> +#[cfg(CONFIG_I2C =3D "y")]
> +pub mod i2c;
>  pub mod id_pool;
>  pub mod init;
>  pub mod io;

