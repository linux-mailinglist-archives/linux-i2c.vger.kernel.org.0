Return-Path: <linux-i2c+bounces-11835-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C7980AF972B
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Jul 2025 17:41:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C568B563917
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Jul 2025 15:41:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8604F307AF3;
	Fri,  4 Jul 2025 15:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XasEArNN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407B32BEC28;
	Fri,  4 Jul 2025 15:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751643679; cv=none; b=UlZIIaDSI1QCGaLF1z28nMFfmbDTp5pEz4UZ4Muh2PY/wBimh8U62whM+sh3pGCbBgyxHlvwHvtfhxcwTm7MnkD8iYsT0F5UknUcXVhsQdKkVGo5rNBj2dWN+SkDGYv1cQDK0gUp/UVMs43DMMZsVfYTbUDwvCQa2NLE+o7aUmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751643679; c=relaxed/simple;
	bh=hLipmzu4F8mg8qXXCFM8HYZaEPjr8KBLcqkXB0ZttpY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kn9/F0Ca3iH4kTkpmsJl8q9JG6oj9UyW8VmPFlUcDXa/M60FIrnj3FJCKav9nAS11dyBxR7V1nkF+v7mu4a4QObHQR42/16rMLMijBvOmxY2lVb1TBy3/Okxjeh5F2m5ybD7adajFDOtTUEsb76MdShotQvDYIS1XTmmr36/GRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XasEArNN; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a54700a463so632021f8f.1;
        Fri, 04 Jul 2025 08:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751643675; x=1752248475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZehQDJ7GYI16BJFe1KA565rbeqzvhJ2ipoQj8wKA4GA=;
        b=XasEArNN5BsKuecOYaiJPD5eWfC6w/jlEbL+7mPhyHSem4Gc9YwV/SsPkPKRtap4wT
         BPhm7cUiw0yLuOGo4IOVXVghwxgiS8c3iaYRSlyM5YJefByTMpmbJ6YVkdxNNXsPJSyB
         NHhzd4TY0vdQ0PQ+L8g5QucgyTpRJrqQA16B9832qhxWZQ2RzNCOIfZFqdC2Y+d6oqwA
         9ctqyFcZ0jEu/TymQNnwf7l28fKYvJ6MMliXAxdTFibwJaY0epe04ek/nDVu9jXUJfUQ
         2lRRhAeORzSV9NWAvd0tKqUKdwSBoyDUdXV6Qj1rnQSahLtKVkjAJFiglOaINT7kFzyw
         5z8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751643675; x=1752248475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZehQDJ7GYI16BJFe1KA565rbeqzvhJ2ipoQj8wKA4GA=;
        b=enBS3hgGcngxSB2KYzZMSkw4CAis8udpajem6J2wTm78TOe6VY7K3ALUzJNR680y8u
         /eBPVTClXtrdFa8qODKvF04x+Tz27Nw1xTuCnGoVZZ5Ud9y+XtQJRo8JbZLj8kotZlLu
         rgAB9Wc6pgmEp6hqLy6CNoYpPqbpkG450Sx5CT2N25XLr+G1hd55gaJkuwx+BxsDKFQT
         v3SzdX6xoOmVxAHhJFm56/s/NuSkN8RJdH+V/yqxFRZsaMedLATYCRr3q4zi9p6LygpW
         MVNaWP9Tk4Ob9Tu/lPaF6zFVb2+fSpJWhGpuxpw9/tWJI99WLP6EHiwvVoCAGQjmvkyN
         at4A==
