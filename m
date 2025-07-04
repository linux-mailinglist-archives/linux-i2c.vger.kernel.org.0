Return-Path: <linux-i2c+bounces-11844-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1718AF9BA0
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Jul 2025 22:18:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD8DF6E2E40
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Jul 2025 20:17:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23FBD233736;
	Fri,  4 Jul 2025 20:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s5xnFZyG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84481E4AE;
	Fri,  4 Jul 2025 20:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751660209; cv=none; b=nUlyker8cJCo6qYDLie0XUgQ6ppUtXc0rQ9qbgsFo/4nlHp8NZyzcd/h2y2qMrXxQfYM5T09exLgKBgYOezOMr8KfjOyRZl0EoEltgzSri8T/0BIplAa2b4WT1ECOwfTjwDFA2v2Im5HkyiyZMnGbfRczzqlvBLd8IghjDjA5SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751660209; c=relaxed/simple;
	bh=pvqJY/YF3ip62iSB4Ew8bXCofafHrtYF2st/xxZCFUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r6LlIOfZVWUBIjhrb1XSHK7ASvSxMGcJ9wFazds+06cW1L/bQyDk+mGMTHiRHsERVXr5vOtPEFasjNdz8/8qFoyyRe7Je/TxAI0l/Vc0jt9gKRMNRsMi2AUjGi0jcwot2p5S2CrRtWb1aM80eddOig3S3BCnyrxEAFadxpBq0EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s5xnFZyG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40ECBC4CEE3;
	Fri,  4 Jul 2025 20:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751660209;
	bh=pvqJY/YF3ip62iSB4Ew8bXCofafHrtYF2st/xxZCFUU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s5xnFZyGKRxG83S2nY7hE6vjsxXCPd++bCr48aE/VXZto5i9RYxw6yfVFhAXJx+Hq
	 NTKWotMNwywH4LczUrQ8pKJ9moXZz/Squqdyd5anR4kX/Cj2hsVfr7Ha4mSX6FW172
	 3UaLMhQ0+v0lJUrvOq7t7qhtvDaeF9BpvIOTR0mySpQnVfB95ARrYbOlVuJAsm6Uxz
	 w/cVdoine9xTgumNp7ZkcEfkaNZTD02uApkrfzIydvz7iCLyecYjNY1cSPySXr8m5B
	 0OvmdtIuL/jdmlL2r4XLXg1yn1X2T+hwNTd+pNMokmEF8Zi/DhmZ6nmhsdjXwwd3eB
	 p8k/w2T+OVoaQ==
Date: Fri, 4 Jul 2025 22:16:42 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Igor Korotin <igor.korotin.linux@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Asahi Lina <lina+kernel@asahilina.net>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Alex Hung <alex.hung@amd.com>, Tamir Duberstein <tamird@gmail.com>,
	Xiangfei Ding <dingxiangfei2009@gmail.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 1/4] rust: i2c: add basic I2C device and driver
 abstractions
Message-ID: <aGg2qkyrKBIPiSeE@cassiopeiae>
References: <20250704153332.1193214-1-igor.korotin.linux@gmail.com>
 <20250704153657.1195687-1-igor.korotin.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250704153657.1195687-1-igor.korotin.linux@gmail.com>

On Fri, Jul 04, 2025 at 04:36:57PM +0100, Igor Korotin wrote:
> Implement the core abstractions needed for I2C drivers, including:
> 
> * `i2c::Driver` — the trait drivers must implement, including `probe`
> 
> * `i2c::Device` — a safe wrapper around `struct i2c_client`
> 
> * `i2c::Adapter` — implements `driver::RegistrationOps` to hook into the
>   generic `driver::Registration` machinery
> 
> * `i2c::DeviceId` — a `RawDeviceId` implementation for I2C device IDs
> 
> Signed-off-by: Igor Korotin <igor.korotin.linux@gmail.com>
> ---
>  MAINTAINERS                     |   2 +
>  rust/bindings/bindings_helper.h |   1 +
>  rust/helpers/helpers.c          |   1 +
>  rust/helpers/i2c.c              |  15 ++
>  rust/kernel/i2c.rs              | 391 ++++++++++++++++++++++++++++++++
>  rust/kernel/lib.rs              |   2 +
>  6 files changed, 412 insertions(+)
>  create mode 100644 rust/helpers/i2c.c
>  create mode 100644 rust/kernel/i2c.rs
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7f8ddeec3b17..688a0ff23e69 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11363,6 +11363,8 @@ F:	include/linux/i2c-smbus.h
>  F:	include/linux/i2c.h
>  F:	include/uapi/linux/i2c-*.h
>  F:	include/uapi/linux/i2c.h
> +F:	rust/helpers/i2c.c
> +F:	rust/kernel/i2c.rs

