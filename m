Return-Path: <linux-i2c+bounces-12355-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43069B2E12E
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Aug 2025 17:32:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ADD2E1CC19DC
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Aug 2025 15:26:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62BCD2E8B8D;
	Wed, 20 Aug 2025 15:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="heOZvz5v"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8CF2E8B83;
	Wed, 20 Aug 2025 15:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755703426; cv=none; b=q4X7+WAtnGO5wQgIsg4etQk5wq+Y58U9aoOUzCf0637NWmIwuuRkdSHF813zrNBjBO3Ul6auAC5qqc/MjT/LVWfOf+PlErhy40dPTsP8HTmM2r8AGFZ7CzYCsue2QsJe+AXSdGm95pPYQg+zL+uU6SLJk0nTV9BfwYr65+zGZJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755703426; c=relaxed/simple;
	bh=LMU87ynpw1ytA3AunlRqXwnWF3lLOhrelFJ9C6WLnRU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fDJlFdja5KnOxnzowQ8RwRiYaMHkY/F29Ejau/VuBY0WaIRj7vdCJnk9j48SRWERrDumz0aII4OBAw85ZmDH9xhl6DzPfp6SFHnnANT4vm3dD2KafbTDVpEWCXY/0DybbKnwuvABgVUiFKGbbGHzy+eg60+D1K+TOEgxFjrvqIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=heOZvz5v; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45a1b0990b2so37996875e9.2;
        Wed, 20 Aug 2025 08:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755703421; x=1756308221; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IWzhwdi0GvmaDa5hyGuSLLD9HdU8bxK8kWqGUA5Y6O8=;
        b=heOZvz5v+6BAixjTcroYMbkb/OGUSEXu6LlIt3aTEBHNvl4hNLf6/gSWzeSEG3nCdb
         b0kVzggYOYZKbs71voBENjPky3E9tYGcMG/69G9W1liBjMjldJKsp+CaS/ByzD9HH8Db
         LU4TzoW3GEXwS+VpVLFIxMdMCnRopYgo6PM8RG6L4lk/QyHfkQC5Ly/Fh5Nmj90hXmcR
         y6Aba2RWPetKtmvV3n6ieB/Ouca/FEyLMwgZYUAzMRO/1rTYIDaF/wUo4t25SDqKx1xp
         nVxSpNvjDqIY0W44AvUY14EQhb4fw2BT04zI8u347MeEHYcDu7tLrjCosCmi9gFxIaCw
         FizA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755703421; x=1756308221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IWzhwdi0GvmaDa5hyGuSLLD9HdU8bxK8kWqGUA5Y6O8=;
        b=RdDzhTS1zfY9HUfjKEWhgmRlR2vNqIpRzy8wTyJ1TfMAUAFM1YotG15/uPWq7Af11Y
         WcTVMZxmMjNkUwIDywXu0scChPLkJNSlBi2GZnqwzeCHgMzpqAShw//J12AAG4g+506w
         NhzLf31jJ7Tm4QisxAARPGSmhDNX0u+I/8vDcdm0dLxuD0UyiaPrwQI9zzxkqq/nLFBZ
         fUTYkTpyaEb18HhwhGuT4+Zqttmtcc+Mgg1xs5b28XxvXVPx1Qp/mMZmmG7BXaXIwz7W
         kHxYtm12BuD7HUpJnIlCAcQPRvyznRClj2Xjyzi45Jf3WDn06rLOo4ztE0VgO9oFDL5h
         1caA==
X-Forwarded-Encrypted: i=1; AJvYcCU/qiqxfJPwt/8Ri3X1XZP1+ZQsCTdGi5ETvDt8MbUZI80fKhVmCnxkkZCkNIGY3vTDMOhP7uC0J0//n/6e@vger.kernel.org, AJvYcCWPQxjVus+my5dcQrG597BiFagmHkrnR/EHlOsJxaHpSeRa7kSvMz/y3xxxBr2mlwr3VDxJEWEckLpzy1KQSx0=@vger.kernel.org, AJvYcCXKW1UxXX2BBRIQXTKi+VBvBHCxrounpFNHSLTvc5deNxOOC03ayT82Hp/UE4CpQ2X+c5wYpHQD+qM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr+7vuCV7uC9EjopdYUhK7ywFT5Zd8AuJCspREvg41qooDTd58
	mfO6h8ZbYyepXX7T7RuaO4tiX0IBINRKTSzCGUHvnZ40Eoqsneiq8Quz
