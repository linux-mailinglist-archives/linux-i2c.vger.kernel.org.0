Return-Path: <linux-i2c+bounces-14961-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9219ACFD52F
	for <lists+linux-i2c@lfdr.de>; Wed, 07 Jan 2026 12:06:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 835E9306D2B4
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Jan 2026 11:00:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A4BD302165;
	Wed,  7 Jan 2026 10:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HqbPkeK8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A32A2FE598;
	Wed,  7 Jan 2026 10:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767782142; cv=none; b=l21RDWiZVqySSwg4iQ7xfQI9X4la+TpWK2S02DZ0ASunMDG4cvEgfbI3JxVz7fiZRrAGvhkD2cnsY8bhDD9BXOekfYdyPWR2TeD1Qh6m8t/L4SDHL3QwLDRw998lHW+tVxuKNdzZRncSqXgBJoDTWZWgSeMQMpZsPwhHPJ9kE/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767782142; c=relaxed/simple;
	bh=B+z322KMnYbfcjFFuMw+36goZ+N9VTbu195hG8ORH7k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bZHV3CXuGBb48aXfdoPhTld/d6fkJFJ61UO9movT605vkwdPmlInZsWiZTQIXTkiOE0fAcL//2buJkMOe6ThIeCt7L9KlJcs0xMQ/9oaMMNZZDroNRUrvj9K/K7+f2T5yN7SEVpWyqelaoUaI65bdiIaypFm4fvPfiJXHG5EBzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HqbPkeK8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88046C16AAE;
	Wed,  7 Jan 2026 10:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767782142;
	bh=B+z322KMnYbfcjFFuMw+36goZ+N9VTbu195hG8ORH7k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HqbPkeK8as/8q01IVmbG8HOxHoN607JQA5xaM7yCKLoHNlK9rMH1gVTARWEQfzhwN
	 dvHoH8Q19PzIZJyfw9ZLD91g3JYZf2614USJgp74NTaiICIhUGNjX5NywXRg9O8rXl
	 Sg4M+5tHl2bXObgN9mFMqkU1t3ZRSWPdDZMKehb7IBBxabhKgIywK+iYyRyj3WGumS
	 Kw/yS1MfYp48lpqDJkMZAiBw96mIp4gQY2zQ+DTsfZ3eVzR2CEoIgwWSFtLl0pdfXb
	 w43F96e/F+nFQqmU8DbUmOD6Zm8ysxbViKnVIbOmAHXNCS4dqf9VZC/tTNUTAu+sQY
	 zgMJKY530NZsA==
From: Danilo Krummrich <dakr@kernel.org>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	igor.korotin.linux@gmail.com,
	ojeda@kernel.org,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	david.m.ertman@intel.com,
	ira.weiny@intel.com,
	leon@kernel.org,
	bhelgaas@google.com,
	kwilczynski@kernel.org,
	wsa+renesas@sang-engineering.com
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 3/6] rust: driver: introduce a common Driver trait
Date: Wed,  7 Jan 2026 11:35:02 +0100
Message-ID: <20260107103511.570525-4-dakr@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260107103511.570525-1-dakr@kernel.org>
References: <20260107103511.570525-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Driver trait describes the layout of a specific driver structure,
such as `struct pci_driver` or `struct platform_driver`.

In a first step, this replaces the associated type RegType of the
RegistrationOps with the Driver::DriverType associated type.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/auxiliary.rs | 18 +++++++++++-------
 rust/kernel/driver.rs    | 40 +++++++++++++++++++++++++---------------
 rust/kernel/i2c.rs       | 18 +++++++++++-------
 rust/kernel/pci.rs       | 18 +++++++++++-------
 rust/kernel/platform.rs  | 18 +++++++++++-------
 rust/kernel/usb.rs       | 18 +++++++++++-------
 6 files changed, 80 insertions(+), 50 deletions(-)

diff --git a/rust/kernel/auxiliary.rs b/rust/kernel/auxiliary.rs
index 6931f8a4267f..4636b6f41195 100644
--- a/rust/kernel/auxiliary.rs
+++ b/rust/kernel/auxiliary.rs
@@ -23,13 +23,17 @@
 /// An adapter for the registration of auxiliary drivers.
 pub struct Adapter<T: Driver>(T);
 
-// SAFETY: A call to `unregister` for a given instance of `RegType` is guaranteed to be valid if
+// SAFETY:
+// - `bindings::auxiliary_driver` is a C type declared as `repr(C)`.
+unsafe impl<T: Driver + 'static> driver::Driver for Adapter<T> {
+    type DriverType = bindings::auxiliary_driver;
+}
+
+// SAFETY: A call to `unregister` for a given instance of `DriverType` is guaranteed to be valid if
 // a preceding call to `register` has been successful.
 unsafe impl<T: Driver + 'static> driver::RegistrationOps for Adapter<T> {
