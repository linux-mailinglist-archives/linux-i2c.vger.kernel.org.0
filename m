Return-Path: <linux-i2c+bounces-11837-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D45AF9740
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Jul 2025 17:46:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B815C5A05E5
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Jul 2025 15:46:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6978C1D63F7;
	Fri,  4 Jul 2025 15:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hCXv4ilm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CEE140E34;
	Fri,  4 Jul 2025 15:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751643956; cv=none; b=cSpAX5rRDavsfR0bedwr9WcqAZNyl8TdRDTrOgSCJAm0i7rSVS5CDTwDy7BrvSNwZQfzclxaGiAg9/Pr9/qwuXXGA2+9N6tQXXZLmL0ys6NUlVlXnWf46kVzHGdoyK6/h0FAqp1+dt9P8g0YMzM/Dn7n3+qlYuS+ISBT2gEe2Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751643956; c=relaxed/simple;
	bh=Qfg1bTdE3fo9bxLBT9hGP1+7jI+26Qt8XFcv2TwSyc0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MLqjfDxKDflsE3FvaIauKDr6igGJbyHtKA1oGb2/9bvtaILnvZOekdfoewOJuLnBgvuVrgy2AZIJRBrI4jhCZSALnMQ9pFV0vquBn5qz509IHL6g8cib0TyVyyPXy0SfLJ3ID4chOaMbkithW5qpsmJwiYdcGLICtirZYvgcNMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hCXv4ilm; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-450ccda1a6eso7938425e9.2;
        Fri, 04 Jul 2025 08:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751643952; x=1752248752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V7tRFxTXdKxo++BEADlGZZAUvVfHDhOeQkPo5DocB8o=;
        b=hCXv4ilmJo4FzBmywVrnhIkt+8o/sLkS5GTAk3l/smr6fJhKoJMCKBZAX6+kGoSKqc
         m37uqeuekKlXWOJW7ftW8iFqtocyaELioG64tIv+wA3mPy8asdffGiRlRhnqjFAAv/eQ
         huZKF2jQ07fXOsfLaG6K7sR+KBQXMGuO+ubFF20yImHag0u6ocRJE253ibiTErgKpdpn
         Cd8SvRQrDY6+DlyrI3HSJSFHgAEHck3JR4Is9lWFrpdQVV/2l/pDYQQTAuN0h3WvZhOA
         G7o0PEbnKVjsCKC4J4w5HpbouexIbmwVFLy/p0TFBqCNJR3r553fXK48UhVinv7FvbRH
         zAcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751643952; x=1752248752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V7tRFxTXdKxo++BEADlGZZAUvVfHDhOeQkPo5DocB8o=;
        b=GCMzDDoqGZ6y7UfINhUhJ0gvx+ltldUW1aWrPRXRY1adJNQ6S0t6P8szJlIoWfRta9
         kNPrqRAFK1XDFcMa9aw3wHXgz5hoGpISY798kZfDEXNOAYVGHzsxoIa9vxaSzQA6n1g8
         t1i5ocx1vGhMcFog4mukUhpgVLyqoqK+ntcmzMz9p04wlEMrnV2D6B7aQlo84WaGM4Rb
         9DNuF1Pals00NvZbrCEfP3cvNCG9xgcbBn+FD3XSCPbcWYQgTdC+7jxrYC9SgFhauK+W
         7j8lUbSvNSGC64RIhsIcKFTLoAF+k92K9APOFm5YRmTwsEPFQeRm51CBwVIpeOYA8rvB
         A+8w==
