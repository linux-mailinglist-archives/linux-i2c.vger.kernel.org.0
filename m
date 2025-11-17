Return-Path: <linux-i2c+bounces-14121-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B01C6512A
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Nov 2025 17:16:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sto.lore.kernel.org (Postfix) with ESMTPS id 7242124162
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Nov 2025 16:16:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3593E2D0C90;
	Mon, 17 Nov 2025 16:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="Or9spY1v"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CD92DCF41
	for <linux-i2c@vger.kernel.org>; Mon, 17 Nov 2025 16:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763396018; cv=none; b=Uph79dJKAINtF1mhWoFA4NsSapHLCy001RjbN7r+AJ0k+LoLd5czxaENtHUbf2hOs6nyDJlhsgQ9/+ZsGUYNq338dCLsxgGDWHexOCGOQA+AL8BmfGzcfYsEK4dHstX3K7JSpgXBSfe701Zp2AwGnl9479lGrq8St2+ygC7c5Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763396018; c=relaxed/simple;
	bh=/aL+BDz8u9R3lWl3XR80Rm/4B7klBpGQiv06VRgHN7Q=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CTkupRg69nnJqJi27yVu2BSZy7iG8aFRbUE3qnfHWwHcJrNzzJ3DFmWAAfsuu26evTmNTG7DOGdsm8EEglOtIZhwOozvhahR+F62/qaAyk+PrVkLFhXm0d2ejKA84jxnEEDcLwJkEJxdkCIRi747mZ74ziyOOvyjpiAKlKtncJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=Or9spY1v; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 45248240107
	for <linux-i2c@vger.kernel.org>; Mon, 17 Nov 2025 17:13:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1763396014; bh=UUSdMv99r9rlBo5q5K+ty65t5fYecY/Z6zbABzWELac=;
	h=Message-ID:Subject:From:To:Cc:Date:Autocrypt:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:OpenPGP:From;
	b=Or9spY1vBN1FhGd0J5YuaqxXSD1/ZuvGiODENkTDusFEjQrcsYsWpkk3px6GGNn6B
	 OCnqCTg61BdBD9imJbqzuKr5qYgjc1ecaiFB1466y+pXo0RZkYpw9SaecQLJnrYG5j
	 Qzdem9j7kFIx6RlKUKgWOPboaNjaQwB8SUGL/i7sWLxqt+dHp0kxhCxokeLxa80vCT
	 LQhtqqgvW7hO+0ruaM8CqX5SkvuxvJPKjYcfwB2WBM6tdPS2JPn5cXJIvn4w921dC+
	 UE+/bdXaUtNCzQQv4TPOiUoQha3UXz3D/BWPLegZ0ocMQ+QqMTR1SADUQxguEop2Fn
	 jL3l8qAoVOjfw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4d9CTl2JRwz9rxN;
	Mon, 17 Nov 2025 17:13:31 +0100 (CET)
