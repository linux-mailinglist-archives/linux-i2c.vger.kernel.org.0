Return-Path: <linux-i2c+bounces-11619-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E52AEA4BA
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Jun 2025 19:51:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B2B2188B8BD
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Jun 2025 17:51:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E6E62ECE80;
	Thu, 26 Jun 2025 17:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eR1eDAeq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353E94A33;
	Thu, 26 Jun 2025 17:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750960277; cv=none; b=DjFngbowEutLddRuclnNF5ACS4U3taB8EChb/z1E4QquE3uRpl/FZWJ29QKjZ+lfc2xDHu6l12MeezFWR7D6Sl/0zAynxblb5sK5/jx2uZZZeon75rT63uPzcP1iHxzg3ZTZtw5FaHYktFIa2ilM0bJo+Hvp0B44VcxfPrVzyQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750960277; c=relaxed/simple;
	bh=m+5bxqvtqiUl+MzKFWjIbbXmZnyTdE8VBXhAm+HV5rE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=saL0/a5S4GzW0kIytpxpgyfY5f/gWQ4F5HXB6VJZTP3Mv5/QQxAwfVwtagYhM6N1tymziBYPvycLRls7boWVi3SmoBtqeuCLCOCxHNNG+wvROkfClwJCELqAYc2XeurbfNCrn214LlsAB3LBi+XPApTh2SDjlNRxZDGb+GD/5Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eR1eDAeq; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a54700a46eso676198f8f.1;
        Thu, 26 Jun 2025 10:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750960273; x=1751565073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yubyZEl+6Y9yV3wuoYfKBENEcakJXXUBssVHsQ4xmUI=;
        b=eR1eDAeqdDWpF0XTBKpmMo+KjQTJk+yBs682o6LM9gBqRz3IjhtnOP5W4duitbFDso
         U4pLUdPc5BaAYjxpsa2hOQQL5NbjZkooV+7/yDbSWPDQ1+y3Tba8xWLHqKyxFSOMGPFh
         scpbiIPBNvBZK9rbA8tcCa9UAd9S6V4hYiSqcoAsAjaQY0vLFnQu5kpWEWdasOAFDHZB
         0mTTTjhPIHV9ClF4mBHYh4syVz9igfb235hcE5wNl6B9lvBt6+utbsnsdYsFFTJfdu9y
         f4atgE6dx5S51+Rv7ylbytbSlDK1dCzfRMnI323FG2THyjuY/UjVQ8POKGMGDtLYurTe
         YcjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750960273; x=1751565073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yubyZEl+6Y9yV3wuoYfKBENEcakJXXUBssVHsQ4xmUI=;
        b=OV8X+2HxkQG7RNKvLRlN5oNyvz9XYFQ7k1V8bgPNjDbKvDX+Q+naoWiTCGwp6qCy6q
         FOIqocvE5S8JC0kEj1jwt9NBqtFPKCwaeo5NFn74JLQwWaROasYVJmh+po8PDIsXnAcN
         8Mnr2G9his1B7SzVkOUiaG4RHxjALBPWUop1gB8xUEIMGc5r5/BvT5afELZPAbLIRnS2
         4/AExD0fqWM2dkAzmyDGP4AzJ4xgV9213GbvddBPXl2LLbrGKGduEHjlwgxerf4R8qDo
         odY+o8baI5kZ1gB8bWQZqB20fynMdfB6+kLuukYbJhL5mAXryMNhAep7GqzklqI1oOko
         ZoUA==
