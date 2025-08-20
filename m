Return-Path: <linux-i2c+bounces-12354-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2271BB2E11E
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Aug 2025 17:31:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD7D9165458
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Aug 2025 15:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9D9B36CE1C;
	Wed, 20 Aug 2025 15:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kzmR83ym"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8D536CE16;
	Wed, 20 Aug 2025 15:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755703286; cv=none; b=bpxSKoOsWgJspK9T94dzK7wJ/vfAaBxIvQcdeQhLd8l/60b/wEAxyZQUOeIeujl5sQGLeQpUII+VofuM78I9jDtIaHtLuoSQ1lBs1eVj0jfNcLpuSK13nnUvTczAXnifz8R8pM7tTWFsuCA7zX/DUkqFJRX62CSOecWWc01NTZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755703286; c=relaxed/simple;
	bh=xCkMSjzlQ7GgBBSwrdkKJLNLEgqmcccZVdAJlLU4BgA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LrrMf3Djx7Ane/ISsZenCsWkI8gupK28PvljPaRzpXJi0o9fg9E5FyEHsKgFrO8keCUFd9S28k53KLfsMXvWJxCNF6/p8DvRRYt3/8oPCxGXXlXXP+6F362Zu+gcGzDes8BsDmYmCRmi8uFwzOEge/RSyRIH7XUYKleiMnNMvHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kzmR83ym; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3b9d41d2a5cso15199f8f.0;
        Wed, 20 Aug 2025 08:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755703282; x=1756308082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yygWEAETBHG8SG46fjnMFvemyaEFLJ8GWxCVZxkDYLg=;
        b=kzmR83ymSFH9zzUyTBpKk+D90aGYghfYMajfqocvijR+4E8G+YQlngHNpWAbGjr0IG
         p7YvL0wREBS50ic/W38z/kcUsp9bMnHpTccgi/iK9AaMgAphS7QII2tbWNwYGEMhFp+i
         nlf44PIoIoZ/7bBhpsa+MeBmG7bNZkE4B8s453fkKU6Nl5yH/2ov+MyFSBIoi4PMAyq8
         crsCGJcFBhhTVjjxNuuCfHzf5eGVOOJ9E6cPaD6rqbExGthBwJ8/iIGjVQJvCRAXe76T
         AspLOkfULCb1GqF+nICeQ9juRYNSIbaG2ptf4E8QidDhEKSWStC1vFN3Fz3ul3WusQqe
         bTSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755703282; x=1756308082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yygWEAETBHG8SG46fjnMFvemyaEFLJ8GWxCVZxkDYLg=;
        b=td6lCg7vNfKRJIA+5ewOkOxN5krH24b035Mgvmzu+Wyo6mAONkl0qS+OKv4puV7bzF
         QBWuIbBYhdbRfR3gXPNkvWwuJZLGUHra051mf4jAAkJLBShK2MKgyZp1Xq5ComQ/vbWI
         Q6m4viSxzTI2f7+JOiqZpyYROrDRDyueks92MoFcYQjwazYiXIMH2ngOaJ/N1lThQ8C6
         9t4CP+nqZLysxI6DXiAsj+aoX7nJArd8ek8KeGPjCfFzQd/LtjPELy6mZVS/7HViMp5Q
         zvPv/fG54QC1ZOaiF5SkPdInJY+k5sK1qOeiBH5UFXu+bew6hBNAzuM7e16cQ51a7EOL
         GOrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUi63rotfWA7Mj52bpB4rz2ONCV7ecGDIfUSbSjqBf0gWkjqxAgYM98jxR6cfiTALCJ+NIQb9jBBWE=@vger.kernel.org, AJvYcCVY1D+6dQBsWDD9h2jlqN2eCzqP6UtGWC1hchZ23Obnuzm/WGh4gBcaxoZlMo/L5plzxQ3apAG1C9VkBuDZzCM=@vger.kernel.org, AJvYcCXqMTY7sZKt9DjxSB5gUbEfDEPh3o9mOH8hs1vl04EEzm/ZwzrafinUtVCCf6CSuNttphQz3vvZXZC6q2UB@vger.kernel.org
X-Gm-Message-State: AOJu0YzHQ+aTDQs3YKO3ZH7cdmt59J8x1cbkziY4Mfiq/J7w8ludl7pc
	TfadOj3DQy4+ACvcuq+3unjQYmOHas2Vi8djf1tbUOk2y5xyBp1ukAsQ
X-Gm-Gg: ASbGncvf41gn1aUWaXUYB8l7w0IanzOiHxozNZp+H4sZOtg+sqLH5F2h3sA9MYN6xyX
	51sUQoeKMD6egxJTRD2N+xyBuHtgUM9qCda/OSXRSzcPAJD9UoVOH9vYJU1Bw9yUBFEhezR2lKL
	N+tNAT4wacznLzBQNwPAxU1q9Lvm4Gv1BKGhqKTj7oUYOtiC6lJpDofauykbM7RuQBq1FlxtThm
	fdmegTt/1mnoxBylcQo3lGMr/9PR+ejy87HVphX6pXx3v17tn4CLxdbkRUN24aXleOiCfRwAdRL
	cjoUGz3CoUe3cTyp/R6p1vTnsf/6/IxoLiJynILIWVQQflMSOoR7wtJGH5+2/5rN7rnrnWoTm+s
	+w7vKdZsVeM3iaP9vCrCO1I6fYrkDxgM15izzKhj/n4iocsHlRxFAdSmdduZozYkRulG88dpG
