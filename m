Return-Path: <linux-i2c+bounces-14963-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57441CFD4DB
	for <lists+linux-i2c@lfdr.de>; Wed, 07 Jan 2026 12:02:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 564C63073786
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Jan 2026 11:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93B9130F953;
	Wed,  7 Jan 2026 10:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iFFGYRPa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C47330F53B;
	Wed,  7 Jan 2026 10:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767782152; cv=none; b=YpwDsa+mkGgXqC9omsqsHjpng8/1i2dWgqgwpxp8omM1c030RxKGjZifseQLRQNTqSWOfz9AejPqtPa5RpealSgGWUHDtzgaLNNuLwqoXHE2QSjYuOV+NGtCmNceQDw9k2IJTIKNQ9mHArtrlV7KP5y3BFAskXL8Si78Ci1qvDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767782152; c=relaxed/simple;
	bh=OABHPQQlfV11ZUpM0ZvmkayXerwyi+tSxR6IpM/FE2I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rkpwvxBgLm6wsqHHHIK3H9hylUHOKkD0N1hVn1Xfjot+fWOGZAXRrMDX3Fj5OxCfresQdZj1ZrgtCm4qcKhDgEeZ8ewy6tSW+/4eU9hPXikxvUdI3OO3Voq1I4aLegBIBdrZK7dM1GBNP9BxjdlAqWQVjdpe8OvmcwIYNGbY17A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iFFGYRPa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46DB8C16AAE;
	Wed,  7 Jan 2026 10:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767782151;
	bh=OABHPQQlfV11ZUpM0ZvmkayXerwyi+tSxR6IpM/FE2I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iFFGYRPaXJz8BmGlymkAz/+ywO+rmGRdvutVFoK1d5DSMszcfg7IjbZn8w7+MUUZk
	 33/9fLLuLZ9qzcbd/SyEUQRVb9boXqrIIoJxAQ5xr3xRVVuR8da5lil3icSxsqK6zi
	 WO41N/VRmO0vgaDaZ5/tfcGEXp7xzbrDxsoLvaw0KNj0eXQaFvzn8RVDxai9ROhxYp
	 3lnRP7GSGXJOvG8m+b4RP1qNnIOlh1ftr4uxmCyHf0+KYcCA/9vpLWpzOIPSMxdL5n
	 DEJE0hWBHiQh/MSxjbqpXJHl+gnhg0gCiM1aPeQ3jCRzkn4/el1zm8Sw147UdGW99W
	 glVNKOBRGuzLQ==
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
Subject: [PATCH 5/6] rust: driver: add DriverData type to the generic Driver trait
Date: Wed,  7 Jan 2026 11:35:04 +0100
Message-ID: <20260107103511.570525-6-dakr@kernel.org>
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

Add an associated type DriverData to the Driver trait indicating the
type of the driver's device private data.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/auxiliary.rs | 2 ++
 rust/kernel/driver.rs    | 4 ++++
 rust/kernel/i2c.rs       | 2 ++
 rust/kernel/pci.rs       | 2 ++
 rust/kernel/platform.rs  | 2 ++
 rust/kernel/usb.rs       | 2 ++
 6 files changed, 14 insertions(+)

diff --git a/rust/kernel/auxiliary.rs b/rust/kernel/auxiliary.rs
index e712d1b89dc3..cb26238e95b0 100644
--- a/rust/kernel/auxiliary.rs
+++ b/rust/kernel/auxiliary.rs
@@ -25,10 +25,12 @@
 
 // SAFETY:
 // - `bindings::auxiliary_driver` is a C type declared as `repr(C)`.
+// - `T` is the type of the driver's device private data.
 // - `struct auxiliary_driver` embeds a `struct device_driver`.
 // - `DEVICE_DRIVER_OFFSET` is the correct byte offset to the embedded `struct device_driver`.
 unsafe impl<T: Driver + 'static> driver::Driver for Adapter<T> {
     type DriverType = bindings::auxiliary_driver;
+    type DriverData = T;
     const DEVICE_DRIVER_OFFSET: usize = core::mem::offset_of!(Self::DriverType, driver);
 }
 