X-Gm-Gg: ASbGncuRVp4xNga9vJ0N5VwpWHv8R3pDIEoM/+IW3b/Apq7rq31zYvzvqllJw2Lv7jP
	RqNLdQklAXbXxhU1SB89wJpgG9XQtTEbsIU9Xo0HHUyxs4XF0MF96P3FIn7u8oT6b1UUC+IIuNB
	g23a+m8/bZSzFC3bciINb9Pt3nyyHnBmbQYv3mpUgt1zJ0hS5Qx1JbRSwfzDIZ+psVuOEgE5i7Z
	XIYKk/nGTi7XIIRV9HILqAuYxEoT+Czg6JIG8NEhzVr+zR+xMQc0iA6Y/uorkjRD63jUzbBeUK/
	EXrpi805S5qF/gXy9aD6fcNPG2tl+DzRngkHiPMmNr+QsnQ4syj/jU12It6kjXDjnftNi97tAvy
	hRRstMfi/5ClLilg5fIe6RtqAW5VGAWQ7PLU75xdBVHO//ooM6lPaL3iE13/7lEllxJH9IaUy
X-Google-Smtp-Source: AGHT+IEttblMfinRS97uVSeUe82HJpCEBoNHucuP2iEtzsdfmgnTYkuMcAM1/iMppBMDqneoqfRpyA==
X-Received: by 2002:a05:600c:3b83:b0:459:e165:2661 with SMTP id 5b1f17b1804b1-45b479f1120mr26440025e9.23.1755703421155;
        Wed, 20 Aug 2025 08:23:41 -0700 (PDT)
Received: from igor-korotin-Precision-Tower-3620.airspan.com ([188.39.32.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c3c89cd4d4sm2061258f8f.42.2025.08.20.08.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 08:23:40 -0700 (PDT)
Sender: Igor Korotin <igorkor.3vium@gmail.com>
From: Igor Korotin <igor.korotin.linux@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
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
Subject: [PATCH v4 2/3] rust: i2c: add manual I2C device creation abstractions
Date: Wed, 20 Aug 2025 16:21:38 +0100
Message-ID: <20250820152138.1814666-1-igor.korotin.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250820151427.1812482-1-igor.korotin.linux@gmail.com>
References: <20250820151427.1812482-1-igor.korotin.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In addition to the basic I2C device support, added rust abstractions
upon `i2c_new_client_device`/`i2c_unregister_device` C functions.

Implement the core abstractions needed for manual creation/deletion
of I2C devices, including:

 * `i2c::Registration` — a NonNull pointer created by the function
                          `i2c_new_client_device`

 * `i2c::I2cAdapter` — a ref counted wrapper around `struct i2c_adapter`

 * `i2c::I2cBoardInfo` — a safe wrapper around `struct i2c_board_info`

Signed-off-by: Igor Korotin <igor.korotin.linux@gmail.com>
---
 rust/kernel/i2c.rs | 175 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 174 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
index f5e8c4bc1b7d..851d20ec65b5 100644
--- a/rust/kernel/i2c.rs
+++ b/rust/kernel/i2c.rs
@@ -13,7 +13,10 @@
     types::Opaque,
 };
 
-use core::{marker::PhantomData, ptr::NonNull};
+use core::{
+    marker::PhantomData,
+    ptr::{from_ref, NonNull},
+};
 
 /// An I2C device id table.
 #[repr(transparent)]
@@ -316,6 +319,134 @@ fn shutdown(dev: &I2cClient<device::Core>) {
     }
 }
 
