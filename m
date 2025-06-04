Return-Path: <linux-i2c+bounces-11222-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF12ACD308
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Jun 2025 03:13:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 906B6189A691
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Jun 2025 01:11:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A148325A63D;
	Wed,  4 Jun 2025 00:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kZ/J+xUC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3D41D5161;
	Wed,  4 Jun 2025 00:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748998770; cv=none; b=FcbBl3ftLGAW5kxo10b+FdbrEE+FAPql2WXJ5EGOyfGJbLp7Hq1aCOTid/axTUBInnhmYCMjDtlXlpaqZ3z/19iUhcBCw+AQmHTVZfPPsx9zlG2kjaS95KKebxJyFdDQUwOlJX2aAWckxbrDunU+SxoerJNTMKSxjJq6E3q+IU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748998770; c=relaxed/simple;
	bh=Dc5nU3bwWk6eq3VZLMfica/VTGt1yc5kUu50qBISyEQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=icy1HEvznzSZcSn1D19ySZ1544mquTWlDx8qJ5L74D0eKaYtlqJuQ+DTGh/fq0UWmiqA2awdvqjD0ou5Q/1E5vjUzy1f8EXAXDFOcSmYuVJL0nLYXEd996TU6n8NVpTi2NZ5iHmXGCFNWq4L5iMM2IYeBG4odytAZH+Cr7KQ4J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kZ/J+xUC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0741CC4CEEF;
	Wed,  4 Jun 2025 00:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748998769;
	bh=Dc5nU3bwWk6eq3VZLMfica/VTGt1yc5kUu50qBISyEQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kZ/J+xUC5ra5Vs5PZlM2bcwUh+uVG4owyG93vO944Z13ATyscW1yizIqcUu0vtmLD
	 Sb9EIfa804zy1KFByUrZpJCQ4Y9Dx1+gG1Z7/ajSoAp3Ex3ishr7OFeFP2tOK53Lqg
	 1X+L3zi0NRk5l4M1VMfPNx0i6NfI4Kf5eMkKGy/BRIC+U2+mCb8sCUVzIxFT/NyE4u
	 /DUwLNFC9aoktnMzwy+uWBPpqcBvtwFnyXOBwn/10QzLj4lywULchE17BSW9Ljlnx3
	 ctg6HattuGdNcfl5GxbZf5oXttB5YVl6F6PLCxmR+88drMqlet0MyvNWxuC+Up7owc
	 I9EFockyqN6SQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Tan En De <ende.tan@starfivetech.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 07/93] i2c: designware: Invoke runtime suspend on quick slave re-registration
Date: Tue,  3 Jun 2025 20:57:53 -0400
Message-Id: <20250604005919.4191884-7-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250604005919.4191884-1-sashal@kernel.org>
References: <20250604005919.4191884-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.31
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Tan En De <ende.tan@starfivetech.com>

[ Upstream commit 2fe2b969d911a09abcd6a47401a3c66c38a310e6 ]

Replaced pm_runtime_put() with pm_runtime_put_sync_suspend() to ensure
the runtime suspend is invoked immediately when unregistering a slave.
This prevents a race condition where suspend was skipped when
unregistering and registering slave in quick succession.

For example, consider the rapid sequence of
`delete_device -> new_device -> delete_device -> new_device`.
In this sequence, it is observed that the dw_i2c_plat_runtime_suspend()
might not be invoked after `delete_device` operation.

This is because after `delete_device` operation, when the
pm_runtime_put() is about to trigger suspend, the following `new_device`
operation might race and cancel the suspend.

If that happens, during the `new_device` operation,
dw_i2c_plat_runtime_resume() is skipped (since there was no suspend), which
means `i_dev->init()`, i.e. i2c_dw_init_slave(), is skipped.
Since i2c_dw_init_slave() is skipped, i2c_dw_configure_fifo_slave() is
skipped too, which leaves `DW_IC_INTR_MASK` unconfigured. If we inspect
the interrupt mask register using devmem, it will show as zero.

Example shell script to reproduce the issue:
```
  #!/bin/sh

  SLAVE_LADDR=0x1010
  SLAVE_BUS=13
  NEW_DEVICE=/sys/bus/i2c/devices/i2c-$SLAVE_BUS/new_device
  DELETE_DEVICE=/sys/bus/i2c/devices/i2c-$SLAVE_BUS/delete_device

  # Create initial device
  echo slave-24c02 $SLAVE_LADDR > $NEW_DEVICE
  sleep 2

  # Rapid sequence of
  # delete_device -> new_device -> delete_device -> new_device
  echo $SLAVE_LADDR > $DELETE_DEVICE
  echo slave-24c02 $SLAVE_LADDR > $NEW_DEVICE
  echo $SLAVE_LADDR > $DELETE_DEVICE
  echo slave-24c02 $SLAVE_LADDR > $NEW_DEVICE

  # Using devmem to inspect IC_INTR_MASK will show as zero
```

