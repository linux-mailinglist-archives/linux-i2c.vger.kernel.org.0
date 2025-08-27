Return-Path: <linux-i2c+bounces-12450-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5F2B38A2C
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Aug 2025 21:24:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC60E202E2E
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Aug 2025 19:24:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8F992DA753;
	Wed, 27 Aug 2025 19:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="k57FsqYn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365A2253355;
	Wed, 27 Aug 2025 19:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756322646; cv=pass; b=SKd9QYEYQUpHj/AZ/e0RA3IKbbsG7iBXeN7tnBjdaGxTRHI8bsnn+nwacnIkLUuMzsj+piMAKgoJaejvU9y8gZuAbUDghpc7BwLb+lWXLjB9/RPu6rSfkDEaa1ZSqGu9VCmEbNvF5eZ8fjFW74EzMxvn698UAi9ZyzupB3V5UWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756322646; c=relaxed/simple;
	bh=NaFZxff00HeC2AqXXhj+jZETx5L6GgCbIZQjMwmVLOo=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=GPfsta9rAU/GSisf7F2fjxHvUFZUAYP+5SjG5N/yiGSorWgue73qeqEgT2o2mRq1GwjdSH639+LLqWeMdK+MSV+ptu6oCYkWlwYPOCXidEttS3sOFHPDRVtzaAWfjim6lbLrZmOOju5P+V9707zV4MJQXgDkEjZetXvQfxnbOMw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=k57FsqYn; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1756322612; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NxfYhorO0oYw5xgYwlReGVD6lYCfR6WMzQBraOniLuAeFOCVQMz+qColtXGLssCrWI9h0oaW+lvHfn0Pg2kjzgACtUS42js+HEg+C3m6ACFS79wS+f8NwA8sLNV11ptWO+QwbVmOrabekuhDXOaW7uPS44uY9ZlnzIBvTVHDgpI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1756322612; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=J4g7cDXoeorvkBFMpO+WMXXdHulJ0g9i99/Kvp0Xuec=; 
	b=d7e48sfaNobg8QFPzs1CZaiiARC46pqBq831JX9PhDhVSYwLeYP0Ce1gN/xb8Zly7hucmXvRr6QMEP2+tqyBnq1Tymhc0ai0f1R6BOjMadnDu8rlkCmdTi8XymzMdlDpdiBaVoBE3aNVz4Xhnp/6TfkUllFf8wPkXfAn8fCvbk8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1756322612;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=J4g7cDXoeorvkBFMpO+WMXXdHulJ0g9i99/Kvp0Xuec=;
	b=k57FsqYnKtYlE3uMtJNkqOI0liR+6I3Vzb6d8bx0bOCADOzgBcMRo2xtZNW++6J6
	1gUU/j13QHfZFXKoeQhUlrlbWBbXN7vpWEh5JCLrWRX6xZIbw5cwOzYkAA0wip0nlJy
	qBD46pzNl9uVlYnSN5A9y8wwIJpWmPxh2e8N6JGY=
Received: by mx.zohomail.com with SMTPS id 1756322609423277.2450617335089;
	Wed, 27 Aug 2025 12:23:29 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v4 2/3] rust: i2c: add manual I2C device creation
 abstractions
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250820152138.1814666-1-igor.korotin.linux@gmail.com>
Date: Wed, 27 Aug 2025 16:23:11 -0300
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Asahi Lina <lina+kernel@asahilina.net>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Alex Hung <alex.hung@amd.com>,
 Tamir Duberstein <tamird@gmail.com>,
 Xiangfei Ding <dingxiangfei2009@gmail.com>,
 linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org,
 linux-i2c@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <712BC396-F34D-4594-BA28-E2F9847A6899@collabora.com>
References: <20250820151427.1812482-1-igor.korotin.linux@gmail.com>
 <20250820152138.1814666-1-igor.korotin.linux@gmail.com>
To: Igor Korotin <igor.korotin.linux@gmail.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External

Hi Igor,

> On 20 Aug 2025, at 12:21, Igor Korotin <igor.korotin.linux@gmail.com> =
wrote:
>=20
> In addition to the basic I2C device support, added rust abstractions
> upon `i2c_new_client_device`/`i2c_unregister_device` C functions.

Can you use imperative voice here?

>=20
> Implement the core abstractions needed for manual creation/deletion
> of I2C devices, including:

Like this ^

