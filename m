Return-Path: <linux-i2c+bounces-14095-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 40088C61879
	for <lists+linux-i2c@lfdr.de>; Sun, 16 Nov 2025 17:24:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2EFFD4EC32F
	for <lists+linux-i2c@lfdr.de>; Sun, 16 Nov 2025 16:21:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0C5C30DEB5;
	Sun, 16 Nov 2025 16:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EEl9aaaD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CEE230C60A
	for <linux-i2c@vger.kernel.org>; Sun, 16 Nov 2025 16:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763310112; cv=none; b=ePNMNcjm51ZYUPsGwZB6HYqP51hlauu2DZZiICF/rKjuumcWgZwm/ygZXIIO+7n8wbAh8dQOrqOM1oNP/jphfw9YyKsmWQuqk8V3q1ME4CBAGGTSh0s0hQ5eVmDtpleG4roXE9rDS0dR6AxkD2skdVCAxNDzGB0/3eS9wxFEv84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763310112; c=relaxed/simple;
	bh=uHqOIm9DwdQg+qgYw7fzQImQbtRmKKyMWdCpS6OoI3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EIq2K9myhEjjlCZPwbw0qE4w0HLD8IylZMkccj+2LWlOtstm/oJ+nzXNYaveUbS8AvE1VMJvSik4xilcPVDWSMGU3zxdtZnWP5+G078Xv9lBe9mMCN43Q7DSNnpF0vw9nzpB24yW6r9HdW+3KDNIPxzwFAp/W4OEZK75VOD3SH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EEl9aaaD; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4775895d69cso18852415e9.0
        for <linux-i2c@vger.kernel.org>; Sun, 16 Nov 2025 08:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763310107; x=1763914907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yd+h7wHl9yg828NHXcsgY7m0i29LLMrN8fEN2Y7/uZA=;
        b=EEl9aaaDUGJX+8cCz9JfPSonw2/IaiqknvjT8JYtEukSyqur6Io++QhRs+XrIXHQl/
         4jbaKsBGD+g3ZHtx8RFobCFCDQ0vpRbVoJnnp0FzqsvjnJi33gu4eLrwW2Xxc9tdBOoo
         kp/yHGvan9EjdQmQHjGSXRstRouK7e+8Pl92ZGE61ZtJerPPfoPgTktJ2lAgKl40tYRM
         5u5s2/G6rEgSM48KDWCRAZ1MaME34SP1Ac5Md4F5s+MAQUBOwtRil8Tq4sLbWkYVZ7jC
         SP5ti7vD3SXZx4w+xsQ8p+gtSZSeu0+dI4JWu6JsS4FMqC9WejEvEKjZ6i9kcKJGVBdc
         1fwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763310107; x=1763914907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yd+h7wHl9yg828NHXcsgY7m0i29LLMrN8fEN2Y7/uZA=;
        b=KzzAWbyDqAHlRnhCowYGGJnG10LsGWKp++KBWwq84ITJr4S2KUwadcT7X+DRrskJbu
         gW0G8xOdOh4zbF3iaPgfiVsPmmCbBL/oFrPzTaGme3kYxB7BonkI6Ny14Ug54FIewVO1
         K934yC0yvhxYJEIPILWulTrSvQF2lFxUbGPHAHKlagUdd08cOXEod8ZQRIv9+3ETAqVh
         tvalUoZiY4U3kp8J5kvt03lzGa2pGCyi1CtCNNeoes6E4x3rnSwoyHb9NuoUI9oo9qCM
         zxzcS9dlNlPDwPx7fFTPLwWU5igBDa3zguwXtgeNKWwaMQBiLjJUYT3BywfjUBnsSGOO
         m3JA==
X-Forwarded-Encrypted: i=1; AJvYcCVg+kMpkY3S7YvWWZD6nOWtd3CzM6P90+p7BLn2pRL+FbFQALyKHLKmmm0o4YQrCCmXTOMcxrL3dck=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKyDR5knJAO/v0vGfpxOezjCRtpaCjqQuXVVYHb0CaFI0Feif5
	wIVVBT5fqNtsrYBtPdVH55PCPsnm75/8FWjkEKpj7V7UY9RSoRfvQTv2
