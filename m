Return-Path: <linux-i2c+bounces-8617-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0B19F7101
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Dec 2024 00:41:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 449CB188F63E
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2024 23:41:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E69520550B;
	Wed, 18 Dec 2024 23:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qhj/Eg0i"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535762036FB;
	Wed, 18 Dec 2024 23:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734565057; cv=none; b=BGJO0IN0lwC0WsrAIoNj/bmg+TDk6VEEpILeKzdgo9k52dlgxiGOmi37j55JFSo3m5vbV85VUOGfqeEXFQZ1096AXtOtmJS+wh1tPsMlyFuo4e9A4l6wyS0KpPCqilxm6HE3uHPu66R1XU9HECLPqlVS1BdbgLHrH4HOWTj5ris=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734565057; c=relaxed/simple;
	bh=TMU9VZ6PTqivckI1JKN5Ey2ahEr1d5gq+kwxzzwrZms=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ePGUOTE1GWSWmEOM/jQTKqe+A+l1TcgcIluWywM5vaf/NlzMzAPZlvkP3hD3iCj1hsGYK1PKMcXkgM01koxXdND0q7tivlpAwDc5KZYQgYM5jwaBWzOWuyo263yw8gpzVo/l+GuUSt/+EkMpyZ5RE8cT6d1raOUu0HSD26V6rhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qhj/Eg0i; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2166651f752so2478125ad.3;
        Wed, 18 Dec 2024 15:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734565055; x=1735169855; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hd/lAaOH2L0N9wnqk4iURGlewLV+M/XaIIsQzSkZkqM=;
        b=Qhj/Eg0iaNt79GqkTjc1SPoir9rJK8ih3icDDVJhOIS0Pk9oQQ8nb4s1hbPhGKrBPs
         weo6XOimWpDTXlOzFZlAp5ufFx/YIRjAsJ/qfiDleeS0WrNDmo2yvAeiYeSZk3YdFkRT
         akY7qQgYeV8X0b9zlvNE/yK+w859YoEuG+IhtrB8SsmShJ9sJc+edKleh7YGpd05av9p
         r69h9sQ2AZ3FAH6rFDgW2c2cJBRv+Ex9AFgAewyCbhAZORuzEf0wA9GDsqirzgAH3Oh+
         0a4kY2/f5lkMf45kWy02ThR8L5XaPEOz2veSSlbsMmToDo+mv4ebFmss+1FjomS4pG/F
         +hMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734565055; x=1735169855;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hd/lAaOH2L0N9wnqk4iURGlewLV+M/XaIIsQzSkZkqM=;
        b=pbgBs74PoCdR92JEXOs+NTZNxPksFSA0k8nts4rPbJBW7c6+CBsMdtuv8tjeArK/mV
         m8HUCju4QOk77aG4+Pv6LcSdrpJXA9MgDOsSqIwbY20ucSBT3yJRiYnInJtoA+cdBfxl
         f/XMYODm9xE6ORopXVMOfPYpGKFvHnYkQteYhUzbpTIAkmgGK41SQuJ/AM7ADsZIDI9b
         Y/hg2+BFI9xmn2ZIntGmX3a7Quu+UetCfwNJOSoRgI9kHsgh4VAB7+kDZWxB0PDUQWiZ
         aedLMQECHIKK704bC3yLhDNS1UnhGW5f3WPbEl6Zyhaltv1GLU2mPnoHLO5t7oxmZqYB
         z/Fw==
X-Forwarded-Encrypted: i=1; AJvYcCULGIyDwSvuutF7hEGYKsRoUsttNaXbKsReNyiGrUHBYFZ+DCd1hKdaauDntQZGQlJxOOVJ8fqjoXWB@vger.kernel.org, AJvYcCURB2OogKJF4NYqOq7L0fE7JenYggMHsOVVT6jHpHpaKMuby1grlhemk8d2F++QbePAypSBWq5ud+FELqXf@vger.kernel.org, AJvYcCUlwFZDUmuj/9ZLLomws5QpPI6tp4Tyzv6gtLe8JLRGml1MKBMj2guLJqNRNkXC49zvjf2E928mNsTNigQ+@vger.kernel.org, AJvYcCXzLvncpw5Bd81WD/RbXT6cQlKjtnT2AJavZyVojpnhNPaIetN5e6rND7ZiRE3V83wMtBKHBJMWT3mqB8QQSM4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKnTvFgcgzIbsNUvxJjPExBv/vg0qlycM4nE/ML+B7oLfxpbHC
	aF1vizH/gbf9zK1b/+For9nYSl2E7gbulmzddlb5r3N27L2QRsPh
