Return-Path: <linux-i2c+bounces-14032-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DB4C464C8
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Nov 2025 12:34:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 75AC94EE578
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Nov 2025 11:31:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3553830C605;
	Mon, 10 Nov 2025 11:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dpxwtW56"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D3C308F0B
	for <linux-i2c@vger.kernel.org>; Mon, 10 Nov 2025 11:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762774253; cv=none; b=MO9soxnrWRnJHV9K+mY6AphnzlDt0qJ8JbKFhxAGnDBlB0Fq1efOSFemW8Bu7e89eF95AfOk0JHrWc+eZWm5WeVovEeUg/THLVSXRAJS4H6AfP5xhqGsz3w3RpsqP6tqmg/mmNxix1TKNv0wlwIgW6aToTCk7xoaFB5x/+wOzeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762774253; c=relaxed/simple;
	bh=OfKe33PZ4jVxK62r9E/y9a4Z1s6PmBdGD9WWYgb8n88=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HZEutEsjI18FmpDWhwX5uQ/2x8Evo8fQeFt2CqtvOFd3yuRnfNuo4SRX+5yjwMCw78bnA0F87yqF1mLGEv6RTteZmzFcr1HWEYMklVTgrZcVHDpCE1OpnQqQL3yweO2qTHk8potWUQOvYGM8FYcC6Nu7USsmLMQ2doesh0SVXwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dpxwtW56; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4775895d69cso14777035e9.0
        for <linux-i2c@vger.kernel.org>; Mon, 10 Nov 2025 03:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762774247; x=1763379047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i2/M4+EN5YNR0EtZX8jaOygcLVo9aZ5Ma5/OhttBbPw=;
        b=dpxwtW56UE64vw1RTZQHG0uxdRCqjkPEkZck7v1cFBf/bJDS6IZSTD5JXotlHamwMN
         FEQnaJX8KkTXKm/dOcHKDn+vNSeRB5/n9z0ap04O+LgZIiefHFKsgZ38cztQZdUhSwnD
         ZQW+TzsVn7uJIILuK40sPu8n92jpdiKz5gpEZ2hDIgFzNPSkqABvjiJY8ov8XZ8KCDpf
         wdht2IwA1G4L5SGtiUH3s/zU6HMyiD+GfqYZWb7ZJ9uPCGXELgmNz2G5SEsOhwS/IVhT
         cbCduXrT21yG4z7MQZmjeQqjwF04mIoHc2w6/IXK56BJ1HqD6blqguh7YvPT8NUbcmOL
         ewaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762774247; x=1763379047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i2/M4+EN5YNR0EtZX8jaOygcLVo9aZ5Ma5/OhttBbPw=;
        b=j4Pj5vZD45UiyInBe+jkgOwPWhy1W9NfyuLKJczvzct190mmSjp5l3Q6xdffJAx5JL
         fGFzlaAu7TZ6PGP39hzXV23PrKUsZY7c+G+pmYQntya7H4sfl6BB2L/6bF/DcehGx7F0
         l4tulzu8Bx5xpKVxyjpyJhk5LxujrDcel2a6rFuohIbfJpnLx+uzsnaE2KEuEa+1YsU4
         u2wqBM1pXkNedMfvcon8pH2zGxUxMoy11Za+qu50inxE4VxKVlYocpHXQHjPaHhg60z6
         bIZscTDBriRsxr41ymzgU0qX+UgKyco6zc9k4DlRvaM2E5q9DJ3/CdMjyLaSqVoIQ/OZ
         c6Iw==
X-Forwarded-Encrypted: i=1; AJvYcCXk+fUBNF0N1v5yLPbVRWE5yIKQtSRxMvw8TIPuVfhQ1WSZ5CdsykkPn72+2K/pp2xklgseva2Cwd4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTYPQ9LlOdLo2na+15U+FQcbSjK13QzNZ6bDppWPRUZA/RAhc/
	wLQXiXITW36Zz7b5iofXHd50YSAmBxpaavSKh8Gmiaf2oCT3AgiOQBpW
