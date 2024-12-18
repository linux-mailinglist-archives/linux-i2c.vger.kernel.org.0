Return-Path: <linux-i2c+bounces-8615-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 30EBB9F70F6
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Dec 2024 00:39:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 74E83167FCA
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2024 23:39:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D54921FFC6F;
	Wed, 18 Dec 2024 23:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nSXAtWoa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A581FF601;
	Wed, 18 Dec 2024 23:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734565052; cv=none; b=MeTakeK3VrozZT5MAVze2vZjLG6zQkkzUBLTrTG+ynzHTeObwMpnUnkFa47lWpWHFHDqFX6dDa3xQi7M1pM6/DUsF7OtWUxpKM9A4uFq4XzCkssi0FzzsF/ceSnBtRBeC020wYh3y7fOHiD13VKpIu4R+dOGtfcRWCo2+rRrCn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734565052; c=relaxed/simple;
	bh=Fh2CSoolKTOXoGPkldUPoU6C9epmAg/wwigUZCOyxXY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TtwVDZAPu2/IDGhiHfXhCkH1609clZfXc+jSKW38QgtzpGZJ3ag8ZSXNsTjzcMwGb4ov/NNCPtLaECG7dwD/sNUzbyZpyRUVDRv0r5aHq/TgufnSeYO8Xh1xw5bdU4Q7/RRtuMy0+ruKqUpDv3/EJjC83bYcIhoVwB5UHGqdvrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nSXAtWoa; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21675fd60feso2538745ad.2;
        Wed, 18 Dec 2024 15:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734565050; x=1735169850; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8wN7HbnCS89pWKKsi3ngBvHoXn6Ip6orbk5X0jvS7fU=;
        b=nSXAtWoaFjdTNWYB4qzNAv1FwYDds0I+Sq83g99PZSKgc2U+u7y16sG+I8wiVwWfLt
         /9h3KbYlFCVPFsABNadWebVUvHlswYE3wJfdP3RYgLHDS58YzuwyuvwxkgQyf3C39ANO
         d7Ml7ME4K7Uv2X6JjfwFRXm8cCOdhAfuu6RbBK8tsmxW7ujZHujTv+5fb1Gn4zZD99FK
         AJobq7QQ/Ma3+Q83KhOnzOCZPd6Cn/Pj1bk5QKw+pwyrGhe+1wMy7Ryl72d/1ZnxWVJQ
         EdQ3i9v2EnkR0avtCtrAyiZciM0vRDZyt7oPpLxxpCKv2AWLvwOo729PbVA0mD26wZzf
         OB7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734565050; x=1735169850;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8wN7HbnCS89pWKKsi3ngBvHoXn6Ip6orbk5X0jvS7fU=;
        b=COiT8ADGU92gKu+RxxmAchRAI3Wfnd6kO0XZjuP2QfQR2ONrRNTCurx+CwgE4dvOIO
         TZivCn3jQw0zpWFbI592GtaLe1SWh5kGXH7OfRkdM8JcClu6IK4/lfL3MP1d8/K4vEgM
         8YmTUjS7QdfWWTOzCjhWBHuMici80mjagag8CZbjvafhkxmEx54NRquhgsvYHlyNbefq
         c+xEcaMQug5162GGMnj5S+4l8k0hYKhMsMXuGCw7yOq/1XNrCDH+3/MItASit7IrV2N/
         0bqRf7p5HG3M18e7wboxoFUxDLqbwuhYgDoBCU0ex2hG9nVNkA5UWZEqKu/iOHQxUlHG
         Mn5A==
