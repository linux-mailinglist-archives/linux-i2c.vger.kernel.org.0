Return-Path: <linux-i2c+bounces-12356-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EAEB2E155
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Aug 2025 17:39:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88C50A2811A
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Aug 2025 15:27:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 948C836CE19;
	Wed, 20 Aug 2025 15:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S0rK9mkK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E0836CE00;
	Wed, 20 Aug 2025 15:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755703554; cv=none; b=Qd56TQJwbExNG8CNVkQQvT3uktL1TR10ietB30cq+pz7SfXLnb5a6DHTzAYp+qneLTP25hI9Ci81LEPL0+mheWCFwpzGT7CtRlN/PQpkiT7R0aCxX2wIYNnIILqahDCCVIddPyd3HeIX/WBZOsKyeI49FF622GJjfoMkhgh9NO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755703554; c=relaxed/simple;
	bh=IblGSvcl9YQ4J83zqi1Getk6bWaI1B1dN8cO0Jqw+lo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iXLPwOfFO+syGNN2Yuyb15e6A7VKwFcek9kXOUd5Hbrb9JnyyZWKERh72Ok8qNyeX9nIjHPcfl9oj4gEDxrtq3xH7Xq+H2xjfruVxEnFxlcmhbTh5ZCD4eyB8K0Z7wPHf711ze1KQSqimzmTLzr22seB2WBsyP/5/NcSnoVAVZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S0rK9mkK; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45a1b05d252so48069835e9.1;
        Wed, 20 Aug 2025 08:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755703551; x=1756308351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=97f6BgM4JY/6DiuS5dYZ9XaNJjjXPDmqhV4WvduflVw=;
        b=S0rK9mkK3dMLryDAi9hrwesPsvTPt4wMiZSb29XFVXg72KDxAOuXIH2kPmAeZkWTZf
         qGraNikZc02xVz4z6D05Hm/kDj7CI3AhKRrThUlrlmpsupTWaEywcaQcXNsiP7fSEipJ
         oe2riemr4gvGfZ06NV6eyengu9W8VuiEDCMsnJ0NW2SjAY2rNLQLZ7KRW2EIIO6YJbA9
         hFHaFSkkYUkCarvCJO8Ej0zx9DXJtiAt5yeJXrXkwpFhT86qkLJQO8MGUA1EPKKBt4ol
         zqqC6obNQBniDJe8jj5ToOiUmnloQaanT6RT4/OEtXGM6hHQ403cMn2OroWEpaHmqBIE
         n3jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755703551; x=1756308351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=97f6BgM4JY/6DiuS5dYZ9XaNJjjXPDmqhV4WvduflVw=;
        b=offCt1qGFjKjXCZOTn/Zo2zsudccNhW0dUOiDdfxCr+CpBbVoG1cxJS1RLb5jHIVmJ
         r5Ow+ixGsqIyr+JjweykSIY4Y1wOrvnp0vSRuh9MDH2t/MfhhivF/6zkg830z1leyV9J
         hWAPgDkzA9rVp/rK6o9k0vAkORaf2ejZsS3e1FGYF3irBjrazYuUiarHdI95j2u7Q0b5
         ZhTEquKUHh9dfcBdTe4qr/tvkvA5IhwBXsO2G+J6ukwxNanzPxRaRRj1YGWWP2VdZkNk
         6Gx9ArMysv9sK0NRAjI/2waH5q2GLTXE/U4xS4C1lIKFoUA/iJ26nKUK3nXobQdxXQs8
         K4yQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0rVKVTzNpOtk+cANssfBtCeHnY0QLHMKAYRkHAiY61v48SnLZQeq2hHXiiKK0J8X4xFe6tQlm/QlZZnPt@vger.kernel.org, AJvYcCX8iA+QWw3TsoMaI6s0z/4hAggKSiIcFXA/EsCJD7MR+gWNqY5oH49dER6r5TMJYjA9u2cmymVt+PnlpWwEEIU=@vger.kernel.org, AJvYcCXP8u4B38CYdGmAyZ5pGChNoS9x3bbwwFpuP08ozvzG3J+hnBh09h4hqCH9Sb1hlQhxssP/fmoX9zg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHZC7cRXXQxuQp9VBi6IgifPzmBFbGvfHb8AQRxmVVa+9ahFOC
	WdU7qDgivGMKPKsYRgAsfVrmtWLmdi7g+yLMTx1o6P2DbPe20OQ9VhmB
X-Gm-Gg: ASbGncvAZbvKspDMZQ9xU2tpAvbn+Up1kbUT6FHb8W0uPz3nTd/1SAdXPsHYLPa8Ass
	QdhDtbK1+WSuQmbMsckSZRqJ9ojFHBVuiHu5ifLlrm2rYV1SKnpVJ2ncVyknY4R3UVS8qoTsD/1
	B3B6e1BZ/qXNiuZocH3NeWI6xqBJSVwdRU9uoI+VO2SCiI1d0oc0qhZCQnkyKb1Tbf1jPlfAvoI
	kmr2Bb45h7LoMcr0hao+hXPAuYPy1P+z3pTrw9/sKxPF1Mc1RnuUlBUc9miANhdv/T8gn2aXmmx
	DgbQZ58tfFpq1Wxm1TwStvqGfoymlz9u1hkQzZXRmEImmpstUNhHj2BRQkI4NXw4L6IN/ExFZHM
	Sc5clWPY3tLdLYb9TyMAXLUC+CutPQ99/n97pC5s00oiRflHDZ6wrW7ebV/oRV5VZWzjL0kfs