-    type RegType = bindings::auxiliary_driver;
-
     unsafe fn register(
-        adrv: &Opaque<Self::RegType>,
+        adrv: &Opaque<Self::DriverType>,
         name: &'static CStr,
         module: &'static ThisModule,
     ) -> Result {
@@ -41,14 +45,14 @@ unsafe fn register(
             (*adrv.get()).id_table = T::ID_TABLE.as_ptr();
         }
 
-        // SAFETY: `adrv` is guaranteed to be a valid `RegType`.
+        // SAFETY: `adrv` is guaranteed to be a valid `DriverType`.
         to_result(unsafe {
             bindings::__auxiliary_driver_register(adrv.get(), module.0, name.as_char_ptr())
         })
     }
 
-    unsafe fn unregister(adrv: &Opaque<Self::RegType>) {
-        // SAFETY: `adrv` is guaranteed to be a valid `RegType`.
+    unsafe fn unregister(adrv: &Opaque<Self::DriverType>) {
+        // SAFETY: `adrv` is guaranteed to be a valid `DriverType`.
         unsafe { bindings::auxiliary_driver_unregister(adrv.get()) }
     }
 }
diff --git a/rust/kernel/driver.rs b/rust/kernel/driver.rs
index 649d06468f41..cd1d36c313e1 100644
--- a/rust/kernel/driver.rs
+++ b/rust/kernel/driver.rs
@@ -99,23 +99,33 @@
 use core::pin::Pin;
 use pin_init::{pin_data, pinned_drop, PinInit};
 
+/// Trait describing the layout of a specific device driver.
+///
+/// This trait describes the layout of a specific driver structure, such as `struct pci_driver` or
+/// `struct platform_driver`.
+///
+/// # Safety
+///
+/// Implementors must guarantee that:
+/// - `DriverType` is `repr(C)`.
+pub unsafe trait Driver {
+    /// The specific driver type embedding a `struct device_driver`.
+    type DriverType: Default;
+}
+
 /// The [`RegistrationOps`] trait serves as generic interface for subsystems (e.g., PCI, Platform,
 /// Amba, etc.) to provide the corresponding subsystem specific implementation to register /
-/// unregister a driver of the particular type (`RegType`).
+/// unregister a driver of the particular type (`DriverType`).
 ///
-/// For instance, the PCI subsystem would set `RegType` to `bindings::pci_driver` and call
+/// For instance, the PCI subsystem would set `DriverType` to `bindings::pci_driver` and call
 /// `bindings::__pci_register_driver` from `RegistrationOps::register` and
 /// `bindings::pci_unregister_driver` from `RegistrationOps::unregister`.
 ///
 /// # Safety
 ///
