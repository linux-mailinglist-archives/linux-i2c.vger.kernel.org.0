Return-Path: <linux-i2c+bounces-12884-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE235B53839
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 17:52:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 677D6A01DFE
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 15:51:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72F9F3570AA;
	Thu, 11 Sep 2025 15:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gvaz0Xij"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B2C3570B5;
	Thu, 11 Sep 2025 15:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757605845; cv=none; b=rqRrIzfzC8o7FMcNpZmqFL3EfJSoshvUIYkpDNhEHe3xX9OlsiIY+iuLamfeA/knhsYL4uX3Cz17hnOtPK/Wb6Bbp3qQspRFJPbJ/Ft3wCImQj9MDJq5rQg5QDywEG0gJYgoIEEFbYqc8QcLyASXMnbHgA1FlbQPhIt/ownY88Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757605845; c=relaxed/simple;
	bh=/GxU+jEY2KMQTMEJLFuIb9ZyyD8LZqJi90YR1/PiLDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HZcFjDJAh9FxsY0LgjofUXM9iVuvhFWnqQ16rl1HpIF5NNF88BPx+jZRh2izhKecbj2UIt3NVOAIs03RiKlo/NQRyap3CQium5CogW13ii101e2iF/hhApnBHQlixznrmWvFlFDgQNTC8ktghgA9KCeIfY34O2MAp9DD/EX0tlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gvaz0Xij; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45dec1ae562so8365985e9.1;
        Thu, 11 Sep 2025 08:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757605842; x=1758210642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lGfRRs5ai10Yzqa03B7aOINkHozBmH05bAV6lePZvcY=;
        b=gvaz0XijW7hsdypzygNRhGKNYTkHFxvpYmjy7CnoVlf7CPIz79aI0NHiEOB6q35E/P
         ISr6Zt6tyj4LYsD7lwrdgX3wE7Y5egxocczRJDUbDAVbzZVgkY2/3ORov7JfViSVqM15
         Std5xoT/TD7smCyDZLaERNNixVIVdLYCtd3n1wc3+RbK088XTvjp0Q/2gl2FJOySqe+z
         GiucI8pwQRvDwCxT43FmctwZeRTSM/EyWuUz+zVW4aOUy/Am7ULvPeklOWYpmYnh2V9y
         Kp/AbvhCtVgOC/XmJmKUC1BX9Aa+PLNan2BALQvYkuj3hYHNYAzIDXA558Mtc6HK26P6
         VxcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757605842; x=1758210642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lGfRRs5ai10Yzqa03B7aOINkHozBmH05bAV6lePZvcY=;
        b=EUU7In4xkqzvQnYjF0Vcmc0J5wX0qnWG9/aHlc9IPh+CYCOFVfB7uDt090ecW1OXIp
         TQZOs709W9PKvbMQ96V/KS5ynabekBq8gdcuPKZWMgwhyuxgtEegnwlAf0pqODtMRYqW
         d6dzjG31tL7xpZbHqgDzK3H/qwRVwlBLxnLq2CjgJM573ZTRnfk8JmXNghnAtxMovE1P
         DT2FAwIyAxF4E251bM+QtTpPdtwR/3utacC42QJMCfnKtJUPMD7Orf0qiBHT8j6XVVMY
         4Ih3H8PyjuBLYBz2X8p6p0SBw9DkDfLT1pGpcr/GXks+OBvMEYkJ/cnGZTrPeaC4DBEf
         OVbw==
X-Forwarded-Encrypted: i=1; AJvYcCUtHGujkV69v365t0F9N4p70rUtc7L4iKPZRLOTE5Eee4MpoBoLGnY8SHFlxuh+qv1nPEV3tPTF87Y=@vger.kernel.org, AJvYcCVt8OqNiJc+VobJvSeC6J5ZaweVCiNQiN4dXJf+fLSePgt++J2gafDaT0EBwtmUACcwl8JA8/lBkYN8YK9J@vger.kernel.org, AJvYcCWXhzmtDsoqqIVai0LAzVX8LWDoJ8U7Dl+/yCWiSNLTZspfXw2x4MMXc7iXRw+RqKKU3g4Yi5+LHV+vEnZPvZI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPH3hAIpZ9AIfwB/axMyGtKuOzgNsihxnT4CWcGVMkoWv2aRcj
	crd7J6VTaYdhuo6yWdZ0qib6ozR9k7rveom8IaL4C1daHIAtclNS8/Sc
