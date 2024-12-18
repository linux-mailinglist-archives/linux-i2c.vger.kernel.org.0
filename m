Return-Path: <linux-i2c+bounces-8613-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF1F9F70F1
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Dec 2024 00:39:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82E13188FBA0
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2024 23:39:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 669D91FECDE;
	Wed, 18 Dec 2024 23:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="II061yV3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852C71FDE29;
	Wed, 18 Dec 2024 23:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734565048; cv=none; b=q2NQzfmvSH2PEb4wUr1pJkcfBF/asCIdQNyKK9huH1xYW1ebTAvFEXiqPLh+7r2j2xDR1xNu/Hnt7k1qGcjhQii6Yz/09JuCJ/c4glL87tdsKoC8y6PBuxFIIUdFMgq1mvumwdP2Kiq/2Ewt3wDa+PUISeSTBTCBgohbi+BPExE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734565048; c=relaxed/simple;
	bh=jg2oRp5e5fuog+zg79Tz0wrUxR488MRr97JufU3GLxU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XS0VTxwB7bfeYNQVnBgKFFz+nFipZMxiFvS8B0xhs56bFCoJiTjRBPeBvhb9FKjS5uvQg6FcDtKvHnGI03lZZotBuDxJvWO4EUvmxt70KnJ5piN++lQPZsEGviGP2yCC9JTwN7/cPSRR30/DNlBEMByxoWQAPppu8ce0WHRlKM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=II061yV3; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2164b662090so1805535ad.1;
        Wed, 18 Dec 2024 15:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734565046; x=1735169846; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=12KHJUczqWRitS9k61VKlbaTiRVMkGTV7QU9FFZ0F4Y=;
        b=II061yV30WJGrbZRWMMqSgSFchY61Sry9HtVbDiGL6InG98zIugXAhCrK//xAhv2vZ
         Znnyqwm0CIXC2olxjd5m9aMQoB6QsizUt9k9EHwO1CDQj5moCT0pqr2cmetxV2bMf9NL
         TtASnrb4ltyyJL5slcWsQo/Tqquvzf5YvHgvcB5a5YP3U3W1XcpZk9ywwhcPjAXJn/yg
         xDDnaDCgryPulQaQtvanD4x+OpoiFvvOGf5+63bQA4iojugdtiiqY8O0cSDx2uAxMUwx
         hZ4ONf5+MMJaqau8i75WwM/4GtRoSAtLMqMQNu74vPlhmwGEAAY8aWRy47aL7RWReNcd
         NKvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734565046; x=1735169846;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=12KHJUczqWRitS9k61VKlbaTiRVMkGTV7QU9FFZ0F4Y=;
        b=b9r3bIoyWVGPaVQ5htPmbl+JDcWs0sRD4IxVdwzroy0sohVoLEDomRCrpr7V84L6ib
         MEB/U0Y6KTd+Ppy7L+g/9zUc6jFkQfHooxquLaBtmqix/+iWv3Tx0T2lShuukWgCD9Va
         FO1boR7AYZUMzJl/5fmINuJgKy7qdd/tMmAwTPl8usns/oF8Q6AA+FcXWuqA/3nslHoQ
         UB8QABnrZaFWC+Q4cQVSB1Uo8LjW9/nzr5Iv7AWl0ukdARh0nl/dm2lXsz0KDx07sv7U
         VY0sZEfNy5kKN9UZ21Sm1KHN8627oU10ghN1Y0CfIRQiy/BRmzYPPKluPUwwYEYCOtl/
         jyAw==
X-Forwarded-Encrypted: i=1; AJvYcCWszyX8WWcBOnA1AHzZqNluBrm+MMVCy4z+VkClZ+7aLNJml8g5FSpClHIPCn0g2ODEQK6y53b0lIhQ@vger.kernel.org, AJvYcCX7HiOMrvBiXeVBm7hkWyTrp/FiiFxzEXzMBrU0DxJUoeEQ8G+fSAe3Xk527ZvbXADE4fKgDez+vCIfMo1l@vger.kernel.org, AJvYcCXWKpwLcYn5snPq1fCDAmcSgkn5T2GjUKDpsAEc3TzmAOQoOe8gwtXD1BIn4gIcbrHKspQaEJYXqYj+UmZENns=@vger.kernel.org, AJvYcCXxTwFG2dg/QArB8otjQ9RI/1uJ+9N6jCLJbH4x8+ygQjkszyQRJdmdDaLaZ0mvDhtAzDX13vLbcq0RbgTe@vger.kernel.org
X-Gm-Message-State: AOJu0YxOAKRu0X96i6lUwHYdkl6+lIqj+DoDPrsdeeViyHCBtAIRP50c
	gOiPWFpXvQMXg2M4Ovss99zXdhfWjvEJnt6wJXiXz6ilvluHXl82evMsoHK6i8U=
