Return-Path: <linux-i2c+bounces-14035-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A5843C464B3
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Nov 2025 12:34:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5DEC81881684
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Nov 2025 11:32:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42B8E30C373;
	Mon, 10 Nov 2025 11:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jxLArBwx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD4430BF58
	for <linux-i2c@vger.kernel.org>; Mon, 10 Nov 2025 11:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762774292; cv=none; b=piKtIXTgdGGxSvdlMxyTR1gAXhNK7wzgfm9haDgHCZGrYy+EZR+FNM0FKvgYyGF5DzIyNTfq88nUm7PbLN6xbAj5m8X4Neh0wu6GV1ZYs7nQx1sGW7o6pidAxDDz/Abp4871NMTVQVwshc/rRXnvec/QMu8CvMayr9tIGnL4eEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762774292; c=relaxed/simple;
	bh=bFIQQ06Agyt2upC6J1Gjh5h7YG0NBP+vayKdmqFopoM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ipyuHBl16iLDiIj8v/uxQ4fXWpf0hM5TVS0KV7/SFVwJRiWbJiPDq4yNkH+M0gKLYy3U1ha45dfjr8LxdhZDgqbgJ6MG2Zz127LYkHGBU41VU8Z0pjcIVeSGLL36nveUVv96C8joHbuvF3Qnd3hEf1zjwl4AGa1AWvpRixAb8Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jxLArBwx; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47777000dadso10068515e9.1
        for <linux-i2c@vger.kernel.org>; Mon, 10 Nov 2025 03:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762774288; x=1763379088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5LWQjcrvAOJQ7nTF8lLDP1PEbSkHG+HZiQBcb+5o/+U=;
        b=jxLArBwxlDZ9V4eEJ0Zg1roUqPvEfMlIaGCpxE75fEOHlZhHYadsA6ErkaofLlAyTg
         fE5H6Kr+eBby1xYxhjCS+aE5Wkthx8xNXILEgIFbgs8GgD80DBbOOCgu2sDDwEOV4lCk
         7wmd0lUYumwcg8nctxuuDIoBiivC7KP+2hGEbhQ2w7xQUU12ZKs72qO8oe9eHb5rKp+U
         Wufb6yrs+2OiRKccQqhciKCA7l3RB+wwveGYwfp6GgGnJm2UqytkMYLX1yh8rfKRotWh
         Ciagopuk8EuayeU3gv3ilzwbkG4zTnz1Qyr3VUiBgNu35K7Xch9hc9by2nRqfq6Gjgra
         +2Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762774288; x=1763379088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5LWQjcrvAOJQ7nTF8lLDP1PEbSkHG+HZiQBcb+5o/+U=;
        b=NBeRGylA4HeuCVX4DWhd5tjRb0i+HCH9yg1kzU1TRRjPGvXHhlauJI2lsBe/W33els
         KjqRmFk3kY9NkN9gjOegUo+frJUVnY7Jjnc3LeFy2whXajI7ZKXsj4k2UPb69fQb+dOP
         QZ1O3pGIqwtdDmzqhwRiQp+bAUqQTs+kELbsoUyBlLrfu1sRE2Uq0kRbLfkRGQTuwIpM
         w6jClpMl+WPFvGc5v4omSTmrWLvugRxg84ytDnOspAw05GynuOeDw92K2v3HRf8E3l6I
         50U383zra/frVobwrKuGCGmpqW+LiVk3g858+LhE6WIwOCelmdeVWkNpaXjC94NxxLIz
         scug==
X-Forwarded-Encrypted: i=1; AJvYcCXPJNzwrOHariYRx+mXpv/GrCn6e4nwahcTL8fkHFNGRcjndE08x9LO/qXL4V8DT4ZnqMH6YEWClso=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl0dmYJUxOg6VRVV190sUZBPs7SumCocHhJSjQzYLY19ulKUEX
	phEnAibyILnHEQR/KJ1AW+q6rwpevgVqd/xOYj72lOa5u/J40Npv9zTd