+/// The i2c adapter representation.
+///
+/// This structure represents the Rust abstraction for a C `struct i2c_adapter`. The
+/// implementation abstracts the usage of an existing C `struct i2c_adapter` that
+/// gets passed from the C side
+///
+/// # Invariants
+///
+/// A [`I2cAdapter`] instance represents a valid `struct i2c_adapter` created by the C portion of
+/// the kernel.
+#[repr(transparent)]
+pub struct I2cAdapter<Ctx: device::DeviceContext = device::Normal>(
+    Opaque<bindings::i2c_adapter>,
+    PhantomData<Ctx>,
+);
+
+impl<Ctx: device::DeviceContext> I2cAdapter<Ctx> {
+    fn as_raw(&self) -> *mut bindings::i2c_adapter {
+        self.0.get()
+    }
+
+    /// Gets pointer to an `i2c_adapter` by index.
+    pub fn get(index: i32) -> Result<&'static Self> {
+        // SAFETY: `index` must refer to a valid I2C adapter; the kernel
+        // guarantees that `i2c_get_adapter(index)` returns either a valid
+        // pointer or NULL. `NonNull::new` guarantees the correct check.
+        let adapter = NonNull::new(unsafe { bindings::i2c_get_adapter(index) }).ok_or(ENODEV)?;
+
+        // SAFETY: `adapter` is non-null and points to a live `i2c_adapter`.
+        // `I2cAdapter` is #[repr(transparent)], so this cast is valid.
+        Ok(unsafe { adapter.cast::<Self>().as_ref() })
+    }
+}
+
+impl<Ctx: device::DeviceContext> Drop for I2cAdapter<Ctx> {
+    fn drop(&mut self) {
+        // SAFETY: This `I2cAdapter` was obtained from `i2c_get_adapter`,
+        // and calling `i2c_put_adapter` exactly once will correctly release
+        // the reference count in the I2C core. It is safe to call from any context
+        unsafe { bindings::i2c_put_adapter(self.as_raw()) }
+    }
+}
+
+// SAFETY: `I2cAdapter` is a transparent wrapper of a type that doesn't depend on `I2cAdapter`'s
+// generic argument.
+kernel::impl_device_context_deref!(unsafe { I2cAdapter });
+kernel::impl_device_context_into_aref!(I2cAdapter);
+
+// SAFETY: Instances of `I2cAdapter` are always reference-counted.
+unsafe impl crate::types::AlwaysRefCounted for I2cAdapter {
+    fn inc_ref(&self) {
+        // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
+        unsafe { bindings::get_device(self.as_ref().as_raw()) };
+    }
+
+    unsafe fn dec_ref(obj: NonNull<Self>) {
+        // SAFETY: The safety requirements guarantee that the refcount is non-zero.
+        unsafe { bindings::put_device(&raw mut (*obj.as_ref().as_raw()).dev) }
+    }
+}
+
+impl<Ctx: device::DeviceContext> AsRef<device::Device<Ctx>> for I2cAdapter<Ctx> {
+    fn as_ref(&self) -> &device::Device<Ctx> {
+        let raw = self.as_raw();
+        // SAFETY: By the type invariant of `Self`, `self.as_raw()` is a pointer to a valid
+        // `struct i2c_adapter`.
+        let dev = unsafe { &raw mut (*raw).dev };
+
+        // SAFETY: `dev` points to a valid `struct device`.
+        unsafe { device::Device::from_raw(dev) }
+    }
+}
+
+impl<Ctx: device::DeviceContext> TryFrom<&device::Device<Ctx>> for &I2cAdapter<Ctx> {
+    type Error = kernel::error::Error;
+
+    fn try_from(dev: &device::Device<Ctx>) -> Result<Self, Self::Error> {
+        // SAFETY: By the type invariant of `Device`, `dev.as_raw()` is a valid pointer to a
+        // `struct device`.
+        if unsafe { bindings::i2c_verify_adapter(dev.as_raw()).is_null() } {
+            return Err(EINVAL);
+        }
+
+        // SAFETY: We've just verified that the type of `dev` equals to
+        // `bindings::i2c_adapter_type`, hence `dev` must be embedded in a valid
+        // `struct i2c_adapter` as guaranteed by the corresponding C code.
+        let idev = unsafe { container_of!(dev.as_raw(), bindings::i2c_adapter, dev) };
+
+        // SAFETY: `idev` is a valid pointer to a `struct i2c_adapter`.
+        Ok(unsafe { &*idev.cast() })
+    }
+}
+
+/// The i2c board info representation
+///
+/// This structure represents the Rust abstraction for a C `struct i2c_board_info` structure,
+/// which is used for manual I2C client creation.
+#[repr(transparent)]
+pub struct I2cBoardInfo(bindings::i2c_board_info);
+
+impl I2cBoardInfo {
+    const I2C_TYPE_SIZE: usize = 20;
+    /// Create a new board‐info for a kernel driver.
+    #[inline(always)]
+    pub const fn new(type_: &'static CStr, addr: u16) -> Self {
+        build_assert!(
+            type_.len_with_nul() <= Self::I2C_TYPE_SIZE,
+            "Type exceeds 20 bytes"
+        );
+        let src = type_.as_bytes_with_nul();
+        // Replace with `bindings::acpi_device_id::default()` once stabilized for `const`.
+        // SAFETY: FFI type is valid to be zero-initialized.
+        let mut i2c_board_info: bindings::i2c_board_info = unsafe { core::mem::zeroed() };
+        let mut i: usize = 0;
+        while i < src.len() {
+            i2c_board_info.type_[i] = src[i];
+            i += 1;
+        }
+
+        i2c_board_info.addr = addr;
+        Self(i2c_board_info)
+    }
+
+    fn as_raw(&self) -> *const bindings::i2c_board_info {
+        from_ref(&self.0)
+    }
+}
+
 /// The i2c client representation.
 ///
 /// This structure represents the Rust abstraction for a C `struct i2c_client`. The