>=20
> * `i2c::Registration` =E2=80=94 a NonNull pointer created by the =
function
>                          `i2c_new_client_device`
>=20
> * `i2c::I2cAdapter` =E2=80=94 a ref counted wrapper around `struct =
i2c_adapter`
>=20
> * `i2c::I2cBoardInfo` =E2=80=94 a safe wrapper around `struct =
i2c_board_info`
>=20
> Signed-off-by: Igor Korotin <igor.korotin.linux@gmail.com>
> ---
> rust/kernel/i2c.rs | 175 ++++++++++++++++++++++++++++++++++++++++++++-
> 1 file changed, 174 insertions(+), 1 deletion(-)
>=20
> diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
> index f5e8c4bc1b7d..851d20ec65b5 100644
> --- a/rust/kernel/i2c.rs
> +++ b/rust/kernel/i2c.rs
> @@ -13,7 +13,10 @@
>     types::Opaque,
> };
>=20
> -use core::{marker::PhantomData, ptr::NonNull};
> +use core::{
> +    marker::PhantomData,
> +    ptr::{from_ref, NonNull},
> +};
>=20
> /// An I2C device id table.
> #[repr(transparent)]
> @@ -316,6 +319,134 @@ fn shutdown(dev: &I2cClient<device::Core>) {
>     }
> }
>=20
> +/// The i2c adapter representation.
> +///
> +/// This structure represents the Rust abstraction for a C `struct =
i2c_adapter`. The
> +/// implementation abstracts the usage of an existing C `struct =
i2c_adapter` that
> +/// gets passed from the C side
> +///
> +/// # Invariants
> +///
> +/// A [`I2cAdapter`] instance represents a valid `struct i2c_adapter` =
created by the C portion of
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
> +
> +    /// Gets pointer to an `i2c_adapter` by index.
> +    pub fn get(index: i32) -> Result<&'static Self> {

Hmm, perhaps I am misunderstanding what is going on, but I don=E2=80=99t =
think
=E2=80=99static is the right thing to have here.

Looking at i2c_get_adapter, it relies on:=20

a) adap->nr actually being in i2c_adapter_idr, but even if it is, it may =
eventually be removed.
b) acquiring a refcount on adapter->dev,

Also, when this goes out of scope the refcount acquired above has to be
decremented, so this has to return an owned type and not a reference.

We should probably simply return ARef<I2cAdapter> here, or more =
succinctly,
ARef<Self>.

> +        // SAFETY: `index` must refer to a valid I2C adapter; the =
kernel
> +        // guarantees that `i2c_get_adapter(index)` returns either a =
valid
> +        // pointer or NULL. `NonNull::new` guarantees the correct =
check.
> +        let adapter =3D NonNull::new(unsafe { =
bindings::i2c_get_adapter(index) }).ok_or(ENODEV)?;
> +
> +        // SAFETY: `adapter` is non-null and points to a live =
`i2c_adapter`.
> +        // `I2cAdapter` is #[repr(transparent)], so this cast is =
valid.
> +        Ok(unsafe { adapter.cast::<Self>().as_ref() })
> +    }
> +}
> +
> +impl<Ctx: device::DeviceContext> Drop for I2cAdapter<Ctx> {
> +    fn drop(&mut self) {
> +        // SAFETY: This `I2cAdapter` was obtained from =
`i2c_get_adapter`,

Where? Note that drop() is called when a T goes out of scope, not when a =
&T
does so. Specially, you should not expect drop() to be called for T if
there=E2=80=99s a &=E2=80=99static T laying around.

> +        // and calling `i2c_put_adapter` exactly once will correctly =
release
> +        // the reference count in the I2C core. It is safe to call =
from any context
> +        unsafe { bindings::i2c_put_adapter(self.as_raw()) }
> +    }

Again, barring some misunderstanding on my end, remove this whole Drop =
impl in
favor of ARef<I2cAdapter>.

> +}
> +
> +// SAFETY: `I2cAdapter` is a transparent wrapper of a type that =
doesn't depend on `I2cAdapter`'s
> +// generic argument.
> +kernel::impl_device_context_deref!(unsafe { I2cAdapter });
> +kernel::impl_device_context_into_aref!(I2cAdapter);
> +
> +// SAFETY: Instances of `I2cAdapter` are always reference-counted.
> +unsafe impl crate::types::AlwaysRefCounted for I2cAdapter {
> +    fn inc_ref(&self) {
> +        // SAFETY: The existence of a shared reference guarantees =
that the refcount is non-zero.
> +        unsafe { bindings::get_device(self.as_ref().as_raw()) };
> +    }
> +
> +    unsafe fn dec_ref(obj: NonNull<Self>) {
> +        // SAFETY: The safety requirements guarantee that the =
refcount is non-zero.
> +        unsafe { bindings::put_device(&raw mut =
(*obj.as_ref().as_raw()).dev) }
> +    }
> +}

Shouldn=E2=80=99t these be `i2c_{get/put}_adapter` ?

> +
> +impl<Ctx: device::DeviceContext> AsRef<device::Device<Ctx>> for =
I2cAdapter<Ctx> {
> +    fn as_ref(&self) -> &device::Device<Ctx> {
> +        let raw =3D self.as_raw();
> +        // SAFETY: By the type invariant of `Self`, `self.as_raw()` =
is a pointer to a valid
> +        // `struct i2c_adapter`.
> +        let dev =3D unsafe { &raw mut (*raw).dev };
> +
> +        // SAFETY: `dev` points to a valid `struct device`.
> +        unsafe { device::Device::from_raw(dev) }
> +    }
> +}
> +
> +impl<Ctx: device::DeviceContext> TryFrom<&device::Device<Ctx>> for =
&I2cAdapter<Ctx> {
> +    type Error =3D kernel::error::Error;
> +
> +    fn try_from(dev: &device::Device<Ctx>) -> Result<Self, =
Self::Error> {
> +        // SAFETY: By the type invariant of `Device`, `dev.as_raw()` =
is a valid pointer to a
> +        // `struct device`.
> +        if unsafe { =
bindings::i2c_verify_adapter(dev.as_raw()).is_null() } {
> +            return Err(EINVAL);
> +        }
> +
> +        // SAFETY: We've just verified that the type of `dev` equals =
to
> +        // `bindings::i2c_adapter_type`, hence `dev` must be embedded =
in a valid
> +        // `struct i2c_adapter` as guaranteed by the corresponding C =
code.
> +        let idev =3D unsafe { container_of!(dev.as_raw(), =
bindings::i2c_adapter, dev) };
> +
> +        // SAFETY: `idev` is a valid pointer to a `struct =
i2c_adapter`.
> +        Ok(unsafe { &*idev.cast() })
> +    }
> +}
> +
> +/// The i2c board info representation
> +///
> +/// This structure represents the Rust abstraction for a C `struct =
i2c_board_info` structure,
> +/// which is used for manual I2C client creation.
> +#[repr(transparent)]
> +pub struct I2cBoardInfo(bindings::i2c_board_info);
> +
> +impl I2cBoardInfo {
> +    const I2C_TYPE_SIZE: usize =3D 20;
> +    /// Create a new board=E2=80=90info for a kernel driver.

Nit: instead of `board-info` you can just say [`I2cBoardInfo`]. This =
will look
better in the docs.
=20
> +    #[inline(always)]
> +    pub const fn new(type_: &'static CStr, addr: u16) -> Self {
> +        build_assert!(
> +            type_.len_with_nul() <=3D Self::I2C_TYPE_SIZE,
> +            "Type exceeds 20 bytes"
> +        );
> +        let src =3D type_.as_bytes_with_nul();
> +        // Replace with `bindings::acpi_device_id::default()` once =
stabilized for `const`.
> +        // SAFETY: FFI type is valid to be zero-initialized.
> +        let mut i2c_board_info: bindings::i2c_board_info =3D unsafe { =
core::mem::zeroed() };
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
> /// The i2c client representation.
> ///
> /// This structure represents the Rust abstraction for a C `struct =
i2c_client`. The
> @@ -394,3 +525,45 @@ unsafe impl Send for I2cClient {}
> // SAFETY: `I2cClient` can be shared among threads because all methods =
of `I2cClient`
> // (i.e. `I2cClient<Normal>) are thread safe.
> unsafe impl Sync for I2cClient {}
> +
> +/// The registration of an i2c client device.
> +///
> +/// This type represents the registration of a [`struct i2c_client`]. =
When an instance of this
> +/// type is dropped, its respective i2c client device will be =
unregistered from the system.
> +///
> +/// # Invariants
> +///
> +/// `self.0` always holds a valid pointer to an initialized and =
registered
> +/// [`struct i2c_client`].
> +#[repr(transparent)]
> +pub struct Registration(NonNull<bindings::i2c_client>);
> +
> +impl Registration {
> +    /// The C `i2c_new_client_device` function wrapper for manual I2C =
client creation.
> +    pub fn new(i2c_adapter: &I2cAdapter, i2c_board_info: =
&I2cBoardInfo) -> Result<Self> {
> +        // SAFETY: the kernel guarantees that =
`i2c_new_client_device()` returns either a valid
> +        // pointer or NULL. `from_err_ptr` separates errors. =
Following `NonNull::new` checks
> +        // for NULL.
> +        let raw_dev =3D from_err_ptr(unsafe {
> +            bindings::i2c_new_client_device(i2c_adapter.as_raw(), =
i2c_board_info.as_raw())
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
> +        // SAFETY: `Drop` is only called for a valid `Registration`, =
which by invariant
> +        // always contains a non-null pointer to an `i2c_client`.
> +        unsafe { bindings::i2c_unregister_device(self.0.as_ptr()) }
> +    }
> +}
> +
> +// SAFETY: A `Registration` of a `struct i2c_client` can be released =
from any thread.
> +unsafe impl Send for Registration {}
> +
> +// SAFETY: `Registration` does not expose any methods or fields that =
need synchronization.

Can you mention that `Registration` offers no interior mutability =
instead?

I think we should all align on the safety comments for Sync.

> +unsafe impl Sync for Registration {}
> --=20
> 2.43.0
>=20
>=20


