Return-Path: <linux-i2c+bounces-11225-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC47ACD368
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Jun 2025 03:18:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5F963A573D
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Jun 2025 01:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A0EE2641CC;
	Wed,  4 Jun 2025 01:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ESGx8Zgt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E813A1FFC46;
	Wed,  4 Jun 2025 01:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748998943; cv=none; b=R+OZZzlSuBh6x2fLPlbQEJMgNcpV00WxurMZDvNf3Q4jQhoawI5qxEkDopVUxeWjKyf1GA83zpAAzJOPtNcJt77a1MDgS8+sFHzOIXKaFpdDLWcgp4Ltacd1bDmjre+4uUSm5in8IzXDCC13hB7eDHWrwwvUomH5wNjM2BGUdjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748998943; c=relaxed/simple;
	bh=O6W0Y9gXzArPqkRF5TctF/7dhghYPCb58Ka6e2u32Xw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bWKMHLWRmaeIMZzNTGQMdooVejKuDYmwHjDN0oX6vK416bg+FgHJt3HB+pI26cnOaApZFAGeUZoep9d2CGLpdNVcQxQ/NsUf4F3XZ09mwWYx43IXMI04dcLKJW1rCz029J4WczJYRxQ3vY05x9XjN9hoiwrj6uQ/OEVGqKg/13c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ESGx8Zgt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E974FC4CEF1;
	Wed,  4 Jun 2025 01:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748998942;
	bh=O6W0Y9gXzArPqkRF5TctF/7dhghYPCb58Ka6e2u32Xw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ESGx8ZgtcTlzQz+WbBgvxIqylFA66sPAVk6AQI0p35ua4KMXVkWaTs6PR6KIkXrr+
	 aV4mNk9Ya0uhxOasBNilmlRhUYwHnQh+m0A/wDJQgxmsBoAShGo7L9ue9yHimXZmtb
	 TFjnIlYaR1DBQpAP4/YMlUJNALi5LR1/18IQYtC8xgbRjUfMKyN+Hz/qhmrodriFJN
	 6WUJC90HbIbLzrRNzplY0YWbfPrNpuNh+ABQSmX9+UU05HukyytUZuZmGAVbcYO2hc
	 RO1729/TyfssYx9N1++ZjaLEXC0RHL/URS7w5879Otq50zY8IUIJdLRf7O2gBby0O/
	 h4CZlmdFOIGhg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Tan En De <ende.tan@starfivetech.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 06/62] i2c: designware: Invoke runtime suspend on quick slave re-registration
Date: Tue,  3 Jun 2025 21:01:17 -0400
Message-Id: <20250604010213.3462-6-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250604010213.3462-1-sashal@kernel.org>
References: <20250604010213.3462-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.92
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
index 78e2c47e3d7da..1feb978d51cae 100644
--- a/drivers/i2c/busses/i2c-designware-slave.c
+++ b/drivers/i2c/busses/i2c-designware-slave.c
@@ -91,7 +91,7 @@ static int i2c_dw_unreg_slave(struct i2c_client *slave)
 	dev->disable(dev);
 	synchronize_irq(dev->irq);
 	dev->slave = NULL;
-	pm_runtime_put(dev->dev);
+	pm_runtime_put_sync_suspend(dev->dev);
 
 	return 0;
 }
-- 
2.39.5


