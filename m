Return-Path: <linux-i2c+bounces-13395-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C86BB957B
	for <lists+linux-i2c@lfdr.de>; Sun, 05 Oct 2025 12:24:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 395C53B9D16
	for <lists+linux-i2c@lfdr.de>; Sun,  5 Oct 2025 10:24:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1A1A26CE2C;
	Sun,  5 Oct 2025 10:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NxXWL8Ui"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACE126CE23
	for <linux-i2c@vger.kernel.org>; Sun,  5 Oct 2025 10:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759659835; cv=none; b=Z8oPsOeDccJeGSPr8seVVk4ZxWqKeLk3r+Nauc6zc3Dx1MraJ80Z7e06L11QLq3UcTd1gMEhCD6VbBYJskLAv7wLO5F/I51cLDMFUoaDdOOW7cx2eLK4d6M6UChFcDXWnnBbLDDQdI7NAvNElwRju4zQgevbnHAJYQ/EXU/Cb18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759659835; c=relaxed/simple;
	bh=q+WTdvd20EQ+5LcFvIvTRIFw16rgVBtHz4Xy4O5ISho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F/EasipPEKXsImg7S8RDpnrUUCYGsvAmrUawd8jVo/bztbkUKXMpoEhYN3YvxjAeDZqeuUw2ln4kC7qDRhTLuDSzn6FtK2/yPsLutI46an/dg09656piTXrSi0n5z7UikB/HxzBZAp9iGTFPYyp3L+MTpVNwhlQG5g7S0Terr0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NxXWL8Ui; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3ee12332f3dso3312164f8f.2
        for <linux-i2c@vger.kernel.org>; Sun, 05 Oct 2025 03:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759659832; x=1760264632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ngfEm+DQ3DVDPW9zq8FsaUOLCfe9b0eQ1gcmjeKbeXc=;
        b=NxXWL8Ui0iyQDJS/Tt9EnonWCpThJG+zUaWwkDD9ZVB3/PKZUESCCx0NcjcSYOFkyj
         uxL5ODk0TrtL66mJ9D9gCDD8NXObDx0h6n/S25onR1kY1fvHD3UK30onI3UbK3OEVmkF
         ieOPrRMg3/szBVNl6MeBlddATjckfQD9iu65cW9ZsJYbshBYJ9VKXoGdEG7tqeSBPoGC
         at8FYdO4JD45gJOfLHghtknwUBxUt34sM3MuvOkczazjzxb5EhrW2Ie3k8pOYeMb6Udu
         SRbXj99iLWUIr4XC9mOc69KpUFDMTnSqDJ260Emt5seNegA2bJ2mKIALilHsXU/ICUAT
         KTPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759659832; x=1760264632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ngfEm+DQ3DVDPW9zq8FsaUOLCfe9b0eQ1gcmjeKbeXc=;
        b=Lg9qvr73s+B0DT8GD7+wG7rIM4xLnRZPISciNm+I9yVughYKaz2U8zLoxN8ZJvtB1h
         SYnjgtcHsJxOAsfEQG3+YoqVQtl7RUql9oaqlnd5rZiJSA+KmDRbhhgssgJpau20A42p
         O6Gg3WkhULBip5nz4vdVfPP3X+8IkcsDjsvOCjLDwE5BU1OS4/HOqqJywhXc2sGhIrpm
         nxPxixA9C5VNHBA+5D4W3rfkvQtRXlg+AI6s0cOTEP7ZAM3MqeXqfJapZHm6+j5OanO/
         TQ3wPlbTjrd7I0Lujpwf7uaUoaYa7L6pcqhgTmk53/+PU2yqXUeb8s0LNgUfm/y32ROf
         m4lQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVL+4yDT+V6oEvBnUnCeCVTcNXFOrBZPLhMbA557zwPdpzLXGJygPVrcSYOZQVVhFrW/QtGI2nHzs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3XxWjkO0cuG4YV3WoecNpoquWoRWCVGaxSctDM4hum+3m6s/J
	ed8dq6JxkHXXfF0hHcO9C881I0M8KKdNnx8iYY+qtpsqYN1RHBU67Bzh
X-Gm-Gg: ASbGncsxU7X2A02sllvcmYGPvJa7pVtUGyMypwWRn89d3SSpdcnlzf4KgFQe6IC+NQd
	Ycmij6uSXZrN2fw2F2tk5c+l171ffOJJFUGmI6D1u7b5bgkgsScV6cyNP0U3JmgOYspgrrBcfoB
	ncJD+HzypGQNgLZDpSnyt+ZaIz0OSSOPXmXgnMv+YcVmpCZHpgYQ7OWvZuPVEnw1tckkzi9mU3i
	LKSuXD4hDkWVV/IVL9PiLpCL6Fv7Q5GsHzFs4sWdRD+UFPPw9mcYl0SoSMukpO3TMiB+iiI/tDi
	U7IcsUymAXWHD7uwNaJLkEv/khFBTN1BRgiunA7f08+L7A28y/4dbaRMpuAcuKj6tfxjOsxQKaD
	mA7QQ77tB5zMIsfKLj3gM/CpNUuinjD7gHHbXnUhVt+qGLkTKo5cHV3KLzHGxXj+Ahn4=