X-Forwarded-Encrypted: i=1; AJvYcCVUq7GwxKEO2hL6HxFqbG7QsHIzZkzN9j/rEmm3Je5SLazjSSZNLHZiKooox2hQL4wqjNYX5x8vUqJnWB5f@vger.kernel.org, AJvYcCVVSk2cZw8+FBDOUcH/w7lODnyLNETnK2W+a8O08TVlr9MBGUM0cMOHah1q7k1J1zQlhQDFJgET0ag=@vger.kernel.org, AJvYcCVeEcAe8jxBy7uAUkihK8ZFQ8Tc0SjgF5P07W9NkRW7ZJANUErebHV4k9Y1kWJaDr1rb8RNvHMMGCT71rCxyuY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQrgB4gM4cL4XvCNjIeGMjSVq5tEDhEkRFDTZDJAfEkdLak5c+
	8rupCK8OnIQlfmWqz58iOF3d4CIEm6arOuMMWjtAfOJnYppnwlz7vEEE
X-Gm-Gg: ASbGncvX61nslwcvELm7ldHd5gc/dYav5MQVgNl5qeVP+XIdjNM9vtuFdCCceBAcBO6
	r3iTOVcGr1VydjGL9ihXFfLEWIMu25CpoPwiekuvkK5alpUNcFo3Ql/QjlYEET/9f6DVpDlK3cT
	MQpPm82O6IGmkOKOoNE+dV2cJtZu61k9xLQEenmngOgHMYKaKk/3oluPVMvWPRJ90h9Lnz7IDan
	BwvMSgZmSKsUGbPDCXfi8MRGwSnVZl+dSXz75VgUHzRIUzaAAis/YWFqI835kmEtKU377ntQWUP
	hjgJ4Ld1hDMszM3fFi8j4xERWb/AdAMsjVjzipQX8zsAvMvJ32SekKpzo2LjBlefvyW/4otXTkW
	n7bX13Hgc8taJLkt9BCxwxb/zCKJ4sChE685VZmcL8jKWa58G5A==
X-Google-Smtp-Source: AGHT+IERyK/7kX7kvDPfsA3GitiUXco1hNZ9Yv7C25VPQUc9/JklVrs18eYYPX/AUpNMA9WYXUYxoQ==
X-Received: by 2002:a05:6000:230c:b0:3a5:23c6:eeee with SMTP id ffacd0b85a97d-3b495cbcb56mr3859110f8f.21.1751643675108;
        Fri, 04 Jul 2025 08:41:15 -0700 (PDT)
