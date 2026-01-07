Return-Path: <linux-i2c+bounces-14958-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C659CFD32E
	for <lists+linux-i2c@lfdr.de>; Wed, 07 Jan 2026 11:35:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 068CB3005338
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Jan 2026 10:35:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DB202D5A14;
	Wed,  7 Jan 2026 10:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TNm7vErs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5D11E515;
	Wed,  7 Jan 2026 10:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767782128; cv=none; b=j4WZT0baVxkfnDDCa3mvJw7W4TL0MNRUBQhx6JfVcqyte4UZotUVIBGyCjS4C4y0E8gfPo1Xkn8aBJY9JOXQbTgS3sIcWgTxgesP+WzwQP7gLak+lAxrIkwgoFqQNTaYH+Jy2JyZmO6g1dFEami2/HD4bw2UbnIuU6SncA5RO8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767782128; c=relaxed/simple;
	bh=93NBu9Ie2cQSxpAnoUF9DHmMJwQipXp+6hJve9Q6jKc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fYZFlRo7DZLOcJIICyUh6qEWvM7niItv13W2Fv/ieBs4gSCcbuXnmmqrsENqmJjZ2dW9AKc/kJTU+m94askiGGkZOhZaJ7/XWtAPZLqMU4erlCiOGQd2oi0ONUu11kQEWs64Nj1S2hXu9qCGSlCuS4oOzJBkjnFW3wnjMysUisg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TNm7vErs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E24AEC4CEF7;
	Wed,  7 Jan 2026 10:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767782127;
	bh=93NBu9Ie2cQSxpAnoUF9DHmMJwQipXp+6hJve9Q6jKc=;
	h=From:To:Cc:Subject:Date:From;
	b=TNm7vErsjgUbbnWwmEiffmYrzZqF00d4icrsv/kQ0dCYPP6gLO6HkGqy5q5+6mggN
	 OSF+IOv1l7YgJLjro4MwfvtACcib3MZoLCl8GfgwNpSuaHdbjEJarcbVboNR9+A75y
	 WSEOJEESwmWL9EiLx4HpJ+9+MwfFQRsNlXjfVCIYKopD7aD0lzIFpU1IqoUH4Tp0oS
	 KUi2PejnxAd7FwCBRv2hmvUAM8NvBstaQZ5Zy97Q645/3nA9BJu8jQ80HzXK8ICd3Q
	 DfBbSsB/4xMfrCG7dXf27bsC0kpSsXqyaZd/koft9dYNG71PPhRNUfTJBmM/RcJkIA
	 izP7skvYeuPzg==
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
Subject: [PATCH 0/6] Address race condition with Device::drvdata()
Date: Wed,  7 Jan 2026 11:34:59 +0100
Message-ID: <20260107103511.570525-1-dakr@kernel.org>
X-Mailer: git-send-email 2.52.0
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
reverse order cleanup of devres [1].

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

--

Dependency wise we need a common Driver trait that describes the layout of a
specific driver structure, such as struct pci_driver or struct platform_driver.
Additional to this specific driver type (which was previously the associated
type RegType of the RegistrationOps) it provides the offset to the embedded
struct device_driver and the type of the driver's device private data.

This patch series contains two additional dependencies:

  (1) A fix for i2c::Driver::shutdown() to not free the driver's device
      private data at all, which otherwise causes the exact same bug, and
      is not necessary in the first place anyways.

  (2) Add the auxiliary::Driver::unbind() callback. Strictly speaking,
      this is not a dependency, but without this patch the main fix of this
      series leaves the remove() callback of the auxiliary bus
      abstraction with either dead code or quite some code removed;
      code that we would otherwise add back immediately afterwards.

--

[1] In fact, the cleanup ordering of devres is a separate challenge in
    Rust, since it is technically unsound to rely on the driver to pick
    the correct order. I am already working on a solution for this;
    luckily this also has some synergies with optimizing the required
    synchronize_rcu() calls required by the Rust Devres container
    structure down to exactly one per driver unbind.

Link: https://git.kernel.org/pub/scm/linux/kernel/git/dakr/linux.git/log/?h=driver/post_unbind

Danilo Krummrich (6):
  rust: i2c: do not drop device private data on shutdown()
  rust: auxiliary: add Driver::unbind() callback
  rust: driver: introduce a common Driver trait
  rust: driver: add DEVICE_DRIVER_OFFSET to the Driver trait
  rust: driver: add DriverData type to the generic Driver trait
  rust: driver: drop device private data post unbind

 drivers/base/dd.c             |  4 ++
 include/linux/device/driver.h | 11 +++++
 rust/kernel/auxiliary.rs      | 41 +++++++++++++----
 rust/kernel/device.rs         | 20 ++++----
 rust/kernel/driver.rs         | 86 ++++++++++++++++++++++++++++-------
 rust/kernel/i2c.rs            | 31 ++++++++-----
 rust/kernel/pci.rs            | 27 +++++++----
 rust/kernel/platform.rs       | 27 +++++++----
 rust/kernel/usb.rs            | 27 +++++++----
 9 files changed, 203 insertions(+), 71 deletions(-)


base-commit: 8510ef5e3cfbd7d59a16845f85cd0194a8689761
-- 
2.52.0


