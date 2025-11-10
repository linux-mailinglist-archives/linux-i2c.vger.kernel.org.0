Return-Path: <linux-i2c+bounces-14034-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D699C464AA
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Nov 2025 12:34:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0496B1883319
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Nov 2025 11:32:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEF5C30ACE5;
	Mon, 10 Nov 2025 11:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="msWDt2hS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99F030AAD8
	for <linux-i2c@vger.kernel.org>; Mon, 10 Nov 2025 11:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762774282; cv=none; b=HISGGETeRhCJBriAqxHEAqblKxSqSt+vAdQxU9uFraABHfeuTwvaUGQd+D6fSrAs4mQLE3/5rskyzWCWQ3BYXrsCo7koPkyCAw8joD+L6RabrbFnpKNmgETq7O7USXoeqztPAvW9XhLNOo8/N0I2KoiTSqNWQm9FsSxjzv9yE+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762774282; c=relaxed/simple;
	bh=QDgyZn87hGLt4zqNVLGdGA9KZtHVZaERp/iNSIowMsA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s6l0Ytpc518tMu0xJ1SgN05whNu2vzO+Prj3QL//pXmP1dFNNOv2AhP3O4E0gove9t6nPcuT2ZGvZCSskjySCgW0Yl+ezdGo8y9+ExJ2KJfokdacjEI+qa5HgptzYA4EJEi0px6jNJ39mt4vzzK2WPdSZtNciZ2CRlfzK6Hwwaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=msWDt2hS; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-477549b3082so25737635e9.0
        for <linux-i2c@vger.kernel.org>; Mon, 10 Nov 2025 03:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762774279; x=1763379079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+B5LEwdFrUWa2nsD2z+5oWtZAFge/Sr1BBSlvPtJNts=;
        b=msWDt2hSRTzVdXLtqk4AurIvHeiEYrhsxft0i3HOokAE7sMP9QxgaPAx9WeEEYmc7V
         rr6j6cWdUvGBNl2JKtqSRhjFAOq7ZkltG27+FRUIMDtN9LshbBNztbM27JMK5y08EGeT
         WbfmuAPhxvp0blPm2BT60VWGEVNBtUpjYct4Qz2K+pZDxWnGiRN2Ht4TbgOqI3c3g9Rm
         biC7I94Ie8JaqMciODVnPHsVUJdqu6bJAy5epsARgNeg7q9rBkzPhIGPZbPTZEKSNYdk
         5aXa0zM49ibAP02E+8jTb+ve1W+zyEx3ilcgIvJ9hn4pbAGORUFTPAIaBwz/+eW0HdUa
         g6Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762774279; x=1763379079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+B5LEwdFrUWa2nsD2z+5oWtZAFge/Sr1BBSlvPtJNts=;
        b=i/vO7U8/+404Y1Zqg+znt8CUxmRmDGvmVDXaz1p+L/hy4F5rRDYzhSjaAXus+GBE0v
         hC9sYFWrkWCV5lJLYKy2s3PykYY4uVTtlGD9nN3U5sOHF1mSIP15Dd606vhDTysHZvd/
         oGByOo8k+P+yA88GcXzKYDQhwFwhDBxxGEXDA4cvu45Q7U1YfQMKT+d3f6OpeDdLNuHp
         mw0G5iMK/Xq0SrBHVfDBJ+ZJToQnJbYOkSJEFw4Lan7fk3BCBxgAbhIMuVQ1B8NTHE50
         4apsRov5K8K7+wcw1lDSSaEARycNHyC+tBD7ZaRGoTHUQqjcjcNAkx+oxPqOWf0SboCd
         FRtQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2XOgzliP9wmzBJ6YxitcdMKL4RUGPcbU+GVXFUt807MX8eEeHMroQsZYbu/AXyggeJJ+OOyP2upM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyiO2LujsPtOMjXO0+qjzt5wOTkNBUryyV1WGWWzRLqPLtALma
	KRAi4ZlKmMHXQI4U67JbkY96cIwD6RnvYsFqOoASmOhI6ZtBDenoDgSU
X-Gm-Gg: ASbGncvZw0281M/OQBo0G+RKyXImBCB7h2MYHXyUMHfs6g/Y0JMHBQU4JuEwTP1lMj1
	XgYy9LXcOb0YK8ici/fIw7/hNkOu+2vnMKYlz+rE9Qa5MLyQ85udCFph9Er6jjvQVyhTaVDblRd
	vCBg+dsP4QF+W5SIlfO2MMw0kczf7XgAr6RyZK53Ly50p+XB/y4XzIVVmONGIaXosLXQSATPewr
	wS+q9Di8hej+jUL5YYKLYxInLNaX/dt+jIOxw9ux4Be49/9Tptz/mmRLFY4walnhXR/gy7+aF1Y
	SmTEIduWd/ghCSlVIvRgDcVFSdXXLH9vOcjuCKFkMQnggdi6Jxw0Su8OafxREpMBoJ/mdU+lz6o
	UKbo8Ie2cV3UwrXjczgRzsXRexqp+lnK9jccA/p17WFsjBUD7vk3loakf04PlYCbXYewi397+sm
	M8BhEZAXz39L5VovNyWL1WoKnbqA==
X-Google-Smtp-Source: AGHT+IEhi5skpO8ovjV3Z3ijxfBPFuObtlXjH9GjayH0SxEofIgcBu601R+yhpFJGs3AHgakPJ96qw==
X-Received: by 2002:a05:6000:25c4:b0:42b:41a6:a670 with SMTP id ffacd0b85a97d-42b41a6a685mr74859f8f.54.1762774278734;
        Mon, 10 Nov 2025 03:31:18 -0800 (PST)
Received: from Vasilio.Home ([176.26.203.25])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac679d544sm22516706f8f.46.2025.11.10.03.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 03:31:18 -0800 (PST)
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
Subject: [PATCH v7 3/4] samples: rust: add Rust I2C sample driver
Date: Mon, 10 Nov 2025 11:31:16 +0000
Message-ID: <20251110113116.51743-1-igor.korotin.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251110112437.50405-1-igor.korotin.linux@gmail.com>
References: <20251110112437.50405-1-igor.korotin.linux@gmail.com>
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
 samples/rust/Kconfig            | 11 ++++++
 samples/rust/Makefile           |  1 +
 samples/rust/rust_driver_i2c.rs | 69 +++++++++++++++++++++++++++++++++
 4 files changed, 82 insertions(+)
 create mode 100644 samples/rust/rust_driver_i2c.rs

diff --git a/MAINTAINERS b/MAINTAINERS
index 828f6d8b1c32..641757beb56b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11744,6 +11744,7 @@ R:	Daniel Almeida <daniel.almeida@collabora.com>
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
index 000000000000..79d0055793d7
--- /dev/null
+++ b/samples/rust/rust_driver_i2c.rs
@@ -0,0 +1,69 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Rust I2C driver sample.
+
+use kernel::{acpi, c_str, device::Core, i2c, of, prelude::*, types::ARef};
+
+struct SampleDriver {
+    _idev: ARef<i2c::I2cClient>,
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
+        Ok(Self { _idev: idev.into() })
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


