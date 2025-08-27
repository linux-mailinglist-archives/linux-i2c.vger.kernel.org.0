Return-Path: <linux-i2c+bounces-12449-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 469F2B389AE
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Aug 2025 20:38:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 025EB3ADC51
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Aug 2025 18:38:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 581A62E0B5D;
	Wed, 27 Aug 2025 18:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="fnP8DfQb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44B32DAFA1;
	Wed, 27 Aug 2025 18:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756319924; cv=pass; b=M8NxXRsQ4pZ0len4dEjXy6XTrWq9wWrn+QYrAbTsT6T2dkPYbOGWIiGKMxhpj/lRYk077ov9Qpys/m/CFkRDPYo0YXmTXjMxD8ogMB4CHC9OFq/RHHLbUwAsJjpOPaa8KyGCCgFBSNEg67n4ZcT2q96pBvNqqhLi60TBgHj2aAo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756319924; c=relaxed/simple;
	bh=CVMfBSj8Ju/TmXVsxExHZtBmOOyC6csl4+5ca7Y3o1s=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=EJ67ytuxGOU2GKI8GMMDrxr1kSC54p7j44BRYMmvPBYCpDSZi6TMo9iK2T0+vAQDtMOE/hgMcB0Q9UAg+1NIXH2A/IX1zW/aeoWqUYTBSPOynJim7Ozw5dSPCJbLGJw2aMOkRPqPkxpDi9DtwqVJjbsKMWueusDomZOPaj/n8R0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=fnP8DfQb; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1756319876; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DXvkzY6w0SnEssCmzSpVCDzaSNWiMEu/HBeKBn5+dg0jN3o0aluNkDtx9YuZ6g/nVC5JgPHpCpXjmyTE7KtMa3nA2xMc0Fq4u+vW8rYhXkWzsY1yVGG2IAqr+LfZXMYr7bAllzUiQzabJj3tRe9SYoMxyfok+gBmLajq4Z1wg04=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1756319876; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=uFigvrMzb8XvehQF/tr+qc5cYuogiZyjSf+/9amPAWU=; 
	b=QEn/VPCjkCwfYHWI9i6AKSkz/Gub37do7icTMvgTkoGtYXW1Iv3HU4uTToNIINLxrcA6E75JD9pKmaN+IUDJ03FU5Uz/ekG+m7mJKEtuF3nqRLwNzooPFHRjQhmYyoG2379SDsOYLQjIdPS0OLBwWbYe728Xq2L56CuztE2/0p0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1756319876;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=uFigvrMzb8XvehQF/tr+qc5cYuogiZyjSf+/9amPAWU=;
	b=fnP8DfQbLZ/v6ZSfLu5yoW2BOmrWaQTg1rD7BD8hTOxEnX0wvYR46+d8zgdet2RA
	C7RzJ6vXINz+hxh+hfk88uYe5SzEwML+v6jX8ZObPtaS+MXq3CMsQWIJDWTRVFIVmj+
	eFvSKh1aetFShoz5DxawN6oeFWJ2OmL21BTHIJgw=
Received: by mx.zohomail.com with SMTPS id 1756319874289457.6200987255314;
	Wed, 27 Aug 2025 11:37:54 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v4 1/3] rust: i2c: add basic I2C device and driver
 abstractions
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250820151913.1814284-1-igor.korotin.linux@gmail.com>
Date: Wed, 27 Aug 2025 15:37:36 -0300
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
Message-Id: <CB269793-D165-4D22-95E5-F978C1ECC79E@collabora.com>
References: <20250820151427.1812482-1-igor.korotin.linux@gmail.com>
 <20250820151913.1814284-1-igor.korotin.linux@gmail.com>
To: Igor Korotin <igor.korotin.linux@gmail.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External

Hi Igor,