X-Gm-Gg: ASbGncthl/8bEsk9B3WBkPkqc98dqkGYssDlYEvQMWu9dY8QeGWWvzfs6Cde0Kb3js8
	qigFwSqYc2zu7C1PFC2JufjeJ3aVIkKblca8J4GpEtkN3Ol3P1V0Zl0Ia/1Esj1jmqHN1kw7NzB
	ML2dBLY4+sremdgkRk+er/k23tRBuvyL9wZjk+HS3rvzfL2fl58gMHHpBeDGKyMm4tflTF3HZN2
	mQM8p1Y4ltBIYEt562HexMRqfTgdDoSoqKyztPdj095djecf1MG9eFTUnqnnsIi9hFKNOqq298E
	gmEcnEWk+9Xzf/dGuy/X/vlLFLtisbpqUKBPH2QnC1JPz6nQbuJxvlYbxATUXy6w1HYT9mACje5
	v6fr99WzGlIeCSMCfZiQRLdlmMCARZDyxyQP5MVIXe/UuSKi1f1UO5+VBW3xw36phXDJOw6o7WZ
	SM+NPUNsdSjnXXHHM=
X-Google-Smtp-Source: AGHT+IHRTXVv57D6jz8gQMeHv+k0QEmP8flDzLp6FHloYGxGe+7JI5a6HSXL1amJus57tdaqEBvfYw==
X-Received: by 2002:a05:600c:1c8e:b0:477:54cd:202f with SMTP id 5b1f17b1804b1-47773230ae6mr58929785e9.3.1762774246438;
        Mon, 10 Nov 2025 03:30:46 -0800 (PST)
Received: from Vasilio.Home ([176.26.203.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4776bcfcfc7sm235216915e9.12.2025.11.10.03.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 03:30:46 -0800 (PST)
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
Subject: [PATCH v7 1/4] rust: i2c: add basic I2C device and driver abstractions
Date: Mon, 10 Nov 2025 11:30:43 +0000
Message-ID: <20251110113043.51628-1-igor.korotin.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251110112437.50405-1-igor.korotin.linux@gmail.com>
References: <20251110112437.50405-1-igor.korotin.linux@gmail.com>
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
 rust/kernel/i2c.rs              | 425 ++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |   2 +
 4 files changed, 436 insertions(+)
 create mode 100644 rust/kernel/i2c.rs

diff --git a/MAINTAINERS b/MAINTAINERS
index 46126ce2f968..828f6d8b1c32 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11737,6 +11737,14 @@ F:	include/linux/i2c.h
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
index 2e43c66635a2..a24f9dffed3a 100644
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
index 000000000000..41ef7c65c555
--- /dev/null
+++ b/rust/kernel/i2c.rs
@@ -0,0 +1,425 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! I2C Driver subsystem
+
+// I2C Driver abstractions.
+use crate::{
+    acpi, container_of, device,
+    device_id::{RawDeviceId, RawDeviceIdIndex},
+    driver,
+    error::*,
+    of,
+    prelude::*,
+    types::{AlwaysRefCounted, Opaque},
+};
+
+use core::{marker::PhantomData, ptr::NonNull};
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
+        // Replace with `bindings::acpi_device_id::default()` once stabilized for `const`.
+        // SAFETY: FFI type is valid to be zero-initialized.
+        let mut i2c: bindings::i2c_device_id = unsafe { core::mem::zeroed() };
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
+        let data = unsafe { idev.as_ref().drvdata_obtain::<Pin<KBox<T>>>() };
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
+        let data = unsafe { idev.as_ref().drvdata_obtain::<Pin<KBox<T>>>() };
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
+// SAFETY: `I2cClient` is a transparent wrapper of a type that doesn't depend on `I2cClient`'s generic
+// argument.
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