@@ -394,3 +525,45 @@ unsafe impl Send for I2cClient {}
 // SAFETY: `I2cClient` can be shared among threads because all methods of `I2cClient`
 // (i.e. `I2cClient<Normal>) are thread safe.
 unsafe impl Sync for I2cClient {}
+
+/// The registration of an i2c client device.
+///
+/// This type represents the registration of a [`struct i2c_client`]. When an instance of this
+/// type is dropped, its respective i2c client device will be unregistered from the system.
+///
+/// # Invariants
+///
+/// `self.0` always holds a valid pointer to an initialized and registered
+/// [`struct i2c_client`].
+#[repr(transparent)]
+pub struct Registration(NonNull<bindings::i2c_client>);
+
+impl Registration {
+    /// The C `i2c_new_client_device` function wrapper for manual I2C client creation.
+    pub fn new(i2c_adapter: &I2cAdapter, i2c_board_info: &I2cBoardInfo) -> Result<Self> {
+        // SAFETY: the kernel guarantees that `i2c_new_client_device()` returns either a valid
+        // pointer or NULL. `from_err_ptr` separates errors. Following `NonNull::new` checks
+        // for NULL.
+        let raw_dev = from_err_ptr(unsafe {
+            bindings::i2c_new_client_device(i2c_adapter.as_raw(), i2c_board_info.as_raw())
+        })?;
+
+        let dev_ptr = NonNull::new(raw_dev).ok_or(ENODEV)?;
+
+        Ok(Self(dev_ptr))
+    }
+}
+
+impl Drop for Registration {
+    fn drop(&mut self) {
+        // SAFETY: `Drop` is only called for a valid `Registration`, which by invariant
+        // always contains a non-null pointer to an `i2c_client`.
+        unsafe { bindings::i2c_unregister_device(self.0.as_ptr()) }
+    }
+}
+
+// SAFETY: A `Registration` of a `struct i2c_client` can be released from any thread.
+unsafe impl Send for Registration {}
+
+// SAFETY: `Registration` does not expose any methods or fields that need synchronization.
+unsafe impl Sync for Registration {}
-- 
2.43.0