X-Forwarded-Encrypted: i=1; AJvYcCUDx3HicbvhX6su9jkQYGyvzMIQqdxtu5Oblt7rUcuneYAO7/k10fVAS6S9zb+mxVmyXdZ6GfbX2KKxM1Lf@vger.kernel.org, AJvYcCVTUn0yb5zv4oJjHZ7RnKEMjlzWM5oOE+F4Y5MExNJOrA5FT3enL1gMbL96xgiQDEenxp9voZpOZL0=@vger.kernel.org, AJvYcCXQFqHUSz4Ax2wSmfppnYKn2GebQgEYiNpEyniG7Vlxuk4U6juwPRxGI18ce7RU13Qu9SBsuidVF+ef/2P+eO8=@vger.kernel.org
X-Gm-Message-State: AOJu0YziC4caHCi2tW6hRx5kI3AiYbuywBidy1oI2ev7fLnrbmTLXtSJ
	F7W3ImK2WefIBc0izog9teGtXrbjPOmSmnZND112yUAWX/8SXOaTtfZF
X-Gm-Gg: ASbGncuA5/gfLeI/xN7mCQqlLmfHFvA3Nkp3rEToNWgvvLIvTMOnJAWGG8fU7/W7xRQ
	6kFdhVJPv4YwRRkh1l2hQ7Ee9LC8yqmTxRi0iC9V1u3agjNXN7Azqgzwiu94HCy6B2ZwWDzQJSE
	tD+LXMji31a7HNmsZoL/C5nYdINUjoqAKv4xrR0msSWihOZAIB3KUQDzbsXfE/z1roCEr23jnUX
	NL+c8ipDVbRA+43+wFw+RiCFalfIMfqC4A+h5Ei7LUF877h4qpKjEvcsqazN9kE77SOGxB4u3w9
	UpXfmMCeOMopX/JNvFM2blr5Mjk7CpaYGdxcO509TxemcdCMkdx6hT08r4iOlMiNOzObsMeNLAO
	psBPsMJ+G9ToBDO/q4SbwlyFgU9YL2zoikiQQcOU=
X-Google-Smtp-Source: AGHT+IEIqXyptV5h+15bPfY6BmHXuM5kuOXLpvYhm1Y1Adfg4eZIpMuZD6JZBEpJ/O6aFYrHvy21WA==
X-Received: by 2002:a5d:5f49:0:b0:3a5:5270:a52c with SMTP id ffacd0b85a97d-3a8f302a206mr455969f8f.0.1750960273111;
        Thu, 26 Jun 2025 10:51:13 -0700 (PDT)
