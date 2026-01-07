Return-Path: <linux-i2c+bounces-14959-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 445F6CFD533
	for <lists+linux-i2c@lfdr.de>; Wed, 07 Jan 2026 12:07:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 672B230779AD
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Jan 2026 11:00:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11AD92DBF4B;
	Wed,  7 Jan 2026 10:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m7uzCv0i"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FB51A256E;
	Wed,  7 Jan 2026 10:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767782134; cv=none; b=pc4i0MvlFMZYdONRpV4d7cUnnt9thFTJOiR2PXXVaUfUdDZdtpwbtJW8hc3t50hx+F6k4uqWZcFOhKBFrupUZ83rZ7NBhYtTScWlisvmR669eTFUmmHkl7QMDjQ3rmF/QPbRhNfRVJuBJS2KdCW6ah7T+WzjIKVOb3uPYImXpeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767782134; c=relaxed/simple;
	bh=X8ZIdLz52lID4KcbD2/RyqCVe4O73zttkiWiiUuQlI4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r4lkX2zEoLIIpZoMSClWHzhpUX1RSiVbZSqF8hre11G6uoXgdPPC4wUSj+fiGzHmB0VdqYR5qzEF2HzxXrwPF1mKJWQm/9O2NIXpSJcsUGwvMmlKtvhiLgLyvsA1GaGhAyBTK5po4Y0NTKILkRuHG+5E8Wh0n6J/8CftZlk0+dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m7uzCv0i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8031C16AAE;
	Wed,  7 Jan 2026 10:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767782132;
	bh=X8ZIdLz52lID4KcbD2/RyqCVe4O73zttkiWiiUuQlI4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m7uzCv0ilkIpGVoWfccHm9ouZSYQ0Ud9DNjiURW1b48jsQ3MY+nicCNFbt17gUq+J
	 M5Sd3iuORE86hDIXi++h+yIL7vADY8MTngD2ii0IGFJ/lqpvsUtGG27T13ZVBCkQey
	 m3Jj0AoEc0Bsu2SQTUkCbJ9hXYhZvt2EUaHPfO7f8NuamXuOT6EG5wlJaQVmTmygQI
	 JbJTntMc+/Zahwp40E9iPTzNGXzYI1jGBfRRhTENJO8uMf8akzK1hDYAl1TqpLbtwt
	 tkrnCxkouGRXB1bQqPyn0AxlTDAJVC9A28C8+6D7RHMJFKDJZdhqOpYL1ax/0LO6+u
	 hTcYqqre2t60A==
From: Danilo Krummrich <dakr@kernel.org>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	igor.korotin.linux@gmail.com,
	ojeda@kernel.org,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	david.m.ertman@intel.com,
	ira.weiny@intel.com,
	leon@kernel.org,
	bhelgaas@google.com,
	kwilczynski@kernel.org,
	wsa+renesas@sang-engineering.com
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 1/6] rust: i2c: do not drop device private data on shutdown()
Date: Wed,  7 Jan 2026 11:35:00 +0100
Message-ID: <20260107103511.570525-2-dakr@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260107103511.570525-1-dakr@kernel.org>
References: <20260107103511.570525-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We must not drop the device private data on shutdown(); none of the
registrations attached to devres that might access the device private
data are released before shutdown() is called.

Hence, freeing the device private data on shutdown() can cause UAF bugs.

Fixes: 57c5bd9aee94 ("rust: i2c: add basic I2C device and driver abstractions")
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/i2c.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
index 491e6cc25cf4..35b678b78d91 100644
--- a/rust/kernel/i2c.rs
+++ b/rust/kernel/i2c.rs
@@ -181,9 +181,9 @@ extern "C" fn shutdown_callback(idev: *mut bindings::i2c_client) {
         // SAFETY: `shutdown_callback` is only ever called after a successful call to
         // `probe_callback`, hence it's guaranteed that `Device::set_drvdata()` has been called
         // and stored a `Pin<KBox<T>>`.
-        let data = unsafe { idev.as_ref().drvdata_obtain::<T>() };
+        let data = unsafe { idev.as_ref().drvdata_borrow::<T>() };
 
-        T::shutdown(idev, data.as_ref());
+        T::shutdown(idev, data);
     }
 
     /// The [`i2c::IdTable`] of the corresponding driver.
-- 
2.52.0