X-Gm-Gg: ASbGncvO5fJfrw63NQnuGKxciH81t51SHrf/vev0azK/OSX629PfpPRs2wp1UTzDHSV
	pZY9H2HPWJFjJTcRRR+99eGi34AWfwa3Z5+ZayAXChIAEa/sZTVVjBqerCA/6+ei4FZWZ5HVZDV
	WYC+AybRp6z1ghu7tYuiByBkkMvjSsmetmUah49TL7pnEt2Vmmnqce4W3SIOhPcvlBw+mr7FwpJ
	9KndxBFfh8MBVuKx2U7pIm6J1CJ9zaWqQjiTMfVxG9s+0eI5CKuK3AM9yaAnYvqg0TbTObPWIlw
	ZDGkwXhiEGfmd/lmL7DJ+7Janoovfu7fJTuAGOUXw7S89U/OEPoApHAs4uD6XSwl1Y4M+vpudSR
	srSn5AXIWIVNqvel/0blnNVa0t8Cw5rS61c/32HUh1xnEaLictsP7AjnNblXYCuMEXrWhl0q39N
	IORb89UU+KpQNStkw=
X-Google-Smtp-Source: AGHT+IHNdc/e330G/TR0zgRaxlQY2smuqz4tCYVox7ImE1AomlpN3YaqWPqupsE85ysERCk7P5VP4Q==
X-Received: by 2002:a05:600c:1f83:b0:471:786:94d3 with SMTP id 5b1f17b1804b1-477732832afmr66138085e9.22.1762774288132;
        Mon, 10 Nov 2025 03:31:28 -0800 (PST)
Received: from Vasilio.Home ([176.26.203.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47774d3557csm127361405e9.8.2025.11.10.03.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 03:31:27 -0800 (PST)
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
Subject: [PATCH v7 4/4] samples: rust: add Rust I2C client registration sample
Date: Mon, 10 Nov 2025 11:31:25 +0000
Message-ID: <20251110113125.51785-1-igor.korotin.linux@gmail.com>
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

Add a new `rust_i2c_client` sample, showing how to create a new
i2c client using `i2c::Registration`

Signed-off-by: Igor Korotin <igor.korotin.linux@gmail.com>
---
 samples/rust/Kconfig            |  12 +++
 samples/rust/Makefile           |   1 +
 samples/rust/rust_i2c_client.rs | 142 ++++++++++++++++++++++++++++++++
 3 files changed, 155 insertions(+)
 create mode 100644 samples/rust/rust_i2c_client.rs

diff --git a/samples/rust/Kconfig b/samples/rust/Kconfig
index 181466319588..a952220cdff7 100644
--- a/samples/rust/Kconfig
+++ b/samples/rust/Kconfig
@@ -95,6 +95,18 @@ config SAMPLE_RUST_DRIVER_I2C
 
 	  If unsure, say N.
 
+config SAMPLE_RUST_I2C_CLIENT
+	tristate "Manual I2C Client"
+	depends on I2C && I2C_CHARDEV
+	help
+	  This option builds the Rust I2C client manual creation
+	  sample.
+
+	  To compile this as a module, choose M here:
+	  the module will be called rust_i2c_client.
+
+	  If unsure, say N.
+
 config SAMPLE_RUST_DRIVER_PCI
 	tristate "PCI Driver"
 	depends on PCI
diff --git a/samples/rust/Makefile b/samples/rust/Makefile
index aec865e2adef..f65885d1d62b 100644
--- a/samples/rust/Makefile
+++ b/samples/rust/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_SAMPLE_RUST_DEBUGFS)		+= rust_debugfs.o
 obj-$(CONFIG_SAMPLE_RUST_DEBUGFS_SCOPED)	+= rust_debugfs_scoped.o
 obj-$(CONFIG_SAMPLE_RUST_DMA)			+= rust_dma.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_I2C)		+= rust_driver_i2c.o