X-Forwarded-Encrypted: i=1; AJvYcCVJFHmcxZcE4oQHgKsAwX3SMRhJ1Q6noUwSHhpNCpwu6wG+fydzZcEHelNQuD3oN/dc++QRvO1b9+7C5cPlqgw=@vger.kernel.org, AJvYcCVQ+qOz9h4qLbRczCx8PCrmkP3fKvGNbNzmrjxMHTfcW6vTsSzw/GoYWiPLnxAfHRG+RGKTQxADEnTs+kA1@vger.kernel.org, AJvYcCVgSzUG8PSVBO/eJ7y0I2poNUKn2XPi1rjg9kzQQVtpHFxS8KlO7HgxKtwaAgDkRX5UL8NX1n6uxa4up9Iw@vger.kernel.org, AJvYcCXcvrJrTpTxQ8VkMEA+2tflYx0bGH107+mk3y3Kt1T9T1YDdl5Yw242D3jBIFZXtKsCS+dePlXZrpDQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxNC8O9iD0VlBgyI+NJE+DkVlHSgyXH5oBM9+G5JAGJ09Br4+eI
	4yygbA2SLdLdT1CwNvHZIhF4W+Jn8YReoBETRbYfkOkkELDvrT3O
X-Gm-Gg: ASbGncvp5qtaeRTlliaMR6e62lHFfBtgWuTaG9EiFDYz7apwti4pgfAqVWU4FKyZmXa
	PuJWXsR3Vi6Odu2CYqkAg6RFwhmF3c8yVa1WqfJ44hafMdT+KsBwUxs8lrgYujqTGHm+ysxBYQj
	hp33KN9fOT2dsRheuuFM7IyEykQIF84ju2D8rkqtXfGL0eCwICfyHfxmqA9Rvly5gF+f+/Ticj1
	RbVGuNfL7CDw7ohZZ7PdhJAIPVkPOyXoBNven0Z21Vxz08vArNG4BZi
X-Google-Smtp-Source: AGHT+IE1ZKhghi3VMTfaw6MZhoWc6MdtkU4Axg6ZEskM2qO36+BshJ8EHDAigxhQEPUAhCQGDSIl5g==
X-Received: by 2002:a17:903:2a8c:b0:219:d28a:ca23 with SMTP id d9443c01a7336-219d28acce5mr51876255ad.36.1734565050036;
        Wed, 18 Dec 2024 15:37:30 -0800 (PST)
