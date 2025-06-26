Return-Path: <linux-i2c+bounces-11621-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8297AAEA4C7
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Jun 2025 19:55:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1A1F17E0F2
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Jun 2025 17:55:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0E7F2ECE8D;
	Thu, 26 Jun 2025 17:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ADAAlFvd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8EA4A33;
	Thu, 26 Jun 2025 17:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750960530; cv=none; b=U41dJbek1k3CTzSpjJ4HNrxTmAreTS2cI1W8osAweKIzJ9eyiZGygSsyvOrIZWmkpffumN0NonZHQ3eL07zS8sUTkrKCpjDIq1w1y13Bz/CCKDJ/jE+kzZO2BYHsgyUdUMgV4tKm24ti19W9CDpkL4S/kqtT/2s0F6iyuDUEkJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750960530; c=relaxed/simple;
	bh=Is4pl56zzII6m8npRKkdjZoguWllIfYhpTW2lmD+PAA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=unyOuW3//kCNetWHW7NC990I2Tw+Db/gQTT5MdtTe+DuJKNqJ1TE1yaB8jBcjXIXvKK+vDkTVZpO4h4Y36CNBdlL7KM3/BoEndFw4bE9IsDLfEvJdhtdY4Po0SNTznsIzcyhYgteQMQawWNmZ7Y/RWvByKb74BJek9qj5Ts6U+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ADAAlFvd; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-450ce3a2dd5so9937135e9.3;
        Thu, 26 Jun 2025 10:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750960527; x=1751565327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RIDI78zT6DRLAysPKVHAZFjsgIf6iaU9mJj8Cm/tcZE=;
        b=ADAAlFvdbepKDvMJ+B6CBHj9jzRYErFPHoyBo3qro5RQpce+VsGsdgVMMleJZs0eV6
         mcxucvx6Q9I5nlXStUwzTrnXQL5k6pobsmSx3wBrOX5EShgec98H/vQtNn+mhZF49L93
         Gx7VcMk8GRXfxv631tmqUWZZ0avk1aWlFHJJiVYnTdGfq3ewxaTvhj90njeUU57uDEtO
         BK176HPfWMAkYZeZIzokRBdk+R1oeRHcd4jMSIIqNUAKnc1VUDq+Sne9FbUJ+TwZ/xlN
         iJcL1Hgwc99ZSAzsdC5aINJ61FnsPGEBvdUT9CKajfJblWRJ8UYMKfs5w945xTKumiYB
         KWWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750960527; x=1751565327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RIDI78zT6DRLAysPKVHAZFjsgIf6iaU9mJj8Cm/tcZE=;
        b=V35889sTSv45TcND3O6OOKaMQUSvufR3P/7IUXYQ7ouSDvGpmJC+KgeXUBdFI2pd88
         eD1kQOzM6FJEjsYEbYLVL9UogLZhS3fuQHWdYlfCiQkx4FBL98eYn0FTrwsMYIdAI73w
         JYYm7GevtVLFB7w3zuiDHjVcY5BlobP45PjPxeQoXY45hRi0fHKdK/DRhcAIoRyDL0M1
         llhw8Gn6UJoZNFq5xnvS7BHElHQuteMtUNg0NpswS5jRxirjR7jZElaZmKIvwCt769iz
         e+lGfJMm3qtTADfsyDdgE8kyry/PF4BBiRdKWWOic9MRJUpvqBLePh/dkpyrlpBq9Qev
         J9aw==
X-Forwarded-Encrypted: i=1; AJvYcCVXM8rINlpWLmRtOVw5dUwbZa/ykGAhaNG1s01+iIGyb11rxJogFw90ju21mnI+SfESNlhs41PR3zj3j12P@vger.kernel.org, AJvYcCWoea385DyLfgzVIVfTR6Vs50d3NtJkdkgU/yxJjm7NnUahEM+eG++L4sOF+LqqkIX5tQ/AUY7b0kX+Ol4MgMA=@vger.kernel.org, AJvYcCXB520DAB5YHnwKRQ4Qu9lNr60c/k6twNy/tkTfWc7R1zz24XSNpmiyFhwDQGyr4gS8UKdkAXmYquw=@vger.kernel.org
X-Gm-Message-State: AOJu0YySJBtDGNnsvZb4/2MFwXPw21lYJw1blCK8fnEIcjXbj5e7YVOS
	ryqaREDmejw0CX4drCknwpkR2JtlLRVGo6JSMSunpIED6+iBaLcd+t8K
X-Gm-Gg: ASbGncu8zHLqqBpsJ8Zrkxt8M2nhwOSZqpdHtC0A1EOzGEV2xWl+Ceb4mhMae7Ef2u4
	Gnesi1vKwwFINL7VV2jGXXeYLK9FYBAXEetwqzl4Dtem5XI0b59N749DMlJALlYtutTNDv0kDlx
	AaRuyjvQRCvsOIT6zBuiPSu6U0r/mjpivl52yyipfx26NgK13e7jVjwsZibTtmMkV0JZzeUBKfo
	sJ6F508cgVUHjrakBfMf93+/kYYgurueDPI20EwXKsh6tAnVs9XXAMxG0YzwrAhmkmmV29sU+Ym
	2fo/0B2sL4I+kLr7jHaN5ovTvGWnpu0Ua0K5717OJtsLZ5UuUR2moAIXjODE2rKDdV8BIoFwaf+
	Z+07U+wmqxr+23d2i4qghLGfMESZm2bxdSjDnnX2bdWvyGzI=