-/// A call to [`RegistrationOps::unregister`] for a given instance of `RegType` is only valid if a
-/// preceding call to [`RegistrationOps::register`] has been successful.
-pub unsafe trait RegistrationOps {
-    /// The type that holds information about the registration. This is typically a struct defined
-    /// by the C portion of the kernel.
-    type RegType: Default;
-
+/// A call to [`RegistrationOps::unregister`] for a given instance of `DriverType` is only valid if
+/// a preceding call to [`RegistrationOps::register`] has been successful.
+pub unsafe trait RegistrationOps: Driver {
     /// Registers a driver.
     ///
     /// # Safety
@@ -123,7 +133,7 @@ pub unsafe trait RegistrationOps {
     /// On success, `reg` must remain pinned and valid until the matching call to
     /// [`RegistrationOps::unregister`].
     unsafe fn register(
-        reg: &Opaque<Self::RegType>,
+        reg: &Opaque<Self::DriverType>,
         name: &'static CStr,
         module: &'static ThisModule,
     ) -> Result;
@@ -134,7 +144,7 @@ unsafe fn register(
     ///
     /// Must only be called after a preceding successful call to [`RegistrationOps::register`] for
     /// the same `reg`.
-    unsafe fn unregister(reg: &Opaque<Self::RegType>);
+    unsafe fn unregister(reg: &Opaque<Self::DriverType>);
 }
 
 /// A [`Registration`] is a generic type that represents the registration of some driver type (e.g.
@@ -146,7 +156,7 @@ unsafe fn register(
 #[pin_data(PinnedDrop)]
 pub struct Registration<T: RegistrationOps> {
     #[pin]
-    reg: Opaque<T::RegType>,
+    reg: Opaque<T::DriverType>,
 }
 
 // SAFETY: `Registration` has no fields or methods accessible via `&Registration`, so it is safe to
@@ -161,13 +171,13 @@ impl<T: RegistrationOps> Registration<T> {
     /// Creates a new instance of the registration object.
     pub fn new(name: &'static CStr, module: &'static ThisModule) -> impl PinInit<Self, Error> {
         try_pin_init!(Self {
-            reg <- Opaque::try_ffi_init(|ptr: *mut T::RegType| {
+            reg <- Opaque::try_ffi_init(|ptr: *mut T::DriverType| {
                 // SAFETY: `try_ffi_init` guarantees that `ptr` is valid for write.
-                unsafe { ptr.write(T::RegType::default()) };
+                unsafe { ptr.write(T::DriverType::default()) };
 
                 // SAFETY: `try_ffi_init` guarantees that `ptr` is valid for write, and it has
                 // just been initialised above, so it's also valid for read.
-                let drv = unsafe { &*(ptr as *const Opaque<T::RegType>) };
+                let drv = unsafe { &*(ptr as *const Opaque<T::DriverType>) };
 
                 // SAFETY: `drv` is guaranteed to be pinned until `T::unregister`.
                 unsafe { T::register(drv, name, module) }
diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
index 35b678b78d91..de35961c6903 100644
--- a/rust/kernel/i2c.rs
+++ b/rust/kernel/i2c.rs
@@ -92,13 +92,17 @@ macro_rules! i2c_device_table {
 /// An adapter for the registration of I2C drivers.
 pub struct Adapter<T: Driver>(T);
 
-// SAFETY: A call to `unregister` for a given instance of `RegType` is guaranteed to be valid if
+// SAFETY:
+// - `bindings::i2c_driver` is a C type declared as `repr(C)`.
+unsafe impl<T: Driver + 'static> driver::Driver for Adapter<T> {
+    type DriverType = bindings::i2c_driver;
+}
+
+// SAFETY: A call to `unregister` for a given instance of `DriverType` is guaranteed to be valid if
 // a preceding call to `register` has been successful.
 unsafe impl<T: Driver + 'static> driver::RegistrationOps for Adapter<T> {
-    type RegType = bindings::i2c_driver;
-
     unsafe fn register(
-        idrv: &Opaque<Self::RegType>,
+        idrv: &Opaque<Self::DriverType>,
         name: &'static CStr,
         module: &'static ThisModule,
     ) -> Result {
@@ -133,12 +137,12 @@ unsafe fn register(
             (*idrv.get()).driver.acpi_match_table = acpi_table;
         }
 
-        // SAFETY: `idrv` is guaranteed to be a valid `RegType`.
+        // SAFETY: `idrv` is guaranteed to be a valid `DriverType`.
         to_result(unsafe { bindings::i2c_register_driver(module.0, idrv.get()) })
     }
 
-    unsafe fn unregister(idrv: &Opaque<Self::RegType>) {
-        // SAFETY: `idrv` is guaranteed to be a valid `RegType`.
+    unsafe fn unregister(idrv: &Opaque<Self::DriverType>) {
+        // SAFETY: `idrv` is guaranteed to be a valid `DriverType`.
         unsafe { bindings::i2c_del_driver(idrv.get()) }
     }
 }
diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index 82e128431f08..f58ce35d9c60 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -50,13 +50,17 @@
 /// An adapter for the registration of PCI drivers.
 pub struct Adapter<T: Driver>(T);
 
-// SAFETY: A call to `unregister` for a given instance of `RegType` is guaranteed to be valid if
+// SAFETY:
+// - `bindings::pci_driver` is a C type declared as `repr(C)`.
+unsafe impl<T: Driver + 'static> driver::Driver for Adapter<T> {
+    type DriverType = bindings::pci_driver;
+}
+
+// SAFETY: A call to `unregister` for a given instance of `DriverType` is guaranteed to be valid if
 // a preceding call to `register` has been successful.
 unsafe impl<T: Driver + 'static> driver::RegistrationOps for Adapter<T> {
-    type RegType = bindings::pci_driver;
-
     unsafe fn register(
-        pdrv: &Opaque<Self::RegType>,
+        pdrv: &Opaque<Self::DriverType>,
         name: &'static CStr,
         module: &'static ThisModule,
     ) -> Result {
@@ -68,14 +72,14 @@ unsafe fn register(
             (*pdrv.get()).id_table = T::ID_TABLE.as_ptr();
         }
 
-        // SAFETY: `pdrv` is guaranteed to be a valid `RegType`.
+        // SAFETY: `pdrv` is guaranteed to be a valid `DriverType`.
         to_result(unsafe {
             bindings::__pci_register_driver(pdrv.get(), module.0, name.as_char_ptr())
         })
     }
 
-    unsafe fn unregister(pdrv: &Opaque<Self::RegType>) {
-        // SAFETY: `pdrv` is guaranteed to be a valid `RegType`.
+    unsafe fn unregister(pdrv: &Opaque<Self::DriverType>) {
+        // SAFETY: `pdrv` is guaranteed to be a valid `DriverType`.
         unsafe { bindings::pci_unregister_driver(pdrv.get()) }
     }
 }
diff --git a/rust/kernel/platform.rs b/rust/kernel/platform.rs
index ed889f079cab..e48d055fdc8a 100644
--- a/rust/kernel/platform.rs
+++ b/rust/kernel/platform.rs
@@ -26,13 +26,17 @@
 /// An adapter for the registration of platform drivers.
 pub struct Adapter<T: Driver>(T);
 
-// SAFETY: A call to `unregister` for a given instance of `RegType` is guaranteed to be valid if
+// SAFETY:
+// - `bindings::platform_driver` is a C type declared as `repr(C)`.
+unsafe impl<T: Driver + 'static> driver::Driver for Adapter<T> {
+    type DriverType = bindings::platform_driver;
+}
+
+// SAFETY: A call to `unregister` for a given instance of `DriverType` is guaranteed to be valid if
 // a preceding call to `register` has been successful.
 unsafe impl<T: Driver + 'static> driver::RegistrationOps for Adapter<T> {
-    type RegType = bindings::platform_driver;
-
     unsafe fn register(
-        pdrv: &Opaque<Self::RegType>,
+        pdrv: &Opaque<Self::DriverType>,
         name: &'static CStr,
         module: &'static ThisModule,
     ) -> Result {
@@ -55,12 +59,12 @@ unsafe fn register(
             (*pdrv.get()).driver.acpi_match_table = acpi_table;
         }
 
-        // SAFETY: `pdrv` is guaranteed to be a valid `RegType`.
+        // SAFETY: `pdrv` is guaranteed to be a valid `DriverType`.
         to_result(unsafe { bindings::__platform_driver_register(pdrv.get(), module.0) })
     }
 
-    unsafe fn unregister(pdrv: &Opaque<Self::RegType>) {
-        // SAFETY: `pdrv` is guaranteed to be a valid `RegType`.
+    unsafe fn unregister(pdrv: &Opaque<Self::DriverType>) {
+        // SAFETY: `pdrv` is guaranteed to be a valid `DriverType`.
         unsafe { bindings::platform_driver_unregister(pdrv.get()) };
     }
 }
diff --git a/rust/kernel/usb.rs b/rust/kernel/usb.rs
index d10b65e9fb6a..32f4b2d55dfb 100644
--- a/rust/kernel/usb.rs
+++ b/rust/kernel/usb.rs
@@ -27,13 +27,17 @@
 /// An adapter for the registration of USB drivers.
 pub struct Adapter<T: Driver>(T);
 
-// SAFETY: A call to `unregister` for a given instance of `RegType` is guaranteed to be valid if
+// SAFETY:
+// - `bindings::usb_driver` is a C type declared as `repr(C)`.
+unsafe impl<T: Driver + 'static> driver::Driver for Adapter<T> {
+    type DriverType = bindings::usb_driver;
+}
+
+// SAFETY: A call to `unregister` for a given instance of `DriverType` is guaranteed to be valid if
 // a preceding call to `register` has been successful.
 unsafe impl<T: Driver + 'static> driver::RegistrationOps for Adapter<T> {
-    type RegType = bindings::usb_driver;
-
     unsafe fn register(
-        udrv: &Opaque<Self::RegType>,
+        udrv: &Opaque<Self::DriverType>,
         name: &'static CStr,
         module: &'static ThisModule,
     ) -> Result {
@@ -45,14 +49,14 @@ unsafe fn register(
             (*udrv.get()).id_table = T::ID_TABLE.as_ptr();
         }
 
-        // SAFETY: `udrv` is guaranteed to be a valid `RegType`.
+        // SAFETY: `udrv` is guaranteed to be a valid `DriverType`.
         to_result(unsafe {
             bindings::usb_register_driver(udrv.get(), module.0, name.as_char_ptr())
         })
     }
 
-    unsafe fn unregister(udrv: &Opaque<Self::RegType>) {
-        // SAFETY: `udrv` is guaranteed to be a valid `RegType`.
+    unsafe fn unregister(udrv: &Opaque<Self::DriverType>) {
+        // SAFETY: `udrv` is guaranteed to be a valid `DriverType`.
         unsafe { bindings::usb_deregister(udrv.get()) };
     }
 }
-- 
2.52.0