+obj-$(CONFIG_SAMPLE_RUST_I2C_CLIENT)		+= rust_i2c_client.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_PCI)		+= rust_driver_pci.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_PLATFORM)	+= rust_driver_platform.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_USB)		+= rust_driver_usb.o
diff --git a/samples/rust/rust_i2c_client.rs b/samples/rust/rust_i2c_client.rs
new file mode 100644
index 000000000000..e876a81ffe6e
--- /dev/null
+++ b/samples/rust/rust_i2c_client.rs
@@ -0,0 +1,142 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Rust I2C client registration sample.
+//!
+//! An I2C client in Rust cannot exist on its own. To register a new I2C client,
+//! it must be bound to a parent device. In this sample driver, a platform device
+//! is used as the parent.
+//!
+
+//! ACPI match table test
+//!
+//! This demonstrates how to test an ACPI-based Rust I2C client registration driver
+//! using QEMU with a custom SSDT.
+//!
+//! Steps:
+//!
+//! 1. **Create an SSDT source file** (`ssdt.dsl`) with the following content:
+//!
+//!     ```asl
+//!     DefinitionBlock ("", "SSDT", 2, "TEST", "VIRTACPI", 0x00000001)
+//!     {
+//!         Scope (\_SB)
+//!         {
+//!             Device (T432)
+//!             {
+//!                 Name (_HID, "LNUXBEEF")  // ACPI hardware ID to match
+//!                 Name (_UID, 1)
+//!                 Name (_STA, 0x0F)        // Device present, enabled
+//!                 Name (_CRS, ResourceTemplate ()
+//!                 {
+//!                     Memory32Fixed (ReadWrite, 0xFED00000, 0x1000)
+//!                 })
+//!             }
+//!         }
+//!     }
+//!     ```
+//!
+//! 2. **Compile the table**:
+//!
+//!     ```sh
+//!     iasl -tc ssdt.dsl
+//!     ```
+//!
+//!     This generates `ssdt.aml`
+//!
+//! 3. **Run QEMU** with the compiled AML file:
+//!
+//!     ```sh
+//!     qemu-system-x86_64 -m 512M \
+//!         -enable-kvm \
+//!         -kernel path/to/bzImage \
+//!         -append "root=/dev/sda console=ttyS0" \
+//!         -hda rootfs.img \
+//!         -serial stdio \
+//!         -acpitable file=ssdt.aml
+//!     ```
+//!
+//!     Requirements:
+//!     - The `rust_driver_platform` must be present either:
+//!         - built directly into the kernel (`bzImage`), or
+//!         - available as a `.ko` file and loadable from `rootfs.img`
+//!
+//! 4. **Verify it worked** by checking `dmesg`:
+//!
+//!     ```
+//!     rust_driver_platform LNUXBEEF:00: Probed with info: '0'.
+//!     ```
+//!
+
+use kernel::{acpi, c_str, device, devres, i2c, of, platform, prelude::*, sync::aref::ARef};
+
+#[pin_data(PinnedDrop)]
+struct SampleDriver {
+    parent_dev: ARef<platform::Device>,
+    #[pin]
+    idev: devres::Devres<i2c::Registration>,
+}
+
+kernel::of_device_table!(
+    OF_TABLE,
+    MODULE_OF_TABLE,
+    <SampleDriver as platform::Driver>::IdInfo,
+    [(of::DeviceId::new(c_str!("test,rust-device")), ())]
+);
+
+kernel::acpi_device_table!(
+    ACPI_TABLE,
+    MODULE_ACPI_TABLE,
+    <SampleDriver as platform::Driver>::IdInfo,
+    [(acpi::DeviceId::new(c_str!("LNUXBEEF")), ())]
+);
+
+const SAMPLE_I2C_CLIENT_ADDR: u16 = 0x30;
+const SAMPLE_I2C_ADAPTER_INDEX: i32 = 0;
+const BOARD_INFO: i2c::I2cBoardInfo =
+    i2c::I2cBoardInfo::new(c_str!("rust_driver_i2c"), SAMPLE_I2C_CLIENT_ADDR);
+
+impl platform::Driver for SampleDriver {
+    type IdInfo = ();
+    const OF_ID_TABLE: Option<of::IdTable<Self::IdInfo>> = Some(&OF_TABLE);
+    const ACPI_ID_TABLE: Option<acpi::IdTable<Self::IdInfo>> = Some(&ACPI_TABLE);
+
+    fn probe(
+        pdev: &platform::Device<device::Core>,
+        _info: Option<&Self::IdInfo>,
+    ) -> impl PinInit<Self, Error> {
+        pin_init::pin_init_scope(move || {
+            dev_info!(
+                pdev.as_ref(),
+                "Probe Rust I2C Client registration sample.\n"
+            );
+
+            Ok(kernel::try_pin_init!( Self {
+                parent_dev: pdev.into(),
+
+                idev <- {
+                    let adapter = i2c::I2cAdapter::get(SAMPLE_I2C_ADAPTER_INDEX)?;
+
+                    i2c::Registration::new(&adapter, &BOARD_INFO, pdev.as_ref())
+                }
+            }))
+        })
+    }
+}
+
+#[pinned_drop]
+impl PinnedDrop for SampleDriver {
+    fn drop(self: Pin<&mut Self>) {
+        dev_info!(
+            self.parent_dev.as_ref(),
+            "Remove Rust Platform driver for I2C Client registration sample.\n"
+        );
+    }
+}
+
+kernel::module_platform_driver! {
+    type: SampleDriver,
+    name: "rust_device_i2c",
+    authors: ["Danilo Krummrich", "Igor Korotin"],
+    description: "Rust Platform driver",
+    license: "GPL v2",
+}
-- 
2.43.0