X-Gm-Gg: ASbGncuLF/dWzfsNGsZixbe8wPWuOU4lb5aUNW2vT+vT7q9XMAhTnRIgiV5+N4IHtOt
	YyEBeDrK3u+JNCptT4DRS4rORYItQ+Rj523Pqb0SeBqEV1knaI2gXC5+fmD4Y7CUVHHSU78ihsU
	8z7FYDfX8ZK14I/aZPIu0WvMR8ZZCqPFtqOq47PERV2oT0GdzZNBEryrGsl4GtTtsV58kd5B3LN
	jrMDbKZyhFvcx2PfSMwB8EVrdktp4onzw7U80a8K0NLf4DtU2ivlFF9c+iegs0F1o6IFMuE0y8S
	+Y676f8eVFEZdyHNDco5eaDJcQq3lqgzgTdBa5bEFZDBgtPt9gpO/dR3rgpnlgqoXjSBE9n5Tew
	1uhI+mEZBbtCgd2vvotW3/HsAbDp9eLomjz6dorLARqTi2TQZhwFUHbBzvA==
X-Google-Smtp-Source: AGHT+IERsczUZebsTN/pI3he7vewHvfsXja7XLf2yIaCLqSvwtVzQ5oAT5Y8oitvobdxRhfJc1S7/w==
X-Received: by 2002:a05:600c:1c1b:b0:45d:e6b6:55fe with SMTP id 5b1f17b1804b1-45ded9fb96bmr98129315e9.34.1757605841390;
        Thu, 11 Sep 2025 08:50:41 -0700 (PDT)
Received: from localhost.localdomain ([152.37.120.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e017b27b6sm31640125e9.16.2025.09.11.08.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 08:50:41 -0700 (PDT)
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
Subject: [PATCH v5 2/3] rust: i2c: add manual I2C device creation abstractions
Date: Thu, 11 Sep 2025 16:50:15 +0100
Message-ID: <20250911155015.97250-1-igor.korotin.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250911154717.96637-1-igor.korotin.linux@gmail.com>
References: <20250911154717.96637-1-igor.korotin.linux@gmail.com>
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
 rust/kernel/i2c.rs | 153 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 152 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
index c17665cd5662..97865a9d8fea 100644
--- a/rust/kernel/i2c.rs
+++ b/rust/kernel/i2c.rs
@@ -13,7 +13,12 @@
     types::{AlwaysRefCounted, Opaque},
 };
 
-use core::{marker::PhantomData, ptr::NonNull};
+use core::{
+    marker::PhantomData,
+    ptr::{from_ref, NonNull},
+};
+
+use kernel::types::ARef;
 
 /// An I2C device id table.
 #[repr(transparent)]
@@ -316,6 +321,110 @@ fn shutdown(dev: &I2cClient<device::Core>) {
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
+impl<Ctx: device::DeviceContext> Drop for I2cAdapter<Ctx> {
+    fn drop(&mut self) {
+        // SAFETY: This `I2cAdapter` was obtained from `i2c_get_adapter`,
+        // and calling `i2c_put_adapter` exactly once will correctly release
+        // the reference count in the I2C core. It is safe to call from any context
+        unsafe { bindings::i2c_put_adapter(self.as_raw()) }
+    }
+}
+
+// SAFETY: `I2cAdapter` is a transparent wrapper of a type that doesn't depend on `I2cAdapter`'s generic
+// argument.
+kernel::impl_device_context_deref!(unsafe { I2cAdapter });
+kernel::impl_device_context_into_aref!(I2cAdapter);
+
+// SAFETY: Instances of `I2cAdapter` are always reference-counted.
+unsafe impl crate::types::AlwaysRefCounted for I2cAdapter {
+    fn inc_ref(&self) {
+        // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
+        unsafe { bindings::i2c_get_adapter((*self.as_raw()).nr) };
+    }
+
+    unsafe fn dec_ref(obj: NonNull<Self>) {
+        // SAFETY: The safety requirements guarantee that the refcount is non-zero.
+        unsafe { bindings::i2c_put_adapter(&raw mut (*obj.as_ref().as_raw())) }
+    }
+}
+
+impl<Ctx: device::DeviceContext> AsRef<I2cAdapter<Ctx>> for I2cAdapter<Ctx> {
+    fn as_ref(&self) -> &I2cAdapter<Ctx> {
+        &self
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
@@ -394,3 +503,45 @@ unsafe impl Send for I2cClient {}
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
+        // pointer or NULL. `from_err_ptr` separates errors. Following `NonNull::new` checks for NULL.
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


