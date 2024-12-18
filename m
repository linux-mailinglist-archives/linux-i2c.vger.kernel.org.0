Return-Path: <linux-i2c+bounces-8614-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE069F70F5
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Dec 2024 00:39:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46F33188EE83
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2024 23:39:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B49941FF7AC;
	Wed, 18 Dec 2024 23:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BO61Cmln"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0745E1FF1C8;
	Wed, 18 Dec 2024 23:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734565051; cv=none; b=mYBgcWVANxgl01Z0EBxH0kGx3XuhuxXK1Ota9HHBwOa4qdO+bTqfqBi7ZarTh8blPBHJch7yUtGSoi1UC7849wJs0uKY1bwbRwTGhuUkKFEMxiP2VZ8q9v7x8e94NTADh1daPTbWFN7rYMsnwRKeCigquuH/Uc78YAl4YViLowQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734565051; c=relaxed/simple;
	bh=JAfbjxBIY8Nq4rIVbaojRV+WEdf2qBL4PSC8ODV2X0Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iyWDTkVxZLR1qm6gxcE8rz0/0JwXlsGCfiTiqxw6Pemp/tTVQpuLZTAEVYWSQjzTyo3ZHqIuKwsqba4Jd/1rzHKz+wdZWU5GJH8JkpIxbSJQq62IVoc5RKWymZ6caD3YPOTAsgFzsmn8Mn7sddhhhox67cA9kFjRV8FW3EWzju8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BO61Cmln; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-216728b1836so2060805ad.0;
        Wed, 18 Dec 2024 15:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734565048; x=1735169848; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tl+g5tdx7rxmvzKspLWFkF4LAJ0SjMm1pdSmLUZ7lgI=;
        b=BO61CmlnCVrdFf00dNyhfET2EfvBXBkwONq3/HPTOAX9fhdaz9L/7xvegtfY/YDDJM
         nMgtnxnx/4MuOy7talh85Gd42HSsEIkRL8tbuw36pxEX9Lv9J6pQSDm2yeviJo46pQvw
         aLlVcCuIh2tpLORsjlClRJRc1KxPTyYY5ZIpxrBkJTWPr/23NkBe1ZEbVHOQx1IhxoAZ
         9lzjQhtpllWF3RL7xwLF5MjJ7dd5hsE0pGSpf5WxhOWvOurYaRh57+ixH2/EHF6axP65
         uy18gq5/C04KbOo4ZkSv1zq5UO9PsqMInbupBDTMe53rsLD2z2DvO8BmxDsVZCnXWGon
         LzEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734565048; x=1735169848;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tl+g5tdx7rxmvzKspLWFkF4LAJ0SjMm1pdSmLUZ7lgI=;
        b=Y+vcTiNCGrL2ImypUS4z3FKTnPW1asLs9dOBpbP54/aksAADuKi5dLWuh4/aK8VH44
         cCNU7Vy/vCkl0vxemEkBds+qmfjCZvAPH7ATCR2isBazPZJX6e8PkVsleKdIsMaPHNOo
         CYxcENgPhd/Xj8SmOk5USXl79M4akDFdzB5GB5mi4UYhxFh2t/oodYNRA1OcMcyMjMFs
         EBLI/xrQQd4RkKfJqvoSCXXtzMVkiB0X2AR17mLltafnfEuQHo0vBqGEks/MQMDzWBLu
         j21ULsu+A9iVaqFP9WC+JtbttZZQmIPq8wlh8WAM2j3g2G7Yr/HYnGm5x+7yNJk0RvWe
         lh+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUvzZg9CD8ATzPNRT0db9cG4IIaxeGpMsDS6zPt48mWmgPvnHMvCKamtrnf12gGSKfPWAu/Hen4PwFi5LAf@vger.kernel.org, AJvYcCVt4nsTetxepY70NqDaUoWFlbwo5ykwhmU8u+RerYYfu6ZhT6LoCeNFA5pK/WZMSCTEomP0dSGHcpVQ@vger.kernel.org, AJvYcCWtveDQ+1+ZDoIy0BLJQ0Qdkr1fRPO1OyZ/pGlUE9U4/tZ6FtusZpsPjd5Q6ClZhgLVQty4TmpyJqP/67MA1rY=@vger.kernel.org, AJvYcCX+UU2m1rtEwhVo5dgrmM0mu7jlPmney6Tb3UE1Y1VBh5NIqM2yg3AscNeR9RIj73jM4Npwx6wc481D0znY@vger.kernel.org
X-Gm-Message-State: AOJu0YxULn3sDuG3LSMoK6PsSdaKI2ZtVVSJEFVXOhPleXo/wfXcpJNR
	N6J7a8m6WfqHIFfpprh6yiNuZmobBC/doPT0czP0TUluExVtqQkZ
X-Gm-Gg: ASbGncuBmcZLTsS/KDGgSuhxtvQSH2P4JPmWie6xRiA8CuKGmKxsfE0JOoX6pEaYZ8Y
	031KgBZVcL5XUHL8BrLuy1/DVw2TkBH33rwN7bRGBs0BqMgpzyMfiQoGDdjRsL8m3xubE7d8ZB+
	61628eeDVk0shYrA3sr9Pk34A6pRSgnyEGjZhitmQ1b6DdjcOMVI1Wivy1omqQWQhPXiyN2LSnd
	lo21gMctbfqPjAK35M8OeN8IlsrBPsaSiALCclJzU459jOmzWOxVUi+