Received: from igor-korotin-Precision-Tower-3620.airspan.com ([188.39.32.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47285bdf8sm2728308f8f.87.2025.07.04.08.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 08:41:14 -0700 (PDT)
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
Subject: [PATCH v2 2/4] rust: i2c: add manual I2C device creation abstractions
Date: Fri,  4 Jul 2025 16:39:12 +0100
Message-ID: <20250704153912.1197034-1-igor.korotin.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704153332.1193214-1-igor.korotin.linux@gmail.com>
References: <20250704153332.1193214-1-igor.korotin.linux@gmail.com>
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

Implement additional generic parameter for i2c::Device that shows if
the i2c::Device is abstraction on top of "borrowed" i2c_client struct,
or it is manually created device which is "owned" by a caller.

Implement the core abstractions needed for owned I2C devices, including:

 * `i2c::state` — a generic parameter type for i2c::Device

 * `i2c::DeviceOwned` — a wrapper around
                       `i2c::Device<Ctx, i2c::state::Owned>`

 * `i2c::I2cAdapterRef` — a safe reference around `struct i2c_adapter`

 * `i2c::I2cBoardInfo` — a safe wrapper around `struct i2c_board_info`

Signed-off-by: Igor Korotin <igor.korotin.linux@gmail.com>
---
 rust/kernel/i2c.rs | 184 +++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 179 insertions(+), 5 deletions(-)

diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
index 4f2f3c378153..43487fdd8597 100644
--- a/rust/kernel/i2c.rs
+++ b/rust/kernel/i2c.rs
@@ -10,7 +10,7 @@
     error::*,
     of,
     prelude::*,
-    types::{ForeignOwnable, Opaque},
+    types::{ARef, ForeignOwnable, Opaque},
 };
 
 use core::{
@@ -312,6 +312,102 @@ fn shutdown(dev: &Device<device::Core>) {
     }
 }
 
+/// The i2c adapter reference
+///
+/// This represents the Rust abstraction for a reference to an existing
+/// C `struct i2c_adapter`.
+///
+/// # Invariants
+///
+/// A [`I2cAdapterRef`] instance represents a valid `struct i2c_adapter` created by the C portion of
+/// the kernel.
+#[repr(transparent)]
+pub struct I2cAdapterRef(NonNull<bindings::i2c_adapter>);
+
+impl I2cAdapterRef {
+    fn as_raw(&self) -> *mut bindings::i2c_adapter {
+        self.0.as_ptr()
+    }
+
+    /// Gets pointer to an `i2c_adapter` by index.
+    pub fn get(index: i32) -> Option<Self> {
+        // SAFETY: `index` must refer to a valid I²C adapter; the kernel
+        // guarantees that `i2c_get_adapter(index)` returns either a valid
+        // pointer or NULL. `NonNull::new` guarantees the correct check.
+        let adapter = NonNull::new(unsafe { bindings::i2c_get_adapter(index) })?;
+        Some(Self(adapter))
+    }
+}
+
+impl Drop for I2cAdapterRef {
+    fn drop(&mut self) {
+        // SAFETY: This `I2cAdapterRef` was obtained from `i2c_get_adapter`,
+        // and calling `i2c_put_adapter` exactly once will correctly release
+        // the reference count in the I²C core. It is safe to call from any context
+        unsafe { bindings::i2c_put_adapter(self.as_raw()) }
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
+        &self.0 as *const _
+    }
+}
+
+/// Marker trait for the state of a bus specific device.
+pub trait DeviceState: private::Sealed {}
+
+/// State module which aggregates existing Device States.
+pub mod state {
+    /// The [`Borrowed`] state is the state of a bus specific device when it was not
+    /// manually created using `DeviceOwned::new`
+    pub struct Borrowed;
+
+    /// The [`Owned`] state is the state of a bus specific device when it was
+    /// manually created using `DeviceOwned::new` and thus will be automatically
+    /// unregistered when the corresponding `DeviceOwned` is dropped
+    pub struct Owned;
+}
+
+mod private {
+    pub trait Sealed {}
+
+    impl Sealed for super::state::Borrowed {}
+    impl Sealed for super::state::Owned {}
+}
+
+impl DeviceState for state::Borrowed {}
+impl DeviceState for state::Owned {}
+
 /// The i2c client representation.
 ///
 /// This structure represents the Rust abstraction for a C `struct i2c_client`. The
@@ -323,15 +419,19 @@ fn shutdown(dev: &Device<device::Core>) {
 /// A [`Device`] instance represents a valid `struct i2c_client` created by the C portion of
 /// the kernel.
 #[repr(transparent)]
-pub struct Device<Ctx: device::DeviceContext = device::Normal>(
+pub struct Device<Ctx: device::DeviceContext = device::Normal, State: DeviceState = state::Borrowed>(
     Opaque<bindings::i2c_client>,
     PhantomData<Ctx>,
+    PhantomData<State>,
 );
 
-impl<Ctx: device::DeviceContext> Device<Ctx> {
+impl<Ctx: device::DeviceContext, State: DeviceState> Device<Ctx, State> {
     fn as_raw(&self) -> *mut bindings::i2c_client {
         self.0.get()
     }
+    fn from_raw(raw: *mut bindings::i2c_client) -> &'static Self {
+        unsafe { &*raw.cast::<Device<Ctx, State>>() }
+    }
 }
 
 // SAFETY: `Device` is a transparent wrapper of a type that doesn't depend on `Device`'s generic
@@ -340,7 +440,9 @@ fn as_raw(&self) -> *mut bindings::i2c_client {
 kernel::impl_device_context_into_aref!(Device);
 
 // SAFETY: Instances of `Device` are always reference-counted.
-unsafe impl crate::types::AlwaysRefCounted for Device {
+unsafe impl<Ctx: device::DeviceContext, State: DeviceState> crate::types::AlwaysRefCounted
+    for Device<Ctx, State>
+{
     fn inc_ref(&self) {
         // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
         unsafe { bindings::get_device(self.as_ref().as_raw()) };
@@ -352,7 +454,9 @@ unsafe fn dec_ref(obj: NonNull<Self>) {
     }
 }
 
-impl<Ctx: device::DeviceContext> AsRef<device::Device<Ctx>> for Device<Ctx> {
+impl<Ctx: device::DeviceContext, State: DeviceState> AsRef<device::Device<Ctx>>
+    for Device<Ctx, State>
+{
     fn as_ref(&self) -> &device::Device<Ctx> {
         // SAFETY: By the type invariant of `Self`, `self.as_raw()` is a pointer to a valid
         // `struct i2c_client`.
@@ -389,3 +493,73 @@ unsafe impl Send for Device {}
 // SAFETY: `Device` can be shared among threads because all methods of `Device`
 // (i.e. `Device<Normal>) are thread safe.
 unsafe impl Sync for Device {}
+
+/// The representation of reference counted pointer to a manually created i2c client.
+///
+/// This structure represents the Rust wrapper upon i2c::Device with the i2c::state::Owned state
+#[repr(transparent)]
+pub struct DeviceOwned<Ctx: device::DeviceContext + 'static = device::Normal>(
+    ARef<Device<Ctx, state::Owned>>,
+);
+
+/// The main purpose of the DeviceOwned wrapper is to automatically
+/// take care of i2c client created by i2c_new_client_device.
+///
+/// The example of usage:
+///
+/// ```
+/// use kernel::{c_str, device::Core, i2c, prelude::*};
+///
+/// struct Context {
+///     _owned: i2c::DeviceOwned<Core>,
+/// }
+///
+/// const BOARD_INFO: i2c::I2cBoardInfo = i2c::I2cBoardInfo::new(c_str!("rust_driver_i2c"), 0x30);
+///
+/// impl Context {
+///     fn init(_module: &'static ThisModule) -> Result<Self> {
+///
+///         let adapter = i2c::I2cAdapterRef::get(0)
+///             .ok_or(EINVAL)?;
+///
+///         let device = i2c::DeviceOwned::<Core>::new(&adapter, &BOARD_INFO)
+///             .ok_or(EINVAL)?;
+///
+///         Ok(Self { _owned: device })
+///     }
+/// }
+///
+/// impl Drop for Context {
+///     fn drop(&mut self) {
+///
+///     }
+/// }
+///
+/// ```
+impl<Ctx: device::DeviceContext> DeviceOwned<Ctx> {
+    fn as_raw_client(&self) -> *mut bindings::i2c_client {
+        self.0.as_raw()
+    }
+
+    /// The C `i2c_new_client_device` function wrapper for manual I2C client creation.
+    pub fn new(i2c_adapter: &I2cAdapterRef, i2c_board_info: &I2cBoardInfo) -> Option<Self> {
+        // SAFETY: the kernel guarantees that `i2c_new_client_device()` returns either a valid
+        // pointer or NULL. `NonNull::new` guarantees the correct check.
+        let raw_dev = NonNull::new(unsafe {
+            bindings::i2c_new_client_device(i2c_adapter.as_raw(), i2c_board_info.as_raw())
+        })?;
+
+        let dev = Device::<Ctx, state::Owned>::from_raw(raw_dev.as_ptr());
+
+        Some(Self(dev.into()))
+    }
+}
+
+impl<Ctx: device::DeviceContext> Drop for DeviceOwned<Ctx> {
+    fn drop(&mut self) {
+        unsafe { bindings::i2c_unregister_device(self.as_raw_client()) }
+    }
+}
+
+// SAFETY: A `Device` is always reference-counted and can be released from any thread.
+unsafe impl<Ctx: device::DeviceContext> Send for DeviceOwned<Ctx> {}
-- 
2.43.0