X-Google-Smtp-Source: AGHT+IEeKzojehoFo40SoZr9b7MARsdE7+Lp7wM9/muxivPRyuPVFMClAKht6pT/YY7xBqPqPC3GIg==
X-Received: by 2002:a05:6000:280d:b0:3a5:27ba:479c with SMTP id ffacd0b85a97d-3a8fe5b1478mr318595f8f.43.1750960527188;
        Thu, 26 Jun 2025 10:55:27 -0700 (PDT)
Received: from igor-korotin-Precision-Tower-3620.airspan.com ([188.39.32.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e52c23sm496813f8f.52.2025.06.26.10.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 10:55:26 -0700 (PDT)
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
Subject: [PATCH v1 3/4] rust: i2c: ACPI ID-table support for I2C abstractions
Date: Thu, 26 Jun 2025 18:53:24 +0100
Message-ID: <20250626175324.908172-1-igor.korotin.linux@gmail.com>
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

Populate driver.acpi_match_table from T::ACPI_ID_TABLE (defaults to None).

Depends-on: <20250620152425.285683-1-igor.korotin.linux@gmail.com>
Signed-off-by: Igor Korotin <igor.korotin.linux@gmail.com>
---
 rust/kernel/i2c.rs | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
index 051f4f2bd38a..c242f1d3921f 100644
--- a/rust/kernel/i2c.rs
+++ b/rust/kernel/i2c.rs
@@ -4,7 +4,7 @@
 
 // I2C Driver abstractions.
 use crate::{
-    container_of, device,
+    acpi, container_of, device,
     device_id::RawDeviceId,
     driver,
     error::*,
@@ -96,6 +96,11 @@ unsafe fn register(
             None => core::ptr::null(),
         };
 
+        let acpi_table = match T::ACPI_ID_TABLE {
+            Some(table) => table.as_ptr(),
+            None => core::ptr::null(),
+        };
+
         // SAFETY: It's safe to set the fields of `struct i2c_client` on initialization.
         unsafe {
             (*pdrv.get()).driver.name = name.as_char_ptr();
@@ -104,6 +109,7 @@ unsafe fn register(
             (*pdrv.get()).shutdown = Some(Self::shutdown_callback);
             (*pdrv.get()).id_table = i2c_table;
             (*pdrv.get()).driver.of_match_table = of_table;
+            (*pdrv.get()).driver.acpi_match_table = acpi_table;
         }
 
         // SAFETY: `pdrv` is guaranteed to be a valid `RegType`.
@@ -187,6 +193,10 @@ impl<T: Driver + 'static> driver::Adapter for Adapter<T> {
     fn of_id_table() -> Option<of::IdTable<Self::IdInfo>> {
         T::OF_ID_TABLE
     }
+
+    fn acpi_id_table() -> Option<acpi::IdTable<Self::IdInfo>> {
+        T::ACPI_ID_TABLE
+    }
 }
 
 /// Declares a kernel module that exposes a single i2c driver.
@@ -216,10 +226,19 @@ macro_rules! module_i2c_driver {
 /// # Example
 ///
 ///```
-/// # use kernel::{bindings, c_str, device::Core, i2c, of};
+/// # use kernel::{acpi, bindings, c_str, device::Core, i2c, of};
 ///
 /// struct MyDriver;
 ///
+/// kernel::acpi_device_table!(
+///     ACPI_TABLE,
+///     MODULE_ACPI_TABLE,
+///     <MyDriver as i2c::Driver>::IdInfo,
+///     [
+///         (acpi::DeviceId::new(b"TST0001"), ())
+///     ]
+/// );
+///
 /// kernel::i2c_device_table!(
 ///     I2C_TABLE,
 ///     MODULE_I2C_TABLE,
@@ -242,6 +261,7 @@ macro_rules! module_i2c_driver {
 ///     type IdInfo = ();
 ///     const I2C_ID_TABLE: Option<i2c::IdTable<Self::IdInfo>> = Some(&I2C_TABLE);
 ///     const OF_ID_TABLE: Option<of::IdTable<Self::IdInfo>> = Some(&OF_TABLE);
+///     const ACPI_ID_TABLE: Option<acpi::IdTable<Self::IdInfo>> = Some(&ACPI_TABLE);
 ///
 ///     fn probe(
 ///         _pdev: &i2c::Device<Core>,
@@ -269,6 +289,9 @@ pub trait Driver: Send {
     /// The table of OF device ids supported by the driver.
     const OF_ID_TABLE: Option<of::IdTable<Self::IdInfo>> = None;
 
+    /// The table of ACPI device ids supported by the driver.
+    const ACPI_ID_TABLE: Option<acpi::IdTable<Self::IdInfo>> = None;
+
     /// I2C driver probe.
     ///
     /// Called when a new i2c device is added or discovered.
-- 
2.43.0