X-Google-Smtp-Source: AGHT+IF17RBTJIOkohlNDQohlW0bXClHHtsE7aCBssZ9CCNLPAILpVfcFgHOU0RfquJetXJuGo/2oQ==
X-Received: by 2002:a05:6000:603:b0:3ee:1461:165f with SMTP id ffacd0b85a97d-42567194bb2mr5418875f8f.31.1759659831787;
        Sun, 05 Oct 2025 03:23:51 -0700 (PDT)
Received: from Vasilio.Home ([2.127.51.206])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8e9703sm16055425f8f.30.2025.10.05.03.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 03:23:51 -0700 (PDT)
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
Subject: [PATCH v6 3/3] samples: rust: add Rust I2C sample driver
Date: Sun,  5 Oct 2025 11:23:48 +0100
Message-ID: <20251005102348.41935-1-igor.korotin.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251005102226.41876-1-igor.korotin.linux@gmail.com>
References: <20251005102226.41876-1-igor.korotin.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new `rust_driver_i2c` sample, showing how to create a new
i2c client using `i2c::Registration` and bind a driver to it
via legacy I2C-ID table.

Signed-off-by: Igor Korotin <igor.korotin.linux@gmail.com>
---
 MAINTAINERS                     |   1 +
 samples/rust/Kconfig            |  11 +++
 samples/rust/Makefile           |   1 +
 samples/rust/rust_driver_i2c.rs | 126 ++++++++++++++++++++++++++++++++
 4 files changed, 139 insertions(+)
 create mode 100644 samples/rust/rust_driver_i2c.rs

diff --git a/MAINTAINERS b/MAINTAINERS
index c44c7ac317b1..2654a7ea0c80 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11523,6 +11523,7 @@ R:	Daniel Almeida <daniel.almeida@collabora.com>
 L:	rust-for-linux@vger.kernel.org
 S:	Maintained
 F:	rust/kernel/i2c.rs
+F:	samples/rust/rust_driver_i2c.rs
 
 I2C SUBSYSTEM HOST DRIVERS
 M:	Andi Shyti <andi.shyti@kernel.org>
diff --git a/samples/rust/Kconfig b/samples/rust/Kconfig
index 7f7371a004ee..28dae070b365 100644
--- a/samples/rust/Kconfig
+++ b/samples/rust/Kconfig
@@ -62,6 +62,17 @@ config SAMPLE_RUST_DMA
 
 	  If unsure, say N.
 
+config SAMPLE_RUST_DRIVER_I2C
+	tristate "I2C Driver"
+	depends on I2C=y
+	help
+	  This option builds the Rust I2C driver sample.
+
+	  To compile this as a module, choose M here:
+	  the module will be called rust_driver_i2c.
+
+	  If unsure, say N.
+
 config SAMPLE_RUST_DRIVER_PCI
 	tristate "PCI Driver"
 	depends on PCI
diff --git a/samples/rust/Makefile b/samples/rust/Makefile
index bd2faad63b4f..141d8f078248 100644
--- a/samples/rust/Makefile
+++ b/samples/rust/Makefile
@@ -5,6 +5,7 @@ obj-$(CONFIG_SAMPLE_RUST_MINIMAL)		+= rust_minimal.o
 obj-$(CONFIG_SAMPLE_RUST_MISC_DEVICE)		+= rust_misc_device.o
 obj-$(CONFIG_SAMPLE_RUST_PRINT)			+= rust_print.o
 obj-$(CONFIG_SAMPLE_RUST_DMA)			+= rust_dma.o