Signed-off-by: Tan En De <ende.tan@starfivetech.com>
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Link: https://lore.kernel.org/r/20250412023303.378600-1-ende.tan@starfivetech.com
Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

**YES** This commit should be backported to stable kernel trees. Here's
my extensive analysis: ## Critical Bug Fix Analysis ### 1. **Nature of
the Bug** This commit fixes a **race condition** that causes I2C slave
functionality to completely break. The problem occurs during rapid slave
device registration/unregistration sequences where: - `pm_runtime_put()`
is asynchronous and may not complete suspend before the next
`pm_runtime_get_sync()` - If suspend doesn't happen, runtime resume is
skipped - Runtime resume is where `i2c_dw_init_slave()` and
`i2c_dw_configure_fifo_slave()` restore critical hardware configuration
- When these initialization functions are skipped, the interrupt mask
register (`DW_IC_INTR_MASK`) remains zero, disabling all interrupts ###
2. **Impact on Users** This is a **high-impact functional bug** that: -
Completely breaks I2C slave functionality in affected scenarios -
Affects real-world use cases (rapid device creation/deletion as shown in
the shell script) - Leaves hardware in a non-functional state requiring
manual intervention - Results in silent failures where the slave appears
registered but cannot handle transactions ### 3. **Code Change
Analysis** The fix is **minimal and surgical**: ```c -
pm_runtime_put(dev->dev); + pm_runtime_put_sync_suspend(dev->dev); ```
This single-line change: - Replaces asynchronous `pm_runtime_put()` with
synchronous `pm_runtime_put_sync_suspend()` - Ensures runtime suspend
happens immediately before unregistration completes - Eliminates the
race window where suspend could be skipped - Has **no functional side
effects** beyond the intended timing change ### 4. **Risk Assessment**
**Very low risk** for several reasons: - **Single line change** with
clear, well-understood semantics - **Conservative fix** - makes behavior
more predictable, not fundamentally different - **Same end result** -
both functions eventually suspend the device, just with different timing
- **No new code paths** - uses existing, well-tested runtime PM
infrastructure - **Maintains all existing error handling and power
management policies** ### 5. **Stable Tree Criteria Compliance** ✅
**Important bugfix** - Fixes complete loss of I2C slave functionality ✅
**Minimal risk** - Single line change with well-understood behavior ✅
**No new features** - Pure bug fix with no feature additions ✅ **No
architectural changes** - Uses existing runtime PM APIs ✅ **Confined to
subsystem** - Only affects i2c-designware slave mode ✅ **Clear
reproduction case** - Includes shell script demonstrating the problem
### 6. **Comparison with Similar Commits** Looking at the provided
examples: - **Similar Commit #3 (Status: YES)**: Also fixed a race
condition in slave mode with `synchronize_irq()` - this shows precedent
for backporting race condition fixes in this driver - **Similar Commits
#1,2,4,5 (Status: NO)**: Were cleanup, optimization, or architectural
changes rather than critical bug fixes ### 7. **Technical Validation**
The commit demonstrates understanding of the underlying issue: - **Root
cause identified**: Async suspend being canceled by subsequent
operations - **Mechanism explained**: Missing initialization during
runtime resume - **Hardware impact documented**: Interrupt mask register
left unconfigured - **Reproduction provided**: Clear test case showing
the failure ### 8. **Maintainer Confidence** The commit has strong
technical validation: - **Acked-by: Jarkko Nikula** - A key
i2c-designware maintainer - **Detailed commit message** with technical
explanation and reproduction steps - **Clean implementation** using
standard kernel APIs ## Conclusion This commit fixes a critical race
condition that completely breaks I2C slave functionality with minimal
risk and clear precedent for backporting similar fixes. It meets all
stable tree criteria for an important, low-risk bugfix that should be
available to users running stable kernels.

 drivers/i2c/busses/i2c-designware-slave.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-designware-slave.c b/drivers/i2c/busses/i2c-designware-slave.c
index f0f0f1f2131d0..602e98e61cc01 100644
--- a/drivers/i2c/busses/i2c-designware-slave.c
+++ b/drivers/i2c/busses/i2c-designware-slave.c
@@ -94,7 +94,7 @@ static int i2c_dw_unreg_slave(struct i2c_client *slave)
 	i2c_dw_disable(dev);
 	synchronize_irq(dev->irq);
 	dev->slave = NULL;
-	pm_runtime_put(dev->dev);
+	pm_runtime_put_sync_suspend(dev->dev);
 
 	return 0;
 }
-- 
2.39.5