Is this agreed with the maintainer?

There are multiple possible options, for instance:

  1) Maintain the Rust abstractions as part of the existing MAINTAINERS entry.
     Optionally, the author can be added as another maintainer or reviewer.

  2) Add a separate MAINTAINERS entry; patches still go through the same
     subsystem tree.

  3) Add a separate MAINTAINERS entry; patches don't go through the subsystem
     tree (e.g. because the subsystem maintainers don't want to deal with it).

I usually recommend (1), which is what is proposes here, but that's of course up
to you and the I2C maintainer.

@Wolfram: In case there's no agreement yet, what's your preference of
maintainership for this?

>  I2C SUBSYSTEM HOST DRIVERS
>  M:	Andi Shyti <andi.shyti@kernel.org>
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
> index 7e8f22850647..efc9be4d9a6e 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -53,6 +53,7 @@
>  #include <linux/file.h>
>  #include <linux/firmware.h>
>  #include <linux/fs.h>
> +#include <linux/i2c.h>
>  #include <linux/jiffies.h>
>  #include <linux/jump_label.h>
>  #include <linux/mdio.h>
> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> index 0b09bd0e3561..be34554b3fab 100644
> --- a/rust/helpers/helpers.c
> +++ b/rust/helpers/helpers.c
> @@ -23,6 +23,7 @@
>  #include "drm.c"
>  #include "err.c"
>  #include "fs.c"
> +#include "i2c.c"
>  #include "io.c"
>  #include "jump_label.c"
>  #include "kunit.c"
> diff --git a/rust/helpers/i2c.c b/rust/helpers/i2c.c
> new file mode 100644
> index 000000000000..5f384f8f560e
> --- /dev/null
> +++ b/rust/helpers/i2c.c
> @@ -0,0 +1,15 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/i2c.h>
> +
> +void* rust_helper_i2c_get_clientdata(struct i2c_client *client)
> +{
> +	return i2c_get_clientdata(client);
> +}
> +
> +void rust_helper_i2c_set_clientdata(struct i2c_client *client, void *data)
> +{
> +	i2c_set_clientdata(client, data);
> +}

Just a note, this won't be needed in the future, I have patches in the queue
that let you use generic accessors from the generic Device type. [1]

[1] https://lore.kernel.org/lkml/20250621195118.124245-3-dakr@kernel.org/

> diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
> new file mode 100644
> index 000000000000..4f2f3c378153
> --- /dev/null
> +++ b/rust/kernel/i2c.rs
> @@ -0,0 +1,391 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! I2C Driver subsystem
> +
> +// I2C Driver abstractions.
> +use crate::{
> +    acpi, container_of, device,
> +    device_id::RawDeviceId,
> +    driver,
> +    error::*,
> +    of,
> +    prelude::*,
> +    types::{ForeignOwnable, Opaque},
> +};
> +
> +use core::{
> +    marker::PhantomData,
> +    ptr::{addr_of_mut, NonNull},
> +};
> +
> +/// An I2C device id table.
> +#[repr(transparent)]
> +#[derive(Clone, Copy)]
> +pub struct DeviceId(bindings::i2c_device_id);
> +
> +impl DeviceId {
> +    const I2C_NAME_SIZE: usize = 20;
> +
> +    /// Create a new device id from an I2C 'id' string.
> +    #[inline(always)]
> +    pub const fn new(id: &'static CStr) -> Self {
> +        build_assert!(
> +            id.len_with_nul() <= Self::I2C_NAME_SIZE,
> +            "ID exceeds 20 bytes"
> +        );
> +        let src = id.as_bytes_with_nul();
> +        // Replace with `bindings::acpi_device_id::default()` once stabilized for `const`.
> +        // SAFETY: FFI type is valid to be zero-initialized.
> +        let mut i2c: bindings::i2c_device_id = unsafe { core::mem::zeroed() };
> +        let mut i = 0;
> +        while i < src.len() {
> +            i2c.name[i] = src[i];
> +            i += 1;
> +        }
> +
> +        Self(i2c)
> +    }
> +}
> +
> +// SAFETY:
> +// * `DeviceId` is a `#[repr(transparent)` wrapper of `i2c_device_id` and does not add
> +//   additional invariants, so it's safe to transmute to `RawType`.
> +// * `DRIVER_DATA_OFFSET` is the offset to the `driver_data` field.
> +unsafe impl RawDeviceId for DeviceId {
> +    type RawType = bindings::i2c_device_id;
> +
> +    const DRIVER_DATA_OFFSET: usize = core::mem::offset_of!(bindings::i2c_device_id, driver_data);
> +
> +    fn index(&self) -> usize {
> +        self.0.driver_data as _
> +    }
> +}

Just a heads-up, this trait will be split up. [2]

[2] https://lore.kernel.org/lkml/20250704041003.734033-2-fujita.tomonori@gmail.com/

> +/// IdTable type for I2C
> +pub type IdTable<T> = &'static dyn kernel::device_id::IdTable<DeviceId, T>;
> +
> +/// Create a I2C `IdTable` with its alias for modpost.
> +#[macro_export]
> +macro_rules! i2c_device_table {
> +    ($table_name:ident, $module_table_name:ident, $id_info_type: ty, $table_data: expr) => {
> +        const $table_name: $crate::device_id::IdArray<
> +            $crate::i2c::DeviceId,
> +            $id_info_type,
> +            { $table_data.len() },
> +        > = $crate::device_id::IdArray::new($table_data);
> +
> +        $crate::module_device_table!("i2c", $module_table_name, $table_name);
> +    };
> +}
> +
> +/// An adapter for the registration of I2C drivers.
> +pub struct Adapter<T: Driver>(T);
> +
> +// SAFETY: A call to `unregister` for a given instance of `RegType` is guaranteed to be valid if
> +// a preceding call to `register` has been successful.
> +unsafe impl<T: Driver + 'static> driver::RegistrationOps for Adapter<T> {
> +    type RegType = bindings::i2c_driver;
> +
> +    unsafe fn register(
> +        pdrv: &Opaque<Self::RegType>,
> +        name: &'static CStr,
> +        module: &'static ThisModule,
> +    ) -> Result {
> +        let i2c_table = match T::I2C_ID_TABLE {
> +            Some(table) => table.as_ptr(),
> +            None => core::ptr::null(),
> +        };
> +
> +        let of_table = match T::OF_ID_TABLE {
> +            Some(table) => table.as_ptr(),
> +            None => core::ptr::null(),
> +        };
> +
> +        let acpi_table = match T::ACPI_ID_TABLE {
> +            Some(table) => table.as_ptr(),
> +            None => core::ptr::null(),
> +        };
> +
> +        // SAFETY: It's safe to set the fields of `struct i2c_client` on initialization.
> +        unsafe {
> +            (*pdrv.get()).driver.name = name.as_char_ptr();
> +            (*pdrv.get()).probe = Some(Self::probe_callback);
> +            (*pdrv.get()).remove = Some(Self::remove_callback);
> +            (*pdrv.get()).shutdown = Some(Self::shutdown_callback);
> +            (*pdrv.get()).id_table = i2c_table;
> +            (*pdrv.get()).driver.of_match_table = of_table;
> +            (*pdrv.get()).driver.acpi_match_table = acpi_table;
> +        }
> +
> +        // SAFETY: `pdrv` is guaranteed to be a valid `RegType`.
> +        to_result(unsafe { bindings::i2c_register_driver(module.0, pdrv.get()) })
> +    }
> +
> +    unsafe fn unregister(pdrv: &Opaque<Self::RegType>) {
> +        // SAFETY: `pdrv` is guaranteed to be a valid `RegType`.
> +        unsafe { bindings::i2c_del_driver(pdrv.get()) }
> +    }
> +}
> +
> +impl<T: Driver + 'static> Adapter<T> {
> +    extern "C" fn probe_callback(pdev: *mut bindings::i2c_client) -> kernel::ffi::c_int {
> +        // SAFETY: The I2C bus only ever calls the probe callback with a valid pointer to a
> +        // `struct i2c_client`.
> +        //
> +        // INVARIANT: `pdev` is valid for the duration of `probe_callback()`.
> +        let pdev = unsafe { &*pdev.cast::<Device<device::Core>>() };
> +
> +        let info =
> +            Self::i2c_id_info(pdev).or_else(|| <Self as driver::Adapter>::id_info(pdev.as_ref()));
> +
> +        match T::probe(pdev, info) {
> +            Ok(data) => {
> +                unsafe { bindings::i2c_set_clientdata(pdev.as_raw(), data.into_foreign() as _) };
> +            }
> +            Err(err) => return Error::to_errno(err),
> +        }

Better use from_result() here.

> +
> +        0
> +    }
> +
> +    extern "C" fn remove_callback(pdev: *mut bindings::i2c_client) {
> +        // SAFETY: `pdev` is a valid pointer to a `struct i2c_client`.
> +        let ptr = unsafe { bindings::i2c_get_clientdata(pdev) }.cast();
> +
> +        // SAFETY: `remove_callback` is only ever called after a successful call to
> +        // `probe_callback`, hence it's guaranteed that `ptr` points to a valid and initialized
> +        // `KBox<T>` pointer created through `KBox::into_foreign`.
> +        let _ = unsafe { KBox::<T>::from_foreign(ptr) };

I like to do that as well, but I usually get asked to use drop() instead, let's
do that here as well. :)

