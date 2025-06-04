Return-Path: <linux-i2c+bounces-11219-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E2705ACD21E
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Jun 2025 03:03:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 623F1189AB3F
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Jun 2025 01:01:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28B421F4629;
	Wed,  4 Jun 2025 00:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aVb//8hU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73344A2D;
	Wed,  4 Jun 2025 00:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748998542; cv=none; b=OCmbYCNrC9Ar+lXXTMl48YooXlkFfVr5KDj3XDCmvV0096ZckRhOnGD/MSIe0ISKiiS84tyRxFYsfXulk+XognpnfLyFiRcrlSvnyhB7tdrpBcBKJi284W6GJ38FnONQc/EnImSgMPcR/ome3+t9VFy5/kAn925Vt5UUwggA/R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748998542; c=relaxed/simple;
	bh=+b+FETlWxMWbnt1EjFXZaNxwOMj3ek5Xh1Dr6nwZ0Vg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SqwlnBpQm4I7Q1zDRMoJrJPjkO1gWoD5Vzt0ascaonwBSPBWWtbbI+5uFxb+muYRD7EBmsmvYIqJBwKAgALeiD8hxz+WIGipEVWBImumeY8uxY+wc3MpaOI03o593DEg1vtkrm8Pej6fyppVhk/BmmlFW9tK4pdYTO0UnM73kxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aVb//8hU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0089C4CEED;
	Wed,  4 Jun 2025 00:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748998542;
	bh=+b+FETlWxMWbnt1EjFXZaNxwOMj3ek5Xh1Dr6nwZ0Vg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aVb//8hU44GCWzj0ePbbc04Xe0c6Gsus/jbda1oKsAFjSK0YSaUP7ACzMi1d9dfzs
	 bpj+USoJVL61bvTTI4LevQuHS5AaDVJKwMqOCWq5PZX+UiE7S1nCyH17KigSs1ss1h
	 FPNranIcAsGeBqu6YdhnpWk8vlaaWeV04cAM8VqPFFmEyV+RyksCho2pdZqjdli32+
	 GRo6cN+1hNVq61Rt1FkfKlKW+SIsuzzrjXCnnajspbOKU8Rgz6bwF7hOzn8IrlfGc5
	 36NAbdroTmFeAvails3k9lRz8zZy2tVdm3m33k29BkbMIraFP6WGvULYKew2NJpWc0
	 hO3Mu6AuuSs+A==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Tan En De <ende.tan@starfivetech.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: [PATCH AUTOSEL 6.14 007/108] i2c: designware: Invoke runtime suspend on quick slave re-registration
Date: Tue,  3 Jun 2025 20:53:50 -0400
Message-Id: <20250604005531.4178547-7-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250604005531.4178547-1-sashal@kernel.org>
References: <20250604005531.4178547-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.9
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
index 5cd4a5f7a472e..b936a240db0a9 100644
--- a/drivers/i2c/busses/i2c-designware-slave.c
+++ b/drivers/i2c/busses/i2c-designware-slave.c
@@ -96,7 +96,7 @@ static int i2c_dw_unreg_slave(struct i2c_client *slave)
 	i2c_dw_disable(dev);
 	synchronize_irq(dev->irq);
 	dev->slave = NULL;
-	pm_runtime_put(dev->dev);
+	pm_runtime_put_sync_suspend(dev->dev);
 
 	return 0;
 }
-- 
2.39.5


