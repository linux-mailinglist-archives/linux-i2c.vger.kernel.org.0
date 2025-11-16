Return-Path: <linux-i2c+bounces-14097-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 88710C61888
	for <lists+linux-i2c@lfdr.de>; Sun, 16 Nov 2025 17:24:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 720414ED96E
	for <lists+linux-i2c@lfdr.de>; Sun, 16 Nov 2025 16:22:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F39C30E0E5;
	Sun, 16 Nov 2025 16:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OW0gorWM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2458030DEB9
	for <linux-i2c@vger.kernel.org>; Sun, 16 Nov 2025 16:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763310130; cv=none; b=sNnr0SgBsvjZcDy4TDW6H15UIredQsVcmqNWwFjHGhb72pRJwSqxt/Y5owOZgb48pYOij4+6UcjJ8qnS1aL04bR0VEEhoN7k4Fei1k3JK3LMzecGAMlDKvZ39zzos5YY0g2xs61TEVQSCY7EwHp4Wke4vHxJRk0LnafWGbSIauw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763310130; c=relaxed/simple;
	bh=m8f3ckNXVWpfmWRTR65J04ac7rJbNT4myeZEqsLDmlY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W5cT2ClSdO/xPukHV2ySxubhETwF5yijBPZuROROU+mnQng4D4CJHihH7heLZS7nktXXtOcWw1YAwiCMxZfmcK50pvbdC6woe2Y4Xn9m/JYAPo/dgH4JmFHKevIRlI+6DS2EUz0jycS279ctVfyhlrkWVsXS2A+hq1crfWpknJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OW0gorWM; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47758595eecso18968425e9.0
        for <linux-i2c@vger.kernel.org>; Sun, 16 Nov 2025 08:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763310125; x=1763914925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GtDZX1ikVCwszhOceYAYwxwSSyFYEhe/dmSKKTM3uq8=;
        b=OW0gorWMULlV8KSt6lJUzQG0FER2xkqfyAX0+E8qoJt5NwJ2J90OOj2EVDlOQgB4Gd
         /ribQm9AKCUPo3UPsGrMX4cK9CvwASr9fSSXujovHLIfhetO5Npqcw+HEGmtXfSKpXon
         2SNC6VuTrVLMbY3oPWIK3gGG2t5dKRmn2kor1hlMDPuMiMXT26L6IDMzVFGtHcdUP2Tp
         5KzYQhvN9ji5N8QQGlp+MxFvAVqGp9ggRveEDFzzGbZlhS1fEZ3BloqznRzmZiEo7p6E
         2bwEkH99IVpG4Sn5Rwtwd4O2dlGcSgdNQOC8wyA4S6m0za8pLjlMPHfh8Rj8XLZZMrDR
         2vew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763310125; x=1763914925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GtDZX1ikVCwszhOceYAYwxwSSyFYEhe/dmSKKTM3uq8=;
        b=geHQAppct/V4msCrKPUFm2wJM2l4GLxB5osO1iI7Av5nlxMtmBepqGJ3xx+1jcxb1X
         /bkhzvmF1vG3195HIweOewZwPT8EHO+m3mHG0+/t8jyGGYmnBFiw2NJ+HjYUIfHbsoa7
         qG342O4AxKRzuVU1XQLf4EQlXWiLMLrdPoTzirLwda3+ml8EfLehOW19hTNEXadAvXq9
         0uJSwrn59d3+YXuvlk2Rc5Up+o9jaFEWU8jeXkgTzn5G/GBOdCRFrN91gmvqbDWTFpgq
         v34k94VC30FkeDCWk5vRcxz9pcowJKw6DvzjNDsle48kpTSOydg2JEtmRdQLSWA09zkC
         TA5A==
X-Forwarded-Encrypted: i=1; AJvYcCWiv3KjnovhDvHbhZRWnaIbdwamjJyo18rW2f0HmlR3iciwCH+X5+BjBEOKfUNadQgzaQl58EIgBIg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0YrJ/e7qYJFFTYEGHYMIRrA2G7BIdeacmRd4O9X9huoqPlqIS
	iLGX3avyiYHw0kPqVL/nXQz4BfCk6WRm87lYmuwVUrlM4SsW/OVeyomj
X-Gm-Gg: ASbGncs2oOeT+YYJ6k+yfuAP10IAsN/N7WYba8qTUXNeBY8iwC6jNs1bBrTHVCglvov
	VLPcJS3TGKxOe0FFfwT+AUvOQxRUg2z5OjTDCEwGNlsmPqag+qWDtltTx4e7rukcZgH5/bCEhqq
	VWNm9g1+hdTfiUn1UJ9NaQQsKzr4uJ2rVURqcjpQE2Qr/4RVFICy0ebD9EvbW3NTADj3mRS8ujD
	cTPQfhXqePtuTqBKSSsRvGx6XfBKxyYp5y5BFgR6LGO15nQmtiO8puOhQwNEchhnobUwDxETYfk
	R/Yvz8/2DWnBrXMEHkDHBR/QCny4/G9/w6Qgb7QwToagiZraWYUd33qy4hW6MIw98D4j41OzuAL
	onzs87HMV0Q+p6aofXZDf99A6PdJgkb9ZLg1zklZDpJboAZne1iS6i8otXhveTA3h/OoHRB7Cv3
	jjaG8b24cHVXC83BAJmvIAQHMWIg==