diff --git a/rust/kernel/driver.rs b/rust/kernel/driver.rs
index 4b0c53b7d22a..77c1f7434897 100644
--- a/rust/kernel/driver.rs
+++ b/rust/kernel/driver.rs
@@ -108,11 +108,15 @@
 ///
 /// Implementors must guarantee that:
 /// - `DriverType` is `repr(C)`,
+/// - `DriverData` is the type of the driver's device private data.
 /// - `DriverType` embeds a valid `struct device_driver` at byte offset `DEVICE_DRIVER_OFFSET`.
 pub unsafe trait Driver {
     /// The specific driver type embedding a `struct device_driver`.
     type DriverType: Default;
 
+    /// The type of the driver's device private data.
+    type DriverData;
+
     /// Byte offset of the embedded `struct device_driver` within `DriverType`.
     ///
     /// This must correspond exactly to the location of the embedded `struct device_driver` field.
diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
index 56f1ed8163a0..6a3923a8b8a7 100644
--- a/rust/kernel/i2c.rs
+++ b/rust/kernel/i2c.rs
@@ -94,10 +94,12 @@ macro_rules! i2c_device_table {
 
 // SAFETY:
 // - `bindings::i2c_driver` is a C type declared as `repr(C)`.
+// - `T` is the type of the driver's device private data.
 // - `struct i2c_driver` embeds a `struct device_driver`.
 // - `DEVICE_DRIVER_OFFSET` is the correct byte offset to the embedded `struct device_driver`.
 unsafe impl<T: Driver + 'static> driver::Driver for Adapter<T> {
     type DriverType = bindings::i2c_driver;
+    type DriverData = T;
     const DEVICE_DRIVER_OFFSET: usize = core::mem::offset_of!(Self::DriverType, driver);
 }
 
diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index 68466150ef20..fe63b53d55d6 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -52,10 +52,12 @@
 
 // SAFETY:
 // - `bindings::pci_driver` is a C type declared as `repr(C)`.
+// - `T` is the type of the driver's device private data.
 // - `struct pci_driver` embeds a `struct device_driver`.
 // - `DEVICE_DRIVER_OFFSET` is the correct byte offset to the embedded `struct device_driver`.
 unsafe impl<T: Driver + 'static> driver::Driver for Adapter<T> {
     type DriverType = bindings::pci_driver;
+    type DriverData = T;
     const DEVICE_DRIVER_OFFSET: usize = core::mem::offset_of!(Self::DriverType, driver);
 }
 
diff --git a/rust/kernel/platform.rs b/rust/kernel/platform.rs
index 56d9e968634e..af94fb58aafb 100644
--- a/rust/kernel/platform.rs
+++ b/rust/kernel/platform.rs
@@ -28,10 +28,12 @@
 
 // SAFETY:
 // - `bindings::platform_driver` is a C type declared as `repr(C)`.
+// - `T` is the type of the driver's device private data.
 // - `struct platform_driver` embeds a `struct device_driver`.
 // - `DEVICE_DRIVER_OFFSET` is the correct byte offset to the embedded `struct device_driver`.
 unsafe impl<T: Driver + 'static> driver::Driver for Adapter<T> {
     type DriverType = bindings::platform_driver;
+    type DriverData = T;
     const DEVICE_DRIVER_OFFSET: usize = core::mem::offset_of!(Self::DriverType, driver);
 }
 
diff --git a/rust/kernel/usb.rs b/rust/kernel/usb.rs
index a9a9d2298d87..b09fe8bcca13 100644
--- a/rust/kernel/usb.rs
+++ b/rust/kernel/usb.rs
@@ -29,10 +29,12 @@
 
 // SAFETY:
 // - `bindings::usb_driver` is a C type declared as `repr(C)`.
+// - `T` is the type of the driver's device private data.
 // - `struct usb_driver` embeds a `struct device_driver`.
 // - `DEVICE_DRIVER_OFFSET` is the correct byte offset to the embedded `struct device_driver`.
 unsafe impl<T: Driver + 'static> driver::Driver for Adapter<T> {
     type DriverType = bindings::usb_driver;
+    type DriverData = T;
     const DEVICE_DRIVER_OFFSET: usize = core::mem::offset_of!(Self::DriverType, driver);
 }
 
-- 
2.52.0


