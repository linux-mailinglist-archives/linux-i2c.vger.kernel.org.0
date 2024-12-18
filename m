Return-Path: <linux-i2c+bounces-8610-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B3F9F70DE
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Dec 2024 00:37:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77ADF16F05F
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2024 23:37:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37BC41FDE06;
	Wed, 18 Dec 2024 23:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b4es2Ivx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBEA1FD78C;
	Wed, 18 Dec 2024 23:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734565042; cv=none; b=XfXKVEzYpfAmiXuSxVnBojUd0OOi0gYhCjfhME0i3zdVtfJ01NxqDvG85BFIWEJEzioQK3BzSh/U1vJ7rTsKBvdPOcf0aYPPWSsDdG7yUbpZDpNQojGl9pWw4aMC5ILQj2JOx5wMShUXqwiMQKK/oY0sR8eQV0StVqc8qwavlHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734565042; c=relaxed/simple;
	bh=4SE9setPSSrH0hJjJY1xCu9tx2HYa/TBhF8z5FVIs4g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q8sC7ocsogEHQ0o7Jz9kSi0vjPb6XeKj+aNKDkhlCBUEC3tAzJgflGeTdLst18oez23Nl0zByt+5R+Ct59Xi1T3iqhPGRZrs6Cuxs6ua+AMCVk6KfSaHXz9VhC3pzs9j1LoS9101o9c0FHPi8kE4zXup83rkuQ6EawKZYPZpGSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b4es2Ivx; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-21654fdd5daso1958805ad.1;
        Wed, 18 Dec 2024 15:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734565039; x=1735169839; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UhAzgwSjNox/FIb+hLHlHMNNI9yeP1VLZ/ht4Xnzx9w=;
        b=b4es2Ivx440lTh6viRB9LN5BYyxzNn55qYZowsx6aFWnjagV4qKvrwqBh9UkKIH7Sy
         LI3NG61EhxWMxbzPeBKEGqOyy0jhUT2dZmxlQrZhxv3YtkDlFUjDDEJU2WDk6fLosDMV
         tmzO7njsMRSUwbLQ7yiyuy3AdZXl3HK/mRHpr1ihMDIEyuyWfA6khYXJ6jb57F8g8ROE
         l8wMzYnq7hKdAgPL3rPcuOxUy4G6o2Y2wi1zvsvFyKLfYr/9ZwDEyEXGZrqtih9o796W
         93/6o9MC2tAFW8opb8klHeLuq14oteCmRNzDcgQDBToJbAprKtIRBuPqUuRLtM6l+Jzx
         7R2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734565039; x=1735169839;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UhAzgwSjNox/FIb+hLHlHMNNI9yeP1VLZ/ht4Xnzx9w=;
        b=K4H0pzWnvI/aGwSASqsn5TC+IwJ8GTjJ+FD6TGk0fZRMROelEdx0Bu6fcTihavjRuV
         V64OxIDEzvsck+xmTUkeA00NA5acAVA0zwgJ7apAeqjzvN2gZqk+HAMjgthCMkdXC/eg
         fIQJpUiXNzbpIXWGlSTtnV6409U0vKuopTao45WSLQwaUmCBbS4R5DCS5Z8TYD2QKdEs
         xZUNQlc0S0KclK83p2Nbac5wPoOODtxjEKehk+WDUWj+XqATRmQNManMWm7zq4ThNpqz
         sJsH7nS1539sKhqlo/v4ApDOp5yAwi4RND6HoOKwJYeBK4DmyABdkzZc/np1ArvzMyyp
         g8ww==