X-Google-Smtp-Source: AGHT+IFne8WEvuURcGzvWOrK3ZiYWL2jvr+Mjmjsc7BjUh6RIZCWEhIQsOUMDSCMBHFaYHy2tGiZeA==
X-Received: by 2002:a05:600c:45d5:b0:477:7af8:c88b with SMTP id 5b1f17b1804b1-4778fe57241mr89311205e9.11.1763310125155;
        Sun, 16 Nov 2025 08:22:05 -0800 (PST)
Received: from Vasilio.Home ([176.26.203.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a0f4ff42sm28419445e9.12.2025.11.16.08.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 08:22:04 -0800 (PST)
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
Subject: [PATCH v8 3/4] samples: rust: add Rust I2C sample driver
Date: Sun, 16 Nov 2025 16:22:04 +0000
Message-ID: <20251116162204.171518-1-igor.korotin.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251116162104.171420-1-igor.korotin.linux@gmail.com>
References: <20251116162104.171420-1-igor.korotin.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new `rust_driver_i2c` sample, showing how to create a new
i2c driver using ACPI/OF/Legacy ID tables.

Signed-off-by: Igor Korotin <igor.korotin.linux@gmail.com>
---
 MAINTAINERS                     |  1 +
 samples/rust/Kconfig            | 11 +++++
 samples/rust/Makefile           |  1 +
 samples/rust/rust_driver_i2c.rs | 74 +++++++++++++++++++++++++++++++++
 4 files changed, 87 insertions(+)
 create mode 100644 samples/rust/rust_driver_i2c.rs

diff --git a/MAINTAINERS b/MAINTAINERS
index a8dfde2f5633..8133987c4b54 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11750,6 +11750,7 @@ R:	Daniel Almeida <daniel.almeida@collabora.com>
 L:	rust-for-linux@vger.kernel.org
 S:	Maintained
 F:	rust/kernel/i2c.rs
+F:	samples/rust/rust_driver_i2c.rs
 
 I2C SUBSYSTEM HOST DRIVERS
 M:	Andi Shyti <andi.shyti@kernel.org>
diff --git a/samples/rust/Kconfig b/samples/rust/Kconfig
index c376eb899b7a..181466319588 100644
--- a/samples/rust/Kconfig
+++ b/samples/rust/Kconfig
@@ -84,6 +84,17 @@ config SAMPLE_RUST_DEBUGFS_SCOPED
 
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
index cf8422f8f219..aec865e2adef 100644
--- a/samples/rust/Makefile
+++ b/samples/rust/Makefile
@@ -7,6 +7,7 @@ obj-$(CONFIG_SAMPLE_RUST_PRINT)			+= rust_print.o
 obj-$(CONFIG_SAMPLE_RUST_DEBUGFS)		+= rust_debugfs.o
 obj-$(CONFIG_SAMPLE_RUST_DEBUGFS_SCOPED)	+= rust_debugfs_scoped.o
 obj-$(CONFIG_SAMPLE_RUST_DMA)			+= rust_dma.o
+obj-$(CONFIG_SAMPLE_RUST_DRIVER_I2C)		+= rust_driver_i2c.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_PCI)		+= rust_driver_pci.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_PLATFORM)	+= rust_driver_platform.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_USB)		+= rust_driver_usb.o
diff --git a/samples/rust/rust_driver_i2c.rs b/samples/rust/rust_driver_i2c.rs
new file mode 100644
index 000000000000..ecefeca3e22f
--- /dev/null
+++ b/samples/rust/rust_driver_i2c.rs
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Rust I2C driver sample.
+
+use kernel::{
+    acpi,
+    c_str,
+    device::Core,
+    i2c,
+    of,
+    prelude::*, //
+};
+
+struct SampleDriver;
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
+    fn probe(
+        idev: &i2c::I2cClient<Core>,
+        info: Option<&Self::IdInfo>,
+    ) -> impl PinInit<Self, Error> {
+        let dev = idev.as_ref();
+
+        dev_info!(dev, "Probe Rust I2C driver sample.\n");
+
+        if let Some(info) = info {
+            dev_info!(dev, "Probed with info: '{}'.\n", info);
+        }
+
+        Ok(Self)
+    }
+
+    fn shutdown(idev: &i2c::I2cClient<Core>, _this: Pin<&Self>) {
+        dev_info!(idev.as_ref(), "Shutdown Rust I2C driver sample.\n");
+    }
+
+    fn unbind(idev: &i2c::I2cClient<Core>, _this: Pin<&Self>) {
+        dev_info!(idev.as_ref(), "Unbind Rust I2C driver sample.\n");
+    }
+}
+
+kernel::module_i2c_driver! {
+    type: SampleDriver,
+    name: "rust_driver_i2c",
+    authors: ["Igor Korotin"],
+    description: "Rust I2C driver",
+    license: "GPL v2",
+}
-- 
2.43.0


