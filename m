Return-Path: <linux-i2c+bounces-14512-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB80CB7A1D
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Dec 2025 03:09:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8FCE0301EFE0
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Dec 2025 02:09:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C785F28DF07;
	Fri, 12 Dec 2025 02:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iVyopwT4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8292A28C00C;
	Fri, 12 Dec 2025 02:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765505362; cv=none; b=VVusP2PjenLImig9srWjeGkLqVood8KkvOYgC1lvvGnJC83Q5mZj273vFcQhfIgNYPtp2BirWsHHwTeNneAXN4qjj5k4RkZBbbDJZqYjAv4w9oYT7Xkrb2vh+ujy9GTujE367iTV2qWgSkrWQBvvxVq2zHqy/QpeFeTDUmfnass=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765505362; c=relaxed/simple;
	bh=evDUzfBugq6sroubhKVE/T5bgJDSywMYTpwCHOpuJWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n40ppYalXRuy0EFlKvXI+mg9IPTCT8qbR3wjPM872m4HAIPMc6wPxx06JutBwFdXDJ3OsiG9tw/lX67QDqM/4q+16WmyUf2Sa1LTxHp2nO6D2h/uhaUPD+6VDS6lhA87KFYBavcF5v/HuKi2gLLNL33aYHJgkUT0JCr1XQnZnzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iVyopwT4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B090AC4CEF7;
	Fri, 12 Dec 2025 02:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765505361;
	bh=evDUzfBugq6sroubhKVE/T5bgJDSywMYTpwCHOpuJWM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iVyopwT4gToVklIqPRNqUAx4Sh5hgwzJl7pPSAn+nWTdca+d8uoD35oiwQwz+nqpi
	 PFIhWMqsXUPOLMjUc5OIa/XKa25vl1BrtCS9CTaT9nOFzKKHceWiyfUPSHlRZWkjh1
	 N94ihNbLizAv8nwjQj1g+b9cJh3PSoCunJsKVcBWSjbjYdoJvOzNtNwNmp0YN8SKGW
	 uDcv9Vjlrk+8EQAQOtUoDvO6ojVQf1Vxgi4CC4CLDbqCwweIzrYYET9RJPVb6hSwrR
	 djJSSIifIfr25bk9rRIlRXmplAzk7L4Ykw1+wB5g9Xi/gpenRjuMhUFsnfkWSBh4z5
	 6uAMmOXHscrCA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Jinhui Guo <guojinhui.liam@bytedance.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: [PATCH AUTOSEL 6.18-6.6] i2c: designware: Disable SMBus interrupts to prevent storms from mis-configured firmware
Date: Thu, 11 Dec 2025 21:08:59 -0500
Message-ID: <20251212020903.4153935-7-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251212020903.4153935-1-sashal@kernel.org>
References: <20251212020903.4153935-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.18
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jinhui Guo <guojinhui.liam@bytedance.com>

[ Upstream commit d3429178ee51dd7155445d15a5ab87a45fae3c73 ]

When probing the I2C master, disable SMBus interrupts to prevent
storms caused by broken firmware mis-configuring IC_SMBUS=1; the
handler never services them and a mis-configured SMBUS Master
extend-clock timeout or SMBUS Slave extend-clock timeout can
flood the CPU.

Signed-off-by: Jinhui Guo <guojinhui.liam@bytedance.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
Link: https://lore.kernel.org/r/20251021075714.3712-2-guojinhui.liam@bytedance.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

## ANALYSIS SUMMARY

### Problem Being Fixed
This commit fixes an **interrupt storm** caused by misconfigured
firmware that leaves `IC_SMBUS=1` in the DesignWare I2C controller. When
this happens:
1. SMBus-related interrupts (Master/Slave extend-clock timeout) get
   enabled
2. The driver has NO handler for these interrupts
3. Unserviced interrupts fire continuously, flooding the CPU
4. This effectively causes a denial-of-service condition

### Code Change Assessment

**Header file (`i2c-designware-core.h`):**
- Adds one register offset: `#define DW_IC_SMBUS_INTR_MASK 0xcc`