X-Forwarded-Encrypted: i=1; AJvYcCUFlKmqjaToa95W6uLYp2mD1cgENnVZOCDjRufS+VRrgm7fRC8nidX8vabYjlVbG64hHuS3qODB9BGk@vger.kernel.org, AJvYcCWVwhcqW7QwmgtQST7GT8rcQ+wkGV6vy+F9buB17XkZqzRB0shc8R6VzwDp8e6zYIA6RZLMk479sbur57le@vger.kernel.org, AJvYcCWnrtplwpG8FZiNZ/WTuziE+Brd3O7W6/KVe44a1yGZ36Auy4lFQM6Qqy5EHGhEP7rTaIg2yZ9QSamviEgl@vger.kernel.org, AJvYcCXHUAm7KmTsM5H7Gvh12Jr/0KJk3XxJxwhlM1ZM/CG1+Dh86sTu9HrUWZe3HbHkuhqfVinBhymULPMi+KdLWAo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVnUYUmb/nwrLtfrAj76ZR8f9WSnjWu2SCY/XRr8bFo2/crtHf
	DV6LdIfYE6xQO+Eu50i/BBOkNEfxCQVAM3R0i5UUrJgsPoj3yy+a
X-Gm-Gg: ASbGncvwhtRtHg/zmbj3HOhOLbf7m9PkrRhPv+Kt4MMbE9v4873uRcAsfjf7SwECm10
	3gPVKC4JZY6bPSk+nG48yTrLt/lEasI6CiDf9B51vgO5V+GNLEdBuHRI6dWM5M3NYf7IUe0nPSa
	a0Hya5ywlVGHtklFti11UqnwYCLJHVpxu6p49RFCVTahJxOcW8+9hVZYJjlp5OdchmWm2w4pdmO
	bdsn2NqPaMRDa4IWNeoltS+99oxBJjEl1Nc/YeG0wV3ANbhF/lqExkL
X-Google-Smtp-Source: AGHT+IG25MGGi4G1Umt/pBxrQoT0UKWAYNG0VN2GMrkgQXxU0hwxukqEiX52e1fIsrdjr9zWG8xfmg==
X-Received: by 2002:a17:902:ec81:b0:216:5568:38c9 with SMTP id d9443c01a7336-218d72349edmr71021735ad.31.1734565039076;
        Wed, 18 Dec 2024 15:37:19 -0800 (PST)