X-Gm-Gg: ASbGnctel6q/NVak86SlG6RmS9loiXFJA1e+KAK1XZMgfCGTmz974FnatQS5O3nKMNU
	ntYafehZp7EWSL9PJjbnuknwco4lOzHutHyIbuoVP6VTq8SscmDry/S8ZEd09dgn1nSRxPl4kOc
	vmii4gjFOpC4RmAT+CUzkkX2L0BWrF5f7xsXrMLHK0P4nyTobmok0U3wnIIn9pp9GQ0Q3f11sOx
	c5mXjGTa48xbl2Oj6OAiWonNrW79G2z6a/PMQEYmk7pdVDHPYTO4WaJ
X-Google-Smtp-Source: AGHT+IH9mSleE//GIh6Qq7FHtStK+3iupDiRh9ncyKsC553vYaM8qlvEWdk9TswOWc4efLT878WwmQ==
X-Received: by 2002:a17:903:2bce:b0:216:7ee9:2227 with SMTP id d9443c01a7336-218d724d328mr69209335ad.36.1734565045836;
        Wed, 18 Dec 2024 15:37:25 -0800 (PST)
Received: from [127.0.1.1] ([2001:569:fcea:600:2e06:283e:5daa:4d0f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f6967sm802335ad.214.2024.12.18.15.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 15:37:24 -0800 (PST)
From: Fabien Parent <parent.f@gmail.com>
Date: Wed, 18 Dec 2024 15:36:34 -0800
Subject: [PATCH 4/9] rust: regulator: add abstraction for Regulator's modes
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241218-ncv6336-v1-4-b8d973747f7a@gmail.com>
References: <20241218-ncv6336-v1-0-b8d973747f7a@gmail.com>
In-Reply-To: <20241218-ncv6336-v1-0-b8d973747f7a@gmail.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Fabien Parent <parent.f@gmail.com>
Cc: devicetree@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, vinod.koul@linaro.org, 
 Fabien Parent <fabien.parent@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3505; i=parent.f@gmail.com;
 h=from:subject:message-id; bh=P1S4uQEgJR2OofcG/5ihA0BvuOtU7xhJ4vJHZDYeWxc=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0o0bkFGdEFwTDlrQTBEQUFvQmlKc2d4Q
 kw5cktRQnl5WmlBR2RqWEtVcldDRGpYdXlsZXNoUHh5QzM5TjQyCmxyOHNjQWQyU0R3bjI1UFpP
 RXhkbTRrQ013UUFBUW9BSFJZaEJONk0wZElMeXpzd3JmRnNxWWliSU1RUy9heWsKQlFKblkxeWx
 BQW9KRUlpYklNUVMvYXlrVDk0UC8zSm55Z2Q2SU1PYmkxa25teTAvZGROWnFhOGEwb3BqZ2NweA
 prT3BHS2Nna0pNV1FsWGlQZlRNb3RUSWg4d0VGSDhwU01kdWUwaHVwYU82b3NkekRQRFU3U2Z4T
 Tlyem1PQW94CmNFTWpWVVNRT0NQWmtnRjNYSUFHaS9hOGJ0NWo2OTlpNGhtSVpDZU4xMnp3MXJG
 MDBNOFB2OWhvc1VnM2ljNWwKaGxDcll0cUx2cTVaYUFRd3Qvb3N2NjFwU0JoZG41djEzTEVFcUZ
 aY2NnekwvVHBuakQxUFpYaUJ0Z1hqYVhoUwp5SWd4cjZuK3RJN2lwSTh0RnlWS3U2Ni9SdnRDRE
 hvczE4cTMxNExOeTBKSDlIU2ZlemJDMVdjVGUxWFJiSk5UCkN1allrRlJzMjVRUUtZU2svQ0V2U
 jhFdzVmSFpzeC83TTNIeHRWV0lOUWxxUHptb3IyajdOZXRmK0lJREZOU00KdjFEb205T3BkMVNP
 N0NQWU45UWx2UWIrLzdaYWtCbGRWMmROQytick1mRkFUdFFTdlFuL2k2SW9FY0xucjFEYQpLTm1
 KMjE1MDdOR3pockNjR253Z0FBcUVEeVNqU3JsUFJzN3F1VDEwdVh5KzdEYm9xd2xuUmhTSTBuZ3
 U4SkdhClZCK1p3MHl4cVd2RWFaMmR4dmtLOTkzMWVGVUovNndyUlRodXRGT3p1dDl2bUxJOXBMR
 FBLdC83S2VpUEdUdzcKZjh0NU1SVUV0S2xYZ1ZCOHllRFVHUXhGbGxCNzV1cjJtY09IZ2FON1pm
 Yi9tOFFLWTQ0QTgveTBBR0dEMnZ6Nwp3QlA0VHdjM01Xd0MvenBmd1N2QXJYWkJlRW41UGhidGh
 FS0d5dnpyYlJaSHhsVEVzTTFvQTZKdEFCb3hhQjVqCkR5QmV4dU9nVUo0d2NnPT0KPU1BNmgKLS
 0tLS1FTkQgUEdQIE1FU1NBR0UtLS0tLQo=
X-Developer-Key: i=parent.f@gmail.com; a=openpgp;
 fpr=07BB034F9E8E3AF0DF4CF7607AE864A1E16FA383

From: Fabien Parent <fabien.parent@linaro.org>

The type regulator::Mode is used by both the regulator consumer
abstraction and the regulator driver abstraction. This commits
adds a shared abstraction for it.

Signed-off-by: Fabien Parent <fabien.parent@linaro.org>
---
 MAINTAINERS                     |  1 +
 rust/bindings/bindings_helper.h |  1 +
 rust/kernel/lib.rs              |  2 ++
 rust/kernel/regulator.rs        | 42 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 46 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index acb3942eb1b66ec2bc09ac50f51c2054b7b45355..90c231f0aa7381aa8d206fb94c5d1f013dfcae41 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25159,6 +25159,7 @@ F:	Documentation/power/regulator/
 F:	drivers/regulator/
 F:	include/dt-bindings/regulator/
 F:	include/linux/regulator/
+F:	rust/kernel/regulator.rs
 K:	regulator_get_optional
 
 VOLTAGE AND CURRENT REGULATOR IRQ HELPERS
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 48d2b91b34067e7e9ee9c64c2e42681e988e9aad..b18d772bc3a0e78d749cc9e5ae81a4237a57f8c5 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -29,6 +29,7 @@
 #include <linux/poll.h>
 #include <linux/refcount.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 #include <linux/sched.h>
 #include <linux/security.h>
 #include <linux/slab.h>
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 456e979724d1079045cb157086ff2b2ed0fcca3b..3aa36648e9571e305a89f5d1353c0dd44e136384 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -68,6 +68,8 @@
 pub mod rbtree;
 #[cfg(CONFIG_REGMAP)]
 pub mod regmap;
+#[cfg(CONFIG_REGULATOR)]
+pub mod regulator;
 pub mod revocable;
 pub mod security;
 pub mod seq_file;
diff --git a/rust/kernel/regulator.rs b/rust/kernel/regulator.rs
new file mode 100644
index 0000000000000000000000000000000000000000..d695ac955193efcfda62770784a92d70d606b93d
--- /dev/null
+++ b/rust/kernel/regulator.rs
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! SoC Regulators
+
+use crate::{
+    bindings,
+    error::{code::*, Error, Result},
+};
+
+/// Regulators operating modes
+#[derive(Copy, Clone)]
+#[repr(u32)]
+pub enum Mode {
+    /// Invalid mode
+    Invalid = bindings::REGULATOR_MODE_INVALID,
+    /// Regulator can handle fast changes in it's load
+    Fast = bindings::REGULATOR_MODE_FAST,
+    /// Normal regulator power supply mode
+    Normal = bindings::REGULATOR_MODE_NORMAL,
+    /// Regulator runs in a more efficient mode for light loads
+    Idle = bindings::REGULATOR_MODE_IDLE,
+    /// Regulator runs in the most efficient mode for very light loads
+    Standby = bindings::REGULATOR_MODE_STANDBY,
+}
+
+impl TryFrom<core::ffi::c_uint> for Mode {
+    type Error = Error;
+
+    /// Convert a mode represented as an unsigned integer into its Rust enum equivalent
+    ///
+    /// If the integer does not match any of the [`Mode`], then [`EINVAL`] is returned
+    fn try_from(mode: core::ffi::c_uint) -> Result<Self> {
+        match mode {
+            bindings::REGULATOR_MODE_FAST => Ok(Self::Fast),
+            bindings::REGULATOR_MODE_NORMAL => Ok(Self::Normal),
+            bindings::REGULATOR_MODE_IDLE => Ok(Self::Idle),
+            bindings::REGULATOR_MODE_STANDBY => Ok(Self::Standby),
+            bindings::REGULATOR_MODE_INVALID => Ok(Self::Invalid),
+            _ => Err(EINVAL),
+        }
+    }
+}

-- 
2.45.2