> +    }
> +
> +    extern "C" fn shutdown_callback(pdev: *mut bindings::i2c_client) {
> +        let pdev = unsafe { &*pdev.cast::<Device<device::Core>>() };
> +
> +        T::shutdown(pdev);
> +    }
> +
> +    /// The [`i2c::IdTable`] of the corresponding driver.
> +    fn i2c_id_table() -> Option<IdTable<<Self as driver::Adapter>::IdInfo>> {
> +        T::I2C_ID_TABLE
> +    }
> +
> +    /// Returns the driver's private data from the matching entry in the [`i2c::IdTable`], if any.
> +    ///
> +    /// If this returns `None`, it means there is no match with an entry in the [`i2c::IdTable`].
> +    fn i2c_id_info(dev: &Device) -> Option<&'static <Self as driver::Adapter>::IdInfo> {
> +        let table = Self::i2c_id_table()?;
> +
> +        // SAFETY:
> +        // - `table` has static lifetime, hence it's valid for read,
> +        // - `dev` is guaranteed to be valid while it's alive, and so is `pdev.as_ref().as_raw()`.
> +        let raw_id = unsafe { bindings::i2c_match_id(table.as_ptr(), dev.as_raw()) };
> +
> +        if raw_id.is_null() {
> +            None
> +        } else {
> +            // SAFETY: `DeviceId` is a `#[repr(transparent)` wrapper of `struct i2c_device_id` and

Nit: Missing ']', probably a copy-paste mistake from other busses.

> +            // does not add additional invariants, so it's safe to transmute.
> +            let id = unsafe { &*raw_id.cast::<DeviceId>() };
> +
> +            Some(table.info(<DeviceId as crate::device_id::RawDeviceId>::index(id)))
> +        }
> +    }
> +}
> +
> +impl<T: Driver + 'static> driver::Adapter for Adapter<T> {
> +    type IdInfo = T::IdInfo;
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
> +    ($($f:tt)*) => {
> +        $crate::module_driver!(<T>, $crate::i2c::Adapter<T>, { $($f)* });
> +    };
> +}
> +
> +/// The i2c driver trait.
> +///
> +/// Drivers must implement this trait in order to get a i2c driver registered.
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
> +///     type IdInfo = ();
> +///     const I2C_ID_TABLE: Option<i2c::IdTable<Self::IdInfo>> = Some(&I2C_TABLE);
> +///     const OF_ID_TABLE: Option<of::IdTable<Self::IdInfo>> = Some(&OF_TABLE);
> +///     const ACPI_ID_TABLE: Option<acpi::IdTable<Self::IdInfo>> = Some(&ACPI_TABLE);
> +///
> +///     fn probe(
> +///         _pdev: &i2c::Device<Core>,
> +///         _id_info: Option<&Self::IdInfo>,
> +///     ) -> Result<Pin<KBox<Self>>> {
> +///         Err(ENODEV)
> +///     }
> +///
> +///     fn shutdown(_pdev: &i2c::Device<Core>) {
> +///     }
> +/// }
> +///```
> +pub trait Driver: Send {
> +    /// The type holding information about each device id supported by the driver.
> +    // TODO: Use `associated_type_defaults` once stabilized:
> +    //
> +    // ```
> +    // type IdInfo: 'static = ();
> +    // ```
> +    type IdInfo: 'static;
> +
> +    /// The table of device ids supported by the driver.
> +    const I2C_ID_TABLE: Option<IdTable<Self::IdInfo>> = None;
> +
> +    /// The table of OF device ids supported by the driver.
> +    const OF_ID_TABLE: Option<of::IdTable<Self::IdInfo>> = None;
> +
> +    /// The table of ACPI device ids supported by the driver.
> +    const ACPI_ID_TABLE: Option<acpi::IdTable<Self::IdInfo>> = None;
> +
> +    /// I2C driver probe.
> +    ///
> +    /// Called when a new i2c device is added or discovered.
> +    /// Implementers should attempt to initialize the device here.
> +    fn probe(dev: &Device<device::Core>, id_info: Option<&Self::IdInfo>)
> +        -> Result<Pin<KBox<Self>>>;
> +
> +    /// I2C driver shutdown
> +    ///
> +    /// Called when

Yes? :)