Received: from igor-korotin-Precision-Tower-3620.airspan.com ([188.39.32.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e52a26sm485966f8f.51.2025.06.26.10.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 10:51:12 -0700 (PDT)
Sender: Igor Korotin <igorkor.3vium@gmail.com>
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
Subject: [PATCH v1 1/4] rust: i2c: add basic I2C device and driver abstractions
Date: Thu, 26 Jun 2025 18:49:10 +0100
Message-ID: <20250626174910.905816-1-igor.korotin.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250626174623.904917-1-igor.korotin.linux@gmail.com>
References: <20250626174623.904917-1-igor.korotin.linux@gmail.com>
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

* `i2c::Device` — a safe wrapper around `struct i2c_client`

* `i2c::Adapter` — implements `driver::RegistrationOps` to hook into the
  generic `driver::Registration` machinery

* `i2c::DeviceId` — a `RawDeviceId` implementation for I2C device IDs

Signed-off-by: Igor Korotin <igor.korotin.linux@gmail.com>
---
 MAINTAINERS                     |   2 +
 rust/bindings/bindings_helper.h |   1 +
 rust/helpers/helpers.c          |   1 +
 rust/helpers/i2c.c              |  15 ++
 rust/kernel/i2c.rs              | 363 ++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |   2 +
 6 files changed, 384 insertions(+)
 create mode 100644 rust/helpers/i2c.c
 create mode 100644 rust/kernel/i2c.rs

diff --git a/MAINTAINERS b/MAINTAINERS
index 68d2a32759ec..2b7a24586c19 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11362,6 +11362,8 @@ F:	include/linux/i2c-smbus.h
 F:	include/linux/i2c.h
 F:	include/uapi/linux/i2c-*.h
 F:	include/uapi/linux/i2c.h
+F:	rust/helpers/i2c.c
+F:	rust/kernel/i2c.rs
 
 I2C SUBSYSTEM HOST DRIVERS
 M:	Andi Shyti <andi.shyti@kernel.org>
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 8cbb660e2ec2..0c7b3cbb8918 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -52,6 +52,7 @@
 #include <linux/file.h>
 #include <linux/firmware.h>
 #include <linux/fs.h>
+#include <linux/i2c.h>
 #include <linux/jiffies.h>
 #include <linux/jump_label.h>
 #include <linux/mdio.h>
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 393ad201befb..63afd35205da 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -23,6 +23,7 @@
 #include "drm.c"
 #include "err.c"
 #include "fs.c"
+#include "i2c.c"
 #include "io.c"
 #include "jump_label.c"
 #include "kunit.c"
diff --git a/rust/helpers/i2c.c b/rust/helpers/i2c.c
new file mode 100644
index 000000000000..5f384f8f560e
--- /dev/null
+++ b/rust/helpers/i2c.c
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/i2c.h>
+
+void* rust_helper_i2c_get_clientdata(struct i2c_client *client)
+{
+	return i2c_get_clientdata(client);
+}
+
+void rust_helper_i2c_set_clientdata(struct i2c_client *client, void *data)
+{
+	i2c_set_clientdata(client, data);
+}
+
+
diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
new file mode 100644
index 000000000000..051f4f2bd38a
--- /dev/null
+++ b/rust/kernel/i2c.rs
@@ -0,0 +1,363 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! I2C Driver subsystem
+
+// I2C Driver abstractions.
+use crate::{
+    container_of, device,
+    device_id::RawDeviceId,
+    driver,
+    error::*,
+    of,
+    prelude::*,
+    types::{ForeignOwnable, Opaque},
+};
+
+use core::{
+    marker::PhantomData,
+    ptr::{addr_of_mut, NonNull},
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
+    pub const fn new<const N: usize>(id: &[u8; N]) -> Self {
+        build_assert!(N <= Self::I2C_NAME_SIZE);
+        // Replace with `bindings::i2c_device_id::default()` once stabilized for `const`.
+        // SAFETY: FFI type is valid to be zero-initialized.
+        let mut i2c: bindings::i2c_device_id = unsafe { core::mem::zeroed() };
+        let mut i = 0;
+        while i < N {
+            i2c.name[i] = id[i];
+            i += 1;
+        }
+
+        Self(i2c)
+    }
+}
+
+// SAFETY:
+// * `DeviceId` is a `#[repr(transparent)` wrapper of `i2c_device_id` and does not add
+//   additional invariants, so it's safe to transmute to `RawType`.
+// * `DRIVER_DATA_OFFSET` is the offset to the `driver_data` field.
+unsafe impl RawDeviceId for DeviceId {
+    type RawType = bindings::i2c_device_id;
+
+    const DRIVER_DATA_OFFSET: usize = core::mem::offset_of!(bindings::i2c_device_id, driver_data);
+
+    fn index(&self) -> usize {
+        self.0.driver_data as _
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
+        pdrv: &Opaque<Self::RegType>,
+        name: &'static CStr,
+        module: &'static ThisModule,
+    ) -> Result {
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
+        // SAFETY: It's safe to set the fields of `struct i2c_client` on initialization.
+        unsafe {
+            (*pdrv.get()).driver.name = name.as_char_ptr();
+            (*pdrv.get()).probe = Some(Self::probe_callback);
+            (*pdrv.get()).remove = Some(Self::remove_callback);
+            (*pdrv.get()).shutdown = Some(Self::shutdown_callback);
+            (*pdrv.get()).id_table = i2c_table;
+            (*pdrv.get()).driver.of_match_table = of_table;
+        }
+
+        // SAFETY: `pdrv` is guaranteed to be a valid `RegType`.
+        to_result(unsafe { bindings::i2c_register_driver(module.0, pdrv.get()) })
+    }
+
+    unsafe fn unregister(pdrv: &Opaque<Self::RegType>) {
+        // SAFETY: `pdrv` is guaranteed to be a valid `RegType`.
+        unsafe { bindings::i2c_del_driver(pdrv.get()) }
+    }
+}
+
+impl<T: Driver + 'static> Adapter<T> {
+    extern "C" fn probe_callback(pdev: *mut bindings::i2c_client) -> kernel::ffi::c_int {
+        // SAFETY: The I2C bus only ever calls the probe callback with a valid pointer to a
+        // `struct i2c_client`.
+        //
+        // INVARIANT: `pdev` is valid for the duration of `probe_callback()`.
+        let pdev = unsafe { &*pdev.cast::<Device<device::Core>>() };
+
+        let info =
+            Self::i2c_id_info(pdev).or_else(|| <Self as driver::Adapter>::id_info(pdev.as_ref()));
+
+        match T::probe(pdev, info) {
+            Ok(data) => {
+                unsafe { bindings::i2c_set_clientdata(pdev.as_raw(), data.into_foreign() as _) };
+            }
+            Err(err) => return Error::to_errno(err),
+        }
+
+        0
+    }
+
+    extern "C" fn remove_callback(pdev: *mut bindings::i2c_client) {
+        // SAFETY: `pdev` is a valid pointer to a `struct i2c_client`.
+        let ptr = unsafe { bindings::i2c_get_clientdata(pdev) }.cast();
+
+        // SAFETY: `remove_callback` is only ever called after a successful call to
+        // `probe_callback`, hence it's guaranteed that `ptr` points to a valid and initialized
+        // `KBox<T>` pointer created through `KBox::into_foreign`.
+        let _ = unsafe { KBox::<T>::from_foreign(ptr) };
+    }
+
+    extern "C" fn shutdown_callback(pdev: *mut bindings::i2c_client) {
+        let pdev = unsafe { &*pdev.cast::<Device<device::Core>>() };
+
+        T::shutdown(pdev);
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
+    fn i2c_id_info(dev: &Device) -> Option<&'static <Self as driver::Adapter>::IdInfo> {
+        let table = Self::i2c_id_table()?;
+
+        // SAFETY:
+        // - `table` has static lifetime, hence it's valid for read,
+        // - `dev` is guaranteed to be valid while it's alive, and so is `pdev.as_ref().as_raw()`.
+        let raw_id = unsafe { bindings::i2c_match_id(table.as_ptr(), dev.as_raw()) };
+
+        if raw_id.is_null() {
+            None
+        } else {
+            // SAFETY: `DeviceId` is a `#[repr(transparent)` wrapper of `struct i2c_device_id` and
+            // does not add additional invariants, so it's safe to transmute.
+            let id = unsafe { &*raw_id.cast::<DeviceId>() };
+
+            Some(table.info(<DeviceId as crate::device_id::RawDeviceId>::index(id)))
+        }
+    }
+}
+
+impl<T: Driver + 'static> driver::Adapter for Adapter<T> {
+    type IdInfo = T::IdInfo;
+
+    fn of_id_table() -> Option<of::IdTable<Self::IdInfo>> {
+        T::OF_ID_TABLE
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
+/// # use kernel::{bindings, c_str, device::Core, i2c, of};
+///
+/// struct MyDriver;
+///
+/// kernel::i2c_device_table!(
+///     I2C_TABLE,
+///     MODULE_I2C_TABLE,
+///     <MyDriver as i2c::Driver>::IdInfo,
+///     [
+///          (i2c::DeviceId::new(b"test"), ())
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
+///
+///     fn probe(
+///         _pdev: &i2c::Device<Core>,
+///         _id_info: Option<&Self::IdInfo>,
+///     ) -> Result<Pin<KBox<Self>>> {
+///         Err(ENODEV)
+///     }
+///
+///     fn shutdown(_pdev: &i2c::Device<Core>) {
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
+    /// I2C driver probe.
+    ///
+    /// Called when a new i2c device is added or discovered.
+    /// Implementers should attempt to initialize the device here.
+    fn probe(dev: &Device<device::Core>, id_info: Option<&Self::IdInfo>)
+        -> Result<Pin<KBox<Self>>>;
+
+    /// I2C driver shutdown
+    ///
+    /// Called when
+    fn shutdown(dev: &Device<device::Core>) {
+        let _ = dev;
+    }
+}
+
+/// The i2c client representation.
+///
+/// This structure represents the Rust abstraction for a C `struct i2c_client`. The
+/// implementation abstracts the usage of an already existing C `struct i2c_client` within Rust
+/// code that we get passed from the C side.
+///
+/// # Invariants
+///
+/// A [`Device`] instance represents a valid `struct i2c_client` created by the C portion of
+/// the kernel.
+#[repr(transparent)]
+pub struct Device<Ctx: device::DeviceContext = device::Normal>(
+    Opaque<bindings::i2c_client>,
+    PhantomData<Ctx>,
+);
+
+impl<Ctx: device::DeviceContext> Device<Ctx> {
+    fn as_raw(&self) -> *mut bindings::i2c_client {
+        self.0.get()
+    }
+}
+
+// SAFETY: `Device` is a transparent wrapper of a type that doesn't depend on `Device`'s generic
+// argument.
+kernel::impl_device_context_deref!(unsafe { Device });
+kernel::impl_device_context_into_aref!(Device);
+
+// SAFETY: Instances of `Device` are always reference-counted.
+unsafe impl crate::types::AlwaysRefCounted for Device {
+    fn inc_ref(&self) {
+        // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
+        unsafe { bindings::get_device(self.as_ref().as_raw()) };
+    }
+
+    unsafe fn dec_ref(obj: NonNull<Self>) {
+        // SAFETY: The safety requirements guarantee that the refcount is non-zero.
+        unsafe { bindings::put_device(addr_of_mut!((*obj.as_ref().as_raw()).dev)) }
+    }
+}
+
+impl<Ctx: device::DeviceContext> AsRef<device::Device<Ctx>> for Device<Ctx> {
+    fn as_ref(&self) -> &device::Device<Ctx> {
+        // SAFETY: By the type invariant of `Self`, `self.as_raw()` is a pointer to a valid
+        // `struct i2c_client`.
+        let dev = unsafe { addr_of_mut!((*self.as_raw()).dev) };
+
+        // SAFETY: `dev` points to a valid `struct device`.
+        unsafe { device::Device::as_ref(dev) }
+    }
+}
+
+impl<Ctx: device::DeviceContext> TryFrom<&device::Device<Ctx>> for &Device<Ctx> {
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
+        let pdev = unsafe { container_of!(dev.as_raw(), bindings::i2c_client, dev) };
+
+        // SAFETY: `pdev` is a valid pointer to a `struct i2c_client`.
+        Ok(unsafe { &*pdev.cast() })
+    }
+}
+
+// SAFETY: A `Device` is always reference-counted and can be released from any thread.
+unsafe impl Send for Device {}
+
+// SAFETY: `Device` can be shared among threads because all methods of `Device`
+// (i.e. `Device<Normal>) are thread safe.
+unsafe impl Sync for Device {}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 6b4774b2b1c3..30a0fc20dfee 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -78,6 +78,8 @@
 #[cfg(CONFIG_RUST_FW_LOADER_ABSTRACTIONS)]
 pub mod firmware;
 pub mod fs;
+#[cfg(CONFIG_I2C)]
+pub mod i2c;
 pub mod init;
 pub mod io;
 pub mod ioctl;
-- 
2.43.0


