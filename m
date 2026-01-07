Return-Path: <linux-i2c+bounces-14962-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 24137CFD4D5
	for <lists+linux-i2c@lfdr.de>; Wed, 07 Jan 2026 12:02:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 456BA30727D4
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Jan 2026 11:01:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E0B430E83E;
	Wed,  7 Jan 2026 10:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r+mBiSsk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C8430CDAE;
	Wed,  7 Jan 2026 10:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767782147; cv=none; b=oQ5RmDw0FBkXrwA8tvC/HVW3sN8h95MknfCVBzzhtMYL3s6EElpLbDLAifuZK0neekTU0ElLQn7ZAYew9MlPxtEDAH9J4ZXHwdH/nFK6FvkZ40xdKHvg5gIwaK7SY4bAaeoQH/T+XKJyKKe9fRf0KELfnYer5iYA0swtVc960MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767782147; c=relaxed/simple;
	bh=nKi5JZBd4Qk8YIPjid5tlqj4dzXK6qTcsyr69Qf6nDA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l/3bvHZVH74IbOiedYlVF1gWqaDhLzjLHrzwmif8ZqZhxh7+4k013CWeqYez1x/3eNh9dlsTreAGMas4GcABvGNSF5kBiiaWgmZtykc8kraRIY+q+Pt6btii9yUyzaPx1qmRSFbxjmTSPT4u+ZYnlXrbw7qmfNMK0i4uZQ4HrsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r+mBiSsk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67854C4CEF7;
	Wed,  7 Jan 2026 10:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767782146;
	bh=nKi5JZBd4Qk8YIPjid5tlqj4dzXK6qTcsyr69Qf6nDA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r+mBiSsk5pT2PDoez9jdXvUDuOz5SBSzJa4x+uu+vPQbLAZt/W1ILE2h92MagbJau
	 r5A01hhBHIBeUcotbR0EDJsl6W2Xb0IYKDgxP3yVglfwqvQTaXXih4zXqJ5NY8VbWS
	 1aUQGUg7zSuYJa9VbkcfIp/LtcQNOpThMie4L+xoMHeY+QmmDf8+lVva2DPAXnPcdd
	 1tImBwGh/TLZHUdaoBTwlfAJwOtAUv/9/6Vu53kMybQIW2b6NDLWZeIglTIyztUoTj
	 TOUblttDkuAPqIN+s55lJK00oBEfYP0qdOP8YOk3yNRu7jnJRtMsGtxekTkMrBYKuO
	 4H0ElNJy5YUrA==
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
Subject: [PATCH 4/6] rust: driver: add DEVICE_DRIVER_OFFSET to the Driver trait
Date: Wed,  7 Jan 2026 11:35:03 +0100
Message-ID: <20260107103511.570525-5-dakr@kernel.org>
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

Add an associated const DEVICE_DRIVER_OFFSET to the Driver trait
indicating the offset of the embedded struct device_driver within
Self::DriverType, i.e. the specific driver structs, such as
struct pci_driver or struct platform_driver.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/auxiliary.rs | 3 +++
 rust/kernel/driver.rs    | 8 +++++++-
 rust/kernel/i2c.rs       | 3 +++
 rust/kernel/pci.rs       | 3 +++
 rust/kernel/platform.rs  | 3 +++
 rust/kernel/usb.rs       | 3 +++
 6 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/auxiliary.rs b/rust/kernel/auxiliary.rs
index 4636b6f41195..e712d1b89dc3 100644
--- a/rust/kernel/auxiliary.rs
+++ b/rust/kernel/auxiliary.rs
@@ -25,8 +25,11 @@
 
 // SAFETY:
 // - `bindings::auxiliary_driver` is a C type declared as `repr(C)`.
+// - `struct auxiliary_driver` embeds a `struct device_driver`.
+// - `DEVICE_DRIVER_OFFSET` is the correct byte offset to the embedded `struct device_driver`.
 unsafe impl<T: Driver + 'static> driver::Driver for Adapter<T> {
     type DriverType = bindings::auxiliary_driver;
+    const DEVICE_DRIVER_OFFSET: usize = core::mem::offset_of!(Self::DriverType, driver);
 }
 
 // SAFETY: A call to `unregister` for a given instance of `DriverType` is guaranteed to be valid if