X-Google-Smtp-Source: AGHT+IFriWgpuiZa2QUfdFrDbMoSzYBtG3jhF5BtCP6qxN94+eVLwnHK2jaOPFKyf31IySegtD4Fvw==
X-Received: by 2002:a05:6000:1a8b:b0:3b7:9bd2:7ad6 with SMTP id ffacd0b85a97d-3c32f943effmr2704445f8f.38.1755703281931;
        Wed, 20 Aug 2025 08:21:21 -0700 (PDT)
Received: from igor-korotin-Precision-Tower-3620.airspan.com ([188.39.32.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c4568499ecsm86724f8f.43.2025.08.20.08.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 08:21:21 -0700 (PDT)
Sender: Igor Korotin <igorkor.3vium@gmail.com>
From: Igor Korotin <igor.korotin.linux@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
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
Subject: [PATCH v4 1/3] rust: i2c: add basic I2C device and driver abstractions
Date: Wed, 20 Aug 2025 16:19:13 +0100
Message-ID: <20250820151913.1814284-1-igor.korotin.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250820151427.1812482-1-igor.korotin.linux@gmail.com>
References: <20250820151427.1812482-1-igor.korotin.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Implement the core abstractions needed for I2C drivers, including:

 - `i2c::Driver` — the trait drivers must implement, including `probe`

 - `i2c::I2cClient` — a safe wrapper around `struct i2c_client`

 - `i2c::Adapter` — implements `driver::RegistrationOps` to hook into the
   generic `driver::Registration` machinery

 - `i2c::DeviceId` — a `RawDeviceIdIndex` implementation for I2C
   device IDs

Signed-off-by: Igor Korotin <igor.korotin.linux@gmail.com>
---
 MAINTAINERS                     |   8 +
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/i2c.rs              | 396 ++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |   2 +
 4 files changed, 407 insertions(+)
 create mode 100644 rust/kernel/i2c.rs

diff --git a/MAINTAINERS b/MAINTAINERS
index fe168477caa4..c44c7ac317b1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11516,6 +11516,14 @@ F:	include/linux/i2c.h
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
index 84d60635e8a9..81796d5e16e8 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -53,6 +53,7 @@
 #include <linux/file.h>
 #include <linux/firmware.h>
 #include <linux/fs.h>
+#include <linux/i2c.h>
 #include <linux/ioport.h>
 #include <linux/jiffies.h>
 #include <linux/jump_label.h>
diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
new file mode 100644
index 000000000000..f5e8c4bc1b7d
--- /dev/null
+++ b/rust/kernel/i2c.rs
@@ -0,0 +1,396 @@
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
+    types::Opaque,
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
+            "At least one of ACPI/OF/Legacy tables must be present"
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
+            let data = T::probe(idev, info)?;
+
+            idev.as_ref().set_drvdata(data);
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
+        drop(unsafe { idev.as_ref().drvdata_obtain::<Pin<KBox<T>>>() });
+    }
+
+    extern "C" fn shutdown_callback(idev: *mut bindings::i2c_client) {
+        // SAFETY: `shutdown_callback` is only ever called for a valid `idev`
+        let idev = unsafe { &*idev.cast::<I2cClient<device::Core>>() };
+
+        T::shutdown(idev);
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
+        // - `dev` is guaranteed to be valid while it's alive, and so is `idev.as_raw()`.
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
+        Some(table.info(<DeviceId as crate::device_id::RawDeviceIdIndex>::index(id)))
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
+///     ) -> Result<Pin<KBox<Self>>> {
+///         Err(ENODEV)
+///     }
+///
+///     fn shutdown(_idev: &i2c::I2cClient<Core>) {
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
+    ) -> Result<Pin<KBox<Self>>>;
+
+    /// I2C driver shutdown
+    ///
+    /// Called when
+    fn shutdown(dev: &I2cClient<device::Core>) {
+        let _ = dev;
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
+// SAFETY: `I2cClient` is a transparent wrapper of a type that doesn't depend on `I2cClient`'s
+// generic argument.
+kernel::impl_device_context_deref!(unsafe { I2cClient });
+kernel::impl_device_context_into_aref!(I2cClient);
+
+// SAFETY: Instances of `I2cClient` are always reference-counted.
+unsafe impl crate::types::AlwaysRefCounted for I2cClient {
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
index ed53169e795c..a5e97a9b1546 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -89,6 +89,8 @@
 pub mod firmware;
 pub mod fmt;
 pub mod fs;
+#[cfg(CONFIG_I2C = "y")]
+pub mod i2c;
 pub mod init;
 pub mod io;
 pub mod ioctl;
-- 
2.43.0