> +    fn shutdown(dev: &Device<device::Core>) {
> +        let _ = dev;
> +    }
> +}
> +
> +/// The i2c client representation.
> +///
> +/// This structure represents the Rust abstraction for a C `struct i2c_client`. The
> +/// implementation abstracts the usage of an already existing C `struct i2c_client` within Rust
> +/// code that we get passed from the C side.
> +///
> +/// # Invariants
> +///
> +/// A [`Device`] instance represents a valid `struct i2c_client` created by the C portion of
> +/// the kernel.
> +#[repr(transparent)]
> +pub struct Device<Ctx: device::DeviceContext = device::Normal>(
> +    Opaque<bindings::i2c_client>,
> +    PhantomData<Ctx>,
> +);
> +
> +impl<Ctx: device::DeviceContext> Device<Ctx> {
> +    fn as_raw(&self) -> *mut bindings::i2c_client {
> +        self.0.get()
> +    }
> +}
> +
> +// SAFETY: `Device` is a transparent wrapper of a type that doesn't depend on `Device`'s generic
> +// argument.
> +kernel::impl_device_context_deref!(unsafe { Device });
> +kernel::impl_device_context_into_aref!(Device);
> +
> +// SAFETY: Instances of `Device` are always reference-counted.
> +unsafe impl crate::types::AlwaysRefCounted for Device {
> +    fn inc_ref(&self) {
> +        // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
> +        unsafe { bindings::get_device(self.as_ref().as_raw()) };
> +    }
> +
> +    unsafe fn dec_ref(obj: NonNull<Self>) {
> +        // SAFETY: The safety requirements guarantee that the refcount is non-zero.
> +        unsafe { bindings::put_device(addr_of_mut!((*obj.as_ref().as_raw()).dev)) }
> +    }
> +}
> +
> +impl<Ctx: device::DeviceContext> AsRef<device::Device<Ctx>> for Device<Ctx> {
> +    fn as_ref(&self) -> &device::Device<Ctx> {
> +        // SAFETY: By the type invariant of `Self`, `self.as_raw()` is a pointer to a valid
> +        // `struct i2c_client`.
> +        let dev = unsafe { addr_of_mut!((*self.as_raw()).dev) };
> +
> +        // SAFETY: `dev` points to a valid `struct device`.
> +        unsafe { device::Device::as_ref(dev) }
> +    }
> +}
> +
> +impl<Ctx: device::DeviceContext> TryFrom<&device::Device<Ctx>> for &Device<Ctx> {
> +    type Error = kernel::error::Error;
> +
> +    fn try_from(dev: &device::Device<Ctx>) -> Result<Self, Self::Error> {
> +        // SAFETY: By the type invariant of `Device`, `dev.as_raw()` is a valid pointer to a
> +        // `struct device`.
> +        if unsafe { bindings::i2c_verify_client(dev.as_raw()).is_null() } {
> +            return Err(EINVAL);
> +        }
> +
> +        // SAFETY: We've just verified that the type of `dev` equals to
> +        // `bindings::i2c_client_type`, hence `dev` must be embedded in a valid
> +        // `struct i2c_client` as guaranteed by the corresponding C code.
> +        let pdev = unsafe { container_of!(dev.as_raw(), bindings::i2c_client, dev) };
> +
> +        // SAFETY: `pdev` is a valid pointer to a `struct i2c_client`.
> +        Ok(unsafe { &*pdev.cast() })
> +    }
> +}
> +
> +// SAFETY: A `Device` is always reference-counted and can be released from any thread.
> +unsafe impl Send for Device {}
> +
> +// SAFETY: `Device` can be shared among threads because all methods of `Device`
> +// (i.e. `Device<Normal>) are thread safe.
> +unsafe impl Sync for Device {}
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 5bbf3627212f..ee1233e44a0f 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -79,6 +79,8 @@
>  #[cfg(CONFIG_RUST_FW_LOADER_ABSTRACTIONS)]
>  pub mod firmware;
>  pub mod fs;
> +#[cfg(CONFIG_I2C)]
> +pub mod i2c;

For now I think you have to ensure that I2C is built-in.

>  pub mod init;
>  pub mod io;
>  pub mod ioctl;
> -- 
> 2.43.0
> 