> On 20 Aug 2025, at 12:19, Igor Korotin <igor.korotin.linux@gmail.com> =
wrote:
>=20
> Implement the core abstractions needed for I2C drivers, including:
>=20
> - `i2c::Driver` =E2=80=94 the trait drivers must implement, including =
`probe`
>=20
> - `i2c::I2cClient` =E2=80=94 a safe wrapper around `struct i2c_client`
>=20
> - `i2c::Adapter` =E2=80=94 implements `driver::RegistrationOps` to =
hook into the
>   generic `driver::Registration` machinery
>=20
> - `i2c::DeviceId` =E2=80=94 a `RawDeviceIdIndex` implementation for =
I2C
>   device IDs
>=20
> Signed-off-by: Igor Korotin <igor.korotin.linux@gmail.com>
> ---
> MAINTAINERS                     |   8 +
> rust/bindings/bindings_helper.h |   1 +
> rust/kernel/i2c.rs              | 396 ++++++++++++++++++++++++++++++++
> rust/kernel/lib.rs              |   2 +
> 4 files changed, 407 insertions(+)
> create mode 100644 rust/kernel/i2c.rs
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fe168477caa4..c44c7ac317b1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11516,6 +11516,14 @@ F: include/linux/i2c.h
> F: include/uapi/linux/i2c-*.h
> F: include/uapi/linux/i2c.h
>=20
> +I2C SUBSYSTEM [RUST]
> +M: Igor Korotin <igor.korotin.linux@gmail.com>
> +R: Danilo Krummrich <dakr@kernel.org>
> +R: Daniel Almeida <daniel.almeida@collabora.com>
> +L: rust-for-linux@vger.kernel.org
> +S: Maintained
> +F: rust/kernel/i2c.rs
> +
> I2C SUBSYSTEM HOST DRIVERS
> M: Andi Shyti <andi.shyti@kernel.org>
> L: linux-i2c@vger.kernel.org
> diff --git a/rust/bindings/bindings_helper.h =
b/rust/bindings/bindings_helper.h
> index 84d60635e8a9..81796d5e16e8 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -53,6 +53,7 @@
> #include <linux/file.h>
> #include <linux/firmware.h>
> #include <linux/fs.h>
> +#include <linux/i2c.h>
> #include <linux/ioport.h>
> #include <linux/jiffies.h>
> #include <linux/jump_label.h>
> diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
> new file mode 100644
> index 000000000000..f5e8c4bc1b7d
> --- /dev/null
> +++ b/rust/kernel/i2c.rs
> @@ -0,0 +1,396 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! I2C Driver subsystem
> +
> +// I2C Driver abstractions.
> +use crate::{
> +    acpi, container_of, device,
> +    device_id::{RawDeviceId, RawDeviceIdIndex},
> +    driver,
> +    error::*,
> +    of,
> +    prelude::*,
> +    types::Opaque,
> +};
> +
> +use core::{marker::PhantomData, ptr::NonNull};
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
> +        // Replace with `bindings::acpi_device_id::default()` once =
stabilized for `const`.
> +        // SAFETY: FFI type is valid to be zero-initialized.
> +        let mut i2c: bindings::i2c_device_id =3D unsafe { =
core::mem::zeroed() };
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
> +// SAFETY: `DeviceId` is a `#[repr(transparent)]` wrapper of =
`i2c_device_id` and does not add
> +// additional invariants, so it's safe to transmute to `RawType`.
> +unsafe impl RawDeviceId for DeviceId {
> +    type RawType =3D bindings::i2c_device_id;
> +}
> +
> +// SAFETY: `DRIVER_DATA_OFFSET` is the offset to the `driver_data` =
field.
> +unsafe impl RawDeviceIdIndex for DeviceId {
> +    const DRIVER_DATA_OFFSET: usize =3D =
core::mem::offset_of!(bindings::i2c_device_id, driver_data);
> +
> +    fn index(&self) -> usize {
> +        self.0.driver_data
> +    }
> +}
> +
> +/// IdTable type for I2C
> +pub type IdTable<T> =3D &'static dyn =
kernel::device_id::IdTable<DeviceId, T>;
> +
> +/// Create a I2C `IdTable` with its alias for modpost.
> +#[macro_export]
> +macro_rules! i2c_device_table {
> +    ($table_name:ident, $module_table_name:ident, $id_info_type: ty, =
$table_data: expr) =3D> {
> +        const $table_name: $crate::device_id::IdArray<
> +            $crate::i2c::DeviceId,
> +            $id_info_type,
> +            { $table_data.len() },
> +        > =3D $crate::device_id::IdArray::new($table_data);
> +
> +        $crate::module_device_table!("i2c", $module_table_name, =
$table_name);
> +    };
> +}
> +
> +/// An adapter for the registration of I2C drivers.
> +pub struct Adapter<T: Driver>(T);
> +
> +// SAFETY: A call to `unregister` for a given instance of `RegType` =
is guaranteed to be valid if
> +// a preceding call to `register` has been successful.
> +unsafe impl<T: Driver + 'static> driver::RegistrationOps for =
Adapter<T> {
> +    type RegType =3D bindings::i2c_driver;
> +
> +    unsafe fn register(
> +        idrv: &Opaque<Self::RegType>,
> +        name: &'static CStr,
> +        module: &'static ThisModule,
> +    ) -> Result {
> +        build_assert!(
> +            T::ACPI_ID_TABLE.is_some() || T::OF_ID_TABLE.is_some() || =
T::I2C_ID_TABLE.is_some(),
> +            "At least one of ACPI/OF/Legacy tables must be present"
> +        );

=E2=80=A6=E2=80=9Dwhen registering an i2c driver=E2=80=9D.

The generated error is cryptic, so we should add as much information as =
possible.

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
> +        // SAFETY: It's safe to set the fields of `struct i2c_client` =
on initialization.
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
> +        to_result(unsafe { bindings::i2c_register_driver(module.0, =
idrv.get()) })
> +    }
> +
> +    unsafe fn unregister(idrv: &Opaque<Self::RegType>) {
> +        // SAFETY: `idrv` is guaranteed to be a valid `RegType`.
> +        unsafe { bindings::i2c_del_driver(idrv.get()) }
> +    }
> +}
> +
> +impl<T: Driver + 'static> Adapter<T> {
> +    extern "C" fn probe_callback(idev: *mut bindings::i2c_client) -> =
kernel::ffi::c_int {
> +        // SAFETY: The I2C bus only ever calls the probe callback =
with a valid pointer to a
> +        // `struct i2c_client`.
> +        //
> +        // INVARIANT: `idev` is valid for the duration of =
`probe_callback()`.
> +        let idev =3D unsafe { =
&*idev.cast::<I2cClient<device::CoreInternal>>() };
> +
> +        let info =3D
> +            Self::i2c_id_info(idev).or_else(|| <Self as =
driver::Adapter>::id_info(idev.as_ref()));

I wonder if these should be private member functions?

> +
> +        from_result(|| {
> +            let data =3D T::probe(idev, info)?;
> +
> +            idev.as_ref().set_drvdata(data);
> +            Ok(0)
> +        })
> +    }
> +
> +    extern "C" fn remove_callback(idev: *mut bindings::i2c_client) {
> +        // SAFETY: `idev` is a valid pointer to a `struct =
i2c_client`.
> +        let idev =3D unsafe { =
&*idev.cast::<I2cClient<device::CoreInternal>>() };

> +
> +        // SAFETY: `remove_callback` is only ever called after a =
successful call to
> +        // `probe_callback`, hence it's guaranteed that =
`I2cClient::set_drvdata()` has been called
> +        // and stored a `Pin<KBox<T>>`.
> +        drop(unsafe { idev.as_ref().drvdata_obtain::<Pin<KBox<T>>>() =
});
> +    }
> +
> +    extern "C" fn shutdown_callback(idev: *mut bindings::i2c_client) =
{
> +        // SAFETY: `shutdown_callback` is only ever called for a =
valid `idev`
> +        let idev =3D unsafe { =
&*idev.cast::<I2cClient<device::Core>>() };
> +
> +        T::shutdown(idev);
> +    }
> +
> +    /// The [`i2c::IdTable`] of the corresponding driver.
> +    fn i2c_id_table() -> Option<IdTable<<Self as =
driver::Adapter>::IdInfo>> {
> +        T::I2C_ID_TABLE
> +    }
> +
> +    /// Returns the driver's private data from the matching entry in =
the [`i2c::IdTable`], if any.
> +    ///
> +    /// If this returns `None`, it means there is no match with an =
entry in the [`i2c::IdTable`].
> +    fn i2c_id_info(dev: &I2cClient) -> Option<&'static <Self as =
driver::Adapter>::IdInfo> {

Again, perhaps a private member function? I=E2=80=99m trying to simplify =
the syntax here.

> +        let table =3D Self::i2c_id_table()?;
> +
> +        // SAFETY:
> +        // - `table` has static lifetime, hence it's valid for reads
> +        // - `dev` is guaranteed to be valid while it's alive, and so =
is `idev.as_raw()`.

I don=E2=80=99t see an =E2=80=9Cidev=E2=80=9D in scope? Perhaps you =
meant =E2=80=9Cdev=E2=80=9D ?

> +        let raw_id =3D unsafe { =
bindings::i2c_match_id(table.as_ptr(), dev.as_raw()) };
> +
> +        if raw_id.is_null() {
> +            return None;
> +        }
> +
> +        // SAFETY: `DeviceId` is a `#[repr(transparent)` wrapper of =
`struct i2c_device_id` and
> +        // does not add additional invariants, so it's safe to =
transmute.
> +        let id =3D unsafe { &*raw_id.cast::<DeviceId>() };
> +
> +        Some(table.info(<DeviceId as =
crate::device_id::RawDeviceIdIndex>::index(id)))

Do we really need to use the fully-qualified syntax here?

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
> +        $crate::module_driver!(<T>, $crate::i2c::Adapter<T>, { $($f)* =
});
> +    };
> +}
> +
> +/// The i2c driver trait.
> +///
> +/// Drivers must implement this trait in order to get a i2c driver =
registered.
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
> +///     const I2C_ID_TABLE: Option<i2c::IdTable<Self::IdInfo>> =3D =
Some(&I2C_TABLE);
> +///     const OF_ID_TABLE: Option<of::IdTable<Self::IdInfo>> =3D =
Some(&OF_TABLE);
> +///     const ACPI_ID_TABLE: Option<acpi::IdTable<Self::IdInfo>> =3D =
Some(&ACPI_TABLE);
> +///
> +///     fn probe(
> +///         _idev: &i2c::I2cClient<Core>,
> +///         _id_info: Option<&Self::IdInfo>,
> +///     ) -> Result<Pin<KBox<Self>>> {
> +///         Err(ENODEV)
> +///     }
> +///
> +///     fn shutdown(_idev: &i2c::I2cClient<Core>) {
> +///     }
> +/// }
> +///```
> +pub trait Driver: Send {
> +    /// The type holding information about each device id supported =
by the driver.
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
> +    const ACPI_ID_TABLE: Option<acpi::IdTable<Self::IdInfo>> =3D =
None;
> +
> +    /// I2C driver probe.
> +    ///
> +    /// Called when a new i2c client is added or discovered.
> +    /// Implementers should attempt to initialize the client here.
> +    fn probe(
> +        dev: &I2cClient<device::Core>,
> +        id_info: Option<&Self::IdInfo>,
> +    ) -> Result<Pin<KBox<Self>>>;
> +
> +    /// I2C driver shutdown
> +    ///
> +    /// Called when
> +    fn shutdown(dev: &I2cClient<device::Core>) {
> +        let _ =3D dev;
> +    }
> +}
> +
> +/// The i2c client representation.
> +///
> +/// This structure represents the Rust abstraction for a C `struct =
i2c_client`. The
> +/// implementation abstracts the usage of an existing C `struct =
i2c_client` that
> +/// gets passed from the C side
> +///
> +/// # Invariants
> +///
> +/// A [`I2cClient`] instance represents a valid `struct i2c_client` =
created by the C portion of
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
> +// SAFETY: `I2cClient` is a transparent wrapper of a type that =
doesn't depend on `I2cClient`'s
> +// generic argument.
> +kernel::impl_device_context_deref!(unsafe { I2cClient });
> +kernel::impl_device_context_into_aref!(I2cClient);
> +
> +// SAFETY: Instances of `I2cClient` are always reference-counted.
> +unsafe impl crate::types::AlwaysRefCounted for I2cClient {

I=E2=80=99d import this.

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
> +
> +impl<Ctx: device::DeviceContext> AsRef<device::Device<Ctx>> for =
I2cClient<Ctx> {
> +    fn as_ref(&self) -> &device::Device<Ctx> {
> +        let raw =3D self.as_raw();
> +        // SAFETY: By the type invariant of `Self`, `self.as_raw()` =
is a pointer to a valid
> +        // `struct i2c_client`.
> +        let dev =3D unsafe { &raw mut (*raw).dev };
> +
> +        // SAFETY: `dev` points to a valid `struct device`.
> +        unsafe { device::Device::from_raw(dev) }
> +    }
> +}
> +
> +impl<Ctx: device::DeviceContext> TryFrom<&device::Device<Ctx>> for =
&I2cClient<Ctx> {
> +    type Error =3D kernel::error::Error;
> +
> +    fn try_from(dev: &device::Device<Ctx>) -> Result<Self, =
Self::Error> {
> +        // SAFETY: By the type invariant of `Device`, `dev.as_raw()` =
is a valid pointer to a
> +        // `struct device`.
> +        if unsafe { =
bindings::i2c_verify_client(dev.as_raw()).is_null() } {
> +            return Err(EINVAL);
> +        }
> +
> +        // SAFETY: We've just verified that the type of `dev` equals =
to
> +        // `bindings::i2c_client_type`, hence `dev` must be embedded =
in a valid
> +        // `struct i2c_client` as guaranteed by the corresponding C =
code.
> +        let idev =3D unsafe { container_of!(dev.as_raw(), =
bindings::i2c_client, dev) };
> +
> +        // SAFETY: `idev` is a valid pointer to a `struct =
i2c_client`.
> +        Ok(unsafe { &*idev.cast() })
> +    }
> +}
> +
> +// SAFETY: A `I2cClient` is always reference-counted and can be =
released from any thread.
> +unsafe impl Send for I2cClient {}
> +
> +// SAFETY: `I2cClient` can be shared among threads because all =
methods of `I2cClient`
> +// (i.e. `I2cClient<Normal>) are thread safe.
> +unsafe impl Sync for I2cClient {}
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index ed53169e795c..a5e97a9b1546 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -89,6 +89,8 @@
> pub mod firmware;
> pub mod fmt;
> pub mod fs;
> +#[cfg(CONFIG_I2C =3D "y")]
> +pub mod i2c;
> pub mod init;
> pub mod io;
> pub mod ioctl;
> --=20
> 2.43.0
>=20
>=20


