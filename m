Return-Path: <linux-i2c+bounces-14033-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F04ACC4648F
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Nov 2025 12:33:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E7B661898161
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Nov 2025 11:31:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1EDD30C61B;
	Mon, 10 Nov 2025 11:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J8mqzIz8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D7D3093DD
	for <linux-i2c@vger.kernel.org>; Mon, 10 Nov 2025 11:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762774253; cv=none; b=NK65IRpZILPW4Gn/jyDmI6p5vizneycybAgd1OuTF5bWN4U+32cL3j3gyOTDVbvP8gOmE6SfsroIgTieNdAWKwfbFHiKrlYEWW9EH5vRrT6/Rv3RLJUEf3LLOFjvAhMDfKhpzDxEfhYCrd7IGocH6hSAZvRCBbd0KtI4Yc29DSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762774253; c=relaxed/simple;
	bh=OfKe33PZ4jVxK62r9E/y9a4Z1s6PmBdGD9WWYgb8n88=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h93y+d01nQsWw2GkgBd1RrTRpGdSejZ1G3UrqJBpvJto/1LSwqJdBMXEsjRNSSbHHLvpepljOq/OAOVhEqrsyNIAUhagEtZ5Q/Bf7PrknV0oLWpnJpzG5ao0A01Uek3L7SlRWAn5P8Dvjo6wdD0x1dJkBmLIWaJH7wzm+KQpGxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J8mqzIz8; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-429c7e438a8so2542133f8f.2
        for <linux-i2c@vger.kernel.org>; Mon, 10 Nov 2025 03:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762774248; x=1763379048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i2/M4+EN5YNR0EtZX8jaOygcLVo9aZ5Ma5/OhttBbPw=;
        b=J8mqzIz8nJwiDoSd8iuqhy1TBJbLNOGizd7YKd26+7dwnC5gqvWZRGIX9Qzaf5xZyi
         OyOIpj6H2fqydU72xfpOY1Q5xUH84Ih/Rj1kTqdRWmh+m0BFSBO+HlG+kzxNJFjy6fF4
         ESPp7qRPt9ZHkIb/MNWo2t7XzBbuSkU0Ww6fKVjjoJ/wmsNjewODSeMO4gjhpYvnys/V
         yiPdUXaxUBTtwNUQ+TM0f9DoeGmin1ptUCZecw3ikKYaNRgHzOfwLfRWK2cUe6Xy7Ze5
         0fDdbGtxLAXfVYF193YuP7o6lbS3bmpL1LSD9kLF1sG6IYdtYTRGBmoUl1yLPdsHApzT
         gpiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762774248; x=1763379048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i2/M4+EN5YNR0EtZX8jaOygcLVo9aZ5Ma5/OhttBbPw=;
        b=X3AZT/xDFjGd2cEYDJJ2bq8Gg6/FTdAQE4cmx65crCxHGc6p/Tc2mxWMhhC9ZjY6rG
         rxrWI+X7dejBWM7nVLxOKokP/jTh8OzfaBeQdShVF1fghlu9kRmFRK7wR4X+mRA9RHeg
         9/0jG386YDsni1M96uix6pzpFYUBu+4asKfA2SXqRZd0j03+itlzmpR14CEONZkXNTJ5
         09dX6+DCTJckphAJSAsrnvsTUiTtZXQt4udT8tomKorTP6ffMYjqYTBvBywoGM5x+kiM
         3q/qszrTFDMUj2u6CvaRnD/WXzqJrJE0rlC61kp9DpS1GJxVmFWoz0RTIyS8Luco1GFQ
         IdWw==
X-Forwarded-Encrypted: i=1; AJvYcCVowPppBUZRdjsta33+zil3zOhBcnrWjhrfsgcUQHMMVcoZnEKL1u0GaE7pnl6veHT7rkYWK5olNJY=@vger.kernel.org
X-Gm-Message-State: AOJu0YztUD67Apg8DmQitD05c07FXI3lyrORc+WwNnV1h8//rXAPaG4c
	AwVSXnE5wqdwkNGSGw0PB3DWwJh55rQxPTUhIDcw1SakzgW/dnlu3ID34/RPZD2P
X-Gm-Gg: ASbGncsid9NLRabsWrTgRZeJvdSi85B/elowukCIIlRGm3UqXlQ1yLOR17AyEPD/wsC
	hGqu2sW3ZQFu2LULGSjdjqWITeH0h5wyxaljd8wWYI+FqXhQ16iBC5SNna7VPnLVxDcPeh5FPvF
	+EgdY4hzsZY6A66n+OuQ+dGZINtvCHn1NUzokXRPHq13bwGTvRjk8pn8udxgejn1Cndr9vGELLY
	EPi/zSO51cO/UFBkxG42dH69+BW5kdws0CDBFryqiQE4MG5ytlm1sD8A78aCp4daCDpeMry9yNk
	SG6+zQxAoHTvYgFsCcLKQ5vmAtPH3TWOf/tXyKbfkVKr+Qep4FdfXB7X06XrkWL7MP0z0YByzZS
	WDxIDwXNFPRUKS/jv4uZKLtARe547/Ca61iShcPW2ZXWCVwISvOGsjWBEBaWSth1QHc8/5R76By
	cifnxxR9Bn4oMKoSGl8QxbLciiqQ==
X-Google-Smtp-Source: AGHT+IFb5h1KMKctXiim7FWSKyQS0eSKR5f1iV4BeC/7GMWQCiCHdeGDuyWOrHD3yCTOZGAP39EUsQ==
X-Received: by 2002:a5d:5d0a:0:b0:429:92d8:3371 with SMTP id ffacd0b85a97d-42b2dc12a1fmr7124488f8f.11.1762773909867;
        Mon, 10 Nov 2025 03:25:09 -0800 (PST)
Received: from Vasilio.Home ([176.26.203.25])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac679e06csm21416030f8f.47.2025.11.10.03.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 03:25:09 -0800 (PST)
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
Date: Mon, 10 Nov 2025 11:25:07 +0000
Message-ID: <20251110112507.50525-1-igor.korotin.linux@gmail.com>
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