X-Google-Smtp-Source: AGHT+IHcCNOs3Z1q0Tuneuj4ew4hMEZEq7HovMkKEHGHdsnXVNyrHD2r+/oTFPsjC5xgBrn0dl4Mbw==
X-Received: by 2002:a05:600c:4f51:b0:456:1c4a:82b2 with SMTP id 5b1f17b1804b1-45b4a4eb04fmr17635775e9.10.1755703550325;
        Wed, 20 Aug 2025 08:25:50 -0700 (PDT)
Received: from igor-korotin-Precision-Tower-3620.airspan.com ([188.39.32.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b47cad57asm40709915e9.24.2025.08.20.08.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 08:25:49 -0700 (PDT)
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
Subject: [PATCH v4 3/3] samples: rust: add Rust I2C sample driver
Date: Wed, 20 Aug 2025 16:23:47 +0100
Message-ID: <20250820152347.1815097-1-igor.korotin.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250820151427.1812482-1-igor.korotin.linux@gmail.com>
References: <20250820151427.1812482-1-igor.korotin.linux@gmail.com>
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
 samples/rust/rust_driver_i2c.rs | 128 ++++++++++++++++++++++++++++++++
 4 files changed, 141 insertions(+)
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
index 000000000000..6dfc299d5aea
--- /dev/null
+++ b/samples/rust/rust_driver_i2c.rs
@@ -0,0 +1,128 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Rust I2C driver sample.
+//!
+//! This module shows how to:
+//!
+//! 1. Manually create an `i2c_client` at address `SAMPLE_I2C_CLIENT_ADDR`
+//!    on the adapter with index `SAMPLE_I2C_ADAPTER_INDEX`.
+//! 2. Register a matching Rust-based I2C driver for that client.
+//!
+//! # Requirements
+//!
+//! - The target system must expose an I2C adapter at index
+//!   `SAMPLE_I2C_ADAPTER_INDEX`.
+//! - To emulate an adapter for testing, you can load the
+//!   `i2c-stub` kernel module with an option `chip_addr`
+//!   For example for this sample driver to emulate an I2C device with
+//!   an address 0x30 you can use:
+//!      `modprobe i2c-stub chip_addr=0x30`
+//!
+
+use kernel::{
+    acpi, c_str,
+    device::{Core, Normal},
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
+    pdev: ARef<i2c::I2cClient>,
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
+    fn probe(pdev: &i2c::I2cClient<Core>, info: Option<&Self::IdInfo>) -> Result<Pin<KBox<Self>>> {
+        let dev = pdev.as_ref();
+
+        dev_dbg!(dev, "Probe Rust I2C driver sample.\n");
+
+        if let Some(info) = info {
+            dev_info!(dev, "Probed with info: '{}'.\n", info);
+        }
+
+        let drvdata = KBox::new(Self { pdev: pdev.into() }, GFP_KERNEL)?;
+
+        Ok(drvdata.into())
+    }
+
+    fn shutdown(pdev: &i2c::I2cClient<Core>) {
+        dev_dbg!(pdev.as_ref(), "Shutdown Rust I2C driver sample.\n");
+    }
+}
+
+impl Drop for SampleDriver {
+    fn drop(&mut self) {
+        dev_dbg!(self.pdev.as_ref(), "Remove Rust I2C driver sample.\n");
+    }
+}
+
+// NOTE: The code below is expanded macro module_i2c_driver. It is not used here
+//       because we need to manually create an I2C client in `init()`. The macro
+//       hides `init()`, so to demo client creation on adapter SAMPLE_I2C_ADAPTER_INDEX
+//       we expand it by hand.
+type Ops<T> = kernel::i2c::Adapter<T>;
+
+#[pin_data]
+struct DriverModule {
+    #[pin]
+    _driver: kernel::driver::Registration<Ops<SampleDriver>>,
+    _reg: i2c::Registration,
+}
+
+impl kernel::InPlaceModule for DriverModule {
+    fn init(
+        module: &'static kernel::ThisModule,
+    ) -> impl ::pin_init::PinInit<Self, kernel::error::Error> {
+        kernel::try_pin_init!(Self {
+            _reg <- {
+                let adapter = i2c::I2cAdapter::<Normal>::get(SAMPLE_I2C_ADAPTER_INDEX)?;
+
+                i2c::Registration::new(adapter, &BOARD_INFO)
+            },
+            _driver <- kernel::driver::Registration::new(
+                 <Self as kernel::ModuleMetadata>::NAME, module
+            ),
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