+obj-$(CONFIG_SAMPLE_RUST_DRIVER_I2C)		+= rust_driver_i2c.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_PCI)		+= rust_driver_pci.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_PLATFORM)	+= rust_driver_platform.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_FAUX)		+= rust_driver_faux.o
diff --git a/samples/rust/rust_driver_i2c.rs b/samples/rust/rust_driver_i2c.rs
new file mode 100644
index 000000000000..b2d1d234b077
--- /dev/null
+++ b/samples/rust/rust_driver_i2c.rs
@@ -0,0 +1,126 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Rust I2C driver sample.
+//!
+//! This module shows how to:
+//!
+//! 1. Manually create an `i2c_client` at address `SAMPLE_I2C_CLIENT_ADDR`
+//!    on the adapter with index `SAMPLE_I2C_ADAPTER_INDEX`.
+//!
+//! 2. Register a matching Rust-based I2C driver for that client.
+//!
+//! # Requirements
+//!
+//! - The target system must expose an I2C adapter at index
+//!   `SAMPLE_I2C_ADAPTER_INDEX`.
+//!
+//! - To emulate an adapter for testing, you can load the
+//!   `i2c-stub` kernel module with an option `chip_addr`
+//!   For example for this sample driver to emulate an I2C device with
+//!   an address 0x30 you can use:
+//!      `modprobe i2c-stub chip_addr=0x30`
+//!
+
+use kernel::{
+    acpi, c_str,
+    device::Core,
+    i2c, of,
+    prelude::*,
+    types::ARef,
+};
+
+const SAMPLE_I2C_CLIENT_ADDR: u16 = 0x30;
+const SAMPLE_I2C_ADAPTER_INDEX: i32 = 0;
+const BOARD_INFO: i2c::I2cBoardInfo =
+    i2c::I2cBoardInfo::new(c_str!("rust_driver_i2c"), SAMPLE_I2C_CLIENT_ADDR);
+
+struct SampleDriver {
+    idev: ARef<i2c::I2cClient>,
+}
+
+kernel::acpi_device_table! {
+    ACPI_TABLE,
+    MODULE_ACPI_TABLE,
+    <SampleDriver as i2c::Driver>::IdInfo,
+    [(acpi::DeviceId::new(c_str!("LNUXBEEF")), 0)]
+}
+
+kernel::i2c_device_table! {
+    I2C_TABLE,
+    MODULE_I2C_TABLE,
+    <SampleDriver as i2c::Driver>::IdInfo,
+    [(i2c::DeviceId::new(c_str!("rust_driver_i2c")), 0)]
+}
+
+kernel::of_device_table! {
+    OF_TABLE,
+    MODULE_OF_TABLE,
+    <SampleDriver as i2c::Driver>::IdInfo,
+    [(of::DeviceId::new(c_str!("test,rust_driver_i2c")), 0)]
+}
+
+impl i2c::Driver for SampleDriver {
+    type IdInfo = u32;
+
+    const ACPI_ID_TABLE: Option<acpi::IdTable<Self::IdInfo>> = Some(&ACPI_TABLE);
+    const I2C_ID_TABLE: Option<i2c::IdTable<Self::IdInfo>> = Some(&I2C_TABLE);
+    const OF_ID_TABLE: Option<of::IdTable<Self::IdInfo>> = Some(&OF_TABLE);
+
+    fn probe(idev: &i2c::I2cClient<Core>, info: Option<&Self::IdInfo>) -> Result<Pin<KBox<Self>>> {
+        let dev = idev.as_ref();
+
+        dev_info!(dev, "Probe Rust I2C driver sample.\n");
+
+        if let Some(info) = info {
+            dev_info!(dev, "Probed with info: '{}'.\n", info);
+        }
+
+        let drvdata = KBox::new(Self { idev: idev.into() }, GFP_KERNEL)?;
+
+        Ok(drvdata.into())
+    }
+
+    fn shutdown(idev: &i2c::I2cClient<Core>, _this: Pin<&Self>) {
+        dev_info!(idev.as_ref(), "Shutdown Rust I2C driver sample.\n");
+    }
+}
+
+impl Drop for SampleDriver {
+    fn drop(&mut self) {
+        dev_info!(self.idev.as_ref(), "Remove Rust I2C driver sample.\n");
+    }
+}
+
+// NOTE: The code below is expanded macro module_i2c_driver. It is not used here
+//       because we need to manually create an I2C client in `init()`. The macro
+//       hides `init()`, so to demo client creation on adapter SAMPLE_I2C_ADAPTER_INDEX
+//       we expand it by hand.
+#[pin_data]
+struct DriverModule {
+    #[pin]
+    _driver: kernel::driver::Registration<i2c::Adapter<SampleDriver>>,
+    _reg: i2c::Registration,
+}
+
+impl kernel::InPlaceModule for DriverModule {
+    fn init(
+        module: &'static kernel::ThisModule,
+    ) -> impl ::pin_init::PinInit<Self, kernel::error::Error> {
+        kernel::try_pin_init!(Self {
+            _reg <- {
+                let adapter = i2c::I2cAdapter::get(SAMPLE_I2C_ADAPTER_INDEX)?;
+
+                i2c::Registration::new(&adapter, &BOARD_INFO)
+            },
+            _driver <- kernel::driver::Registration::new(<Self as kernel::ModuleMetadata>::NAME,module,),
+        })
+    }
+}
+
+kernel::prelude::module! {
+    type: DriverModule,
+    name: "rust_driver_i2c",
+    authors: ["Igor Korotin"],
+    description: "Rust I2C driver",
+    license: "GPL v2",
+}
-- 
2.43.0