**Master file (`i2c-designware-master.c`):**
- In `i2c_dw_init_master()`, after disabling the adapter, writes 0 to
  the SMBus interrupt mask register to disable all SMBus interrupts

The fix is **defensive programming**: it proactively masks interrupts
the driver doesn't use, regardless of what firmware may have configured.

### Stable Criteria Evaluation

| Criterion | Assessment |
|-----------|------------|
| Obviously correct | ✅ Yes - writing 0 to mask unused interrupts is
safe |
| Fixes real bug | ✅ Yes - interrupt storms are real and severe |
| Important issue | ✅ Yes - system can become unresponsive |
| Small and contained | ✅ Yes - 2 lines of actual code |
| No new features | ✅ Correct - purely defensive |
| Clean backport | ✅ Yes - minimal, self-contained change |

### Risk vs Benefit

**Benefits:**
- Prevents interrupt storms that can make systems unusable
- ByteDance reporting this suggests real-world occurrence in production
- The i2c-designware driver is widely used (Intel SoCs, embedded
  systems)

**Risks:**
- Nearly zero - only disables interrupts the driver never uses
- Writing 0 to an interrupt mask register is inherently safe
- The function structure (`i2c_dw_init_master`) has been stable

### Stability Indicators
- **Reviewed-by:** Andy Shevchenko (well-known kernel developer)
- **Acked-by:** Mika Westerberg (Intel/I2C maintainer)
- Well-commented explaining the rationale

### Missing Tags Analysis
- **No `Cc: stable`** - not disqualifying; many important fixes lack
  this
- **No `Fixes:` tag** - the bug likely existed since driver creation,
  not a recent regression

### Category
This falls into the **hardware quirk/workaround** exception category -
defensive code to handle broken/misconfigured firmware, which is
explicitly allowed in stable trees.

### Dependency Check
- No dependencies on other commits
- The `i2c_dw_init_master()` function exists in all stable trees with
  the same structure
- Should apply cleanly to stable kernels

---

## Conclusion

This commit should be backported to stable kernels because:

1. **Severity**: Interrupt storms can make systems completely
   unresponsive
2. **Fix quality**: Minimal, surgical, well-reviewed change
3. **Risk**: Effectively zero - disabling unused interrupts cannot cause
   regression
4. **Scope**: Affects a widely-used I2C controller driver
5. **Real-world impact**: Reported by ByteDance, indicating production
   occurrence
6. **Category**: Hardware workaround - appropriate for stable

The fix is a textbook example of defensive programming that protects
against broken firmware while having no downside.

**YES**

 drivers/i2c/busses/i2c-designware-core.h   | 1 +
 drivers/i2c/busses/i2c-designware-master.c | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 347843b4f5dd7..436555543c79d 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -78,6 +78,7 @@
 #define DW_IC_TX_ABRT_SOURCE			0x80
 #define DW_IC_ENABLE_STATUS			0x9c
 #define DW_IC_CLR_RESTART_DET			0xa8
+#define DW_IC_SMBUS_INTR_MASK			0xcc
 #define DW_IC_COMP_PARAM_1			0xf4
 #define DW_IC_COMP_VERSION			0xf8
 #define DW_IC_SDA_HOLD_MIN_VERS			0x3131312A /* "111*" == v1.11* */
diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index 41e9b5ecad201..45bfca05bb300 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -220,6 +220,13 @@ static int i2c_dw_init_master(struct dw_i2c_dev *dev)
 	/* Disable the adapter */
 	__i2c_dw_disable(dev);
 
+	/*
+	 * Mask SMBus interrupts to block storms from broken
+	 * firmware that leaves IC_SMBUS=1; the handler never
+	 * services them.
+	 */
+	regmap_write(dev->map, DW_IC_SMBUS_INTR_MASK, 0);
+
 	/* Write standard speed timing parameters */
 	regmap_write(dev->map, DW_IC_SS_SCL_HCNT, dev->ss_hcnt);
 	regmap_write(dev->map, DW_IC_SS_SCL_LCNT, dev->ss_lcnt);
-- 
2.51.0