X-Forwarded-Encrypted: i=1; AJvYcCVN4m7WRye9aYkydQu8ejwP+uVdumOkA/sRgLmKGYPpuRsbU+eirRqYmxWkA7mRF6Q4KdY4m8BKo/n3wSQC@vger.kernel.org, AJvYcCVXJToyIlVwOWsvG2cMfgcQ5nNdzQSGqui8Tk+R8Y6AohDrsmLAe4wwkX/BCZvpmLPCb3O4nEolpeg=@vger.kernel.org, AJvYcCXWGJV8jwyKl7Ac1rvGAcVCRlJtqZd0fEB+AJgajU+dJkJLlUNI9d79u0UWXSVfy9v3uMnZPfS1aRvsTaw9SmQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2lC94HPjVYcA5ZfSnRD3XQ1Zi98zh6wnK057HWNx3Ljobl8nC
	go3hpf11w0fd24en6THoO5phG4f5Y2b4cgvRzyl+MV/7umrooF6d3oU1ep+Zz5QBkrE=
X-Gm-Gg: ASbGncvW8J/Iu2i561ITRMYpN3PKBG0NARbA3641abw/n7by3KD5ben5iE654F/+Fvk
	6UXUHWP+3xDeHT2rxYyQHR5ZrIspLaxAkJad+TpPKx7MX6h3RPv8L2OUHwonxvxS1f5skK9THrC
	MOiU0WWUtXvEmOtY9zthk89HXSczUonlwjSJlhAeyXhbmV2izb7IXcnHpWJK7UNU/j7kRGdU61D
	JIlEFCxfMs2ws1qi1j7fij0TMrRkFL09aVO0r2G4kDDg/fju2+f4GiGlQgMNMveTW7P+JjARw9V
	clypCKrtPGYh9KLHAMb+XhsR204czBOhUO8PU2JDzuQ2/KgfqeOcuQ8fCFwH5qJakWfXk1vSz6u
	+ouOfdh8i7Zlq1xEYpl2euYvYnue6Q79yHOMM8SUfZ0SMJ3I=
X-Google-Smtp-Source: AGHT+IGzGtD71lv8K59LG0FwoUFaeTU046UI05a+xTZIHpFbiVsVKRycTLR2W4Ctsi47v5MoDIab6A==
X-Received: by 2002:a05:600c:6745:b0:43d:3df:42d8 with SMTP id 5b1f17b1804b1-454b3069f2cmr31628505e9.6.1751643951525;
        Fri, 04 Jul 2025 08:45:51 -0700 (PDT)
