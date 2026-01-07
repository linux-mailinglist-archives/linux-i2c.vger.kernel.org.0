Return-Path: <linux-i2c+bounces-14960-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C69CFD3D9
	for <lists+linux-i2c@lfdr.de>; Wed, 07 Jan 2026 11:46:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9AFD3300EDC9
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Jan 2026 10:45:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFAA830276A;
	Wed,  7 Jan 2026 10:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JSQ50ZwX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E071301037;
	Wed,  7 Jan 2026 10:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767782137; cv=none; b=gp0ZERn8CJ9sAKJ9uc4fUGUFeaSadZ4bjVHuTqVeFTdhCCQgGrIAojKnlCW08VTPTm8QdGhQbQRQBS59SUINpdgx8ctRmQoZodrEjZRmtLT/CvkNN4HfBdiyd7wZ5atl2FJ3uiYSOyOSXWhs+shZU2RGYyTDH732lJjPMUNQX9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767782137; c=relaxed/simple;
	bh=UrLC3ImC0rFV+2liGhx/jCiQxmj7gIB4UnCVUnC/S1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fdtn4WHdmPlw/bjMmZyO/mdp6H5mnzCh/N7syvbTf6NBIo6Xldlwn04BrOQApWL82Sr82b3SdknnlzwthLEifpnw26miyNIoUKA/tA7S/QZcPOsyspjIkmNbxaaxH6IbBEGWoTtVerbUYVH/GZYI6/SFiAihNrDmYOZfLcpaJB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JSQ50ZwX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A74A9C4CEF7;
	Wed,  7 Jan 2026 10:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767782137;
	bh=UrLC3ImC0rFV+2liGhx/jCiQxmj7gIB4UnCVUnC/S1M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JSQ50ZwXMKZcLWiBQQtmKoFnSudxMxgQ9mNHoxA9dU/xiN9qTIqrDkBLbWPNXkKxz
	 fuahCVkdHnmPljBGfVc+PkIG2Vyept8vzUaPl7Go+xta5cxde/azhgwn2JEak2Hom+
	 1S0WV0pRfagA59n+Q8fvkdRgyUIzBjOId02IAO0+BbWF2FjGfrG4JLFRd+V1JIfxwa
	 hwMhzlQ5K4psogXzeAO5aPYjDso4G1xi/NNIn2QkmXOlZIwC07jzYLcSsU6BbrK1qz
	 DmUn0avEpXTNfG5wMIY3znKgX98gpykFvA+IlCb741n6RITWDGY//EXKwRNnjJeErs
	 mh6CPdl0xZbfw==
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
Subject: [PATCH 2/6] rust: auxiliary: add Driver::unbind() callback
Date: Wed,  7 Jan 2026 11:35:01 +0100
Message-ID: <20260107103511.570525-3-dakr@kernel.org>
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

Add missing unbind() callback to auxiliary::Driver, since it will be
needed by drivers eventually (e.g. the Nova DRM driver).

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 Strictly speaking, this is not a dependency, but without this patch the main
 fix of this series leaves the remove() callback of the auxiliary bus
 abstraction with either dead code or quite some code removed; code that we
 would otherwise add back immediately afterwards.
---
 rust/kernel/auxiliary.rs | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/auxiliary.rs b/rust/kernel/auxiliary.rs
index 56f3c180e8f6..6931f8a4267f 100644
--- a/rust/kernel/auxiliary.rs
+++ b/rust/kernel/auxiliary.rs
@@ -87,7 +87,9 @@ extern "C" fn remove_callback(adev: *mut bindings::auxiliary_device) {
         // SAFETY: `remove_callback` is only ever called after a successful call to
         // `probe_callback`, hence it's guaranteed that `Device::set_drvdata()` has been called
         // and stored a `Pin<KBox<T>>`.
-        drop(unsafe { adev.as_ref().drvdata_obtain::<T>() });
+        let data = unsafe { adev.as_ref().drvdata_obtain::<T>() };
+
+        T::unbind(adev, data.as_ref());
     }
 }
 
@@ -187,6 +189,20 @@ pub trait Driver {
     ///
     /// Called when an auxiliary device is matches a corresponding driver.
     fn probe(dev: &Device<device::Core>, id_info: &Self::IdInfo) -> impl PinInit<Self, Error>;
+
+    /// Auxiliary driver unbind.
+    ///
+    /// Called when a [`Device`] is unbound from its bound [`Driver`]. Implementing this callback
+    /// is optional.
+    ///
+    /// This callback serves as a place for drivers to perform teardown operations that require a
+    /// `&Device<Core>` or `&Device<Bound>` reference. For instance, drivers may try to perform I/O
+    /// operations to gracefully tear down the device.
+    ///
+    /// Otherwise, release operations for driver resources should be performed in `Self::drop`.
+    fn unbind(dev: &Device<device::Core>, this: Pin<&Self>) {
+        let _ = (dev, this);
+    }
 }
 
 /// The auxiliary device representation.
-- 
2.52.0