diff --git a/rust/kernel/driver.rs b/rust/kernel/driver.rs
index cd1d36c313e1..4b0c53b7d22a 100644
--- a/rust/kernel/driver.rs
+++ b/rust/kernel/driver.rs
@@ -107,10 +107,16 @@
 /// # Safety
 ///
 /// Implementors must guarantee that:
-/// - `DriverType` is `repr(C)`.
+/// - `DriverType` is `repr(C)`,
+/// - `DriverType` embeds a valid `struct device_driver` at byte offset `DEVICE_DRIVER_OFFSET`.
 pub unsafe trait Driver {
     /// The specific driver type embedding a `struct device_driver`.
     type DriverType: Default;
+
+    /// Byte offset of the embedded `struct device_driver` within `DriverType`.
+    ///
+    /// This must correspond exactly to the location of the embedded `struct device_driver` field.
+    const DEVICE_DRIVER_OFFSET: usize;
 }
 
 /// The [`RegistrationOps`] trait serves as generic interface for subsystems (e.g., PCI, Platform,
diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
index de35961c6903..56f1ed8163a0 100644
--- a/rust/kernel/i2c.rs
+++ b/rust/kernel/i2c.rs
@@ -94,8 +94,11 @@ macro_rules! i2c_device_table {
 
 // SAFETY:
 // - `bindings::i2c_driver` is a C type declared as `repr(C)`.
+// - `struct i2c_driver` embeds a `struct device_driver`.
+// - `DEVICE_DRIVER_OFFSET` is the correct byte offset to the embedded `struct device_driver`.
 unsafe impl<T: Driver + 'static> driver::Driver for Adapter<T> {
     type DriverType = bindings::i2c_driver;
+    const DEVICE_DRIVER_OFFSET: usize = core::mem::offset_of!(Self::DriverType, driver);
 }
 
 // SAFETY: A call to `unregister` for a given instance of `DriverType` is guaranteed to be valid if
diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index f58ce35d9c60..68466150ef20 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -52,8 +52,11 @@
 
 // SAFETY:
 // - `bindings::pci_driver` is a C type declared as `repr(C)`.
+// - `struct pci_driver` embeds a `struct device_driver`.
+// - `DEVICE_DRIVER_OFFSET` is the correct byte offset to the embedded `struct device_driver`.
 unsafe impl<T: Driver + 'static> driver::Driver for Adapter<T> {
     type DriverType = bindings::pci_driver;
+    const DEVICE_DRIVER_OFFSET: usize = core::mem::offset_of!(Self::DriverType, driver);
 }
 
 // SAFETY: A call to `unregister` for a given instance of `DriverType` is guaranteed to be valid if
diff --git a/rust/kernel/platform.rs b/rust/kernel/platform.rs
index e48d055fdc8a..56d9e968634e 100644
--- a/rust/kernel/platform.rs
+++ b/rust/kernel/platform.rs
@@ -28,8 +28,11 @@
 
 // SAFETY:
 // - `bindings::platform_driver` is a C type declared as `repr(C)`.
+// - `struct platform_driver` embeds a `struct device_driver`.
+// - `DEVICE_DRIVER_OFFSET` is the correct byte offset to the embedded `struct device_driver`.
 unsafe impl<T: Driver + 'static> driver::Driver for Adapter<T> {
     type DriverType = bindings::platform_driver;
+    const DEVICE_DRIVER_OFFSET: usize = core::mem::offset_of!(Self::DriverType, driver);
 }
 
 // SAFETY: A call to `unregister` for a given instance of `DriverType` is guaranteed to be valid if
diff --git a/rust/kernel/usb.rs b/rust/kernel/usb.rs
index 32f4b2d55dfb..a9a9d2298d87 100644
--- a/rust/kernel/usb.rs
+++ b/rust/kernel/usb.rs
@@ -29,8 +29,11 @@
 
 // SAFETY:
 // - `bindings::usb_driver` is a C type declared as `repr(C)`.
+// - `struct usb_driver` embeds a `struct device_driver`.
+// - `DEVICE_DRIVER_OFFSET` is the correct byte offset to the embedded `struct device_driver`.
 unsafe impl<T: Driver + 'static> driver::Driver for Adapter<T> {
     type DriverType = bindings::usb_driver;
+    const DEVICE_DRIVER_OFFSET: usize = core::mem::offset_of!(Self::DriverType, driver);
 }
 
 // SAFETY: A call to `unregister` for a given instance of `DriverType` is guaranteed to be valid if
-- 
2.52.0