Received: from [127.0.1.1] ([2001:569:fcea:600:2e06:283e:5daa:4d0f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f6967sm802335ad.214.2024.12.18.15.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 15:37:28 -0800 (PST)
From: Fabien Parent <parent.f@gmail.com>
Date: Wed, 18 Dec 2024 15:36:36 -0800
Subject: [PATCH 6/9] rust: regulator: add support for regmap
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241218-ncv6336-v1-6-b8d973747f7a@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8661; i=parent.f@gmail.com;
 h=from:subject:message-id; bh=qRS9r1n2/HjY8gk2eXA0ISjuhS69yAMbdqsctAPosAU=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0o0bkFGdEFwTDlrQTBEQUFvQmlKc2d4Q
 kw5cktRQnl5WmlBR2RqWEtlV2wyVG1YTHU5UU1EeTllWXplbmhQClNsN1gyQ25vb1JtRWR2UTFG
 MS9VTG9rQ013UUFBUW9BSFJZaEJONk0wZElMeXpzd3JmRnNxWWliSU1RUy9heWsKQlFKblkxeW5
 BQW9KRUlpYklNUVMvYXlrdXFVUUFLSklObTFxNGtVTXVrZnRoWi9qQ3hMTTU4MjFXNXJxRElOUg
 pwamQvamJpRURZZmZneTFHdHJZb1VQbVNiVDNDY0ZUdFQ0cy9CZmJsOGJLMldTNysrcFlWS2pJU
 Fd5dWZhVUJrCkpOUVVXNnBTNWpjMjI5WENranlMR1BZNjFBN2RYSmpJWVpDNU91YzBpNTBrUXB6
 ajlNZ204WFJENlVCaU1xOWYKbDZwVXZjK3l3am5CdjlzSlZoRVJSdmI0R3RlWmpxSHZUZXV6bnJ
 ZUnB4OGlPSHoxVzB2aEl1clpkNFdjY3hhbApJWG1uSlY1elZsUzNiMzZPZm9aV2gvVFRJSzZuTi
 92OXZ0UldXUG1HZDg5QjhlRWo5YzZJZDFKZFBpVEV0TnN5CklTOXZhY0RndHBzUHc3V2VvM0p1S
 CtVTWRSVlhhV05udXVhaUp0ZU5idjRtd0RGa3ljQmVMZEw0eFdYWW9YalIKMXlyOFFzZUowdXkz
 NFVpTzlPbmkvalhWaUVtVmc0U3lnVWNOc1FBanZkNWd1dWZmU1RiSVQxbmZLODVKWEh5dApRUzN
 ZVGlVZTB4cFQyUXJMTXlpMHJyR1l3NmZiS28zT0wxeDM0UUtJd2ZFbk1TbWhhY04vaXMzMnBxMn
 JJc3BoCkxpdmpsSmFaQUxKZFMzSEFaYzh1ZlRDbHhHMG9kUTJpck0wUHJSenlMMkxwK0pibnNPZ
 EwvZUw1NC9TTEhUeWkKanV3OW1ZNFFXYUtmdjduUnRmSGVJQ0FxaWVTNDBEVzdXQjFPUFVlMjN0
 d1J0WjA3ZXoyYWpnbUFLY2d5MkhwdQpEZTFtdFVjMDVwL3d5S1ZyS0RkMld4QzJZVmVKbUhrOTg
 zbmJBR0ZBblZMSEx4OUt3VGhCcE1tZXNYekFpM0tFCk5uamtCemRuL1owM0ZnPT0KPS9vb2kKLS
 0tLS1FTkQgUEdQIE1FU1NBR0UtLS0tLQo=
X-Developer-Key: i=parent.f@gmail.com; a=openpgp;
 fpr=07BB034F9E8E3AF0DF4CF7607AE864A1E16FA383

From: Fabien Parent <fabien.parent@linaro.org>

The regulator API offer many helpers to help simplifies drivers that
use the regmap API. This commit adds partial support for it, only the
function needed by the NCV6336 driver were added.

Signed-off-by: Fabien Parent <fabien.parent@linaro.org>
---
 rust/kernel/regulator/driver.rs | 141 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 141 insertions(+)

diff --git a/rust/kernel/regulator/driver.rs b/rust/kernel/regulator/driver.rs
index 8079ea28fd5bf7b6871a0b1d2cea7a6fffcb43ca..e79e93122b094e5e086780f18ecdac5105d07153 100644
--- a/rust/kernel/regulator/driver.rs
+++ b/rust/kernel/regulator/driver.rs
@@ -37,13 +37,27 @@
     device,
     error::{code::*, from_err_ptr, from_result, Error, Result},
     macros::vtable,
+    private::Sealed,
     regulator::Mode,
     str::CStr,
+    sync::Arc,
     types::ForeignOwnable,
     ThisModule,
 };
+#[cfg(CONFIG_REGMAP)]
+use crate::{error::to_result, regmap::Regmap};
 use core::{marker::PhantomData, mem::ManuallyDrop, ptr::NonNull};
 
+#[cfg(not(CONFIG_REGMAP))]
+struct Regmap;
+
+#[cfg(not(CONFIG_REGMAP))]
+impl Regmap {
+    pub fn as_raw(&self) -> *mut bindings::regmap {
+        core::ptr::null_mut()
+    }
+}
+
 /// [`Device`]'s status
 #[derive(Eq, PartialEq)]
 pub enum Status {
@@ -357,6 +371,7 @@ unsafe impl Sync for Desc {}
 pub struct Config<T: ForeignOwnable + Send + Sync = ()> {
     cfg: bindings::regulator_config,
     data: T,
+    regmap: Option<Arc<Regmap>>,
 }
 
 impl<T: ForeignOwnable + Send + Sync> Config<T> {
@@ -368,8 +383,16 @@ pub fn new(dev: &device::Device, data: T) -> Self {
                 ..Default::default()
             },
             data,
+            regmap: None,
         }
     }
+
+    /// Assign a regmap device to the config
+    #[cfg(CONFIG_REGMAP)]
+    pub fn with_regmap(mut self, regmap: Arc<Regmap>) -> Self {
+        self.regmap = Some(regmap);
+        self
+    }
 }
 
 /// Regulator device