Received: from igor-korotin-Precision-Tower-3620.airspan.com ([188.39.32.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b168664bsm30154705e9.20.2025.07.04.08.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 08:45:50 -0700 (PDT)
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
Subject: [PATCH v2 4/4] samples: rust: add Rust manual I2C device creation sample
Date: Fri,  4 Jul 2025 16:43:41 +0100
Message-ID: <20250704154345.1198721-1-igor.korotin.linux@gmail.com>
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

Add a new `rust_device_i2c` sample, showing how to create I2C device
on a certain `I2CAdapterRef` using `I2cBoardInfo`. Demonstrates
automatic unregister of such I2C device when driver is unloaded

Signed-off-by: Igor Korotin <igor.korotin.linux@gmail.com>
---
 MAINTAINERS                     |  1 +
 samples/rust/Kconfig            | 13 +++++++++
 samples/rust/Makefile           |  1 +
 samples/rust/rust_device_i2c.rs | 50 +++++++++++++++++++++++++++++++++
 4 files changed, 65 insertions(+)
 create mode 100644 samples/rust/rust_device_i2c.rs

diff --git a/MAINTAINERS b/MAINTAINERS
index 82b469b8ecb9..23bab3c8e1ef 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11365,6 +11365,7 @@ F:	include/uapi/linux/i2c-*.h
 F:	include/uapi/linux/i2c.h
 F:	rust/helpers/i2c.c
 F:	rust/kernel/i2c.rs
+F:	samples/rust/rust_device_i2c.rs
 F:	samples/rust/rust_driver_i2c.rs
 
 I2C SUBSYSTEM HOST DRIVERS
diff --git a/samples/rust/Kconfig b/samples/rust/Kconfig
index 55aeb12cd7f7..394618aaf5ef 100644
--- a/samples/rust/Kconfig
+++ b/samples/rust/Kconfig
@@ -62,6 +62,18 @@ config SAMPLE_RUST_DMA
 
 	  If unsure, say N.
 
+config SAMPLE_RUST_DEVICE_I2C
+	tristate "Manual I2C Device"
+	depends on I2C && I2C_CHARDEV
+	help
+	  This option builds the Rust I2C device manual creation
+	  sample.
+
+	  To compile this as a module, choose M here:
+	  the module will be called rust_device_i2c.
+
+	  If unsure, say N.
+
 config SAMPLE_RUST_DRIVER_I2C
 	tristate "I2C Driver"
 	depends on I2C
@@ -124,3 +136,4 @@ config SAMPLE_RUST_HOSTPROGS
 	  If unsure, say N.
 
 endif # SAMPLES_RUST
+
diff --git a/samples/rust/Makefile b/samples/rust/Makefile
index 141d8f078248..ee830da1a9d2 100644
--- a/samples/rust/Makefile
+++ b/samples/rust/Makefile
@@ -5,6 +5,7 @@ obj-$(CONFIG_SAMPLE_RUST_MINIMAL)		+= rust_minimal.o
 obj-$(CONFIG_SAMPLE_RUST_MISC_DEVICE)		+= rust_misc_device.o
 obj-$(CONFIG_SAMPLE_RUST_PRINT)			+= rust_print.o
 obj-$(CONFIG_SAMPLE_RUST_DMA)			+= rust_dma.o
+obj-$(CONFIG_SAMPLE_RUST_DEVICE_I2C)		+= rust_device_i2c.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_I2C)		+= rust_driver_i2c.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_PCI)		+= rust_driver_pci.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_PLATFORM)	+= rust_driver_platform.o
diff --git a/samples/rust/rust_device_i2c.rs b/samples/rust/rust_device_i2c.rs
new file mode 100644
index 000000000000..a056736b1b97
--- /dev/null
+++ b/samples/rust/rust_device_i2c.rs
@@ -0,0 +1,50 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Rust I2C DeviceOwned usage sample.
+//!
+//! This sample driver manually creates i2c_client using I2C board info
+//! and pointer to I2C Adapter structure.
+//!
+//! For reproduction of the scenario one should compile kernel with i2c-dev and i2c-stub
+//! modules enabled. f
+
+use kernel::{c_str, device::Core, i2c, prelude::*};
+
+struct SampleDriver {
+    _owned: i2c::DeviceOwned<Core>,
+}
+
+// SAFETY: SampleDriver contains only one field `owned: DeviceOwned<Core>`,
+// which is initialized in `init()` and dropped on module unload.
+// There is no interior mutability or concurrent access to its contents
+// (all I²C operations happen in single-threaded init/drop contexts),
+// so it is safe to share &SampleDriver across threads.
+unsafe impl Sync for SampleDriver {}
+
+const BOARD_INFO: i2c::I2cBoardInfo = i2c::I2cBoardInfo::new(c_str!("rust_driver_i2c"), 0x30);
+
+impl kernel::Module for SampleDriver {
+    fn init(_module: &'static ThisModule) -> Result<Self> {
+        pr_debug!("Probe Rust I2C device sample.\n");
+
+        let adapter = i2c::I2cAdapterRef::get(0).ok_or(EINVAL)?;
+
+        let device = i2c::DeviceOwned::<Core>::new(&adapter, &BOARD_INFO).ok_or(EINVAL)?;
+
+        Ok(Self { _owned: device })
+    }
+}
+
+impl Drop for SampleDriver {
+    fn drop(&mut self) {
+        pr_debug!("Drop Rust I2C device sample.\n");
+    }
+}
+
+kernel::prelude::module! {
+    type:SampleDriver,
+    name:"rust_device_i2c",
+    authors:["Igor Korotin"],
+    description:"Rust I2C device manual creation driver ",
+    license:"GPL v2",
+}
-- 
2.43.0


