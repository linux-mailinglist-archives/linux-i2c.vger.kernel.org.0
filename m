Return-Path: <linux-i2c+bounces-14965-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5E9CFD66F
	for <lists+linux-i2c@lfdr.de>; Wed, 07 Jan 2026 12:32:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 98FB33019274
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Jan 2026 11:30:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71B46314A6E;
	Wed,  7 Jan 2026 10:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X70SgUj/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1244730DED4;
	Wed,  7 Jan 2026 10:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767782157; cv=none; b=t5cNMiu9cv2chSx81SWGtTeZM8XYd2unm84MhBXBlMrJaU7u31cPhOUg6Uvk5znWg8GAtmmE3FtOZwbhX0pIbWP+w++mkjQ4/YLQqYGZ+qmYtteTc0HOEqo/EbbWp3QNAAm7u9ZAK8Rt44uLFaNtSj6W2pl0V2X/jNS8hUdUSUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767782157; c=relaxed/simple;
	bh=N18NZ3MvjG11zo05vBY5H6zEWihoOHUn/jN+IusSagk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wnfu79ptwS4W6bih3FLO9lRYE3Wjq2KfJZYCxOyzsvzPNBKQOW/h6XHCdfOfNJYpgojTWlG5XkxIqaqvnI10v9lBfvlgZlbiOxleH0uFJojVqyPAhYYF1JaxXGJzVWIG1XudHug6Xi/CYhKB5cMhl5Dc++pTnkyRlZp5S+0i+qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X70SgUj/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EF8AC2BC9E;
	Wed,  7 Jan 2026 10:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767782156;
	bh=N18NZ3MvjG11zo05vBY5H6zEWihoOHUn/jN+IusSagk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X70SgUj/DeYJ+TJzCQraKyNYXN/wVdOJb0fKPYuP8NfuvTZUmihzX/Bv7IB44HN6x
	 n5TV+eRigt4iqq8X7WSGfE655xrVHEc60tPaPF2dCzocScNAfpP/s12O4igs/lbdR0
	 yrWYPU8nS7z6qIM3tpPiI3Fo84DdFZr5cyYsqBZCesWDG3zmcbZQbRjlswrBEqefgj
	 596hamNn6eURii26t9rKWUx9WMpCNA/QLdPpXDwpYSQN6InXv5K8G1PCNRHRdeh9sq
	 HH7c2HtRc7dq0T+2luWFdlKQbkY8P2G9qZq86DsrCICLAhbhq0Bj6v/R0hDb8Mcwb6
	 Vv9Sgzoo7Zr6Q==
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
Subject: [PATCH 6/6] rust: driver: drop device private data post unbind
Date: Wed,  7 Jan 2026 11:35:05 +0100
Message-ID: <20260107103511.570525-7-dakr@kernel.org>
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

Currently, the driver's device private data is allocated and initialized
from driver core code called from bus abstractions after the driver's
probe() callback returned the corresponding initializer.

Similarly, the driver's device private data is dropped within the
remove() callback of bus abstractions after calling the remove()
callback of the corresponding driver.