Received: from [127.0.1.1] ([2001:569:fcea:600:2e06:283e:5daa:4d0f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f6967sm802335ad.214.2024.12.18.15.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 15:37:18 -0800 (PST)
From: Fabien Parent <parent.f@gmail.com>
Date: Wed, 18 Dec 2024 15:36:31 -0800
Subject: [PATCH 1/9] rust: i2c: add basic I2C client abstraction
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241218-ncv6336-v1-1-b8d973747f7a@gmail.com>
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
 Fabien Parent <fabien.parent@linaro.org>, Fiona Behrens <me@kloenk.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=13005; i=parent.f@gmail.com;
 h=from:subject:message-id; bh=kd7a0C90uxuWTBjnlJWT2Q5dPINXmEd9sR6MvOUkVYg=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0o0bkFGdEFwTDlrQTBEQUFvQmlKc2d4Q
 kw5cktRQnl5WmlBR2RqWEtMNE1RVFdRTFpsRGxBdVl0WHJwNFVPCjFvc1d6OTYvZUZFOVByUXNZ
 Z1NYWjRrQ013UUFBUW9BSFJZaEJONk0wZElMeXpzd3JmRnNxWWliSU1RUy9heWsKQlFKblkxeWl
 BQW9KRUlpYklNUVMvYXlrOFNZUC9SQzVQZGIvdktiZ2RaOXBoY2pvQWMzWElFemFzTm1SMHVmMA
 orRE5FQlQ2YmhISzFyQVM2NStoTU5ET1g4VlZVTFBBejNjQTVjWGJmSm1uVGtoelgzaEt6Z1pUS
 TNocjdrUXgwCmxXU3JpU1J1QnUzYVZCN2pJS3FlanhKU3JCNytUZStWeC9NbDNaYWNsWHJkZzFD
 NnNRc3lWSWRkbjNPd3hTVEEKenZERmxxZDN5d3FaR25ocXZkLy9iL3ZXdzlYcEJ3cXF3ZnJLL0R
 MdDRDQnZxeTB6eDhsYk9SYUNCa3pxVHUrMAp1cGkzRmUvQ2FIbXBUNXpjOFpMN3pZalNtRzU5WH
 p2c2g2RndRcklVT0N6eTcvUVZqMDhaNXpEMVZRdzhsYWRZCmw0YStacENWR3V2Smtld1hMVkJOa
 EV3U0MvbDFuOW9SUFhyVFVYUmlNWlNPcDZyV01hZ3NXdmhyem1aUk1GakcKU2NySkNUdEhZWTNL
 OFhnZmt3WlhZS1preVFkS2ZRUjV1Z3lxcjVDbnhNRWwzbisvZVlIMTFPQWhGU1BhY2lDNgpjNVJ
 RQWI2MGNUeHcvTCtKUjM4ckE4UnZiM2JHY25JTnRMRkZyUHZWYy9PN2ZJYnNoSS8rZHdFMGt0Nj
 ZoMCsvCmk3YjVMR01BM3ZIcGR0VUNmRDJyZDZxd0VOelJoODdMdERRWDNDcXpkeHJ5SG1FYnhhZ
 E52OTZaVVBhTWtuZnMKMEhjZzZmRERtYU9ycU5ZWnVhcDBxcWJ0VWlaM00vQ29OOGRqd0VPemho
 NDhBRjBUcUJjbUc5UU4ybUhRUE1TLwpVaW94UWEvbUZscDM0N1lKUWRqRzZNTVB6YUV5TGZrUFJ
 NbTJjN0o1bUUrZDNhbmxacllyQXdTNFl4QUFrMVNJCk5meVpWaHUvT0NBMytnPT0KPWpHVUMKLS
 0tLS1FTkQgUEdQIE1FU1NBR0UtLS0tLQo=
X-Developer-Key: i=parent.f@gmail.com; a=openpgp;
 fpr=07BB034F9E8E3AF0DF4CF7607AE864A1E16FA383

From: Fiona Behrens <me@kloenk.dev>

Implement an abstraction to write I2C device drivers. The abstraction
is pretty basic and provides just the infrastructure to probe
a device from I2C/OF device_id and abstract `i2c_client`.
The client will be used by the Regmap abstraction to perform
I/O on the I2C bus.

Signed-off-by: Fiona Behrens <me@kloenk.dev>
Co-developed-by: Fabien Parent <fabien.parent@linaro.org>
Signed-off-by: Fabien Parent <fabien.parent@linaro.org>
---
 MAINTAINERS                     |   1 +
 rust/bindings/bindings_helper.h |   1 +
 rust/helpers/helpers.c          |   1 +
 rust/helpers/i2c.c              |  13 ++
 rust/kernel/i2c.rs              | 288 ++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |   2 +
 6 files changed, 306 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6b9e10551392c185b9314c9f94edeaf6e85af58f..961fe4ed39605bf489d1d9e473f47bccb692ff14 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10796,6 +10796,7 @@ F:	include/linux/i2c-smbus.h
 F:	include/linux/i2c.h
 F:	include/uapi/linux/i2c-*.h
 F:	include/uapi/linux/i2c.h
+F:	rust/kernel/i2c.rs
 
 I2C SUBSYSTEM HOST DRIVERS
 M:	Andi Shyti <andi.shyti@kernel.org>
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index e9fdceb568b8f94e602ee498323e5768a40a6cba..a882efb90bfc27960ef1fd5f2dc8cc40533a1c27 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -16,6 +16,7 @@
 #include <linux/file.h>
 #include <linux/firmware.h>
 #include <linux/fs.h>
+#include <linux/i2c.h>
 #include <linux/jiffies.h>
 #include <linux/jump_label.h>
 #include <linux/mdio.h>
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 0640b7e115be1553549312dcfdf842bcae3bde1b..630e903f516ee14a51f46ff0bcc68e8f9a64021a 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -15,6 +15,7 @@
 #include "device.c"
 #include "err.c"
 #include "fs.c"
+#include "i2c.c"
 #include "io.c"
 #include "jump_label.c"
 #include "kunit.c"
diff --git a/rust/helpers/i2c.c b/rust/helpers/i2c.c
new file mode 100644
index 0000000000000000000000000000000000000000..8ffdc454e7597cc61909da5b3597057aeb5f7299
--- /dev/null
+++ b/rust/helpers/i2c.c
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/i2c.h>
+
+void *rust_helper_i2c_get_clientdata(const struct i2c_client *client)
+{
+	return i2c_get_clientdata(client);
+}
+
+void rust_helper_i2c_set_clientdata(struct i2c_client *client, void *data)
+{
+	i2c_set_clientdata(client, data);
+}
diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
new file mode 100644
index 0000000000000000000000000000000000000000..efa03335e5b59e72738380e94213976b2464c25b
--- /dev/null
+++ b/rust/kernel/i2c.rs
@@ -0,0 +1,288 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Abstractions for the I2C bus.
+//!
+//! C header: [`include/linux/i2c.h`](srctree/include/linux/i2c.h)
+
+use crate::{
+    bindings, container_of,
+    device::Device,
+    device_id::{self, RawDeviceId},
+    driver,
+    error::{to_result, Result},
+    of,
+    prelude::*,
+    str::CStr,
+    types::{ARef, ForeignOwnable, Opaque},
+    ThisModule,
+};
+
+/// Abstraction for `bindings::i2c_device_id`.
+#[repr(transparent)]
+#[derive(Clone, Copy)]
+pub struct DeviceId(bindings::i2c_device_id);
+
+impl DeviceId {
+    /// Create a new device id from an I2C name.
+    pub const fn new(name: &CStr) -> Self {
+        let src = name.as_bytes_with_nul();
+        // TODO: Replace with `bindings::i2c_device_id::default()` once stabilized for `const`.
+        // SAFETY: FFI type is valid to be zero-initialized.
+        let mut i2c: bindings::i2c_device_id = unsafe { core::mem::zeroed() };
+
+        let mut i = 0;
+        while i < src.len() {
+            i2c.name[i] = src[i] as _;
+            i += 1;
+        }
+
+        Self(i2c)
+    }
+}
+
+// SAFETY:
+// * `DeviceId` is a `#[repr(transparent)` wrapper of `i2c_device_id` and does not add
+//   additional invariants, so it's safe to transmute to `RawType`.
+// * `DRIVER_DATA_OFFSET` is the offset to the `data` field.
+unsafe impl RawDeviceId for DeviceId {
+    type RawType = bindings::i2c_device_id;
+
+    const DRIVER_DATA_OFFSET: usize = core::mem::offset_of!(bindings::i2c_device_id, driver_data);
+
+    fn index(&self) -> usize {
+        self.0.driver_data as _
+    }
+}
+
+/// I2C [`DeviceId`] table.
+pub type IdTable<T> = &'static dyn device_id::IdTable<DeviceId, T>;
+
+/// An adapter for the registration of I2C drivers.
+#[doc(hidden)]
+pub struct Adapter<T: Driver + 'static>(T);
+
+impl<T: Driver + 'static> driver::RegistrationOps for Adapter<T> {
+    type RegType = bindings::i2c_driver;
+
+    fn register(
+        i2cdrv: &Opaque<Self::RegType>,
+        name: &'static CStr,
+        module: &'static ThisModule,
+    ) -> Result {
+        // SAFETY: It's safe to set the fields of `struct i2c_driver` on initialization.
+        unsafe {
+            (*i2cdrv.get()).driver.name = name.as_char_ptr();
+            (*i2cdrv.get()).probe = Some(Self::probe_callback);
+            (*i2cdrv.get()).remove = Some(Self::remove_callback);
+            if let Some(t) = T::I2C_ID_TABLE {
+                (*i2cdrv.get()).id_table = t.as_ptr();
+            }
+            if let Some(t) = T::OF_ID_TABLE {
+                (*i2cdrv.get()).driver.of_match_table = t.as_ptr();
+            }
+        }
+
+        // SAFETY: `i2cdrv` is guaranteed to be a valid `RegType`.
+        to_result(unsafe { bindings::i2c_register_driver(module.0, i2cdrv.get()) })
+    }
+
+    fn unregister(i2cdrv: &Opaque<Self::RegType>) {
+        // SAFETY: `i2cdrv` is guaranteed to be a valid `RegType`.
+        unsafe { bindings::i2c_del_driver(i2cdrv.get()) };
+    }
+}
+
+impl<T: Driver> Adapter<T> {
+    /// Get the [`Self::IdInfo`] that matched during probe.
+    fn id_info(client: &mut Client) -> Option<&'static T::IdInfo> {
+        let id = <Self as driver::Adapter>::id_info(client.as_ref());
+        if id.is_some() {
+            return id;
+        }
+
+        // SAFETY: `client` and `client.as_raw()` are guaranteed to be valid.
+        let id = unsafe { bindings::i2c_client_get_device_id(client.as_raw()) };
+        if !id.is_null() {
+            // SAFETY: `DeviceId` is a `#[repr(transparent)` wrapper of `struct i2c_device_id` and
+            // does not add additional invariants, so it's safe to transmute.
+            let id = unsafe { &*id.cast::<DeviceId>() };
+            return Some(T::I2C_ID_TABLE?.info(id.index()));
+        }
+
+        None
+    }
+
+    extern "C" fn probe_callback(client: *mut bindings::i2c_client) -> core::ffi::c_int {
+        // SAFETY: The i2c bus only ever calls the probe callback with a valid `client`.
+        let dev = unsafe { Device::get_device(core::ptr::addr_of_mut!((*client).dev)) };
+        // SAFETY: `dev` is guaranteed to be embedded in a valid `struct i2c_client` by the
+        // call above.
+        let mut client = unsafe { Client::from_dev(dev) };
+
+        let info = Self::id_info(&mut client);
+        match T::probe(&mut client, info) {
+            Ok(data) => {
+                // Let the `struct i2c_client` own a reference of the driver's private data.
+                // SAFETY: By the type invariant `client.as_raw` returns a valid pointer to a
+                // `struct i2c_client`.
+                unsafe { bindings::i2c_set_clientdata(client.as_raw(), data.into_foreign() as _) };
+            }
+            Err(err) => return Error::to_errno(err),
+        }
+
+        0
+    }
+
+    extern "C" fn remove_callback(client: *mut bindings::i2c_client) {
+        // SAFETY: `client` is a valid pointer to a `struct i2c_client`.
+        let ptr = unsafe { bindings::i2c_get_clientdata(client) };
+
+        // SAFETY: `remove_callback` is only ever called after a successful call to
+        // `probe_callback`, hence it's guaranteed that `ptr` points to a valid and initialized
+        // `KBox<T>` pointer created through `KBox::into_foreign`.
+        let _ = unsafe { KBox::<T>::from_foreign(ptr) };
+    }
+}
+
+impl<T: Driver + 'static> driver::Adapter for Adapter<T> {
+    type IdInfo = T::IdInfo;
+
+    fn of_id_table() -> Option<of::IdTable<Self::IdInfo>> {
+        T::OF_ID_TABLE
+    }
+}
+
+/// The I2C driver trait.
+///
+/// Drivers must implement this trait in order to get a i2c driver registered.
+///
+/// # Example
+///
+///```
+/// # use kernel::{bindings, c_str, i2c, of};
+/// #
+/// kernel::of_device_table!(
+///     OF_ID_TABLE,
+///     MODULE_OF_ID_TABLE,
+///     <MyDriver as i2c::Driver>::IdInfo,
+///     [(of::DeviceId::new(c_str!("onnn,ncv6336")), ()),]
+/// );
+///
+/// kernel::i2c_device_table!(
+///     I2C_ID_TABLE,
+///     MODULE_I2C_ID_TABLE,
+///     <MyDriver as i2c::Driver>::IdInfo,
+///     [(i2c::DeviceId::new(c_str!("ncv6336")), ()),]
+/// );
+///
+/// struct MyDriver;
+///
+/// impl i2c::Driver for MyDriver {
+///     type IdInfo = ();
+///     const OF_ID_TABLE: Option<of::IdTable<Self::IdInfo>> = Some(&OF_ID_TABLE);
+///     const I2C_ID_TABLE: Option<i2c::IdTable<Self::IdInfo>> = Some(&I2C_ID_TABLE);
+///
+///     fn probe(_client: &mut i2c::Client,
+///              id_info: Option<&Self::IdInfo>) -> Result<Pin<KBox<Self>>> {
+///         Ok(KBox::new(Self, GFP_KERNEL)?.into())
+///     }
+/// }
+///```
+pub trait Driver {
+    /// The type holding information about each device id supported by the driver.
+    // TODO: Use associated_type_defaults once stabilized:
+    // type IdInfo: 'static = ();
+    type IdInfo: 'static;
+
+    /// An optional table of I2C device ids supported by the driver.
+    const I2C_ID_TABLE: Option<IdTable<Self::IdInfo>>;
+
+    /// An optional table of OF device ids supported by the driver.
+    const OF_ID_TABLE: Option<of::IdTable<Self::IdInfo>>;
+
+    /// I2C driver probe.
+    ///
+    /// Called when a new I2C client is added or discovered.
+    fn probe(client: &mut Client, id_info: Option<&Self::IdInfo>) -> Result<Pin<KBox<Self>>>;
+}
+
+/// An I2C Client.
+///
+/// # Invariants
+///
+/// `Client` holds a valid reference of `ARef<device::Device>` whose underlying `struct device` is a
+/// member of a `struct i2c_client`.
+#[derive(Clone)]
+pub struct Client(ARef<Device>);
+
+impl Client {
+    /// Convert a raw kernel device into a `Client`
+    ///
+    /// # Safety
+    ///
+    /// `dev` must be an `Aref<Device>` whose underlying `bindings::device` is a member of a
+    /// `bindings::i2c_client`.
+    unsafe fn from_dev(dev: ARef<Device>) -> Self {
+        Self(dev)
+    }
+
+    /// Returns the raw `struct i2c_client`.
+    pub fn as_raw(&self) -> *mut bindings::i2c_client {
+        // SAFETY: By the type invariant `self.0.as_raw` is a pointer to the `struct device`
+        // embedded in `struct i2c_client`.
+        unsafe { container_of!(self.0.as_raw(), bindings::i2c_client, dev) }.cast_mut()
+    }
+}
+
+impl AsRef<Device> for Client {
+    fn as_ref(&self) -> &Device {
+        &self.0
+    }
+}
+
+/// Declares a kernel module that exposes a single I2C driver.
+///
+/// # Examples
+///
+/// ```ignore
+/// kernel::module_i2c_driver! {
+///     type: MyDriver,
+///     name: "Module name",
+///     author: "Author name",
+///     description: "Description",
+///     license: "GPL v2",
+/// }
+/// ```
+#[macro_export]
+macro_rules! module_i2c_driver {
+    ($($f:tt)*) => {
+        $crate::module_driver!(<T>, $crate::i2c::Adapter<T>, { $($f)* });
+    };
+}
+
+/// Create an I2C `IdTable` with an "alias" for modpost.
+///
+/// # Examples
+///
+/// ```
+/// use kernel::{c_str, i2c};
+///
+/// kernel::i2c_device_table!(
+///     I2C_ID_TABLE,
+///     MODULE_I2C_ID_TABLE,
+///     u32,
+///     [(i2c::DeviceId::new(c_str!("ncv6336")), 0x6336),]
+/// );
+/// ```
+#[macro_export]
+macro_rules! i2c_device_table {
+    ($table_name:ident, $module_table_name:ident, $id_info_type: ty, $table_data: expr) => {
+        const $table_name: $crate::device_id::IdArray<
+            $crate::i2c::DeviceId,
+            $id_info_type,
+            { $table_data.len() },
+        > = $crate::device_id::IdArray::new($table_data);
+
+        $crate::module_device_table!("i2c", $module_table_name, $table_name);
+    };
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 7fb9858966e8457611d5868783000844ba640db9..71ef7df94302b689be665676a36bd5c2e6effff3 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -48,6 +48,8 @@
 #[cfg(CONFIG_RUST_FW_LOADER_ABSTRACTIONS)]
 pub mod firmware;
 pub mod fs;
+#[cfg(CONFIG_I2C)]
+pub mod i2c;
 pub mod init;
 pub mod ioctl;
 pub mod jump_label;

-- 
2.45.2


