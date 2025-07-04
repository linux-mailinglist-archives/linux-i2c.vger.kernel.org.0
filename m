Return-Path: <linux-i2c+bounces-11836-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D386AF9736
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Jul 2025 17:43:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA2B0542E7A
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Jul 2025 15:43:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14290230BF8;
	Fri,  4 Jul 2025 15:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nklSaG36"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142F01E3762;
	Fri,  4 Jul 2025 15:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751643819; cv=none; b=JGH2Lgl+Gb6WMerR9723kL5vuvW6NmEX1YknCWEePVpx9PinBF8gAp8ccd3ubBxrJmkE/F+V9xzyTvaGPhANqTNip0G/uioesV4fJCuIP3aB+R61Kh2CxLUZ0V38golFaoZEIIhVe1SHiq/ZyJoc46YrPAZm3gnO3Dgxp4KAnu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751643819; c=relaxed/simple;
	bh=LjA+/5tDXbnNsqNuIEG+W6Ox8IQsd8bQElonyR5KYzs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fbM1MmiopfKSY8fPwm7sGm0Q+TFQM7NqwsK27xUPtdE7zre+EKIKzb2Osl7JOQ0R3VJf6WMGXP5055Yln1zdtS8Gl2cudUaIJ4uRNknY/MVOo4fzlaCEZtGmFoYoH0bSDUkptZc6EYiCDlGR4beoNNenQVTagBLhIdS2CxLjVhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nklSaG36; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-450cf214200so8207565e9.1;
        Fri, 04 Jul 2025 08:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751643816; x=1752248616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qxhWkz+tlx+vDWtPt3y0/2Jq0yIsXTdVdLxkIQQdoBk=;
        b=nklSaG369TEafZkBS9vHR2odlMQej3zEpkqOF2erzwaDLgPovzeT/Em9KpFl48iCIY
         xYsxEQckCIQrPIFM/4g+boYAu/NuYJnxOY7i8yv/8P7e/Q7HkgYPzTpr1z40FXas65+D
         yQZR2rRxAIOvEawZNJ10s7yborLBwygatO28JXBIhhgl/Bt3+Pd5dW/Lz9TDxgsahVrE
         1A+YD0Af+E/mpfnkxxxjfoajgp6T5iJfbyatnVhsntQC4/bRD9/OoBcAb9XcBbREcWKC
         h00imSkigKY2gD+gAoBT+1fpk434olYEGOPziaoww/ZxkRuXz9q/pppMdV3Iw2OPli6J
         M3fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751643816; x=1752248616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qxhWkz+tlx+vDWtPt3y0/2Jq0yIsXTdVdLxkIQQdoBk=;
        b=il3+7y4jpgsciv8w0o5xxJ0EU6BbKtO9hHWslV3h8VtlzWRAHIq0Rr1s8Njt1kKnaq
         tK/d6WGvjM4tFTRWBRqnmX8HapTAcKBLZtCfHbGPIgfHi5wp4BzcaAd+IRMl08VM3chv
         3KBHQ9SCtA4bNvy1vd06FRbTJLErAg6P5Dirp8IpSZbWwITjhJbwJdGQh2obVOa0kfPj
         4NUbFdcaeUwwZT628ktC7UeCQo3LkReSP2P/I7eHmRPopAi3d1GznMayHplvOPbW58VJ
         UEJ3XMmx+ICJNBTiUCdG/x7NJ6gs5/9CIT/0pErxUG5fyA2OPJqsnrKDBohkD9Og+q+K
         LJaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQ+vs2M5mla/v6F7E7G16uX8C8bCv6KHf2q7MTGHAxkPedlMzlFYtEjs7BE6oLJnVgqvyYWbfDjDmuDmrQ@vger.kernel.org, AJvYcCWiHcOHkXjYZCnaTULZMFx27FYQxDeOlSSxFKBE+lXNPXn0Vu++j/ETyTi0uSt0KIaTahzpKtrY8p9T0nj+Anw=@vger.kernel.org, AJvYcCXS0WXf2b6tg1HO2zSGdREozFAm/3PLhf0DftrHVUok9omBHOkZeOG/AULa8wgksdSv01ykhqL8+GI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXmrPIu8ghllplszpk1ancXIbQnThP6Z2iIP/w0L1x+EoLhV8E
	nMfSusjEjlafJpqYFdCEx7RJouUa5iMpk3/Du3r8KET8yeYzFnCbWlRIJoCD2viipOg=
X-Gm-Gg: ASbGncuyx7rGkscUDv3s1I6/OSpkdUSfUdtf7SPZcL3L2AHU/lic6yWD5WZEbOnEDUG
	OQTOEd/stjebNEfR7bmlhskUTY9nuwfjccPU5aM8Okfq9iysUHHKBqUfesBvAyJkZQJ3iv9AqIK
	I1UaoEHculVb+OlftJapxdlfzK08b8nGOiCINSjGyti6Xp7yYmUjWuIkX1UHjfWDKfebRXQfQCh
	1DMFRjtl+nXuclwLMFHBFTqeW8vnF1ygiKqHxhZ9JcgUOCIRsOVWRC0IBpn+RLnzyz1O1lO/aJ7
	XwFT2xSxAEZbxa+0Zo5Gux/NsWsRoWVwv5OD7mng7gLKMfB3zZ+VIwq/XPRqj4r3rZUJpQvWb+w
	37FzyCNTGBhIwtsav1X59KK3/D6jAgNxoVFeUrwvQerv4NMU=
X-Google-Smtp-Source: AGHT+IEZHbQ7bH1s4YT4UWXAPG4icmKBpSPilG9I3q4k3KctFtB/h7G0o0V5vwHvtJPLsh5RTMsGaA==
X-Received: by 2002:a05:600c:1c90:b0:453:86cc:739c with SMTP id 5b1f17b1804b1-454b3069f37mr29398395e9.1.1751643815724;
        Fri, 04 Jul 2025 08:43:35 -0700 (PDT)
Received: from igor-korotin-Precision-Tower-3620.airspan.com ([188.39.32.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9bead7csm57979425e9.39.2025.07.04.08.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 08:43:34 -0700 (PDT)
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
Subject: [PATCH v2 3/4] samples: rust: add Rust I2C sample driver
Date: Fri,  4 Jul 2025 16:41:32 +0100
Message-ID: <20250704154132.1197920-1-igor.korotin.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704153332.1193214-1-igor.korotin.linux@gmail.com>
References: <20250704153332.1193214-1-igor.korotin.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new `rust_driver_i2c` sample, showing how to bind an I2C client
in Rust via legacy I2C-ID, ACPI ID tables or OF compatible tables.

Signed-off-by: Igor Korotin <igor.korotin.linux@gmail.com>
---
 MAINTAINERS                     |  1 +
 samples/rust/Kconfig            | 11 ++++++
 samples/rust/Makefile           |  1 +
 samples/rust/rust_driver_i2c.rs | 69 +++++++++++++++++++++++++++++++++
 4 files changed, 82 insertions(+)
 create mode 100644 samples/rust/rust_driver_i2c.rs

diff --git a/MAINTAINERS b/MAINTAINERS
index 688a0ff23e69..82b469b8ecb9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11365,6 +11365,7 @@ F:	include/uapi/linux/i2c-*.h
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
index 000000000000..eee3bd774c46
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
+    pdev: ARef<i2c::Device>,
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


