Return-Path: <linux-i2c+bounces-13394-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F29BB9572
	for <lists+linux-i2c@lfdr.de>; Sun, 05 Oct 2025 12:24:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6834E3BA0BA
	for <lists+linux-i2c@lfdr.de>; Sun,  5 Oct 2025 10:23:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C77026C39E;
	Sun,  5 Oct 2025 10:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T9FdtPDn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FEBD26C391
	for <linux-i2c@vger.kernel.org>; Sun,  5 Oct 2025 10:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759659828; cv=none; b=ZDKWhd/VDqeTR9EJXNwpOKQA4IaDXhCbGy2WPL37N2PsvVUPzeQhhKkpX4BleQfAqrNBbbm3npVyeVwI0YU2rzplw+PqdUtyr1EL4O7KhPODbZ61joZuhHgUv3LKvUIpx73fM1yjFEk0nX/7wofiPuhBUVVvjTBA/wG7gFQb2E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759659828; c=relaxed/simple;
	bh=DvRm0YFbd29apY7VZqRRoTc/UIYx6pCH5p5JFix/0to=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l+bQZGUFpl5YbF4E6flRlh8taoGN6cr7ZMU9hVv5fMu61svau439SUB5yS2ap4p0MMEV9Z0eRr1m/2MQKYQkrwYDyPb+IIGwUliDQCaysix1m18bkGwSy4YR6/mluKHYUD5dJ2gdMF6F0hC6+DSMHKBckz49rLoAFZJ09Q9LYRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T9FdtPDn; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-46e2e363118so34762225e9.0
        for <linux-i2c@vger.kernel.org>; Sun, 05 Oct 2025 03:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759659824; x=1760264624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SA5TT2fvtORK9tC44z6GyBz4BrGtperW5xafuSSo7TY=;
        b=T9FdtPDnfKHtfSZ7SzZQIgeI7CFA6eCQrdvBwx+CSnPTzvYo4w/mvSj3tryjs7GLf0
         dlvdtsbILnupnLINmHIRBvaJY4OkHD2Ds8/sxvP9MXz+Ey5POYC7C8bSXw9qoXu3kDy7
         N6csdgrE03VIym+eOwXsCb4LlaCPBGcqjwnXOO/6bhjIDTpEHOovG/mIx6AeNCHnZZ5B
         qkhzmGLXpl/yc3DQtIcWbZvsPVwOBCFgEz2ql4g/8pn4s29DhAj7lhPVDm5BkZZkiF2d
         ut5HoOzcZaQw9BBLgzxy2EsRQQCKTNew23OV1U4bWfQ0wFM4oeMgA9TdMoJRQZU4Gm/5
         Li+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759659824; x=1760264624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SA5TT2fvtORK9tC44z6GyBz4BrGtperW5xafuSSo7TY=;
        b=i3Kb+BBEDJ1xvpM1KnH2YVhMmu6xxOCymTf4VBagrYVoXaXBwGHp8mC2HC8xZgOv2W
         bK+rQStqttZW1IZO/MG5F8/81sLgw/mXDWwgpTTZp9fbGCLOoMoqzv6QXq8v8S1sa/gW
         JlGGYmDQ1ZN6S2JgIpk6Qb1PT0NMS8eQyCQmGiPdGFWknkxc6lzo9r91wDeQ7qoy2CC+
         NflcGhSzaC4nO/cg7MzHqXR6Jbqijakj2Vie3UKATIXrTv3xY9KiKGS1WwL//QtohQK4
         pdqgJMVBXnUISeWSyfKyEXkEVjBbBCKo2jkd4+m31Wgbk6KVZ+DrAD/MeHwizI9cfh6c
         d/Xw==
X-Forwarded-Encrypted: i=1; AJvYcCXEOJ4z3ncMZSt+Rul7xy3lTUVEoN4bkMSXqzTLAlb+1XlIBIhB9/SDSTVPd75bDoqDt9bPDDN91H8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIuooOOTOIuT4LV5tgeTjlXrOtdm3dhKgJWqcbHJ4w1RYb137J
	9G2MVDgBU+EQb4pj4QvAg6zLZwVAuQWrCQ5g++roZDoMuCZT+2sfdN52
X-Gm-Gg: ASbGncshrDcjBzhQhYjdS3c02p6jz6UTPLPVwxev2MnPDpyxGZTVAuYbYFBP5tq2tIN
	uly6oR134coVbG+IVrVhll76WnNNoXEEocgQAXFYPuviWffYj+idkHfu+u5kSZgYUsNveKl744l
	xZ6CuZ5jbnF2vXqVvXvgo2DTMRWdeE2eBuzaClxxn1HaOFYteWdD4NIIVgt588v3J4LkxNggKYA
	s747lgWY3A8/1VuqidUr2156G91dv2NXiVwJpBhdgTAvXzHQ4Cv9HnxQ6JFCiCOeR3oCWk++a3f
	J84gWPDCAGkDsI/epghP3IX12NC2CtHpB8t/+te7YznKj/Lrf2ant3AnrzSB8V3ZWPTWtwyB2kq
	F855tWk14GRhGLWcNT0dDotEaWWH16JBAfa76323ECghT8STh7C/1LyL6
X-Google-Smtp-Source: AGHT+IG53lxwrZgnFr59ceLkQnGXtarTdkYd942GSx/ixgYpl7U5DjaBm9x2LeHR/fd+KTN1NDyerg==
X-Received: by 2002:a05:600c:4fc6:b0:46c:adf8:c845 with SMTP id 5b1f17b1804b1-46e71124395mr70507745e9.16.1759659824371;
        Sun, 05 Oct 2025 03:23:44 -0700 (PDT)
Received: from Vasilio.Home ([2.127.51.206])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e5b5f3015sm122064735e9.1.2025.10.05.03.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 03:23:43 -0700 (PDT)
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
Subject: [PATCH v6 2/3] rust: i2c: add manual I2C device creation abstractions
Date: Sun,  5 Oct 2025 11:23:40 +0100
Message-ID: <20251005102340.41917-1-igor.korotin.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251005102226.41876-1-igor.korotin.linux@gmail.com>
References: <20251005102226.41876-1-igor.korotin.linux@gmail.com>
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
 rust/kernel/i2c.rs | 144 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 143 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
index c5a8a5791523..73858aecc131 100644
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
@@ -343,6 +348,101 @@ fn unbind(dev: &I2cClient<device::Core>, this: Pin<&Self>) {
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
+    pub fn get_nr(&self) -> i32 {
+        // SAFETY: `self.as_raw` is a valid pointer to a `struct i2c_adapter`.
+        unsafe { (*self.as_raw()).nr }
+    }
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
+// SAFETY: `I2cAdapter` is a transparent wrapper of a type that doesn't depend on `I2cAdapter`'s generic
+// argument.
+kernel::impl_device_context_deref!(unsafe { I2cAdapter });
+kernel::impl_device_context_into_aref!(I2cAdapter);
+
+// SAFETY: Instances of `I2cAdapter` are always reference-counted.
+unsafe impl crate::types::AlwaysRefCounted for I2cAdapter {
+    fn inc_ref(&self) {
+        // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
+        unsafe { bindings::i2c_get_adapter(self.get_nr()) };
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
@@ -421,3 +521,45 @@ unsafe impl Send for I2cClient {}
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