@@ -384,6 +407,9 @@ pub fn new(dev: &device::Device, data: T) -> Self {
 pub struct Device<T: ForeignOwnable + Send + Sync> {
     rdev: NonNull<bindings::regulator_dev>,
     _data_type: PhantomData<T>,
+    // The C regmap API does not keep reference count. Keep a reference to the regmap pointer that
+    // is shared to the C regulator API.
+    _regmap: Option<Arc<Regmap>>,
 }
 
 impl<T: ForeignOwnable + Send + Sync> Device<T> {
@@ -396,6 +422,7 @@ unsafe fn from_raw(rdev: *mut bindings::regulator_dev) -> ManuallyDrop<Self> {
             // valid..
             rdev: unsafe { NonNull::new_unchecked(rdev) },
             _data_type: PhantomData::<T>,
+            _regmap: None,
         })
     }
 
@@ -407,6 +434,11 @@ pub fn register(
     ) -> Result<Self> {
         config.cfg.driver_data = config.data.into_foreign() as _;
 
+        let regmap = config.regmap.take();
+        if let Some(regmap) = &regmap {
+            config.cfg.regmap = regmap.as_raw() as _;
+        };
+
         // SAFETY: By the type invariants, we know that `dev.as_ref().as_raw()` is always
         // valid and non-null, and the descriptor and config are guaranteed to be valid values,
         // hence it is safe to perform the FFI call.
@@ -417,6 +449,7 @@ pub fn register(
         Ok(Self {
             rdev: NonNull::new(rdev).ok_or(EINVAL)?,
             _data_type: PhantomData::<T>,
+            _regmap: regmap,
         })
     }
 
@@ -472,6 +505,114 @@ unsafe impl<T: ForeignOwnable + Send + Sync> Send for Device<T> {}
 // the C code is insuring proper synchronization of `self.rdev`.
 unsafe impl<T: ForeignOwnable + Send + Sync> Sync for Device<T> {}
 
+impl<T: ForeignOwnable + Send + Sync> Sealed for Device<T> {}
+
+/// Helper functions to implement some of the [`Driver`] trait methods using [`Regmap`].
+///
+/// This trait is implemented by [`Device`] and is Sealed to prevent
+/// to be implemented by anyone else.
+#[cfg(CONFIG_REGMAP)]
+pub trait RegmapHelpers: Sealed {
+    /// Implementation of [`Driver::get_voltage_sel`] using [`Regmap`].
+    fn get_voltage_sel_regmap(&self) -> Result<i32>;
+    /// Implementation of [`Driver::set_voltage_sel`] using [`Regmap`].
+    fn set_voltage_sel_regmap(&self, sel: u32) -> Result;
+
+    /// Implementation of [`Driver::is_enabled`] using [`Regmap`].
+    ///
+    /// [`Desc::with_enable`] or [`Desc::with_inverted_enable`] must have been called
+    /// to setup the fields required by regmap.
+    fn is_enabled_regmap(&self) -> Result<bool>;
+    /// Implementation of [`Driver::enable`] using [`Regmap`].
+    ///
+    /// [`Desc::with_enable`] or [`Desc::with_inverted_enable`] must have been called
+    /// to setup the fields required by regmap.
+    fn enable_regmap(&self) -> Result;
+    /// Implementation of [`Driver::disable`] using [`Regmap`].
+    ///
+    /// [`Desc::with_enable`] or [`Desc::with_inverted_enable`] must have been called
+    /// to setup the fields required by regmap.
+    fn disable_regmap(&self) -> Result;
+
+    /// Implementation of [`Driver::set_active_discharge`] using [`Regmap`].
+    ///
+    /// [`Desc::with_active_discharge`] must have been called to setup the fields required
+    /// by regmap.
+    fn set_active_discharge_regmap(&self, enable: bool) -> Result;
+
+    /// Implementation of [`Driver::set_current_limit`] using [`Regmap`].
+    fn set_current_limit_regmap(&self, min_ua: i32, max_ua: i32) -> Result;
+    /// Implementation of [`Driver::get_current_limit`] using [`Regmap`].
+    fn get_current_limit_regmap(&self) -> Result<i32>;
+}
+
+#[cfg(CONFIG_REGMAP)]
+impl<T: ForeignOwnable + Send + Sync> RegmapHelpers for Device<T> {
+    fn get_voltage_sel_regmap(&self) -> Result<i32> {
+        // SAFETY: The type invariants guarantee that `self.rdev` is valid and non-null,
+        // so it is safe to perform the FFI call.
+        let ret = unsafe { bindings::regulator_get_voltage_sel_regmap(self.rdev.as_ptr()) };
+        if ret < 0 {
+            return Err(Error::from_errno(ret));
+        }
+        Ok(ret)
+    }
+
+    fn set_voltage_sel_regmap(&self, sel: u32) -> Result {
+        // SAFETY: The type invariants guarantee that `self.rdev` is valid and non-null,
+        // so it is safe to perform the FFI call.
+        to_result(unsafe { bindings::regulator_set_voltage_sel_regmap(self.rdev.as_ptr(), sel) })
+    }
+
+    fn is_enabled_regmap(&self) -> Result<bool> {
+        // SAFETY: The type invariants guarantee that `self.rdev` is valid and non-null,
+        // so it is safe to perform the FFI call.
+        let ret = unsafe { bindings::regulator_is_enabled_regmap(self.rdev.as_ptr()) };
+        if ret < 0 {
+            return Err(Error::from_errno(ret));
+        }
+        Ok(ret > 0)
+    }
+
+    fn enable_regmap(&self) -> Result {
+        // SAFETY: The type invariants guarantee that `self.rdev` is valid and non-null,
+        // so it is safe to perform the FFI call.
+        to_result(unsafe { bindings::regulator_enable_regmap(self.rdev.as_ptr()) })
+    }
+
+    fn disable_regmap(&self) -> Result {
+        // SAFETY: The type invariants guarantee that `self.rdev` is valid and non-null,
+        // so it is safe to perform the FFI call.
+        to_result(unsafe { bindings::regulator_disable_regmap(self.rdev.as_ptr()) })
+    }
+
+    fn set_active_discharge_regmap(&self, enable: bool) -> Result {
+        // SAFETY: The type invariants guarantee that `self.rdev` is valid and non-null,
+        // so it is safe to perform the FFI call.
+        to_result(unsafe {
+            bindings::regulator_set_active_discharge_regmap(self.rdev.as_ptr(), enable)
+        })
+    }
+
+    fn set_current_limit_regmap(&self, min_ua: i32, max_ua: i32) -> Result {
+        // SAFETY: The type invariants guarantee that `self.rdev` is valid and non-null,
+        // so it is safe to perform the FFI call.
+        to_result(unsafe {
+            bindings::regulator_set_current_limit_regmap(self.rdev.as_ptr(), min_ua, max_ua)
+        })
+    }
+
+    fn get_current_limit_regmap(&self) -> Result<i32> {
+        // SAFETY: The type invariants guarantee that `self.rdev` is valid and non-null,
+        // so it is safe to perform the FFI call.
+        let ret = unsafe { bindings::regulator_get_current_limit_regmap(self.rdev.as_ptr()) };
+        if ret < 0 {
+            return Err(Error::from_errno(ret));
+        }
+        Ok(ret)
+    }
+}
+
 /// [`Device`] type
 pub enum Type {
     /// Voltage regulator

-- 
2.45.2


