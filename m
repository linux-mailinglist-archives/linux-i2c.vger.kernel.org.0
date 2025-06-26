Return-Path: <linux-i2c+bounces-11620-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9E9AEA4C0
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Jun 2025 19:53:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65E534A5BB7
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Jun 2025 17:53:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 354112ECE88;
	Thu, 26 Jun 2025 17:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fYe+84dF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4725D2ECD3B;
	Thu, 26 Jun 2025 17:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750960404; cv=none; b=dN8/kw7vyWEM13aoyKyYm4S5r9Z4vCfXFvaio8bf2uzj3D7FyGSK522B7C3wATBPL6SwtxutzNuS5G7jyRgW0+jM0XBkqmEzy/4lWsWTwzsrHX3inGNg4IZTPh4n9ZlKjh/ZObLR1RJ+JNtUKkFq9xGr/rnehfrAH4cjmc9qig8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750960404; c=relaxed/simple;
	bh=NQGCH21Cr3TGgbGw7hzS5ZmYtxDnvykL1nv8YPps/uw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ymd4IUzQuqGiIq4NMDlqOrGWzkSyF1suHcYQbNHgyF/DR2aAvElhFup+ci+aYs7YM6FiPOzgQk4cWfYHDGVTI55th6fkK/KY/hq701wHHTUwhwq7bo0prB7uEQM0mCjcPrP5WRK78Hrc6goou7XqneAu3GaD5kfzJPaoMHP0p2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fYe+84dF; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4538bc1cffdso7745955e9.0;
        Thu, 26 Jun 2025 10:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750960400; x=1751565200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ORxdFmBgJBVNfDZeWld7nnhWsBM7PFaTDPy5u2ssuGg=;
        b=fYe+84dFwY25M1qxXAkhqq4Fqw7kfDpuCtbcjX9TFs/ENW7u5VC2ISqvFhXbAnCq6T
         WkEO2tRAJy/criqEpcWfu5P/2Rt78O1YhvFjN1DfsZfYkO2m6NrNXJw4YO3xUjyFpgra
         ep+HBdWsWI9C4Zq51mJzt/WYBiKRrICSquGcu3lOVliSxy2pVAWHkr0hBC6HfDXcxKES
         G+BWDG4UdCkJASbsCcibwnD9ohP47S1VJ9SixD5YTvnCa1PYmMV0a0RRDCfCa7KO2ose
         +ilyD9lAtRgPNvKZkusovu3xPwtMj3ZTfs5Qod7D53isgyV9sBj1rrFm01l8ptKiofWf
         ZrWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750960400; x=1751565200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ORxdFmBgJBVNfDZeWld7nnhWsBM7PFaTDPy5u2ssuGg=;
        b=CJD6fnPlVeQKxnLwMiwNW2BqR4JeY2vZVSFEWtdZ4f97pUDzCTxxmbS1c+9xl85CWN
         NBt7X5PBVzIjDnQToSJzaEA7Ni249gSYu0I0JOY6gWQK1b7J6YoWMwkMUIOO0VP9EQxI
         OiW01QKqnNb2gBy1vSW1qVUt9sJrs7Bkm8HB9aEbtoW4cLpZ2cV4lcVd4BwshQ9/7K5A
         DWjhZt9UYjpSdxcg2LeLF4WSvMm7mKAgwGg4KHhpg4ubg4vE4UOQJDf7IpPBWCcshzU7
         N3ATU+4++4aZekZpXqkHANyw/Bz8sT5TrYCIqOZsFJNUKYxISLbCDkjSg55x7ilCOquv
         BLkg==
X-Forwarded-Encrypted: i=1; AJvYcCWA0PmeFMzGhCI8e0YsPL+l4VqKZA7yXNuE/99mPbs0gabaJdth/YKrPFIXWRB9NvETQXYRU/1NIX45e9NYphU=@vger.kernel.org, AJvYcCWEIi7COrmclFgvzHkRVY6hLJ0k7Ewy0HvKqRdGekiXQUkJ0T4xLaYkHkiPB5naYBbUND2+BigOJimvHT7G@vger.kernel.org, AJvYcCXfYCXIUp2xN2OGPlmW0kRe0uh40vT9WfOuz9mcA9CyWw0JzCYt09ylVSWr233VMHFwzwzGyRklDeU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yym+5ksAVQa0WGEvwR2cJD/HnErlm+Wt3pCF/BhJOaZZc4HtchJ
	TR9oFwajwwDf61opGcYM7GjvEl5gWfxeAGkhYcJ9RcDB/JLxlvCcvshW