Message-ID: <e7e8c93ff4eb9c56eb412a9856947409a26eade1.camel@posteo.de>
Subject: Re: [PATCH v8 2/4] rust: i2c: add manual I2C device creation
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
Date: Mon, 17 Nov 2025 16:13:33 +0000
In-Reply-To: <20251116162154.171493-1-igor.korotin.linux@gmail.com>
References: <20251116162104.171420-1-igor.korotin.linux@gmail.com>
	 <20251116162154.171493-1-igor.korotin.linux@gmail.com>
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
 keydata=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
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
> In addition to the basic I2C device support, add rust abstractions
> upon `i2c_new_client_device`/`i2c_unregister_device` C functions.
>=20
> Implement the core abstractions needed for manual creation/deletion
> of I2C devices, including:
>=20
>  * `i2c::Registration` =E2=80=94 a NonNull pointer created by the functio=
n
>                           `i2c_new_client_device`
>=20
>  * `i2c::I2cAdapter` =E2=80=94 a ref counted wrapper around `struct i2c_a=
dapter`
>=20
>  * `i2c::I2cBoardInfo` =E2=80=94 a safe wrapper around `struct i2c_board_=
info`
>=20
> Signed-off-by: Igor Korotin <igor.korotin.linux@gmail.com>
> ---
>  rust/kernel/i2c.rs | 155 ++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 154 insertions(+), 1 deletion(-)
>=20
> diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
> index a5ad8213d9ac..3695b4adf436 100644
> --- a/rust/kernel/i2c.rs
> +++ b/rust/kernel/i2c.rs
> @@ -11,6 +11,7 @@
>          RawDeviceId,
>          RawDeviceIdIndex, //
>      },
> +    devres::Devres,
>      driver,
>      error::*,
>      of,
> @@ -23,9 +24,14 @@
> =20
>  use core::{
>      marker::PhantomData,
> -    ptr::NonNull, //
> +    ptr::{
> +        from_ref,
> +        NonNull, //
> +    }, //
>  };
> =20
> +use kernel::types::ARef;
> +
>  /// An I2C device id table.
>  #[repr(transparent)]
>  #[derive(Clone, Copy)]
> @@ -356,6 +362,102 @@ fn unbind(dev: &I2cClient<device::Core>, this: Pin<=
&Self>) {
>      }
>  }
> =20
> +/// The i2c adapter representation.
> +///
> +/// This structure represents the Rust abstraction for a C `struct i2c_a=
dapter`. The
> +/// implementation abstracts the usage of an existing C `struct i2c_adap=
ter` that
> +/// gets passed from the C side
> +///
> +/// # Invariants
> +///
> +/// A [`I2cAdapter`] instance represents a valid `struct i2c_adapter` cr=
eated by the C portion of
> +/// the kernel.
> +#[repr(transparent)]
> +pub struct I2cAdapter<Ctx: device::DeviceContext =3D device::Normal>(
> +    Opaque<bindings::i2c_adapter>,
> +    PhantomData<Ctx>,
> +);
> +
> +impl<Ctx: device::DeviceContext> I2cAdapter<Ctx> {
> +    fn as_raw(&self) -> *mut bindings::i2c_adapter {
> +        self.0.get()
> +    }
> +}
> +
> +impl I2cAdapter {
> +    /// Returns the I2C Adapter index.
> +    #[inline]
> +    pub fn index(&self) -> i32 {
> +        // SAFETY: `self.as_raw` is a valid pointer to a `struct i2c_ada=
pter`.
> +        unsafe { (*self.as_raw()).nr }
> +    }
> +
> +    /// Gets pointer to an `i2c_adapter` by index.
> +    pub fn get(index: i32) -> Result<ARef<Self>> {
> +        // SAFETY: `index` must refer to a valid I2C adapter; the kernel
> +        // guarantees that `i2c_get_adapter(index)` returns either a val=
id
> +        // pointer or NULL. `NonNull::new` guarantees the correct check.
> +        let adapter =3D NonNull::new(unsafe { bindings::i2c_get_adapter(=
index) }).ok_or(ENODEV)?;
> +
> +        // SAFETY: `adapter` is non-null and points to a live `i2c_adapt=
er`.
> +        // `I2cAdapter` is #[repr(transparent)], so this cast is valid.
> +        Ok(unsafe { (&*adapter.as_ptr().cast::<I2cAdapter<device::Normal=
>>()).into() })
> +    }
> +}
> +
> +// SAFETY: `I2cAdapter` is a transparent wrapper of a type that doesn't =
depend on
> +// `I2cAdapter`'s generic argument.
> +kernel::impl_device_context_deref!(unsafe { I2cAdapter });
> +kernel::impl_device_context_into_aref!(I2cAdapter);
> +
> +// SAFETY: Instances of `I2cAdapter` are always reference-counted.
> +unsafe impl crate::types::AlwaysRefCounted for I2cAdapter {
> +    fn inc_ref(&self) {
> +        // SAFETY: The existence of a shared reference guarantees that t=
he refcount is non-zero.
> +        unsafe { bindings::i2c_get_adapter(self.index()) };
> +    }
> +
> +    unsafe fn dec_ref(obj: NonNull<Self>) {
> +        // SAFETY: The safety requirements guarantee that the refcount i=
s non-zero.
> +        unsafe { bindings::i2c_put_adapter(obj.as_ref().as_raw()) }
> +    }
> +}
> +
> +/// The i2c board info representation
> +///
> +/// This structure represents the Rust abstraction for a C `struct i2c_b=
oard_info` structure,
> +/// which is used for manual I2C client creation.
> +#[repr(transparent)]
> +pub struct I2cBoardInfo(bindings::i2c_board_info);
> +
> +impl I2cBoardInfo {
> +    const I2C_TYPE_SIZE: usize =3D 20;
> +    /// Create a new [`I2cBoardInfo`] for a kernel driver.
> +    #[inline(always)]
> +    pub const fn new(type_: &'static CStr, addr: u16) -> Self {
> +        build_assert!(
> +            type_.len_with_nul() <=3D Self::I2C_TYPE_SIZE,
> +            "Type exceeds 20 bytes"
> +        );
> +        let src =3D type_.as_bytes_with_nul();
> +        // Replace with `bindings::i2c_board_info::default()` once stabi=
lized for `const`.
> +        // SAFETY: FFI type is valid to be zero-initialized.
> +        let mut i2c_board_info: bindings::i2c_board_info =3D pin_init::z=
eroed();
Same clippy error here:

error: statement has unnecessary safety comment
   --> rust/kernel/i2c.rs:446:9
    |
446 |         let mut i2c_board_info: bindings::i2c_board_info =3D
pin_init::zeroed();
    |       =20
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    |
help: consider removing the safety comment
   --> rust/kernel/i2c.rs:445:9
    |
445 |         // SAFETY: FFI type is valid to be zero-initialized.
    |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    =3D help: for further information visit
https://rust-lang.github.io/rust-clippy/rust-1.91.0/index.html#unnecessary_=
safety_comment

Thanks
- Markus Probst

> +        let mut i: usize =3D 0;
> +        while i < src.len() {
> +            i2c_board_info.type_[i] =3D src[i];
> +            i +=3D 1;
> +        }
> +
> +        i2c_board_info.addr =3D addr;
> +        Self(i2c_board_info)
> +    }
> +
> +    fn as_raw(&self) -> *const bindings::i2c_board_info {
> +        from_ref(&self.0)
> +    }
> +}
> +
>  /// The i2c client representation.
>  ///
>  /// This structure represents the Rust abstraction for a C `struct i2c_c=
lient`. The
> @@ -434,3 +536,54 @@ unsafe impl Send for I2cClient {}
>  // SAFETY: `I2cClient` can be shared among threads because all methods o=
f `I2cClient`
>  // (i.e. `I2cClient<Normal>) are thread safe.
>  unsafe impl Sync for I2cClient {}
> +
> +/// The registration of an i2c client device.
> +///
> +/// This type represents the registration of a [`struct i2c_client`]. Wh=
en an instance of this
> +/// type is dropped, its respective i2c client device will be unregister=
ed from the system.
> +///
> +/// # Invariants
> +///
> +/// `self.0` always holds a valid pointer to an initialized and register=
ed
> +/// [`struct i2c_client`].
> +#[repr(transparent)]
> +pub struct Registration(NonNull<bindings::i2c_client>);
> +
> +impl Registration {
> +    /// The C `i2c_new_client_device` function wrapper for manual I2C cl=
ient creation.
> +    pub fn new<'a>(
> +        i2c_adapter: &I2cAdapter,
> +        i2c_board_info: &I2cBoardInfo,
> +        parent_dev: &'a device::Device<device::Bound>,
> +    ) -> impl PinInit<Devres<Self>, Error> + 'a {
> +        Devres::new(parent_dev, Self::try_new(i2c_adapter, i2c_board_inf=
o))
> +    }
> +
> +    fn try_new(i2c_adapter: &I2cAdapter, i2c_board_info: &I2cBoardInfo) =
-> Result<Self> {
> +        // SAFETY: the kernel guarantees that `i2c_new_client_device()` =
returns either a valid
> +        // pointer or NULL. `from_err_ptr` separates errors. Following `=
NonNull::new`
> +        // checks for NULL.
> +        let raw_dev =3D from_err_ptr(unsafe {
> +            bindings::i2c_new_client_device(i2c_adapter.as_raw(), i2c_bo=
ard_info.as_raw())
> +        })?;
> +
> +        let dev_ptr =3D NonNull::new(raw_dev).ok_or(ENODEV)?;
> +
> +        Ok(Self(dev_ptr))
> +    }
> +}
> +
> +impl Drop for Registration {
> +    fn drop(&mut self) {
> +        // SAFETY: `Drop` is only called for a valid `Registration`, whi=
ch by invariant
> +        // always contains a non-null pointer to an `i2c_client`.
> +        unsafe { bindings::i2c_unregister_device(self.0.as_ptr()) }
> +    }
> +}
> +
> +// SAFETY: A `Registration` of a `struct i2c_client` can be released fro=
m any thread.
> +unsafe impl Send for Registration {}
> +
> +// SAFETY: `Registration` offers no interior mutability (no mutation thr=
ough &self
> +// and no mutable access is exposed)
> +unsafe impl Sync for Registration {}