However, commit 6f61a2637abe ("rust: device: introduce
Device::drvdata()") introduced an accessor for the driver's device
private data for a Device<Bound>, i.e. a device that is currently bound
to a driver.

Obviously, this is in conflict with dropping the driver's device private
data in remove(), since a device can not be considered to be fully
unbound after remove() has finished:

We also have to consider registrations guarded by devres - such as IRQ
or class device registrations - which are torn down after remove() in
devres_release_all().

Thus, it can happen that, for instance, a class device or IRQ callback
still calls Device::drvdata(), which then runs concurrently to remove()
(which sets dev->driver_data to NULL and drops the driver's device
private data), before devres_release_all() started to tear down the
corresponding registration. This is because devres guarded registrations
can, as expected, access the corresponding Device<Bound> that defines
their scope.

In C it simply is the driver's responsibility to ensure that its device
private data is freed after e.g. an IRQ registration is unregistered.

Typically, C drivers achieve this by allocating their device private data
with e.g. devm_kzalloc() before doing anything else, i.e. before e.g.
registering an IRQ with devm_request_threaded_irq(), relying on the
reverse order cleanup of devres.

Technically, we could do something similar in Rust. However, the
resulting code would be pretty messy:

In Rust we have to differentiate between allocated but uninitialized
memory and initialized memory in the type system. Thus, we would need to
somehow keep track of whether the driver's device private data object
has been initialized (i.e. probe() was successful and returned a valid
initializer for this memory) and conditionally call the destructor of
the corresponding object when it is freed.

This is because we'd need to allocate and register the memory of the
driver's device private data *before* it is initialized by the
initializer returned by the driver's probe() callback, because the
driver could already register devres guarded registrations within
probe() outside of the driver's device private data initializer.

Luckily there is a much simpler solution: Instead of dropping the
driver's device private data at the end of remove(), we just drop it
after the device has been fully unbound, i.e. after all devres callbacks
have been processed.

For this, we introduce a new post_unbind() callback private to the
driver-core, i.e. the callback is neither exposed to drivers, nor to bus
abstractions.

This way, the driver-core code can simply continue to conditionally
allocate the memory for the driver's device private data when the
driver's initializer is returned from probe() - no change needed - and
drop it when the driver-core code receives the post_unbind() callback.

Closes: https://lore.kernel.org/all/DEZMS6Y4A7XE.XE7EUBT5SJFJ@kernel.org/
Fixes: 6f61a2637abe ("rust: device: introduce Device::drvdata()")
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/base/dd.c             |  4 ++++
 include/linux/device/driver.h | 11 +++++++++++
 rust/kernel/auxiliary.rs      |  4 ++--
 rust/kernel/device.rs         | 20 ++++++++++---------
 rust/kernel/driver.rs         | 36 ++++++++++++++++++++++++++++++++++-
 rust/kernel/i2c.rs            |  4 ++--
 rust/kernel/pci.rs            |  4 ++--
 rust/kernel/platform.rs       |  4 ++--
 rust/kernel/usb.rs            |  4 ++--
 9 files changed, 71 insertions(+), 20 deletions(-)

diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index 349f31bedfa1..2d9871503614 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -548,6 +548,10 @@ static DEVICE_ATTR_RW(state_synced);
 static void device_unbind_cleanup(struct device *dev)
 {
 	devres_release_all(dev);
+#ifdef CONFIG_RUST
+	if (dev->driver->p_cb.post_unbind)
+		dev->driver->p_cb.post_unbind(dev);
+#endif
 	arch_teardown_dma_ops(dev);
 	kfree(dev->dma_range_map);
 	dev->dma_range_map = NULL;
diff --git a/include/linux/device/driver.h b/include/linux/device/driver.h
index cd8e0f0a634b..51a9ebdd8a2d 100644
--- a/include/linux/device/driver.h
+++ b/include/linux/device/driver.h
@@ -85,6 +85,8 @@ enum probe_type {
  *		uevent.
  * @p:		Driver core's private data, no one other than the driver
  *		core can touch this.
+ * @p_cb:	Callbacks private to the driver core; no one other than the
+ *		driver core is allowed to touch this.
  *
  * The device driver-model tracks all of the drivers known to the system.
  * The main reason for this tracking is to enable the driver core to match
@@ -119,6 +121,15 @@ struct device_driver {
 	void (*coredump) (struct device *dev);
 
 	struct driver_private *p;
+#ifdef CONFIG_RUST
+	struct {
+		/*
+		 * Called after remove() and after all devres entries have been
+		 * processed.
+		 */
+		void (*post_unbind)(struct device *dev);
+	} p_cb;
+#endif
 };
 
 
diff --git a/rust/kernel/auxiliary.rs b/rust/kernel/auxiliary.rs
index cb26238e95b0..2b4a9aaabb65 100644
--- a/rust/kernel/auxiliary.rs
+++ b/rust/kernel/auxiliary.rs
@@ -96,9 +96,9 @@ extern "C" fn remove_callback(adev: *mut bindings::auxiliary_device) {
         // SAFETY: `remove_callback` is only ever called after a successful call to
         // `probe_callback`, hence it's guaranteed that `Device::set_drvdata()` has been called
         // and stored a `Pin<KBox<T>>`.
-        let data = unsafe { adev.as_ref().drvdata_obtain::<T>() };
+        let data = unsafe { adev.as_ref().drvdata_borrow::<T>() };
 
-        T::unbind(adev, data.as_ref());
+        T::unbind(adev, data);
     }
 }
 
diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index 71b200df0f40..031720bf5d8c 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -232,30 +232,32 @@ pub fn set_drvdata<T: 'static>(&self, data: impl PinInit<T, Error>) -> Result {
     ///
     /// # Safety
     ///
-    /// - Must only be called once after a preceding call to [`Device::set_drvdata`].
     /// - The type `T` must match the type of the `ForeignOwnable` previously stored by
     ///   [`Device::set_drvdata`].
-    pub unsafe fn drvdata_obtain<T: 'static>(&self) -> Pin<KBox<T>> {
+    pub(crate) unsafe fn drvdata_obtain<T: 'static>(&self) -> Option<Pin<KBox<T>>> {
         // SAFETY: By the type invariants, `self.as_raw()` is a valid pointer to a `struct device`.
         let ptr = unsafe { bindings::dev_get_drvdata(self.as_raw()) };
 
         // SAFETY: By the type invariants, `self.as_raw()` is a valid pointer to a `struct device`.
         unsafe { bindings::dev_set_drvdata(self.as_raw(), core::ptr::null_mut()) };
 
+        if ptr.is_null() {
+            return None;
+        }
+
         // SAFETY:
-        // - By the safety requirements of this function, `ptr` comes from a previous call to
-        //   `into_foreign()`.
+        // - If `ptr` is not NULL, it comes from a previous call to `into_foreign()`.
         // - `dev_get_drvdata()` guarantees to return the same pointer given to `dev_set_drvdata()`
         //   in `into_foreign()`.
-        unsafe { Pin::<KBox<T>>::from_foreign(ptr.cast()) }
+        Some(unsafe { Pin::<KBox<T>>::from_foreign(ptr.cast()) })
     }
 
     /// Borrow the driver's private data bound to this [`Device`].
     ///
     /// # Safety
     ///
-    /// - Must only be called after a preceding call to [`Device::set_drvdata`] and before
-    ///   [`Device::drvdata_obtain`].
+    /// - Must only be called after a preceding call to [`Device::set_drvdata`] and before the
+    ///   device is fully unbound.
     /// - The type `T` must match the type of the `ForeignOwnable` previously stored by
     ///   [`Device::set_drvdata`].
     pub unsafe fn drvdata_borrow<T: 'static>(&self) -> Pin<&T> {
@@ -271,7 +273,7 @@ impl Device<Bound> {
     /// # Safety
     ///
     /// - Must only be called after a preceding call to [`Device::set_drvdata`] and before
-    ///   [`Device::drvdata_obtain`].
+    ///   the device is fully unbound.
     /// - The type `T` must match the type of the `ForeignOwnable` previously stored by
     ///   [`Device::set_drvdata`].
     unsafe fn drvdata_unchecked<T: 'static>(&self) -> Pin<&T> {
@@ -320,7 +322,7 @@ pub fn drvdata<T: 'static>(&self) -> Result<Pin<&T>> {
 
         // SAFETY:
         // - The above check of `dev_get_drvdata()` guarantees that we are called after
-        //   `set_drvdata()` and before `drvdata_obtain()`.
+        //   `set_drvdata()`.
         // - We've just checked that the type of the driver's private data is in fact `T`.
         Ok(unsafe { self.drvdata_unchecked() })
     }
diff --git a/rust/kernel/driver.rs b/rust/kernel/driver.rs
index 77c1f7434897..6e32376d4c7c 100644
--- a/rust/kernel/driver.rs
+++ b/rust/kernel/driver.rs
@@ -177,7 +177,39 @@ unsafe impl<T: RegistrationOps> Sync for Registration<T> {}
 // any thread, so `Registration` is `Send`.
 unsafe impl<T: RegistrationOps> Send for Registration<T> {}
 
-impl<T: RegistrationOps> Registration<T> {
+impl<T: RegistrationOps + 'static> Registration<T> {
+    extern "C" fn post_unbind_callback(dev: *mut bindings::device) {
+        // SAFETY: The driver core only ever calls the post unbind callback with a valid pointer to
+        // a `struct device`.
+        //
+        // INVARIANT: `dev` is valid for the duration of the `post_unbind_callback()`.
+        let dev = unsafe { &*dev.cast::<device::Device<device::CoreInternal>>() };
+
+        // `remove()` and all devres callbacks have been completed at this point, hence drop the
+        // driver's device private data.
+        //
+        // SAFETY: By the safety requirements of the `Driver` trait, `T::DriverData` is the
+        // driver's device private data.
+        drop(unsafe { dev.drvdata_obtain::<T::DriverData>() });
+    }
+
+    /// Attach generic `struct device_driver` callbacks.
+    fn callbacks_attach(drv: &Opaque<T::DriverType>) {
+        let ptr = drv.get().cast::<u8>();
+
+        // SAFETY:
+        // - `drv.get()` yields a valid pointer to `Self::DriverType`.
+        // - Adding `DEVICE_DRIVER_OFFSET` yields the address of the embedded `struct device_driver`
+        //   as guaranteed by the safety requirements of the `Driver` trait.
+        let base = unsafe { ptr.add(T::DEVICE_DRIVER_OFFSET) };
+
+        // CAST: `base` points to the offset of the embedded `struct device_driver`.
+        let base = base.cast::<bindings::device_driver>();
+
+        // SAFETY: It is safe to set the fields of `struct device_driver` on initialization.
+        unsafe { (*base).p_cb.post_unbind = Some(Self::post_unbind_callback) };
+    }
+
     /// Creates a new instance of the registration object.
     pub fn new(name: &'static CStr, module: &'static ThisModule) -> impl PinInit<Self, Error> {
         try_pin_init!(Self {
@@ -189,6 +221,8 @@ pub fn new(name: &'static CStr, module: &'static ThisModule) -> impl PinInit<Sel
                 // just been initialised above, so it's also valid for read.
                 let drv = unsafe { &*(ptr as *const Opaque<T::DriverType>) };
 
+                Self::callbacks_attach(drv);
+
                 // SAFETY: `drv` is guaranteed to be pinned until `T::unregister`.
                 unsafe { T::register(drv, name, module) }
             }),
diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
index 6a3923a8b8a7..c1813f94da7a 100644
--- a/rust/kernel/i2c.rs
+++ b/rust/kernel/i2c.rs
@@ -178,9 +178,9 @@ extern "C" fn remove_callback(idev: *mut bindings::i2c_client) {
         // SAFETY: `remove_callback` is only ever called after a successful call to
         // `probe_callback`, hence it's guaranteed that `I2cClient::set_drvdata()` has been called
         // and stored a `Pin<KBox<T>>`.
-        let data = unsafe { idev.as_ref().drvdata_obtain::<T>() };
+        let data = unsafe { idev.as_ref().drvdata_borrow::<T>() };
 
-        T::unbind(idev, data.as_ref());
+        T::unbind(idev, data);
     }
 
     extern "C" fn shutdown_callback(idev: *mut bindings::i2c_client) {
diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index fe63b53d55d6..8fdc18faeb4c 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -123,9 +123,9 @@ extern "C" fn remove_callback(pdev: *mut bindings::pci_dev) {
         // SAFETY: `remove_callback` is only ever called after a successful call to
         // `probe_callback`, hence it's guaranteed that `Device::set_drvdata()` has been called
         // and stored a `Pin<KBox<T>>`.
-        let data = unsafe { pdev.as_ref().drvdata_obtain::<T>() };
+        let data = unsafe { pdev.as_ref().drvdata_borrow::<T>() };
 
-        T::unbind(pdev, data.as_ref());
+        T::unbind(pdev, data);
     }
 }
 
diff --git a/rust/kernel/platform.rs b/rust/kernel/platform.rs
index af94fb58aafb..6f81186a7919 100644
--- a/rust/kernel/platform.rs
+++ b/rust/kernel/platform.rs
@@ -101,9 +101,9 @@ extern "C" fn remove_callback(pdev: *mut bindings::platform_device) {
         // SAFETY: `remove_callback` is only ever called after a successful call to
         // `probe_callback`, hence it's guaranteed that `Device::set_drvdata()` has been called
         // and stored a `Pin<KBox<T>>`.
-        let data = unsafe { pdev.as_ref().drvdata_obtain::<T>() };
+        let data = unsafe { pdev.as_ref().drvdata_borrow::<T>() };
 
-        T::unbind(pdev, data.as_ref());
+        T::unbind(pdev, data);
     }
 }
 
diff --git a/rust/kernel/usb.rs b/rust/kernel/usb.rs
index b09fe8bcca13..e6080955f742 100644
--- a/rust/kernel/usb.rs
+++ b/rust/kernel/usb.rs
@@ -103,9 +103,9 @@ extern "C" fn disconnect_callback(intf: *mut bindings::usb_interface) {
         // SAFETY: `disconnect_callback` is only ever called after a successful call to
         // `probe_callback`, hence it's guaranteed that `Device::set_drvdata()` has been called
         // and stored a `Pin<KBox<T>>`.
-        let data = unsafe { dev.drvdata_obtain::<T>() };
+        let data = unsafe { dev.drvdata_borrow::<T>() };
 
-        T::disconnect(intf, data.as_ref());
+        T::disconnect(intf, data);
     }
 }
 
-- 
2.52.0