X-Gm-Gg: ASbGnct7D11kvEvgjzO4tA4RokcJP3tAWpDIEnbLqAsmL67XccCgjMsbWF6tXMGMhAN
	eagqy/XvdacYovoHDNzjKr/o5wvumqIH7wZpe7JFHXRML49fJ09SWHgs0+83BWWYQfzGk04xyQW
	j/H6W9tyjVtja69OT4H3x0H9ch98VaAE7ZRX9uqfMqxV8/wr0YJ/yHCqJvoxq/Vuu5teuVt/P1f
	hXs//MOzfPSbCRsIXWb50QEZ1x4csuHJdhCG0H0Rwef/m88FwBSEtUl
X-Google-Smtp-Source: AGHT+IF+WtFTEtPNMBwgZfofryr+jcualMK5NtwUVd+BMo91Vigzb5En+7ZipV2RAxZZ7XVsyY7e7w==
X-Received: by 2002:a17:902:d2c5:b0:216:48f4:4f20 with SMTP id d9443c01a7336-218d70dc236mr67176745ad.16.1734565054640;
        Wed, 18 Dec 2024 15:37:34 -0800 (PST)
Received: from [127.0.1.1] ([2001:569:fcea:600:2e06:283e:5daa:4d0f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f6967sm802335ad.214.2024.12.18.15.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 15:37:33 -0800 (PST)
From: Fabien Parent <parent.f@gmail.com>
Date: Wed, 18 Dec 2024 15:36:38 -0800
Subject: [PATCH 8/9] regulator: add driver for ncv6336 regulator
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241218-ncv6336-v1-8-b8d973747f7a@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9527; i=parent.f@gmail.com;
 h=from:subject:message-id; bh=vtb7NM/ARwqwFSM2X0HpnsIhUiEzaB5FxGPUahmOA/4=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0o0bkFGdEFwTDlrQTBEQUFvQmlKc2d4Q
 kw5cktRQnl5WmlBR2RqWEtsT0lORjRKUHRneUsyUk0zYzFON0FQCkZBait6S2hIMkNTRVdmUS9s
 N3pjRDRrQ013UUFBUW9BSFJZaEJONk0wZElMeXpzd3JmRnNxWWliSU1RUy9heWsKQlFKblkxeXB
 BQW9KRUlpYklNUVMvYXlreE80UC9SRkNkNFBTQkNpTjRCTHFPRzgyNk5nT2N5VmRpZFhJc0VObQ
 p1NVZ4TGM2MFR2RTJQenNaWmNLMllGRzZwSDNRa3FKTHRqaHFDMStWWmZOOVF1bTVwc3FrL3kvV
 1diTjNpalpEClV6SitGTkFpaFRFaWJMSU5SWFo5VFJXOFFUeGlvVWJYMUNqUFNhYURFTDRNOFdw
 dzcxYnR0Z0Nmc2o4c1A4YkoKVTRocGtmMWlyY01MdWJXaDZOeWJHWWdBbG5teExmc1hMQU84ZFV
 sU2duL2JIUENTeHpyZTRpZGdFZ2ZGZ0RvbgpTeDBtMFZsRHZlWm5sc0d5d2p3aHpEU01TcnRFWE
 JjbDNmRWx3R3hmdDRVbTBRSGVoOGlhbUEwRmt4NEVjOE5HCnFjcjlTaDhZSGNmWDVwMnhKMkcyR
 jFheXlPL2t0NFBya0hleXo1bzJlTmREc2U2RTlWbXRQVTdoWjZDSVE3MWEKbWg3TlRmNU54dUlG
 UytXOUdWVGY3MDJDalEwS25HR0FJbTc2QW04cUc0dTFhVmM0WUNxaGhBUEtNVWRiUC9uVQpiRk5
 xNDlqVUd4VjdERHRXVWkyVElhd2hZSFB0a3d3cUgxQUJXUmY1d3FmeVIvNXJUbTZCVzE4ZmRkOV
 FCRzBvClR2RkhERWgvd1BYMVkxVm5XU25YMG5DTXVkSmV1SzRaa2pHZ2dHeTBzQzhYYjNLUEM1M
 jYyRng5Rld4aWlDd0QKKytkN0tRMEdvc3MrZ0lJb1c1QjNJRzQ4c0cwY29OQk1Sc3U2b1RZN1NZ
 alJWNW5tTGRjaGR4WjZobzRWcVd0NAptK09YaHFxUnpoeWV4OWpNeThuVi9MS0xoQU4zSlBxYTc
 1b0tSTHU3amZNZWxMbmRXWUQvMGcva0wwMTlNcSsyCmRoUWNBZkMzWFNVa1ZBPT0KPTB5S1QKLS
 0tLS1FTkQgUEdQIE1FU1NBR0UtLS0tLQo=
X-Developer-Key: i=parent.f@gmail.com; a=openpgp;
 fpr=07BB034F9E8E3AF0DF4CF7607AE864A1E16FA383

From: Fabien Parent <fabien.parent@linaro.org>

This commit adds support for the Onsemi NCV6336 buck down converter.

Signed-off-by: Fabien Parent <fabien.parent@linaro.org>
---
 drivers/regulator/Kconfig              |   7 +
 drivers/regulator/Makefile             |   1 +
 drivers/regulator/ncv6336_regulator.rs | 241 +++++++++++++++++++++++++++++++++
 3 files changed, 249 insertions(+)

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 39297f7d8177193e51c99bc2b360c6d9936e62fe..7254a6e1d7539b147b7ba00ebcb6fd92eb6b2616 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -952,6 +952,13 @@ config REGULATOR_MTK_DVFSRC
 	  of Mediatek. It allows for voting on regulator state
 	  between multiple users.
 
+config REGULATOR_NCV6336
+	tristate "Onsemi NCV6336 regulator driver"
+	depends on RUST && OF && I2C=y
+	select REGMAP_I2C
+	help
+	  Say y here to support the Onsemi NCV6336 buck converter.
+
 config REGULATOR_PALMAS
 	tristate "TI Palmas PMIC Regulators"
 	depends on MFD_PALMAS
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index 3d5a803dce8a0556ba9557fa069c6e37593b3c69..0309a78b820cc85883c0c129801ab713e08e4391 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -113,6 +113,7 @@ obj-$(CONFIG_REGULATOR_MT6370) += mt6370-regulator.o
 obj-$(CONFIG_REGULATOR_MT6380)	+= mt6380-regulator.o
 obj-$(CONFIG_REGULATOR_MT6397)	+= mt6397-regulator.o
 obj-$(CONFIG_REGULATOR_MTK_DVFSRC) += mtk-dvfsrc-regulator.o
+obj-$(CONFIG_REGULATOR_NCV6336) += ncv6336_regulator.o
 obj-$(CONFIG_REGULATOR_QCOM_LABIBB) += qcom-labibb-regulator.o
 obj-$(CONFIG_REGULATOR_QCOM_PM8008) += qcom-pm8008-regulator.o
 obj-$(CONFIG_REGULATOR_QCOM_REFGEN) += qcom-refgen-regulator.o
diff --git a/drivers/regulator/ncv6336_regulator.rs b/drivers/regulator/ncv6336_regulator.rs
new file mode 100644
index 0000000000000000000000000000000000000000..7efd7630792b68fb353ed1b1634980def9e326a1
--- /dev/null
+++ b/drivers/regulator/ncv6336_regulator.rs
@@ -0,0 +1,241 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Driver for the Onsemi Buck Converter NCV6336
+//!
+//! Datasheet: https://www.onsemi.com/pdf/datasheet/ncv6336bm-d.pdf
+
+use kernel::{
+    c_str, i2c, of,
+    prelude::*,
+    regmap::{self, BitFieldReadOps, BitFieldWriteOps, RawFieldWriteOps},
+    regulator::{
+        driver::{Config, Desc, Device, Driver, RegmapHelpers, Status, Type},
+        Mode,
+    },
+    sync::{new_mutex, Arc, Mutex},
+};
+use register::*;
+
+kernel::module_i2c_driver! {
+    type: Ncv6336,
+    name: "ncv6336",
+    author: "Fabien Parent <fabien.parent@linaro.org>",
+    license: "GPL",
+}
+
+kernel::i2c_device_table!(
+    I2C_ID_TABLE,
+    MODULE_I2C_ID_TABLE,
+    <Ncv6336 as i2c::Driver>::IdInfo,
+    [(i2c::DeviceId::new(c_str!("ncv6336")), ()),]
+);
+
+kernel::of_device_table!(
+    OF_ID_TABLE,
+    MODULE_OF_ID_TABLE,
+    <Ncv6336 as i2c::Driver>::IdInfo,
+    [(of::DeviceId::new(c_str!("onnn,ncv6336")), ()),]
+);
+
+regmap::define_regmap_field_descs!(FIELD_DESCS, {
+    (pid, 0x3, READ, { value => raw([7:0], ro) }),
+    (rid, 0x4, READ, { value => raw([7:0], ro) }),
+    (fid, 0x5, READ, { value => raw([7:0], ro) }),
+    (progvsel1, 0x10, RW, {
+        voutvsel1 => raw([6:0], rw),
+        envsel1   => bit(7, rw),
+    }),
+    (progvsel0, 0x11, RW, {
+        voutvsel0 => raw([6:0], rw),
+        envsel0   => bit(7, rw),
+    }),
+    (pgood, 0x12, RW, { dischg => bit(4, rw) }),
+    (command, 0x14, RW, {
+        vselgt   => bit(0, rw),
+        pwmvsel1 => bit(6, rw),
+        pwmvsel0 => bit(7, rw),
+    }),
+    (limconf, 0x16, RW, {
+        rearm     => bit(0, rw),
+        rststatus => bit(1, rw),
+        tpwth     => enum([5:4], rw, {
+            Temp83C  = 0x0,
+            Temp94C  = 0x1,
+            Temp105C = 0x2,
+            Temp116C = 0x3,
+        }),
+        ipeak     => enum([7:6], rw, {
+            Peak3p5A = 0x0,
+            Peak4p0A = 0x1,
+            Peak4p5A = 0x2,
+            Peak5p0A = 0x3,
+        }),
+    })
+});
+
+static NCV6336_DESC: Desc = Desc::new::<Ncv6336>(c_str!("ncv6336"), Type::Voltage)
+    .with_owner(&THIS_MODULE)
+    .with_of_match(c_str!("buck"))
+    .with_active_discharge(
+        pgood::addr(),
+        pgood::dischg::mask(),
+        pgood::dischg::mask(),
+        0,
+    )
+    .with_csel(
+        limconf::addr(),
+        limconf::ipeak::mask(),
+        &[3_500_000, 4_000_000, 4_500_000, 5_000_000],
+    )
+    .with_enable(
+        progvsel0::addr(),
+        progvsel0::envsel0::mask(),
+        progvsel0::envsel0::mask(),
+        0,
+    )
+    .with_linear_mapping(
+        progvsel0::addr(),
+        progvsel0::voutvsel0::mask(),
+        600_000,
+        6250,
+        128,
+        0,
+    );
+
+struct Ncv6336RegulatorData {
+    fields: regmap::Fields<{ FIELD_DESCS.len() }>,
+}
+
+struct Ncv6336(#[expect(dead_code)] Device<<Self as Driver>::Data>);
+
+impl i2c::Driver for Ncv6336 {
+    type IdInfo = ();
+
+    const I2C_ID_TABLE: Option<i2c::IdTable<Self::IdInfo>> = Some(&I2C_ID_TABLE);
+    const OF_ID_TABLE: Option<of::IdTable<Self::IdInfo>> = Some(&OF_ID_TABLE);
+
+    fn probe(client: &mut i2c::Client, _id_info: Option<&Self::IdInfo>) -> Result<Pin<KBox<Self>>> {
+        let config = regmap::Config::<AccessOps>::new(8, 8)
+            .with_max_register(0x16)
+            .with_cache_type(regmap::CacheType::RbTree);
+        let regmap = Arc::new(regmap::Regmap::init_i2c(client, &config)?, GFP_KERNEL)?;
+        let fields = regmap::Fields::new(&regmap, &FIELD_DESCS)?;
+
+        let data = Arc::pin_init(new_mutex!(Ncv6336RegulatorData { fields }), GFP_KERNEL)?;
+        let config = Config::new(client.as_ref(), data.clone()).with_regmap(regmap.clone());
+        let regulator = Device::register(client.as_ref(), &NCV6336_DESC, config)?;
+
+        let drvdata = KBox::new(Self(regulator), GFP_KERNEL)?;
+
+        Ok(drvdata.into())
+    }
+}
+
+#[vtable]
+impl Driver for Ncv6336 {
+    type Data = Arc<Mutex<Ncv6336RegulatorData>>;
+
+    fn list_voltage(reg: &mut Device<Self::Data>, selector: u32) -> Result<i32> {
+        reg.list_voltage_linear(selector)
+    }
+
+    fn enable(reg: &mut Device<Self::Data>) -> Result {
+        reg.enable_regmap()
+    }
+
+    fn disable(reg: &mut Device<Self::Data>) -> Result {
+        reg.disable_regmap()
+    }
+
+    fn is_enabled(reg: &mut Device<Self::Data>) -> Result<bool> {
+        reg.is_enabled_regmap()
+    }
+
+    fn set_active_discharge(reg: &mut Device<Self::Data>, enable: bool) -> Result {
+        reg.set_active_discharge_regmap(enable)
+    }
+
+    fn set_current_limit(reg: &mut Device<Self::Data>, min_ua: i32, max_ua: i32) -> Result {
+        reg.set_current_limit_regmap(min_ua, max_ua)
+    }
+
+    fn get_current_limit(reg: &mut Device<Self::Data>) -> Result<i32> {
+        reg.get_current_limit_regmap()
+    }
+
+    fn set_voltage_sel(reg: &mut Device<Self::Data>, selector: u32) -> Result {
+        reg.set_voltage_sel_regmap(selector)
+    }
+
+    fn get_voltage_sel(reg: &mut Device<Self::Data>) -> Result<i32> {
+        reg.get_voltage_sel_regmap()
+    }
+
+    fn set_mode(reg: &mut Device<Self::Data>, mode: Mode) -> Result {
+        let data = reg.data();
+        let fields = &mut data.lock().fields;
+
+        match mode {
+            Mode::Normal => command::pwmvsel0::clear(fields),
+            Mode::Fast => command::pwmvsel0::set(fields),
+            _ => Err(ENOTSUPP),
+        }
+    }
+
+    fn get_mode(reg: &mut Device<Self::Data>) -> Mode {
+        let data = reg.data();
+        let fields = &mut data.lock().fields;
+
+        match command::pwmvsel0::is_set(fields) {
+            Ok(true) => Mode::Fast,
+            Ok(false) => Mode::Normal,
+            Err(_) => Mode::Invalid,
+        }
+    }
+
+    fn get_status(reg: &mut Device<Self::Data>) -> Result<Status> {
+        if !Self::is_enabled(reg)? {
+            return Ok(Status::Off);
+        }
+
+        Ok(Self::get_mode(reg).into())
+    }
+
+    fn set_suspend_voltage(reg: &mut Device<Self::Data>, uv: i32) -> Result {
+        let data = reg.data();
+        let fields = &mut data.lock().fields;
+
+        let quot = (uv - 600000) / 6250;
+        let rem = (uv - 600000) % 6250;
+        let selector = if rem > 0 { quot + 1 } else { quot };
+
+        progvsel1::voutvsel1::write(fields, selector as _)
+    }
+
+    fn set_suspend_enable(reg: &mut Device<Self::Data>) -> Result {
+        let data = reg.data();
+        let fields = &mut data.lock().fields;
+
+        progvsel1::envsel1::set(fields)?;
+        command::vselgt::clear(fields)
+    }
+
+    fn set_suspend_disable(reg: &mut Device<Self::Data>) -> Result {
+        let data = reg.data();
+        let fields = &mut data.lock().fields;
+
+        progvsel1::envsel1::clear(fields)?;
+        command::vselgt::set(fields)
+    }
+
+    fn set_suspend_mode(reg: &mut Device<Self::Data>, mode: Mode) -> Result {
+        let data = reg.data();
+        let fields = &mut data.lock().fields;
+
+        match mode {
+            Mode::Normal => command::pwmvsel1::clear(fields),
+            Mode::Fast => command::pwmvsel1::set(fields),
+            _ => Err(ENOTSUPP),
+        }
+    }
+}

-- 
2.45.2


