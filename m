Return-Path: <linux-i2c+bounces-11834-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13856AF9718
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Jul 2025 17:40:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 82F795652EA
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Jul 2025 15:39:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED41F3074BD;
	Fri,  4 Jul 2025 15:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FNxtE/Cp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557D82DE710;
	Fri,  4 Jul 2025 15:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751643547; cv=none; b=lRxyXAX3KanJVuHtT8dUz3qGuU39ehjaNxLiZeZpjU/RdnW6C4xof3r1OMy8yFimNWSBuDmOw2vduJoqmnbzpiRLeYRZiletwpAuc9JQnwDfHckFI6rxMq1fkT5+obSohIJBkysYezdDN/6Nt1Qq0LaZCyn0mLAWkQjB+ssvtm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751643547; c=relaxed/simple;
	bh=09JL73lDwyKAS0NATXopcslT4d7c6v+zoAS+cDGpgq4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g2SlMcL5cUlYBZgXpgzX4fW1CkZy22Iun4ZYhbrJUB4OlGZ5FlAs4TW7OuMkrESuJrohaUJ8pArVgXvTYarcor2iEc5Vn+GlS0JZATKSzGykvGCNKxtG9ZJ9khl8V91kCO079/OYyylu9TzyZ2ovtidTarjjwlJ7V1U7H80YVJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FNxtE/Cp; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a54700a46eso608053f8f.1;
        Fri, 04 Jul 2025 08:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751643543; x=1752248343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=14iVrnVMBU+8vP2oKEQ6H7zWd8y3qXQf/YOTfgvD75I=;
        b=FNxtE/CpPEpbkqGzIHUJqhMrdG1IX+vE5flKwUcPj1/gBSbhlR+RbmanS9YNWpso93
         hxM+X5WiW+C/GJsqEPd3LiWtjUTtJ2BuDTAYQiuGmKh4+OtDnQSdpSba9ICcDchs4gtJ
         /G1GHtDmbbrPclbqLV/bVUZYhi3gV8iiDdVRH4hKnsE78TOBCpXDt+3pRDG71N/gMhQ/
         bxoDiGt0uohhEpM1erLkzkd3oHBqqwUWH1YgmsTrCI04JU56wU1LnALxanJHD819mcLE
         +8k0tlrqWKAn6RSUg2INuvlpl93TYWZViiRpVS67GuMdT6DDVPaEs6NtwsIjGlJ8eIXV
         UYSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751643543; x=1752248343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=14iVrnVMBU+8vP2oKEQ6H7zWd8y3qXQf/YOTfgvD75I=;
        b=l6fAeOb7+lFpiGfXGQAgVlKBcAow64C4Ai41ztI7yKCQ7HNHlfVq5/wA1CUR9f+FUY
         QE+427I5gy1ZGVUYQ5yA6CROtmMrBTn37e9nf3yy+7SoZZGjacvOcHkvpdIY3wDIP/hX
         JiI0lgR9m5tx/y3KvfddDgZycGXFVP5RNkUoy5zfY8ZJJ0pTBZY5AU9gFRLFkYuKxNk2
         0wO4NM3QRikpGJgVgwDysj0OTLk294E6votB/2GDfcRT9GaPT2xyXIG4yNkIGu7LphKf
         Oh0HomH7T/CL48kVW4kjSW3slX+zGDpp4nG73DATbEd3kuXi3R/0vOydPXWohi6ax8jA
         GZTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoxBWh+plAr6osbtdhxMaXkJaGE++YexL2rtlE2HwkVpJuAIcOmm9NReomekXdPCLsG46mHIdicis=@vger.kernel.org, AJvYcCVIgbSP2FXzNY2IIcKatriYGqJAHqS88sbEp21ptr5BMuYlMflt5Fygy6Q22DASVyHSwCWEmiYmP0l7eisiSwA=@vger.kernel.org, AJvYcCW6dTaedshKKndMiXOaOT3kQKbmBg6RTziNvgevrkSA9YwWFy51Xszhm2CQMjZppRSHqEm8uSW3vA4r1G1N@vger.kernel.org