X-Gm-Gg: ASbGncvmchU4AAjnm/TNnzyvEaNP7F8/F4Zr3mSHi8F6cG+FRLeCuIWGLvMSaT1n7Ya
	ftiDIsfumKOmrMf0zYwGEkdx7P3HmF0alPj5N1flDuo0zYXUbMpQYRszyRdJz4rKf2NyILcg0JQ
	JAiuxF5cDnCk8v3tH6LuhwC+3hF7WcjGfvLmfc3uYw31Sbb9UFSw7RczWXmG5Fpi6uNgLX/YosI
	+LMQ1ZzFZPhxc0QmqknGakskCwqL5NHG+jk1Em4WbLFNCU1rZ2iF53dob7HEdSRO4PSE2MvQ/nj
	ncy0qBGw+yGCXFearYtZtV6yITvUt8VGF5aciG0605KK0CbhT1BhqLOrEHRvDAlkm2qiXkK+5dv
	nWh7pr7aEvh+25+YOUn4Da8lqer92tZOrs3Ya
X-Google-Smtp-Source: AGHT+IEmOlq90hh0Tao5zeGkk5g+LoHlubiwo3zM4KNNDyLJweA8fdHr5wHeWASnKc06/3KhQ4do+A==
X-Received: by 2002:a05:600c:4f12:b0:450:c20d:64c3 with SMTP id 5b1f17b1804b1-4538ee835a4mr2612385e9.18.1750960400346;
        Thu, 26 Jun 2025 10:53:20 -0700 (PDT)
Received: from igor-korotin-Precision-Tower-3620.airspan.com ([188.39.32.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e6280bsm487731f8f.94.2025.06.26.10.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 10:53:19 -0700 (PDT)
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
Subject: [PATCH v1 2/4] samples: rust: add Rust I2C sample driver
Date: Thu, 26 Jun 2025 18:51:17 +0100
Message-ID: <20250626175117.906567-1-igor.korotin.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250626174623.904917-1-igor.korotin.linux@gmail.com>
References: <20250626174623.904917-1-igor.korotin.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new `rust_driver_i2c` sample, showing how to bind an I2C client
in Rust via legacy I2C-ID or OF compatible tables.

Signed-off-by: Igor Korotin <igor.korotin.linux@gmail.com>
---
 MAINTAINERS                     |  1 +
 samples/rust/Kconfig            | 11 ++++++
 samples/rust/Makefile           |  1 +
 samples/rust/rust_driver_i2c.rs | 61 +++++++++++++++++++++++++++++++++
 4 files changed, 74 insertions(+)
 create mode 100644 samples/rust/rust_driver_i2c.rs

diff --git a/MAINTAINERS b/MAINTAINERS
index 2b7a24586c19..a64570dda05e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11364,6 +11364,7 @@ F:	include/uapi/linux/i2c-*.h
 F:	include/uapi/linux/i2c.h
 F:	rust/helpers/i2c.c
 F:	rust/kernel/i2c.rs
+F:	samples/rust/rust_driver_i2c.rs
 
 I2C SUBSYSTEM HOST DRIVERS
 M:	Andi Shyti <andi.shyti@kernel.org>
diff --git a/samples/rust/Kconfig b/samples/rust/Kconfig
index 7f7371a004ee..55aeb12cd7f7 100644
--- a/samples/rust/Kconfig
+++ b/samples/rust/Kconfig
@@ -62,6 +62,17 @@ config SAMPLE_RUST_DMA
 
 	  If unsure, say N.
 
+config SAMPLE_RUST_DRIVER_I2C
+	tristate "I2C Driver"
+	depends on I2C
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
index 000000000000..7c5def930fe0
--- /dev/null
+++ b/samples/rust/rust_driver_i2c.rs
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Rust I2C driver sample.
+
+use kernel::{c_str, device::Core, i2c, of, prelude::*, types::ARef};
+
+struct SampleDriver {
+    pdev: ARef<i2c::Device>,
+}
+
+kernel::i2c_device_table! {
+    I2C_TABLE,
+    MODULE_I2C_TABLE,
+    <SampleDriver as i2c::Driver>::IdInfo,
+    [(i2c::DeviceId::new(b"rust_driver_i2c"), 0)]
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
+    const I2C_ID_TABLE: Option<i2c::IdTable<Self::IdInfo>> = Some(&I2C_TABLE);
+    const OF_ID_TABLE: Option<of::IdTable<Self::IdInfo>> = Some(&OF_TABLE);
+
+    fn probe(pdev: &i2c::Device<Core>, info: Option<&Self::IdInfo>) -> Result<Pin<KBox<Self>>> {
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
+    fn shutdown(pdev: &i2c::Device<Core>) {
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
+kernel::module_i2c_driver! {
+    type: SampleDriver,
+    name: "rust_driver_i2c",
+    authors: ["Igor Korotin"],
+    description: "Rust I2C driver",
+    license: "GPL v2",
+}
-- 
2.43.0


