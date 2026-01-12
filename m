Return-Path: <linux-i2c+bounces-15067-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BF27DD134B8
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 15:50:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D86A53024B55
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 14:33:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 740B42E7185;
	Mon, 12 Jan 2026 14:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I8d/wXMz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338C52E2DF2;
	Mon, 12 Jan 2026 14:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768228034; cv=none; b=d1wN5WaNe6zPYyA6gRCmCAx/y/ul0eLMv+p3Vcy504gE/kfEyxyl3GNHe4Qdm/Z+RY3x6ccpOrNG8nEaIlfRQIdDw/x+v3Rr034XFd7tyRJkKqjqnkKOcdlJrAUW0EzJmu7cV2VbQ+ROmzbJRyurZot0sXWhPqrrxI7JGaKpgcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768228034; c=relaxed/simple;
	bh=ZGnxsgK/5Z1p93I0FWNkfWilUaIajuvcnQz79Vyaozk=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=OrR7F7gibO57QVbxRMXgmQXv1yzdVQPJkXj5T9C2CCtZgiVpwN5qsQIDxMZ1hAey9hVPn98njksQs8tIT1OWk4cErBvTSDidxp34tFn8dRbbIdDCehURRUs8UrNJIoyTIAbV3HtCMC9MxfdmMtmizGnqg1kTOjsVCn1muB7hllY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I8d/wXMz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06B80C16AAE;
	Mon, 12 Jan 2026 14:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768228034;
	bh=ZGnxsgK/5Z1p93I0FWNkfWilUaIajuvcnQz79Vyaozk=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=I8d/wXMz6YIIxsvkh75J33zs9/A2zJU+9qS3WnskjVYZEQ9Oo+4iIXUgwyzB7usNE
	 sESlh8fPLukij1AER+4U/zVnjKcdv3D/gMpOUBKtvjpG5xMqQ2Ekx3L+waCocpYBMe
	 WNPC4uSU3DUdAaAJMhHJqvdnxAnLFybkpOPMpwcsIVrkWNpCyaGuhRX5Xke5k8fkxv
	 /brdcSMV7AVVP9t18c+SwEUkjS5X8mMNvNiKww8CB9HjG6TXqdaFPc7ruWgAvu6993
	 xvh/uMx4KRc/vRVdyFWFejQTRz7LyJ+yEq/uTlawVchsfNlGHvBOg2MMp8Iy2C9AQ2
	 W8wKJQC8GJbyA==
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Jan 2026 15:27:08 +0100
Message-Id: <DFMOIU3FC48L.17P3TCF92CEZZ@kernel.org>
To: "Greg KH" <gregkh@linuxfoundation.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 6/6] rust: driver: drop device private data post unbind
Cc: <rafael@kernel.org>, <igor.korotin.linux@gmail.com>, <ojeda@kernel.org>,
 <boqun.feng@gmail.com>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <lossin@kernel.org>, <a.hindborg@kernel.org>, <aliceryhl@google.com>,
 <tmgross@umich.edu>, <david.m.ertman@intel.com>, <ira.weiny@intel.com>,
 <leon@kernel.org>, <bhelgaas@google.com>, <kwilczynski@kernel.org>,
 <wsa+renesas@sang-engineering.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-pci@vger.kernel.org>,
 <linux-usb@vger.kernel.org>, <linux-i2c@vger.kernel.org>
References: <20260107103511.570525-1-dakr@kernel.org>
 <20260107103511.570525-7-dakr@kernel.org>
 <2026010741-wiry-trophy-46ec@gregkh> <DFIDCAL68R7N.8SYKSAF0JO4C@kernel.org>
 <2026010701-rearview-retriever-3268@gregkh>
In-Reply-To: <2026010701-rearview-retriever-3268@gregkh>

On Wed Jan 7, 2026 at 3:54 PM CET, Greg KH wrote:
> I say name it with "rust_" and take out the #ifdef, that makes it
> simpler/easier to understand.

diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index 2d9871503614..bea8da5f8a3a 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -548,10 +548,8 @@ static DEVICE_ATTR_RW(state_synced);
 static void device_unbind_cleanup(struct device *dev)
 {
        devres_release_all(dev);
-#ifdef CONFIG_RUST
-       if (dev->driver->p_cb.post_unbind)
-               dev->driver->p_cb.post_unbind(dev);
-#endif
+       if (dev->driver->p_cb.post_unbind_rust)
+               dev->driver->p_cb.post_unbind_rust(dev);
        arch_teardown_dma_ops(dev);
        kfree(dev->dma_range_map);
        dev->dma_range_map =3D NULL;
diff --git a/include/linux/device/driver.h b/include/linux/device/driver.h
index 51a9ebdd8a2d..bbc67ec513ed 100644
--- a/include/linux/device/driver.h
+++ b/include/linux/device/driver.h
@@ -121,15 +121,13 @@ struct device_driver {
        void (*coredump) (struct device *dev);

        struct driver_private *p;
-#ifdef CONFIG_RUST
        struct {
                /*
                 * Called after remove() and after all devres entries have =
been
-                * processed.
+                * processed. This is a Rust only callback.
                 */
-               void (*post_unbind)(struct device *dev);
+               void (*post_unbind_rust)(struct device *dev);
        } p_cb;
-#endif
 };


diff --git a/rust/kernel/driver.rs b/rust/kernel/driver.rs
index 6e32376d4c7c..26095d7bd0d9 100644
--- a/rust/kernel/driver.rs
+++ b/rust/kernel/driver.rs
@@ -207,7 +207,7 @@ fn callbacks_attach(drv: &Opaque<T::DriverType>) {
         let base =3D base.cast::<bindings::device_driver>();

         // SAFETY: It is safe to set the fields of `struct device_driver` =
on initialization.
-        unsafe { (*base).p_cb.post_unbind =3D Some(Self::post_unbind_callb=
ack) };
+        unsafe { (*base).p_cb.post_unbind_rust =3D Some(Self::post_unbind_=
callback) };
     }

     /// Creates a new instance of the registration object.