X-Google-Smtp-Source: AGHT+IGsgZowloX2sSekJiZwr5HUa7XJGyd9XeMnodxAPqgzxE3diRw7PiA2qjjYWejh/G7dEWQHhw==
X-Received: by 2002:a17:902:ce8b:b0:216:6f1a:1c81 with SMTP id d9443c01a7336-218d6fc3a38mr64676395ad.2.1734565047899;
        Wed, 18 Dec 2024 15:37:27 -0800 (PST)
Received: from [127.0.1.1] ([2001:569:fcea:600:2e06:283e:5daa:4d0f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f6967sm802335ad.214.2024.12.18.15.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 15:37:26 -0800 (PST)
From: Fabien Parent <parent.f@gmail.com>
Date: Wed, 18 Dec 2024 15:36:35 -0800
Subject: [PATCH 5/9] rust: regulator: add Regulator Driver abstraction
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241218-ncv6336-v1-5-b8d973747f7a@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=31897; i=parent.f@gmail.com;
 h=from:subject:message-id; bh=OsmHu/e69v+xfLx7ce6mgWFJpVCdUWuT+k1hKoJNLVg=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0o0bkFGdEFwTDlrQTBEQUFvQmlKc2d4Q
 kw5cktRQnl5WmlBR2RqWEtiVEFyUFF4SFdUYkNlTTBPNkVyTG9KCjBtejJLMXV0WXkxWlpuNzlG
 V09rellrQ013UUFBUW9BSFJZaEJONk0wZElMeXpzd3JmRnNxWWliSU1RUy9heWsKQlFKblkxeW1
 BQW9KRUlpYklNUVMvYXlrZGRnUC8zb0lsalZwdEs3TzBwdnRLcEhFd0F2Z2NISXhwd29DeDFYNw
 pnSzBwbm9MRnQ0RXdhc2lOeHZqa0FoYlgra2x5ZmVQT2VSR095YWdVd3BLMEZHelZVWXBGUXplM
 HBkL2tGOXF1CmpFeEYxQUxqMFJ1TllLMmtaaXVHbDhTQ240TnlZTGlvYitUM1B4cFRQS1JXWWx3
 VlBPMTg1cVJrM29HdDJwTHoKQzNsVU8vcU0ySlU1MVYvT1d4TFN2bTVKUDRIVjcvTUhxeVhwcjl
 xU3BpZHJDcjVXRjViOXVyZUZyVDZRSlhneAorajRMSVZEWWJBVHlCT0dHR1o5TUpKKzlSNXhrVX
 ZCVk5leGp4ZThRWUQxR0pqWndCZVFhUklNOXJYUElub25GClcxTDBDc2xrVGR0MlNHOStYL1F6V
 1JKeWQ2bEtRWVR1cnBDNFpxWTZURTg4U1R5NHFTOW5QY25Va0oyWW5GaXoKRTNGRVA3aFVsTnVU
 ZHNzbS9jMEVwUkJRUS9yako2MGZqa1pvMjV4bkp0dHQxSjZWc1JQaDdYK0V4SVlXemVuNwo2elB
 ZUTFGWDRzM3JIZnZHenJzWlgySkRsVGl2d3lqYm1CSmdDUmZzWS9SWWs5cTk0VTd2NjFPaEwzY2
 dzbjZyCnFpRDZTZEd4dFlPTzV5ZkhCL3ZCbUxyaGMyUm9wbTFXL0t3K2tuMnZEdEJ4YUF1VnBoc
 09TanpBYzRPNEZxclcKMlNjbFdWOVdpRkQ4bWlGQlh6WUNHMlVQZDhtbFp3Y3pmY3RaUzBvZTFY
 Njh6Z29UMTY0UEV2bWVtODFTN2h3cwo1NW9WdnFlbFFndlRlMFIxdS9jd3cyZEo5ZGYrRmd3YXB
 1UHZ1RXpiRW1mOS9UbTltdVJHVllhdjhScExhQk11CmZzTldQSDFLYjk0dzl3PT0KPW9qWEoKLS
 0tLS1FTkQgUEdQIE1FU1NBR0UtLS0tLQo=
X-Developer-Key: i=parent.f@gmail.com; a=openpgp;
 fpr=07BB034F9E8E3AF0DF4CF7607AE864A1E16FA383

From: Fabien Parent <fabien.parent@linaro.org>

This commit adds a Rust abstraction to write Regulator drivers. Only
the features used by the NCV6336 driver were added to this abstraction.

Signed-off-by: Fabien Parent <fabien.parent@linaro.org>
---
 MAINTAINERS                     |   1 +
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/regulator.rs        |   4 +-
 rust/kernel/regulator/driver.rs | 850 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 855 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 90c231f0aa7381aa8d206fb94c5d1f013dfcae41..87da43251bf0f20d2b5831345778ead592c407dc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25160,6 +25160,7 @@ F:	drivers/regulator/
 F:	include/dt-bindings/regulator/
 F:	include/linux/regulator/
 F:	rust/kernel/regulator.rs
+F:	rust/kernel/regulator/
 K:	regulator_get_optional
 
 VOLTAGE AND CURRENT REGULATOR IRQ HELPERS
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index b18d772bc3a0e78d749cc9e5ae81a4237a57f8c5..124129daea73c143c919d05814fc02bb4460ddfd 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -30,6 +30,7 @@
 #include <linux/refcount.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
+#include <linux/regulator/driver.h>
 #include <linux/sched.h>
 #include <linux/security.h>
 #include <linux/slab.h>
diff --git a/rust/kernel/regulator.rs b/rust/kernel/regulator.rs
index d695ac955193efcfda62770784a92d70d606b93d..bd8202fe5702b944201e76553b9496e1d42cb429 100644
--- a/rust/kernel/regulator.rs
+++ b/rust/kernel/regulator.rs
@@ -2,12 +2,14 @@
 
 //! SoC Regulators
 
+pub mod driver;
+
 use crate::{
     bindings,
     error::{code::*, Error, Result},
 };
 
-/// Regulators operating modes
+/// [`driver::Device`] operating modes
 #[derive(Copy, Clone)]
 #[repr(u32)]
 pub enum Mode {
diff --git a/rust/kernel/regulator/driver.rs b/rust/kernel/regulator/driver.rs
new file mode 100644
index 0000000000000000000000000000000000000000..8079ea28fd5bf7b6871a0b1d2cea7a6fffcb43ca
--- /dev/null
+++ b/rust/kernel/regulator/driver.rs
@@ -0,0 +1,850 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! SoC Device Driver Interface
+//!
+//! C header: [`include/linux/regulator/driver.h`](srctree/include/linux/regulator/driver.h)
+//!
+//! # Examples
+//!
+//! ```
+//! use kernel::regulator::driver::{Config, Desc, Device, Driver, Type};
+//!
+//! static DESC: Desc =
+//!     Desc::new::<MyDeviceDriver>(kernel::c_str!("my-regulator-driver"), Type::Voltage);
+//!
+//! struct MyDeviceDriver;
+//!
+//! #[vtable]
+//! impl Driver for MyDeviceDriver {
+//!     type Data = ();
+//!
+//!     // Implement supported `Driver`'s operations here.
+//!
+//!     // Example:
+//!     fn is_enabled(reg: &mut Device<Self::Data>) -> Result<bool> {
+//!         Ok(true)
+//!     }
+//! }
+//!
+//! impl MyDeviceDriver {
+//!     fn probe(dev: &mut kernel::device::Device) {
+//!         let _ = Device::register(dev, &DESC, Config::<<Self as Driver>::Data>::new(dev, ()));
+//!     }
+//! }
+//! ```
+
+use crate::{
+    device,
+    error::{code::*, from_err_ptr, from_result, Error, Result},
+    macros::vtable,
+    regulator::Mode,
+    str::CStr,
+    types::ForeignOwnable,
+    ThisModule,
+};
+use core::{marker::PhantomData, mem::ManuallyDrop, ptr::NonNull};
+
+/// [`Device`]'s status
+#[derive(Eq, PartialEq)]
+pub enum Status {
+    /// Device is off
+    Off,
+    /// Device is on
+    On,
+    /// Device is in an error state
+    Error,
+    /// Device is on and in Fast mode
+    Fast,
+    /// Device is on and in Normal mode
+    Normal,
+    /// Device is on and in Idle mode
+    Idle,
+    /// Device is on and in Standby mode
+    Standby,
+    /// Device is enabled but not regulating
+    Bypass,
+    /// Device is any other status
+    Undefined,
+}
+
+impl TryFrom<core::ffi::c_uint> for Status {
+    type Error = Error;
+
+    fn try_from(status: core::ffi::c_uint) -> Result<Self> {
+        match status {
+            bindings::regulator_status_REGULATOR_STATUS_OFF => Ok(Self::Off),
+            bindings::regulator_status_REGULATOR_STATUS_ON => Ok(Self::On),
+            bindings::regulator_status_REGULATOR_STATUS_ERROR => Ok(Self::Error),
+            bindings::regulator_status_REGULATOR_STATUS_FAST => Ok(Self::Fast),
+            bindings::regulator_status_REGULATOR_STATUS_NORMAL => Ok(Self::Normal),
+            bindings::regulator_status_REGULATOR_STATUS_IDLE => Ok(Self::Idle),
+            bindings::regulator_status_REGULATOR_STATUS_STANDBY => Ok(Self::Standby),
+            bindings::regulator_status_REGULATOR_STATUS_BYPASS => Ok(Self::Bypass),
+            bindings::regulator_status_REGULATOR_STATUS_UNDEFINED => Ok(Self::Undefined),
+            _ => Err(EINVAL),
+        }
+    }
+}
+
+impl From<Mode> for Status {
+    fn from(mode: Mode) -> Self {
+        // SAFETY: `regulator_mode_to_status` is a `pure function` that is only doing integer
+        // to integer conversion, hence this function call is safe.
+        let status = unsafe { bindings::regulator_mode_to_status(mode as _) };
+
+        if status < 0 {
+            Self::Undefined
+        } else {
+            Self::try_from(status as core::ffi::c_uint).unwrap_or(Self::Undefined)
+        }
+    }
+}
+
+/// [`Device`]'s operations
+#[vtable]
+pub trait Driver {
+    /// User data that will be accessible to all operations
+    type Data: ForeignOwnable + Send + Sync;
+
+    /// Return one of the supported voltages, in microvolt; zero if the selector indicates a
+    /// voltage that is unusable by the system; or negative errno. Selectors range from zero to one
+    /// less than the number of voltages supported by the system.
+    fn list_voltage(_rdev: &mut Device<Self::Data>, _selector: u32) -> Result<i32> {
+        Err(ENOTSUPP)
+    }
+
+    /// Set the voltage for the regulator within the range specified. The driver should select the
+    /// voltage closest to `min_uv`.
+    fn set_voltage(_rdev: &mut Device<Self::Data>, _min_uv: i32, _max_uv: i32) -> Result<i32> {
+        Err(ENOTSUPP)
+    }
+
+    /// Set the voltage for the regulator using the specified selector.
+    fn set_voltage_sel(_rdev: &mut Device<Self::Data>, _selector: u32) -> Result {
+        Err(ENOTSUPP)
+    }
+
+    /// Convert a voltage into a selector.
+    fn map_voltage(_rdev: &mut Device<Self::Data>, _min_uv: i32, _max_uv: i32) -> Result<i32> {
+        Err(ENOTSUPP)
+    }
+
+    /// Get the currently configured voltage for the regulator; Returns
+    /// [`ENOTRECOVERABLE`] if the regulator can't be read at bootup and hasn't been
+    /// set yet.
+    fn get_voltage(_rdev: &mut Device<Self::Data>) -> Result<i32> {
+        Err(ENOTSUPP)
+    }
+
+    /// Get the currently configured voltage selector for the regulator; Returns
+    /// [`ENOTRECOVERABLE`] if the regulator can't be read at bootup and hasn't been
+    /// set yet.
+    fn get_voltage_sel(_rdev: &mut Device<Self::Data>) -> Result<i32> {
+        Err(ENOTSUPP)
+    }
+
+    /// Configure a limit for a current-limited regulator.
+    ///
+    /// The driver should select the current closest to `max_ua`.
+    fn set_current_limit(_rdev: &mut Device<Self::Data>, _min_ua: i32, _max_ua: i32) -> Result {
+        Err(ENOTSUPP)
+    }
+
+    /// Get the configured limit for a current-limited regulator.
+    fn get_current_limit(_rdev: &mut Device<Self::Data>) -> Result<i32> {
+        Err(ENOTSUPP)
+    }
+
+    /// Enable or disable the active discharge of the regulator.
+    fn set_active_discharge(_rdev: &mut Device<Self::Data>, _enable: bool) -> Result {
+        Err(ENOTSUPP)
+    }
+
+    /// Configure the regulator as enabled.
+    fn enable(_rdev: &mut Device<Self::Data>) -> Result {
+        Err(ENOTSUPP)
+    }
+
+    /// Configure the regulator as disabled.
+    fn disable(_rdev: &mut Device<Self::Data>) -> Result {
+        Err(ENOTSUPP)
+    }
+
+    /// Returns enablement state of the regulator.
+    fn is_enabled(_rdev: &mut Device<Self::Data>) -> Result<bool> {
+        Err(ENOTSUPP)
+    }
+
+    /// Set the configured operating [`Mode`] for the regulator.
+    fn set_mode(_rdev: &mut Device<Self::Data>, _mode: Mode) -> Result {
+        Err(ENOTSUPP)
+    }
+
+    /// Get the configured operating [`Mode`] for the regulator.
+    fn get_mode(_rdev: &mut Device<Self::Data>) -> Mode {
+        Mode::Invalid
+    }
+
+    /// Report the regulator [`Status`].
+    fn get_status(_rdev: &mut Device<Self::Data>) -> Result<Status> {
+        Err(ENOTSUPP)
+    }
+
+    /// Set the voltage for the regaultor when the system is suspended.
+    fn set_suspend_voltage(_rdev: &mut Device<Self::Data>, _uv: i32) -> Result {
+        Err(ENOTSUPP)
+    }
+
+    /// Mark the regulator as enabled when the system is suspended.
+    fn set_suspend_enable(_rdev: &mut Device<Self::Data>) -> Result {
+        Err(ENOTSUPP)
+    }
+
+    /// Mark the regulator as disabled when the system is suspended.
+    fn set_suspend_disable(_rdev: &mut Device<Self::Data>) -> Result {
+        Err(ENOTSUPP)
+    }
+
+    /// Set the operating mode for the regulator when the system is suspended.
+    fn set_suspend_mode(_rdev: &mut Device<Self::Data>, _mode: Mode) -> Result {
+        Err(ENOTSUPP)
+    }
+}
+
+/// [`Device`]'s descriptor
+///
+/// # Examples
+///
+/// ```
+/// use kernel::{
+///     c_str,
+///     device,
+///     regulator::driver::{Config, Desc, Device, Driver, Type},
+///     types::ForeignOwnable,
+/// };
+///
+/// struct MyDeviceDriver;
+///
+/// #[vtable]
+/// impl Driver for MyDeviceDriver {
+///     type Data = ();
+/// }
+///
+/// static BUCK_DESC: Desc = Desc::new::<MyDeviceDriver>(c_str!("my_driver"), Type::Voltage)
+///     .with_of_match(c_str!("buck"))
+///     .with_enable(0x24, 0x1, 0x1, 0);
+///
+/// fn example(dev: &mut device::Device, mut config: Config<<MyDeviceDriver as Driver>::Data>) {
+///     let _ = Device::register(dev, &BUCK_DESC, config);
+/// }
+/// ```
+///
+/// # Invariants
+///
+/// `self.0` has always valid data.
+pub struct Desc(bindings::regulator_desc);
+impl Desc {
+    /// Create a new [`Device`] descriptor
+    pub const fn new<T: Driver>(name: &'static CStr, reg_type: Type) -> Self {
+        // SAFETY: `bindings::regulator_desc" is safe to initialize with 0s.
+        let mut desc: bindings::regulator_desc = unsafe { core::mem::zeroed() };
+        desc.name = name.as_char_ptr();
+        desc.type_ = match reg_type {
+            Type::Voltage => bindings::regulator_type_REGULATOR_VOLTAGE,
+            Type::Current => bindings::regulator_type_REGULATOR_CURRENT,
+        };
+        desc.ops = Adapter::<T>::build();
+        Self(desc)
+    }
+
+    /// Setup the register address, mask, and {en,dis}able values
+    pub const fn with_enable(mut self, reg: u32, mask: u32, en_val: u32, dis_val: u32) -> Self {
+        self.0.enable_reg = reg;
+        self.0.enable_mask = mask;
+        self.0.enable_val = en_val;
+        self.0.disable_val = dis_val;
+        self
+    }
+
+    /// Setup the register address, mask, and {en,dis}able values. {En,Dis}able values are
+    /// inverted, i.e. `dis_val` will be use to enable the regulator while `en_val` will be used
+    /// to disable the regulator.
+    pub const fn with_inverted_enable(
+        mut self,
+        reg: u32,
+        mask: u32,
+        en_val: u32,
+        dis_val: u32,
+    ) -> Self {
+        self.0.enable_is_inverted = true;
+        self.with_enable(reg, mask, en_val, dis_val)
+    }
+
+    /// Setup the active discharge regiter address, mask, on/off values.
+    pub const fn with_active_discharge(mut self, reg: u32, mask: u32, on: u32, off: u32) -> Self {
+        self.0.active_discharge_on = on;
+        self.0.active_discharge_off = off;
+        self.0.active_discharge_reg = reg;
+        self.0.active_discharge_mask = mask;
+        self
+    }
+
+    /// Setup the current selection register address, mask, and current table
+    pub const fn with_csel(mut self, reg: u32, mask: u32, table: &'static [u32]) -> Self {
+        self.0.csel_reg = reg;
+        self.0.csel_mask = mask;
+        self.0.curr_table = table.as_ptr();
+        self
+    }
+
+    /// Voltages are a linear mapping
+    pub const fn with_linear_mapping(
+        mut self,
+        reg: u32,
+        mask: u32,
+        min_uv: u32,
+        uv_step: u32,
+        n_voltages: u32,
+        linear_min_sel: u32,
+    ) -> Self {
+        self.0.vsel_reg = reg;
+        self.0.vsel_mask = mask;
+        self.0.n_voltages = n_voltages;
+        self.0.min_uV = min_uv;
+        self.0.uV_step = uv_step;
+        self.0.linear_min_sel = linear_min_sel;
+        self
+    }
+
+    /// Set the regulator owner
+    pub const fn with_owner(mut self, owner: &'static ThisModule) -> Self {
+        self.0.owner = owner.as_ptr();
+        self
+    }
+
+    /// Set the name used to identify the regulator in the DT.
+    pub const fn with_of_match(mut self, of_match: &'static CStr) -> Self {
+        self.0.of_match = of_match.as_char_ptr();
+        self
+    }
+}
+
+// SAFETY: `Desc` cannot be modified after its declaration and owns its data, hence it is safe
+// to share references between threads.
+unsafe impl Sync for Desc {}
+
+/// [`Device`]'s Config
+///
+/// # Examples
+///
+/// ```
+/// use kernel::regulator::driver::Config;
+/// # use kernel::regulator::driver::{Desc, Device};
+/// # use kernel::{device, sync::Arc};
+///
+/// struct DriverData(u32);
+///
+/// # fn probe(dev: &device::Device, desc: &'static Desc) -> Result {
+/// let config = Config::<Arc<DriverData>>::new(dev, Arc::new(DriverData(128), GFP_KERNEL)?);
+/// let reg = Device::register(dev, desc, config)?;
+/// #     Ok(())
+/// # }
+/// ```
+///
+/// # Invariants
+///
+/// `self.cfg` always hold valid data.
+pub struct Config<T: ForeignOwnable + Send + Sync = ()> {
+    cfg: bindings::regulator_config,
+    data: T,
+}
+
+impl<T: ForeignOwnable + Send + Sync> Config<T> {
+    /// Create a [`Device`] config.
+    pub fn new(dev: &device::Device, data: T) -> Self {
+        Self {
+            cfg: bindings::regulator_config {
+                dev: dev.as_raw(),
+                ..Default::default()
+            },
+            data,
+        }
+    }
+}
+
+/// Regulator device
+///
+/// Abstraction for `struct regulator_dev`.
+///
+/// # Invariants
+///
+/// * `self.rdev` is valid and non-null.
+/// * [`Self`] has owns `self.rdev` memory allocation.
+/// * [`Self`] has owns memory of type `T` that can be retrieved through `rdev_get_drvdata`.
+pub struct Device<T: ForeignOwnable + Send + Sync> {
+    rdev: NonNull<bindings::regulator_dev>,
+    _data_type: PhantomData<T>,
+}
+
+impl<T: ForeignOwnable + Send + Sync> Device<T> {
+    /// # Safety
+    ///
+    /// `rdev` must be valid and non-null.
+    unsafe fn from_raw(rdev: *mut bindings::regulator_dev) -> ManuallyDrop<Self> {
+        ManuallyDrop::new(Self {
+            // SAFETY: The caller of `Self::from_raw` must garantee that `rdev` is non-null and
+            // valid..
+            rdev: unsafe { NonNull::new_unchecked(rdev) },
+            _data_type: PhantomData::<T>,
+        })
+    }
+
+    /// register a Regulator driver
+    pub fn register(
+        dev: &device::Device,
+        desc: &'static Desc,
+        mut config: Config<T>,
+    ) -> Result<Self> {
+        config.cfg.driver_data = config.data.into_foreign() as _;
+
+        // SAFETY: By the type invariants, we know that `dev.as_ref().as_raw()` is always
+        // valid and non-null, and the descriptor and config are guaranteed to be valid values,
+        // hence it is safe to perform the FFI call.
+        let rdev = from_err_ptr(unsafe {
+            bindings::regulator_register(dev.as_raw(), &desc.0, &config.cfg)
+        })?;
+
+        Ok(Self {
+            rdev: NonNull::new(rdev).ok_or(EINVAL)?,
+            _data_type: PhantomData::<T>,
+        })
+    }
+
+    /// List voltages when the regulator is using linear mapping
+    pub fn list_voltage_linear(&self, selector: u32) -> Result<i32> {
+        // SAFETY: By the type invariants, we know that `self.rdev` is always valid and non-null.
+        // The C function is safe to call with any selector values.
+        let ret = unsafe { bindings::regulator_list_voltage_linear(self.rdev.as_ptr(), selector) };
+        if ret < 0 {
+            return Err(Error::from_errno(ret));
+        }
+        Ok(ret)
+    }
+
+    /// Get regulator's name
+    pub fn get_name(&self) -> &'static CStr {
+        // SAFETY: By the type invariants, we know that `self.rdev` is always valid and non-null.
+        // The C function is guaranteed to return a valid string.
+        unsafe { CStr::from_char_ptr(bindings::rdev_get_name(self.rdev.as_ptr())) }
+    }
+
+    /// Get regulator's ID
+    pub fn get_id(&self) -> i32 {
+        // SAFETY: By the type invariants, we know that `self.rdev` is always valid and non-null.
+        unsafe { bindings::rdev_get_id(self.rdev.as_ptr()) }
+    }
+
+    /// Retrieve driver data associated to `self`
+    pub fn data(&self) -> T::Borrowed<'_> {
+        // SAFETY: By the type invariants, we know that `self.rdev` is always valid and non-null.
+        unsafe { T::borrow(bindings::rdev_get_drvdata(self.rdev.as_ptr())) }
+    }
+}
+
+impl<T: ForeignOwnable + Send + Sync> Drop for Device<T> {
+    fn drop(&mut self) {
+        // SAFETY: The type invariants guarantee that `self.rdev` is valid and non-null,
+        // so it is safe to perform the FFI call.
+        unsafe { bindings::regulator_unregister(self.rdev.as_ptr()) };
+
+        // SAFETY: The type invariants garuantee that `self.rdev` is valid and non-null, and
+        // that `rdev_get_drvdata` is valid memory of type `T` stored there by calling
+        // `T::into_foreign`.
+        unsafe { T::from_foreign(bindings::rdev_get_drvdata(self.rdev.as_ptr())) };
+    }
+}
+
+// SAFETY: `Device` has sole ownership of `self.rdev` and is never read outside of the C
+// implementation. It is safe to use it from any thread.
+unsafe impl<T: ForeignOwnable + Send + Sync> Send for Device<T> {}
+
+// SAFETY: It is OK to access `Device` through shared references from other threads because
+// the C code is insuring proper synchronization of `self.rdev`.
+unsafe impl<T: ForeignOwnable + Send + Sync> Sync for Device<T> {}
+
+/// [`Device`] type
+pub enum Type {
+    /// Voltage regulator
+    Voltage,
+    /// Current regulator
+    Current,
+}
+
+pub(crate) struct Adapter<T>(PhantomData<T>);
+
+impl<T: Driver> Adapter<T> {
+    /// # Safety
+    ///
+    /// `rdev` must be non-null and valid.
+    unsafe extern "C" fn list_voltage_callback(
+        rdev: *mut bindings::regulator_dev,
+        selector: core::ffi::c_uint,
+    ) -> core::ffi::c_int {
+        // SAFETY: Per this function safety requirements, `rdev` is non-null and valid.
+        let mut rdev = unsafe { Device::from_raw(rdev) };
+        from_result(|| T::list_voltage(&mut rdev, selector))
+    }
+
+    /// # Safety
+    ///
+    /// `rdev` and `selector` must be non-null and valid.
+    unsafe extern "C" fn set_voltage_callback(
+        rdev: *mut bindings::regulator_dev,
+        min_uv: core::ffi::c_int,
+        max_uv: core::ffi::c_int,
+        selector: *mut core::ffi::c_uint,
+    ) -> core::ffi::c_int {
+        // SAFETY: Per this function safety requirements, `rdev` is non-null and valid.
+        let mut rdev = unsafe { Device::from_raw(rdev) };
+        match T::set_voltage(&mut rdev, min_uv, max_uv) {
+            Ok(v) => {
+                // SAFETY: Per this function safety requirements, `rdev` is non-null and valid.
+                unsafe { *selector = v as _ };
+                0
+            }
+            Err(e) => e.to_errno(),
+        }
+    }
+
+    /// # Safety
+    ///
+    /// `rdev` must be non-null and valid.
+    unsafe extern "C" fn map_voltage_callback(
+        rdev: *mut bindings::regulator_dev,
+        min_uv: core::ffi::c_int,
+        max_uv: core::ffi::c_int,
+    ) -> core::ffi::c_int {
+        // SAFETY: Per this function safety requirements, `rdev` is non-null and valid.
+        let mut rdev = unsafe { Device::from_raw(rdev) };
+        from_result(|| T::map_voltage(&mut rdev, min_uv, max_uv))
+    }
+
+    /// # Safety
+    ///
+    /// `rdev` must be non-null and valid.
+    unsafe extern "C" fn set_voltage_sel_callback(
+        rdev: *mut bindings::regulator_dev,
+        selector: core::ffi::c_uint,
+    ) -> core::ffi::c_int {
+        // SAFETY: Per this function safety requirements, `rdev` is non-null and valid.
+        let mut rdev = unsafe { Device::from_raw(rdev) };
+        from_result(|| {
+            T::set_voltage_sel(&mut rdev, selector)?;
+            Ok(0)
+        })
+    }
+
+    /// # Safety
+    ///
+    /// `rdev` must be non-null and valid.
+    unsafe extern "C" fn get_voltage_callback(
+        rdev: *mut bindings::regulator_dev,
+    ) -> core::ffi::c_int {
+        // SAFETY: Per this function safety requirements, `rdev` is non-null and valid.
+        let mut rdev = unsafe { Device::from_raw(rdev) };
+        from_result(|| T::get_voltage(&mut rdev))
+    }
+
+    /// # Safety
+    ///
+    /// `rdev` must be non-null and valid.
+    unsafe extern "C" fn get_voltage_sel_callback(
+        rdev: *mut bindings::regulator_dev,
+    ) -> core::ffi::c_int {
+        // SAFETY: Per this function safety requirements, `rdev` is non-null and valid.
+        let mut rdev = unsafe { Device::from_raw(rdev) };
+        from_result(|| T::get_voltage_sel(&mut rdev))
+    }
+
+    /// # Safety
+    ///
+    /// `rdev` must be non-null and valid.
+    unsafe extern "C" fn set_current_limit_callback(
+        rdev: *mut bindings::regulator_dev,
+        min_ua: core::ffi::c_int,
+        max_ua: core::ffi::c_int,
+    ) -> core::ffi::c_int {
+        // SAFETY: Per this function safety requirements, `rdev` is non-null and valid.
+        let mut rdev = unsafe { Device::from_raw(rdev) };
+        from_result(|| {
+            T::set_current_limit(&mut rdev, min_ua, max_ua)?;
+            Ok(0)
+        })
+    }
+
+    /// # Safety
+    ///
+    /// `rdev` must be non-null and valid.
+    unsafe extern "C" fn get_current_limit_callback(
+        rdev: *mut bindings::regulator_dev,
+    ) -> core::ffi::c_int {
+        // SAFETY: Per this function safety requirements, `rdev` is non-null and valid.
+        let mut rdev = unsafe { Device::from_raw(rdev) };
+        from_result(|| T::get_current_limit(&mut rdev))
+    }
+
+    /// # Safety
+    ///
+    /// `rdev` must be non-null and valid.
+    unsafe extern "C" fn set_active_discharge_callback(
+        rdev: *mut bindings::regulator_dev,
+        enable: bool,
+    ) -> core::ffi::c_int {
+        // SAFETY: Per this function safety requirements, `rdev` is non-null and valid.
+        let mut rdev = unsafe { Device::from_raw(rdev) };
+        from_result(|| {
+            T::set_active_discharge(&mut rdev, enable)?;
+            Ok(0)
+        })
+    }
+
+    /// # Safety
+    ///
+    /// `rdev` must be non-null and valid.
+    unsafe extern "C" fn enable_callback(rdev: *mut bindings::regulator_dev) -> core::ffi::c_int {
+        // SAFETY: Per this function safety requirements, `rdev` is non-null and valid.
+        let mut rdev = unsafe { Device::from_raw(rdev) };
+        from_result(|| {
+            T::enable(&mut rdev)?;
+            Ok(0)
+        })
+    }
+
+    /// # Safety
+    ///
+    /// `rdev` must be non-null and valid.
+    unsafe extern "C" fn disable_callback(rdev: *mut bindings::regulator_dev) -> core::ffi::c_int {
+        // SAFETY: Per this function safety requirements, `rdev` is non-null and valid.
+        let mut rdev = unsafe { Device::from_raw(rdev) };
+        from_result(|| {
+            T::disable(&mut rdev)?;
+            Ok(0)
+        })
+    }
+
+    /// # Safety
+    ///
+    /// `rdev` must be non-null and valid.
+    unsafe extern "C" fn is_enabled_callback(
+        rdev: *mut bindings::regulator_dev,
+    ) -> core::ffi::c_int {
+        // SAFETY: Per this function safety requirements, `rdev` is non-null and valid.
+        let mut rdev = unsafe { Device::from_raw(rdev) };
+        from_result(|| {
+            T::is_enabled(&mut rdev)?;
+            Ok(0)
+        })
+    }
+
+    /// # Safety
+    ///
+    /// `rdev` must be non-null and valid.
+    unsafe extern "C" fn set_mode_callback(
+        rdev: *mut bindings::regulator_dev,
+        mode: core::ffi::c_uint,
+    ) -> core::ffi::c_int {
+        // SAFETY: Per this function safety requirements, `rdev` is non-null and valid.
+        let mut rdev = unsafe { Device::from_raw(rdev) };
+        from_result(|| {
+            let mode = Mode::try_from(mode).unwrap_or(Mode::Invalid);
+            T::set_mode(&mut rdev, mode)?;
+            Ok(0)
+        })
+    }
+
+    /// # Safety
+    ///
+    /// `rdev` must be non-null and valid.
+    unsafe extern "C" fn get_mode_callback(
+        rdev: *mut bindings::regulator_dev,
+    ) -> core::ffi::c_uint {
+        // SAFETY: Per this function safety requirements, `rdev` is non-null and valid.
+        let mut rdev = unsafe { Device::from_raw(rdev) };
+        T::get_mode(&mut rdev) as _
+    }
+
+    /// # Safety
+    ///
+    /// `rdev` must be non-null and valid.
+    unsafe extern "C" fn get_status_callback(
+        rdev: *mut bindings::regulator_dev,
+    ) -> core::ffi::c_int {
+        // SAFETY: Per this function safety requirements, `rdev` is non-null and valid.
+        let mut rdev = unsafe { Device::from_raw(rdev) };
+        from_result(|| Ok(T::get_status(&mut rdev)? as _))
+    }
+
+    /// # Safety
+    ///
+    /// `rdev` must be non-null and valid.
+    unsafe extern "C" fn set_suspend_voltage_callback(
+        rdev: *mut bindings::regulator_dev,
+        uv: core::ffi::c_int,
+    ) -> core::ffi::c_int {
+        // SAFETY: Per this function safety requirements, `rdev` is non-null and valid.
+        let mut rdev = unsafe { Device::from_raw(rdev) };
+        from_result(|| {
+            T::set_suspend_voltage(&mut rdev, uv)?;
+            Ok(0)
+        })
+    }
+
+    /// # Safety
+    ///
+    /// `rdev` must be non-null and valid.
+    unsafe extern "C" fn set_suspend_enable_callback(
+        rdev: *mut bindings::regulator_dev,
+    ) -> core::ffi::c_int {
+        // SAFETY: Per this function safety requirements, `rdev` is non-null and valid.
+        let mut rdev = unsafe { Device::from_raw(rdev) };
+        from_result(|| {
+            T::set_suspend_enable(&mut rdev)?;
+            Ok(0)
+        })
+    }
+
+    /// # Safety
+    ///
+    /// `rdev` must be non-null and valid.
+    unsafe extern "C" fn set_suspend_disable_callback(
+        rdev: *mut bindings::regulator_dev,
+    ) -> core::ffi::c_int {
+        // SAFETY: Per this function safety requirements, `rdev` is non-null and valid.
+        let mut rdev = unsafe { Device::from_raw(rdev) };
+        from_result(|| {
+            T::set_suspend_disable(&mut rdev)?;
+            Ok(0)
+        })
+    }
+
+    /// # Safety
+    ///
+    /// `rdev` must be non-null and valid.
+    unsafe extern "C" fn set_suspend_mode_callback(
+        rdev: *mut bindings::regulator_dev,
+        mode: core::ffi::c_uint,
+    ) -> core::ffi::c_int {
+        // SAFETY: Per this function safety requirements, `rdev` is non-null and valid.
+        let mut rdev = unsafe { Device::from_raw(rdev) };
+        from_result(|| {
+            let mode = Mode::try_from(mode).unwrap_or(Mode::Invalid);
+            T::set_suspend_mode(&mut rdev, mode)?;
+            Ok(0)
+        })
+    }
+
+    const VTABLE: bindings::regulator_ops = bindings::regulator_ops {
+        list_voltage: if T::HAS_LIST_VOLTAGE {
+            Some(Adapter::<T>::list_voltage_callback)
+        } else {
+            None
+        },
+        set_voltage: if T::HAS_SET_VOLTAGE {
+            Some(Adapter::<T>::set_voltage_callback)
+        } else {
+            None
+        },
+        map_voltage: if T::HAS_MAP_VOLTAGE {
+            Some(Adapter::<T>::map_voltage_callback)
+        } else {
+            None
+        },
+        set_voltage_sel: if T::HAS_SET_VOLTAGE_SEL {
+            Some(Adapter::<T>::set_voltage_sel_callback)
+        } else {
+            None
+        },
+        get_voltage: if T::HAS_GET_VOLTAGE {
+            Some(Adapter::<T>::get_voltage_callback)
+        } else {
+            None
+        },
+        get_voltage_sel: if T::HAS_GET_VOLTAGE_SEL {
+            Some(Adapter::<T>::get_voltage_sel_callback)
+        } else {
+            None
+        },
+        set_current_limit: if T::HAS_SET_CURRENT_LIMIT {
+            Some(Adapter::<T>::set_current_limit_callback)
+        } else {
+            None
+        },
+        get_current_limit: if T::HAS_GET_CURRENT_LIMIT {
+            Some(Adapter::<T>::get_current_limit_callback)
+        } else {
+            None
+        },
+        set_active_discharge: if T::HAS_SET_ACTIVE_DISCHARGE {
+            Some(Adapter::<T>::set_active_discharge_callback)
+        } else {
+            None
+        },
+        enable: if T::HAS_ENABLE {
+            Some(Adapter::<T>::enable_callback)
+        } else {
+            None
+        },
+        disable: if T::HAS_DISABLE {
+            Some(Adapter::<T>::disable_callback)
+        } else {
+            None
+        },
+        is_enabled: if T::HAS_IS_ENABLED {
+            Some(Adapter::<T>::is_enabled_callback)
+        } else {
+            None
+        },
+        set_mode: if T::HAS_SET_MODE {
+            Some(Adapter::<T>::set_mode_callback)
+        } else {
+            None
+        },
+        get_mode: if T::HAS_GET_MODE {
+            Some(Adapter::<T>::get_mode_callback)
+        } else {
+            None
+        },
+        get_status: if T::HAS_GET_STATUS {
+            Some(Adapter::<T>::get_status_callback)
+        } else {
+            None
+        },
+        set_suspend_voltage: if T::HAS_SET_SUSPEND_VOLTAGE {
+            Some(Adapter::<T>::set_suspend_voltage_callback)
+        } else {
+            None
+        },
+        set_suspend_enable: if T::HAS_SET_SUSPEND_ENABLE {
+            Some(Adapter::<T>::set_suspend_enable_callback)
+        } else {
+            None
+        },
+        set_suspend_disable: if T::HAS_SET_SUSPEND_DISABLE {
+            Some(Adapter::<T>::set_suspend_disable_callback)
+        } else {
+            None
+        },
+        set_suspend_mode: if T::HAS_SET_SUSPEND_MODE {
+            Some(Adapter::<T>::set_suspend_mode_callback)
+        } else {
+            None
+        },
+        // SAFETY: The rest is zeroed out to initialize `struct regulator_ops`,
+        // sets `Option<&F>` to be `None`.
+        ..unsafe { core::mem::zeroed() }
+    };
+
+    const fn build() -> &'static bindings::regulator_ops {
+        &Self::VTABLE
+    }
+}

-- 
2.45.2