X-Gm-Message-State: AOJu0YyODX5YavqOEKFLtR9FYBp1rlh6Q6O+1GHRjSgdjm87noruPOET
	YbIZuHkCzSbyzEEAGCtuO26BuGGxWVuLIl2wiQAjCicQ4Ze8ck6DKML0
X-Gm-Gg: ASbGncsr0En07wEfqrfdUNIX22hzVNPNg6fkry6pAz06aVDJt1gXWm6h3bgJKuhoHSO
	eqrkXDzgvifhuBNl9jcXHc4abUDOoApLizGsIThKj7RIyqbkMZPPixV/MBsET7L0h+R3roPqpT4
	JGl5Yy76hWmytygNJw6sD/rLZPM63dx9CN6JUt1coQDvf6Tr/ucizTSn/Hxr3wipqsTsyatBSQ0
	QPq8M6mZR4W0njHudYfEiLTvVSWwm3kg2EHfz+dBKmrXGk6VwzmhHJNc9I60wPybBE7yrFupapX
	MYl6zJc79fFnyXFA8RxX8Ay5ZtmvlL+hyJOcD2TxPw+XgpTar5UDdNU2n5H4D4lmgq66Os/BEBz
	yEt2iqA4+yjFueIEt8oBuUqmMf8WVQIDAYa7a8uFqrL/Hew0=
X-Google-Smtp-Source: AGHT+IFRGI2AkmdyvGIsjw27l3CYDTCf0wgleuo5O26HxkCjLw0VkjRmXwIQQ9851Gu+Ponj54k+kw==
X-Received: by 2002:a05:6000:4210:b0:3a5:2beb:7493 with SMTP id ffacd0b85a97d-3b4964c8b9emr2825465f8f.9.1751643543100;
        Fri, 04 Jul 2025 08:39:03 -0700 (PDT)
Received: from igor-korotin-Precision-Tower-3620.airspan.com ([188.39.32.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b16866a7sm29652025e9.23.2025.07.04.08.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 08:39:02 -0700 (PDT)
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
Subject: [PATCH v2 1/4] rust: i2c: add basic I2C device and driver abstractions
Date: Fri,  4 Jul 2025 16:36:57 +0100
Message-ID: <20250704153657.1195687-1-igor.korotin.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704153332.1193214-1-igor.korotin.linux@gmail.com>
References: <20250704153332.1193214-1-igor.korotin.linux@gmail.com>
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
 rust/kernel/i2c.rs              | 391 ++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |   2 +
 6 files changed, 412 insertions(+)
 create mode 100644 rust/helpers/i2c.c
 create mode 100644 rust/kernel/i2c.rs

diff --git a/MAINTAINERS b/MAINTAINERS
index 7f8ddeec3b17..688a0ff23e69 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11363,6 +11363,8 @@ F:	include/linux/i2c-smbus.h
 F:	include/linux/i2c.h
 F:	include/uapi/linux/i2c-*.h
 F:	include/uapi/linux/i2c.h
+F:	rust/helpers/i2c.c
+F:	rust/kernel/i2c.rs
 
 I2C SUBSYSTEM HOST DRIVERS
 M:	Andi Shyti <andi.shyti@kernel.org>
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 7e8f22850647..efc9be4d9a6e 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -53,6 +53,7 @@
 #include <linux/file.h>
 #include <linux/firmware.h>
 #include <linux/fs.h>
+#include <linux/i2c.h>
 #include <linux/jiffies.h>
 #include <linux/jump_label.h>
 #include <linux/mdio.h>
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 0b09bd0e3561..be34554b3fab 100644
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
index 000000000000..4f2f3c378153
--- /dev/null
+++ b/rust/kernel/i2c.rs
@@ -0,0 +1,391 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! I2C Driver subsystem
+
+// I2C Driver abstractions.
+use crate::{
+    acpi, container_of, device,
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
+        let acpi_table = match T::ACPI_ID_TABLE {
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
+            (*pdrv.get()).driver.acpi_match_table = acpi_table;
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
+    /// The table of ACPI device ids supported by the driver.
+    const ACPI_ID_TABLE: Option<acpi::IdTable<Self::IdInfo>> = None;
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
index 5bbf3627212f..ee1233e44a0f 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -79,6 +79,8 @@
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


