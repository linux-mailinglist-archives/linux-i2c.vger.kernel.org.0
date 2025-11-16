Return-Path: <linux-i2c+bounces-14096-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D770C61885
	for <lists+linux-i2c@lfdr.de>; Sun, 16 Nov 2025 17:24:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 92D744ED2D5
	for <lists+linux-i2c@lfdr.de>; Sun, 16 Nov 2025 16:22:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7FB830E0F2;
	Sun, 16 Nov 2025 16:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O2IoiMdO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37BD30DEA1
	for <linux-i2c@vger.kernel.org>; Sun, 16 Nov 2025 16:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763310121; cv=none; b=sA9lGG+W133u22vl15UrLK9sSy+WYSgNTx5s+h7bBUIJJBy2Ti+brTLZ989yvVKZipndB/xE6Y/2J2PvVxUA6RKw52CXeqCf9I5Cl1vELX070jXdhKdiq98BTWp1e81agRt7KheEgDky0LOe8zDMI09+RMKFR8o7gGuFZajrGeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763310121; c=relaxed/simple;
	bh=ApphTV0iM79Tcn+I4kX4k5tNugukbpC+Z7Iqowu12Xw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tg7AVauPrV+zrb96q+6XVC5kCO/06gmMLBVhVv3hR+dTr5QI9nUd0HPsdG1DVazgaf6okBGRJ+KcU1PF68+F00llT/IxSa99BO5uUDVmXJj00KodpdiC8BxO6vS9YEwvVXtNS5OBlLP8BApoogyOLn0Bt5YJ+UUSWUVKLVJg7Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O2IoiMdO; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4779d47be12so6878145e9.2
        for <linux-i2c@vger.kernel.org>; Sun, 16 Nov 2025 08:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763310116; x=1763914916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Syd7xnGgI92fwp08IiTjBeUE3R8GmiJuYW751z8Y8Tc=;
        b=O2IoiMdOCb6RxZIBJKWRnOSL7UlVx7AIOWoZJhSdUZ7scaDVpH1bEM4EX5S9ju0WGV
         0KphX6hi6mT3lfZLfRM+j0vFdovBegoVR6ggMnXRSVcgh/keEL42I4Ng7ZwmaNpu1CPT
         6B5tTR7a8DErB+LPQ/V3tn6CiBL+eEO8xv+lVgno2jGZCbUfi7WyWx5ek9yYYO8A7dcj
         lLvbL4/eBHbSXQKVYFtQprAOQfOYBxKcByC7s7NqOMaNgHKC0EyMotw+gA1QIPtIRsoZ
         AQwA2U0475XG8Lf73HRkHSUfGjcdQqymlYPT+9BP87k5hA+FXuxQLy2x8oIinUw1LLt+
         cIsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763310116; x=1763914916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Syd7xnGgI92fwp08IiTjBeUE3R8GmiJuYW751z8Y8Tc=;
        b=sij5pVTz0A1kOxSJuebiorpSmPhH1tpQJLRb0qAGDJO4JWiIEMK3tFBjs+b/FDYbr2
         3msZnwzjKQKAs1q9T9cZZd+s3DtGQ4gRk5kOYrsCyESynJXG3b+oYL3Rgf/NlPHscjd3
         1LFZX/AX/HXcp7Dgzc8bw6iPKrvmYNuhdi5VRG6OTWAzbomLnkclypJWwz8SgdHsBJz2
         yTxRGaqgRX4hLIe9XVEJzTMNeGNA9DLEwLoIf5pOCZdd1x9ykzptKCpwbccwTI81uV8D
         30eo8ipT6fbxtNQNOrETOx/Q9qnsWYGGf9C0yzGKEyc1NxDq5ASoz2bSbx6In0QMqLTb
         NlHA==
X-Forwarded-Encrypted: i=1; AJvYcCULb9+dIIvR5+93QEDK6/3DRjQPcvBAMT4gtGYS024k7GL3qqbWvox86fHK9KTXb72gEgtKjiJb/C4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx6USnhb+I5NkIIWzIwyJf43MtQx9VvobQfBhlYqYP5fqlDM3h
	2RCSuqp4GlZj4KcG5C9iJ+O2NwaZOp32BmKqLOKj1X0a0QdDblTTVhVZ
X-Gm-Gg: ASbGnctcY2xHmm++DGY4Q0JL/hpYc05NSAzEdW98t/mL36nOZVBvfB0z2hImgYx0Ku5
	gBIgmS1N8x/ha9xYhwlOJLCQiujGwXhfKN9WYfjcgKuBAvaUcdQKwVjRTfJbCzxfjDBA7C3wX5m
	YYNHQrn4KbKoFnMwVpBPP8MhEZkZ4BDPpHfcWd44hxLKKO8I2Gh8AB6rqeKYXScvO/6u5tvHVFp
	/MFbWrIokMD7LkwKH0aQ0ZF9UAOlUE4dqhQvLc9en1aR+07c8ZzBkJdMCKk61TXcWSgDl4HG2ad
	JqF3PIN+2PbmQzyuqJ/rd+QRrnUy9rlY3yKjt7GWFw9gk5Qg/ZhL/FuH5hV/lN4TxMm3vql5dFD
	X2d6EgCmKxn0btW/yKdufOgb492KgFQxB3+n+tsxHOnug97WTUPORk39C6jooHcLd03j9xgdW36
	f6GODiR32v5XTCSvA=
X-Google-Smtp-Source: AGHT+IHeFaLLw4+NbZrg2fiLx3f31DKAu5da1HwyDYMFVfbHC6H0V27Re0NAWGpYJiz2+IHibZSNFg==
X-Received: by 2002:a05:600c:1f92:b0:477:73cc:82c3 with SMTP id 5b1f17b1804b1-4778fe9b3c4mr93941715e9.26.1763310116084;
        Sun, 16 Nov 2025 08:21:56 -0800 (PST)