X-Gm-Gg: ASbGncuT2crbcqW2D+EOvUMs9VT7oV2Qa1Eio37pNImDAUafiDQQfsYXokXPLE/maPs
	l6uQUu2UMF2Y3oKMd4CGYkE1T9Jtog8c2JN52UJr75pCB/9nNSo7q1x1q8mtGBBlp6IVPq4cHyr
	U/zN62M5HeXRbldVR8RUzlAV2mxyAmIT2RmW9w3as+ub3UVXflQokYgUrQe/ssf1Wc1VgHq0Agr
	tcTKgaLcOiA5vJZIbXIIipgwsTipQYU6bVb0o7s5H7/S6FCZ7XtK2+B9xa5gIHyjBlqXHn5tqRO
	tzj7UgogwkNZLy9gOQ6YLmKs0bq6JW+enulsqK5G7pPjHEC/lD3isifV2Slc8dDBoYaq7Ow9/j/
	woUfwqR+l0Q+xqG0fLaoGBCp+EuGFbfl3SAvWe17lLwVPSDLqQ0ehNCbYaJz3CMB8kGZ5so9K61
	7DP22Qe7o7WYrpjQY=
X-Google-Smtp-Source: AGHT+IHJO98+rZpKqfSy3Hufvx0I+gBcVhTvQHuC7iCzMg3RxDp+WXfOv1e2ezWrF4rqJW/CN2BEQw==
X-Received: by 2002:a7b:ce86:0:b0:477:9c73:268b with SMTP id 5b1f17b1804b1-4779c7327c9mr32253675e9.33.1763310106755;
        Sun, 16 Nov 2025 08:21:46 -0800 (PST)
Received: from Vasilio.Home ([176.26.203.25])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e7ae5bsm21448789f8f.8.2025.11.16.08.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 08:21:46 -0800 (PST)
From: Igor Korotin <igor.korotin.linux@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
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
Subject: [PATCH v8 1/4] rust: i2c: add basic I2C device and driver abstractions
Date: Sun, 16 Nov 2025 16:21:44 +0000
Message-ID: <20251116162144.171469-1-igor.korotin.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251116162104.171420-1-igor.korotin.linux@gmail.com>
References: <20251116162104.171420-1-igor.korotin.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Implement the core abstractions needed for I2C drivers, including:

* `i2c::Driver` — the trait drivers must implement, including `probe`

* `i2c::I2cClient` — a safe wrapper around `struct i2c_client`

* `i2c::Adapter` — implements `driver::RegistrationOps` to hook into the
  generic `driver::Registration` machinery

* `i2c::DeviceId` — a `RawDeviceIdIndex` implementation for I2C device IDs

Signed-off-by: Igor Korotin <igor.korotin.linux@gmail.com>
---
 MAINTAINERS                     |   8 +
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/i2c.rs              | 436 ++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |   2 +
 4 files changed, 447 insertions(+)
 create mode 100644 rust/kernel/i2c.rs

diff --git a/MAINTAINERS b/MAINTAINERS
index 3da2c26a796b..a8dfde2f5633 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11743,6 +11743,14 @@ F:	include/linux/i2c.h
 F:	include/uapi/linux/i2c-*.h
 F:	include/uapi/linux/i2c.h
 
+I2C SUBSYSTEM [RUST]
+M:	Igor Korotin <igor.korotin.linux@gmail.com>
+R:	Danilo Krummrich <dakr@kernel.org>
+R:	Daniel Almeida <daniel.almeida@collabora.com>
+L:	rust-for-linux@vger.kernel.org
+S:	Maintained
+F:	rust/kernel/i2c.rs
+
 I2C SUBSYSTEM HOST DRIVERS
 M:	Andi Shyti <andi.shyti@kernel.org>
 L:	linux-i2c@vger.kernel.org
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index a79fd111f886..f92abb578b56 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -58,6 +58,7 @@
 #include <linux/firmware.h>
 #include <linux/interrupt.h>
 #include <linux/fs.h>
+#include <linux/i2c.h>
 #include <linux/ioport.h>
 #include <linux/jiffies.h>
 #include <linux/jump_label.h>
diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
new file mode 100644
index 000000000000..a5ad8213d9ac
--- /dev/null
+++ b/rust/kernel/i2c.rs
@@ -0,0 +1,436 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! I2C Driver subsystem
+
+// I2C Driver abstractions.
+use crate::{
+    acpi,
+    container_of,
+    device,
+    device_id::{
+        RawDeviceId,
+        RawDeviceIdIndex, //
+    },
+    driver,
+    error::*,
+    of,
+    prelude::*,
+    types::{
+        AlwaysRefCounted,
+        Opaque, //
+    }, //
+};
+
+use core::{
+    marker::PhantomData,
+    ptr::NonNull, //
+};
+
+/// An I2C device id table.
+#[repr(transparent)]
+#[derive(Clone, Copy)]
+pub struct DeviceId(bindings::i2c_device_id);
+
+impl DeviceId {
+    const I2C_NAME_SIZE: usize = 20;
+
+    /// Create a new device id from an I2C 'id' string.
+    #[inline(always)]
+    pub const fn new(id: &'static CStr) -> Self {
+        build_assert!(
+            id.len_with_nul() <= Self::I2C_NAME_SIZE,
+            "ID exceeds 20 bytes"
+        );
+        let src = id.as_bytes_with_nul();
+        // Replace with `bindings::i2c_device_id::default()` once stabilized for `const`.
+        // SAFETY: FFI type is valid to be zero-initialized.
+        let mut i2c: bindings::i2c_device_id = pin_init::zeroed();
+        let mut i = 0;
+        while i < src.len() {
+            i2c.name[i] = src[i];
+            i += 1;
+        }
+
+        Self(i2c)
+    }
+}
+
+// SAFETY: `DeviceId` is a `#[repr(transparent)]` wrapper of `i2c_device_id` and does not add
+// additional invariants, so it's safe to transmute to `RawType`.
+unsafe impl RawDeviceId for DeviceId {
+    type RawType = bindings::i2c_device_id;
+}
+
+// SAFETY: `DRIVER_DATA_OFFSET` is the offset to the `driver_data` field.
+unsafe impl RawDeviceIdIndex for DeviceId {
+    const DRIVER_DATA_OFFSET: usize = core::mem::offset_of!(bindings::i2c_device_id, driver_data);
+
+    fn index(&self) -> usize {
+        self.0.driver_data
+    }
+}
+
+/// IdTable type for I2C
+pub type IdTable<T> = &'static dyn kernel::device_id::IdTable<DeviceId, T>;
+
+/// Create a I2C `IdTable` with its alias for modpost.
+#[macro_export]
+macro_rules! i2c_device_table {
+    ($table_name:ident, $module_table_name:ident, $id_info_type: ty, $table_data: expr) => {
+        const $table_name: $crate::device_id::IdArray<
+            $crate::i2c::DeviceId,
+            $id_info_type,
+            { $table_data.len() },
+        > = $crate::device_id::IdArray::new($table_data);
+
+        $crate::module_device_table!("i2c", $module_table_name, $table_name);
+    };
+}
+
+/// An adapter for the registration of I2C drivers.
+pub struct Adapter<T: Driver>(T);
+
+// SAFETY: A call to `unregister` for a given instance of `RegType` is guaranteed to be valid if
+// a preceding call to `register` has been successful.
+unsafe impl<T: Driver + 'static> driver::RegistrationOps for Adapter<T> {
+    type RegType = bindings::i2c_driver;
+
+    unsafe fn register(
+        idrv: &Opaque<Self::RegType>,
+        name: &'static CStr,
+        module: &'static ThisModule,
+    ) -> Result {
+        build_assert!(
+            T::ACPI_ID_TABLE.is_some() || T::OF_ID_TABLE.is_some() || T::I2C_ID_TABLE.is_some(),
+            "At least one of ACPI/OF/Legacy tables must be present when registering an i2c driver"
+        );
+
+        let i2c_table = match T::I2C_ID_TABLE {
+            Some(table) => table.as_ptr(),
+            None => core::ptr::null(),
+        };
+
+        let of_table = match T::OF_ID_TABLE {
+            Some(table) => table.as_ptr(),
+            None => core::ptr::null(),
+        };
+
+        let acpi_table = match T::ACPI_ID_TABLE {
+            Some(table) => table.as_ptr(),
+            None => core::ptr::null(),
+        };
+
+        // SAFETY: It's safe to set the fields of `struct i2c_client` on initialization.
+        unsafe {
+            (*idrv.get()).driver.name = name.as_char_ptr();
+            (*idrv.get()).probe = Some(Self::probe_callback);
+            (*idrv.get()).remove = Some(Self::remove_callback);
+            (*idrv.get()).shutdown = Some(Self::shutdown_callback);
+            (*idrv.get()).id_table = i2c_table;
+            (*idrv.get()).driver.of_match_table = of_table;
+            (*idrv.get()).driver.acpi_match_table = acpi_table;
+        }
+
+        // SAFETY: `idrv` is guaranteed to be a valid `RegType`.
+        to_result(unsafe { bindings::i2c_register_driver(module.0, idrv.get()) })
+    }
+
+    unsafe fn unregister(idrv: &Opaque<Self::RegType>) {
+        // SAFETY: `idrv` is guaranteed to be a valid `RegType`.
+        unsafe { bindings::i2c_del_driver(idrv.get()) }
+    }
+}
+
+impl<T: Driver + 'static> Adapter<T> {
+    extern "C" fn probe_callback(idev: *mut bindings::i2c_client) -> kernel::ffi::c_int {
+        // SAFETY: The I2C bus only ever calls the probe callback with a valid pointer to a
+        // `struct i2c_client`.
+        //
+        // INVARIANT: `idev` is valid for the duration of `probe_callback()`.
+        let idev = unsafe { &*idev.cast::<I2cClient<device::CoreInternal>>() };
+
+        let info =
+            Self::i2c_id_info(idev).or_else(|| <Self as driver::Adapter>::id_info(idev.as_ref()));
+
+        from_result(|| {
+            let data = T::probe(idev, info);
+
+            idev.as_ref().set_drvdata(data)?;
+            Ok(0)
+        })
+    }
+
+    extern "C" fn remove_callback(idev: *mut bindings::i2c_client) {
+        // SAFETY: `idev` is a valid pointer to a `struct i2c_client`.
+        let idev = unsafe { &*idev.cast::<I2cClient<device::CoreInternal>>() };
+
+        // SAFETY: `remove_callback` is only ever called after a successful call to
+        // `probe_callback`, hence it's guaranteed that `I2cClient::set_drvdata()` has been called
+        // and stored a `Pin<KBox<T>>`.
+        let data = unsafe { idev.as_ref().drvdata_obtain::<T>() };
+
+        T::unbind(idev, data.as_ref());
+    }
+
+    extern "C" fn shutdown_callback(idev: *mut bindings::i2c_client) {
+        // SAFETY: `shutdown_callback` is only ever called for a valid `idev`
+        let idev = unsafe { &*idev.cast::<I2cClient<device::CoreInternal>>() };
+
+        // SAFETY: `shutdown_callback` is only ever called after a successful call to
+        // `probe_callback`, hence it's guaranteed that `Device::set_drvdata()` has been called
+        // and stored a `Pin<KBox<T>>`.
+        let data = unsafe { idev.as_ref().drvdata_obtain::<T>() };
+
+        T::shutdown(idev, data.as_ref());
+    }
+
+    /// The [`i2c::IdTable`] of the corresponding driver.
+    fn i2c_id_table() -> Option<IdTable<<Self as driver::Adapter>::IdInfo>> {
+        T::I2C_ID_TABLE
+    }
+
+    /// Returns the driver's private data from the matching entry in the [`i2c::IdTable`], if any.
+    ///
+    /// If this returns `None`, it means there is no match with an entry in the [`i2c::IdTable`].
+    fn i2c_id_info(dev: &I2cClient) -> Option<&'static <Self as driver::Adapter>::IdInfo> {
+        let table = Self::i2c_id_table()?;
+
+        // SAFETY:
+        // - `table` has static lifetime, hence it's valid for reads
+        // - `dev` is guaranteed to be valid while it's alive, and so is `dev.as_raw()`.
+        let raw_id = unsafe { bindings::i2c_match_id(table.as_ptr(), dev.as_raw()) };
+
+        if raw_id.is_null() {
+            return None;
+        }
+
+        // SAFETY: `DeviceId` is a `#[repr(transparent)` wrapper of `struct i2c_device_id` and
+        // does not add additional invariants, so it's safe to transmute.
+        let id = unsafe { &*raw_id.cast::<DeviceId>() };
+
+        Some(table.info(<DeviceId as RawDeviceIdIndex>::index(id)))
+    }
+}
+
+impl<T: Driver + 'static> driver::Adapter for Adapter<T> {
+    type IdInfo = T::IdInfo;
+
+    fn of_id_table() -> Option<of::IdTable<Self::IdInfo>> {
+        T::OF_ID_TABLE
+    }
+
+    fn acpi_id_table() -> Option<acpi::IdTable<Self::IdInfo>> {
+        T::ACPI_ID_TABLE
+    }
+}
+
+/// Declares a kernel module that exposes a single i2c driver.
+///
+/// # Examples
+///
+/// ```ignore
+/// kernel::module_i2c_driver! {
+///     type: MyDriver,
+///     name: "Module name",
+///     authors: ["Author name"],
+///     description: "Description",
+///     license: "GPL v2",
+/// }
+/// ```
+#[macro_export]
+macro_rules! module_i2c_driver {
+    ($($f:tt)*) => {
+        $crate::module_driver!(<T>, $crate::i2c::Adapter<T>, { $($f)* });
+    };
+}
+
+/// The i2c driver trait.
+///
+/// Drivers must implement this trait in order to get a i2c driver registered.
+///
+/// # Example
+///
+///```
+/// # use kernel::{acpi, bindings, c_str, device::Core, i2c, of};
+///
+/// struct MyDriver;
+///
+/// kernel::acpi_device_table!(
+///     ACPI_TABLE,
+///     MODULE_ACPI_TABLE,
+///     <MyDriver as i2c::Driver>::IdInfo,
+///     [
+///         (acpi::DeviceId::new(c_str!("LNUXBEEF")), ())
+///     ]
+/// );
+///
+/// kernel::i2c_device_table!(
+///     I2C_TABLE,
+///     MODULE_I2C_TABLE,
+///     <MyDriver as i2c::Driver>::IdInfo,
+///     [
+///          (i2c::DeviceId::new(c_str!("rust_driver_i2c")), ())
+///     ]
+/// );
+///
+/// kernel::of_device_table!(
+///     OF_TABLE,
+///     MODULE_OF_TABLE,
+///     <MyDriver as i2c::Driver>::IdInfo,
+///     [
+///         (of::DeviceId::new(c_str!("test,device")), ())
+///     ]
+/// );
+///
+/// impl i2c::Driver for MyDriver {
+///     type IdInfo = ();
+///     const I2C_ID_TABLE: Option<i2c::IdTable<Self::IdInfo>> = Some(&I2C_TABLE);
+///     const OF_ID_TABLE: Option<of::IdTable<Self::IdInfo>> = Some(&OF_TABLE);
+///     const ACPI_ID_TABLE: Option<acpi::IdTable<Self::IdInfo>> = Some(&ACPI_TABLE);
+///
+///     fn probe(
+///         _idev: &i2c::I2cClient<Core>,
+///         _id_info: Option<&Self::IdInfo>,
+///     ) -> impl PinInit<Self, Error> {
+///         Err(ENODEV)
+///     }
+///
+///     fn shutdown(_idev: &i2c::I2cClient<Core>, this: Pin<&Self>) {
+///     }
+/// }
+///```
+pub trait Driver: Send {
+    /// The type holding information about each device id supported by the driver.
+    // TODO: Use `associated_type_defaults` once stabilized:
+    //
+    // ```
+    // type IdInfo: 'static = ();
+    // ```
+    type IdInfo: 'static;
+
+    /// The table of device ids supported by the driver.
+    const I2C_ID_TABLE: Option<IdTable<Self::IdInfo>> = None;
+
+    /// The table of OF device ids supported by the driver.
+    const OF_ID_TABLE: Option<of::IdTable<Self::IdInfo>> = None;
+
+    /// The table of ACPI device ids supported by the driver.
+    const ACPI_ID_TABLE: Option<acpi::IdTable<Self::IdInfo>> = None;
+
+    /// I2C driver probe.
+    ///
+    /// Called when a new i2c client is added or discovered.
+    /// Implementers should attempt to initialize the client here.
+    fn probe(
+        dev: &I2cClient<device::Core>,
+        id_info: Option<&Self::IdInfo>,
+    ) -> impl PinInit<Self, Error>;
+
+    /// I2C driver shutdown.
+    ///
+    /// Called by the kernel during system reboot or power-off to allow the [`Driver`] to bring the
+    /// [`Device`] into a safe state. Implementing this callback is optional.
+    ///
+    /// Typical actions include stopping transfers, disabling interrupts, or resetting the hardware
+    /// to prevent undesired behavior during shutdown.
+    ///
+    /// This callback is distinct from final resource cleanup, as the driver instance remains valid
+    /// after it returns. Any deallocation or teardown of driver-owned resources should instead be
+    /// handled in `Self::drop`.
+    fn shutdown(dev: &I2cClient<device::Core>, this: Pin<&Self>) {
+        let _ = (dev, this);
+    }
+
+    /// I2C driver unbind.
+    ///
+    /// Called when a [`Device`] is unbound from its bound [`Driver`]. Implementing this callback
+    /// is optional.
+    ///
+    /// This callback serves as a place for drivers to perform teardown operations that require a
+    /// `&Device<Core>` or `&Device<Bound>` reference. For instance, drivers may try to perform I/O
+    /// operations to gracefully tear down the device.
+    ///
+    /// Otherwise, release operations for driver resources should be performed in `Self::drop`.
+    fn unbind(dev: &I2cClient<device::Core>, this: Pin<&Self>) {
+        let _ = (dev, this);
+    }
+}
+
+/// The i2c client representation.
+///
+/// This structure represents the Rust abstraction for a C `struct i2c_client`. The
+/// implementation abstracts the usage of an existing C `struct i2c_client` that
+/// gets passed from the C side
+///
+/// # Invariants
+///
+/// A [`I2cClient`] instance represents a valid `struct i2c_client` created by the C portion of
+/// the kernel.
+#[repr(transparent)]
+pub struct I2cClient<Ctx: device::DeviceContext = device::Normal>(
+    Opaque<bindings::i2c_client>,
+    PhantomData<Ctx>,
+);
+
+impl<Ctx: device::DeviceContext> I2cClient<Ctx> {
+    fn as_raw(&self) -> *mut bindings::i2c_client {
+        self.0.get()
+    }
+}
+
+// SAFETY: `I2cClient` is a transparent wrapper of a type that doesn't depend on
+// `I2cClient`'s generic argument.
+kernel::impl_device_context_deref!(unsafe { I2cClient });
+kernel::impl_device_context_into_aref!(I2cClient);
+
+// SAFETY: Instances of `I2cClient` are always reference-counted.
+unsafe impl AlwaysRefCounted for I2cClient {
+    fn inc_ref(&self) {
+        // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
+        unsafe { bindings::get_device(self.as_ref().as_raw()) };
+    }
+
+    unsafe fn dec_ref(obj: NonNull<Self>) {
+        // SAFETY: The safety requirements guarantee that the refcount is non-zero.
+        unsafe { bindings::put_device(&raw mut (*obj.as_ref().as_raw()).dev) }
+    }
+}
+
+impl<Ctx: device::DeviceContext> AsRef<device::Device<Ctx>> for I2cClient<Ctx> {
+    fn as_ref(&self) -> &device::Device<Ctx> {
+        let raw = self.as_raw();
+        // SAFETY: By the type invariant of `Self`, `self.as_raw()` is a pointer to a valid
+        // `struct i2c_client`.
+        let dev = unsafe { &raw mut (*raw).dev };
+
+        // SAFETY: `dev` points to a valid `struct device`.
+        unsafe { device::Device::from_raw(dev) }
+    }
+}
+
+impl<Ctx: device::DeviceContext> TryFrom<&device::Device<Ctx>> for &I2cClient<Ctx> {
+    type Error = kernel::error::Error;
+
+    fn try_from(dev: &device::Device<Ctx>) -> Result<Self, Self::Error> {
+        // SAFETY: By the type invariant of `Device`, `dev.as_raw()` is a valid pointer to a
+        // `struct device`.
+        if unsafe { bindings::i2c_verify_client(dev.as_raw()).is_null() } {
+            return Err(EINVAL);
+        }
+
+        // SAFETY: We've just verified that the type of `dev` equals to
+        // `bindings::i2c_client_type`, hence `dev` must be embedded in a valid
+        // `struct i2c_client` as guaranteed by the corresponding C code.
+        let idev = unsafe { container_of!(dev.as_raw(), bindings::i2c_client, dev) };
+
+        // SAFETY: `idev` is a valid pointer to a `struct i2c_client`.
+        Ok(unsafe { &*idev.cast() })
+    }
+}
+
+// SAFETY: A `I2cClient` is always reference-counted and can be released from any thread.
+unsafe impl Send for I2cClient {}
+
+// SAFETY: `I2cClient` can be shared among threads because all methods of `I2cClient`
+// (i.e. `I2cClient<Normal>) are thread safe.
+unsafe impl Sync for I2cClient {}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 3dd7bebe7888..8c0070a8029e 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -94,6 +94,8 @@
 pub mod firmware;
 pub mod fmt;
 pub mod fs;
+#[cfg(CONFIG_I2C = "y")]
+pub mod i2c;
 pub mod id_pool;
 pub mod init;
 pub mod io;
-- 
2.43.0


