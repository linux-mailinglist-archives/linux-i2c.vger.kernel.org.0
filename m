Return-Path: <linux-i2c+bounces-12885-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DC9B53835
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 17:52:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1F3C67B4D2E
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 15:50:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5155352FC0;
	Thu, 11 Sep 2025 15:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lh0eRYhE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA7432A821;
	Thu, 11 Sep 2025 15:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757605879; cv=none; b=hin1IRy4Qb+Fk+eCbdrP2lkMMaCrL35jr3gEex6RJryPrWqclb0yU0xFx+4N9yQ+Bbuo6uAjDamOvohgie+gSBsTail5e0QOdMjcnkOJwq38vtIHhfTYrfiBoqUJKpE1M25+tZGAqnGEaN5xAqacsf+aVQcMUwrsVmAZjkY1Scw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757605879; c=relaxed/simple;
	bh=aerhj0RFhte+fgz++Owj7ON9z6hpkH/N0WoFAF2ffqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=il+0Ngw4umM+UnAtd3kKqktjpLh2dZZKctR3wpaoKodwmoFclIW6RpCqiAxU7fKEEZ16iFmWxpZIfkKMDFksSNk6v9sG/cFWVFO+PnwFstcwPcH7Nhoy8f37nU/dZBFNWvj4TCnbDeBMJRl1rn86tIl4e6VuhewHbuCAYEsygRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lh0eRYhE; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3d3ff4a4d6fso711600f8f.0;
        Thu, 11 Sep 2025 08:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757605876; x=1758210676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kcoYJYcX2AcUyn7GwJusWiZuV4vjE1hHYw0k4yVptOI=;
        b=Lh0eRYhEv1/HMAIZ4OUf1oTzPu5OLyqZpF9IMSWsWaUVva6vFjSw7XWl2Zh4DgY2K4
         OcGvzAdiqCxH6dHOBv4yw2Kz3QQHLoHyrC0OcvP+A54hb2XL3aQ9blOuYueiKYF5EW1N
         WI75LoSaoJtWQxkQSj4d4R+nTz9ErY7zcOhDFKHUrSsF/s5IDKpQ18x93YqxUSgidptk
         XX6S45zAVwvDh1MFxaSTcRlNX9t+vDRBrQXuXF76D2GrHIu7cXcXZY/pUD+q79YE5Lbi
         W/wSmSOMgkUZKFCDbcNQxfSnSQuQBoxSXnb0giliIpWSI9HPPTGWCHyLm8HbJqik0SWW
         Nayw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757605876; x=1758210676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kcoYJYcX2AcUyn7GwJusWiZuV4vjE1hHYw0k4yVptOI=;
        b=oRmH1Ksy0DfWblBpCF37v0vaf1wSn2Hk2FTGOFFsC1Sd71VI4JM6wS2PJPBCiHUFM7
         GJsWVeO+2Bbz0lBF6fZibUzMvdfqt9DOHsOsxvFbIynibFgT/LUUBj1nTRmueFLom0yi
         lpEFbuLLnrFLo5q//k8FnIlTZQkB7LIpRqpefN5+ULTdFp+Ds+mXFwYDizewsRwmQfDX
         cSgjg1F6BoWmc9451nldQPzFc7xY5VU7mZWN3+GCO2QnKrcqWTllGgjh7jYRWIj6N3G0
         NAqLQ/T0JdqFnS16PmdyZCPpjlwRhtRlp239TsG2qz4cDSt+smbo9KzPtN/gUglhNXa2
         Rihw==
X-Forwarded-Encrypted: i=1; AJvYcCVEVlI6yi1dQ2rBecTl5PPDvblAO+yPxIstW+hS58mxBd0oRSFXnCAY0GY38tQxNnQyp0QC1kKCyTA5GzMW@vger.kernel.org, AJvYcCVLsgIVTWcnQqTVukKEEmr3mC+JaXzatfg1EF2l5xKRa5z5NNBzjhCpxQBxNui1moloJaYfhEktBTY=@vger.kernel.org, AJvYcCVQt7/bph2wzglERt2l2vbYKO/zBUCaOolYxGhBa7IlEcLZpXSodSXq/k/50D9IYpnw1XKEtPqPvmBHpmVL57c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2r31+vSmYB78J+DLGdVxFu4vELbYJ8fe5F1xKgym4SDd0nYK3
	QGD1xkaWFGbFrMqZrpwD+QbJHFqYkE0UW21twXzvCLiFbld60ZhVHXnb
X-Gm-Gg: ASbGnct17bEe1GacAkH8hZifU3q/sXwBmgt2yY3WSuTrjcjxYSuAXLJhQ6bOA72VuNt
	CnBQQZ16LsVUFI9C9p9iCMuoFi78LwuWp7ASyIXdfXpI3A/o2WUxlmPhAYyvqPYvuHeEwzm07RW
	PtTO2Tunn/OjY/xi2jIT2pNGSVJUEuN272S5Zxcgs6suWCM6nvKKqAuJRarl8yU1R920W3MaWRt
	7cICRcusW8hkA3wMX75yJRWOFaPCHa5BHB0EoIkDdwwzfohloA5Nnv3eeNx73mM6j4mMsIpzB/g
	BKBElmK7AyYTToAoky1Q7KIf7kzRMs/B+NgxfqvFm2oGuApG3XZrEuPJUGPz/uSo8+Fdo+fLN7U
	cBeY43E2Z47vhyHQudOx5wk9ehpf7kYm9tFgA5QNASKv4COuAcn0teSlilg==
X-Google-Smtp-Source: AGHT+IHniASw6BLnRpPL3l/IQVi/qoAdvbREGPT4Lf2k6LszStp7FrXOSbAhe6veAZwWqILf2IqGlQ==
X-Received: by 2002:a05:6000:26c3:b0:3e4:e4e:3444 with SMTP id ffacd0b85a97d-3e642f9171dmr15689719f8f.30.1757605875810;
        Thu, 11 Sep 2025 08:51:15 -0700 (PDT)
Received: from localhost.localdomain ([152.37.120.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e01baa70dsm31498085e9.15.2025.09.11.08.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 08:51:15 -0700 (PDT)
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
Subject: [PATCH v5 3/3] samples: rust: add Rust I2C sample driver
Date: Thu, 11 Sep 2025 16:50:48 +0100
Message-ID: <20250911155048.97364-1-igor.korotin.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250911154717.96637-1-igor.korotin.linux@gmail.com>
References: <20250911154717.96637-1-igor.korotin.linux@gmail.com>
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
index 000000000000..c73b89abbac6
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
+    fn shutdown(idev: &i2c::I2cClient<Core>) {
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
+                i2c::Registration::new(adapter.as_ref(), &BOARD_INFO)
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