Received: from Vasilio.Home ([176.26.203.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4779fb67e73sm36901375e9.0.2025.11.16.08.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 08:21:55 -0800 (PST)
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
Subject: [PATCH v8 2/4] rust: i2c: add manual I2C device creation abstractions
Date: Sun, 16 Nov 2025 16:21:54 +0000
Message-ID: <20251116162154.171493-1-igor.korotin.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251116162104.171420-1-igor.korotin.linux@gmail.com>
References: <20251116162104.171420-1-igor.korotin.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In addition to the basic I2C device support, add rust abstractions
upon `i2c_new_client_device`/`i2c_unregister_device` C functions.

Implement the core abstractions needed for manual creation/deletion
of I2C devices, including:

 * `i2c::Registration` — a NonNull pointer created by the function
                          `i2c_new_client_device`

 * `i2c::I2cAdapter` — a ref counted wrapper around `struct i2c_adapter`

 * `i2c::I2cBoardInfo` — a safe wrapper around `struct i2c_board_info`

Signed-off-by: Igor Korotin <igor.korotin.linux@gmail.com>
---
 rust/kernel/i2c.rs | 155 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 154 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
index a5ad8213d9ac..3695b4adf436 100644
--- a/rust/kernel/i2c.rs
+++ b/rust/kernel/i2c.rs
@@ -11,6 +11,7 @@
         RawDeviceId,
         RawDeviceIdIndex, //
     },
+    devres::Devres,
     driver,
     error::*,
     of,
@@ -23,9 +24,14 @@
 
 use core::{
     marker::PhantomData,
-    ptr::NonNull, //
+    ptr::{
+        from_ref,
+        NonNull, //
+    }, //
 };
 
+use kernel::types::ARef;
+
 /// An I2C device id table.
 #[repr(transparent)]
 #[derive(Clone, Copy)]
@@ -356,6 +362,102 @@ fn unbind(dev: &I2cClient<device::Core>, this: Pin<&Self>) {
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
+}
+
+impl I2cAdapter {
+    /// Returns the I2C Adapter index.
+    #[inline]
+    pub fn index(&self) -> i32 {
+        // SAFETY: `self.as_raw` is a valid pointer to a `struct i2c_adapter`.
+        unsafe { (*self.as_raw()).nr }
+    }
+
+    /// Gets pointer to an `i2c_adapter` by index.
+    pub fn get(index: i32) -> Result<ARef<Self>> {
+        // SAFETY: `index` must refer to a valid I2C adapter; the kernel
+        // guarantees that `i2c_get_adapter(index)` returns either a valid
+        // pointer or NULL. `NonNull::new` guarantees the correct check.
+        let adapter = NonNull::new(unsafe { bindings::i2c_get_adapter(index) }).ok_or(ENODEV)?;
+
+        // SAFETY: `adapter` is non-null and points to a live `i2c_adapter`.
+        // `I2cAdapter` is #[repr(transparent)], so this cast is valid.
+        Ok(unsafe { (&*adapter.as_ptr().cast::<I2cAdapter<device::Normal>>()).into() })
+    }
+}
+
+// SAFETY: `I2cAdapter` is a transparent wrapper of a type that doesn't depend on
+// `I2cAdapter`'s generic argument.
+kernel::impl_device_context_deref!(unsafe { I2cAdapter });
+kernel::impl_device_context_into_aref!(I2cAdapter);
+
+// SAFETY: Instances of `I2cAdapter` are always reference-counted.
+unsafe impl crate::types::AlwaysRefCounted for I2cAdapter {
+    fn inc_ref(&self) {
+        // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
+        unsafe { bindings::i2c_get_adapter(self.index()) };
+    }
+
+    unsafe fn dec_ref(obj: NonNull<Self>) {
+        // SAFETY: The safety requirements guarantee that the refcount is non-zero.
+        unsafe { bindings::i2c_put_adapter(obj.as_ref().as_raw()) }
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
+    /// Create a new [`I2cBoardInfo`] for a kernel driver.
+    #[inline(always)]
+    pub const fn new(type_: &'static CStr, addr: u16) -> Self {
+        build_assert!(
+            type_.len_with_nul() <= Self::I2C_TYPE_SIZE,
+            "Type exceeds 20 bytes"
+        );
+        let src = type_.as_bytes_with_nul();
+        // Replace with `bindings::i2c_board_info::default()` once stabilized for `const`.
+        // SAFETY: FFI type is valid to be zero-initialized.
+        let mut i2c_board_info: bindings::i2c_board_info = pin_init::zeroed();
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
@@ -434,3 +536,54 @@ unsafe impl Send for I2cClient {}
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
+    pub fn new<'a>(
+        i2c_adapter: &I2cAdapter,
+        i2c_board_info: &I2cBoardInfo,
+        parent_dev: &'a device::Device<device::Bound>,
+    ) -> impl PinInit<Devres<Self>, Error> + 'a {
+        Devres::new(parent_dev, Self::try_new(i2c_adapter, i2c_board_info))
+    }
+
+    fn try_new(i2c_adapter: &I2cAdapter, i2c_board_info: &I2cBoardInfo) -> Result<Self> {
+        // SAFETY: the kernel guarantees that `i2c_new_client_device()` returns either a valid
+        // pointer or NULL. `from_err_ptr` separates errors. Following `NonNull::new`
+        // checks for NULL.
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
+// SAFETY: `Registration` offers no interior mutability (no mutation through &self
+// and no mutable access is exposed)
+unsafe impl Sync for Registration {}
-- 
2.43.0


