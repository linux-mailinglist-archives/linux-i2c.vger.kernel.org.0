Return-Path: <linux-i2c+bounces-11224-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2FBACD326
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Jun 2025 03:15:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6FAD97A2EE9
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Jun 2025 01:11:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B98725D1F5;
	Wed,  4 Jun 2025 01:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BnjrjP7J"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C901D5143;
	Wed,  4 Jun 2025 01:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748998801; cv=none; b=Sgg+E4kp9IBgIosN2O4OzmwRLwqtnXn5smbPSJDWEg6n3l4Ei5qOICybhMoWyOPtnP2vFA37iOat46YLPSWpng1X6UwwpjPrsEXj8CVPnAgKtUToQDVmmtaecmTPkZG591mb2ANEEj7iIkuiT0QnCy57GMvUoGPfDfSJPJvhQ2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748998801; c=relaxed/simple;
	bh=YnWu7uKd8aeZ/8+8pP53vu+TpqRky+NdBXh3LNj7Kkk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uDnfoCn6kZSt1gqfIF5VnU3uQlUG67TcSEXXEMBcYjRaLgpIyFL6UvQ/RiIO6h4H7X+f3eqEv4SdAXGA4xBGmv9108Axnc59LWFw0IZE9211+mGxhzxu+5vPS5MH9um8lcmiAU1ZcD3AIlbcxDvQsK/wHP2hTl8v5Rf42n2+Cqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BnjrjP7J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7A61C4CEF1;
	Wed,  4 Jun 2025 00:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748998801;
	bh=YnWu7uKd8aeZ/8+8pP53vu+TpqRky+NdBXh3LNj7Kkk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BnjrjP7JZjXpYVOwjnpNiloEn9xCcVRLgKyzFFdTUcAZqEMi9eBxd15ABwCbo5gp4
	 YFF2+VYqRBBvRXSjHtm0qWG51jguJSjpJ4Ny+/X2/RjBoodaGRnjyTtc60FXOxLMxA
	 VRz+1UUmVqXO5RZrWJQ6gftLFvKh3exyUikBgD0VHtjsBu8hJpj3bw9m1ydkSyqLAK
	 4tf/v6bHFVQP/tYsqy8eMZPEbQoHVJS2zhlj1808hGHs+UySMzATgK93SgRxIAx5bC
	 guLX4d6ibbPsZG6+8hy0WqstIRa0PUIszW61sj9ORrsnSNdZw3MrihbFwBVeAgjeBZ
	 U3dpHp0J4PVUw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Tali Perry <tali.perry1@gmail.com>,
	Mohammed Elbadry <mohammed.0.elbadry@gmail.com>,
	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	openbmc@lists.ozlabs.org,
	linux-i2c@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 20/93] i2c: npcm: Add clock toggle recovery
Date: Tue,  3 Jun 2025 20:58:06 -0400
Message-Id: <20250604005919.4191884-20-sashal@kernel.org>
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
Content-Transfer-Encoding: 8bit

From: Tali Perry <tali.perry1@gmail.com>

[ Upstream commit 38010591a0fc3203f1cee45b01ab358b72dd9ab2 ]

During init of the bus, the module checks that the bus is idle.
If one of the lines are stuck try to recover them first before failing.
Sometimes SDA and SCL are low if improper reset occurs (e.g., reboot).

Signed-off-by: Tali Perry <tali.perry1@gmail.com>
Signed-off-by: Mohammed Elbadry <mohammed.0.elbadry@gmail.com>
Reviewed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Link: https://lore.kernel.org/r/20250328193252.1570811-1-mohammed.0.elbadry@gmail.com
Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

**YES** This commit should be backported to stable kernel trees. Here's
my detailed analysis: ## **Primary Reasons for Backporting:** ### **1.
Fixes a Real Hardware Bug** The commit addresses a legitimate hardware
initialization issue where the NPCM I2C controller can fail to
initialize if SDA or SCL lines are stuck low after system reset. This is
not a theoretical problem but a real-world scenario that occurs when: -
External I2C devices (sensors, EEPROMs) hold SDA low after improper
reset - Power cycling leaves slave devices in an inconsistent state -
BMC systems reboot while I2C transactions are in progress ### **2.
Small, Contained Fix** The code change is minimal and well-contained: -
**Before**: Hard failure with `dev_err()` and `return -ENXIO` when lines
are stuck - **After**: Attempts recovery first, only fails if recovery
doesn't work - Uses existing `npcm_i2c_recovery_tgclk()` function that's
already proven and in use for runtime recovery ### **3. Prevents System
Boot Failures** Without this fix, systems can fail to boot completely
when I2C controllers can't initialize due to stuck bus lines. The commit
message specifically mentions "Sometimes SDA and SCL are low if improper
reset occurs (e.g., reboot)" - this is a boot-critical issue. ### **4.
Conservative Error Handling** The fix uses defensive programming: -
First attempts recovery using hardware-specific TGCLK mechanism - Only
fails initialization if recovery is unsuccessful - Downgrades the
initial error from `dev_err` to `dev_warn` with recovery attempt -
Maintains the same failure path if recovery doesn't work ### **5.
Alignment with Similar Successful Backports** Looking at the reference
commits, this follows the pattern of similar commit #4 (npcm timeout
calculation fix) which was marked "YES" for backporting. Both: - Fix
NPCM I2C driver issues - Address real hardware problems - Make small,
targeted changes - Don't introduce new features ### **6. Hardware-
Specific, Low Risk** The change only affects the NPCM I2C controller
initialization path and uses existing recovery mechanisms. The risk of
regression is minimal since: - It only adds a recovery attempt before an
existing failure case - Uses proven recovery logic already in the driver
- Specific to Nuvoton BMC hardware ## **Code Analysis:** The key change
replaces immediate failure: ```c // OLD: Immediate failure
dev_err(bus->dev, "I2C%d init fail: lines are low\n", bus->num); return
-ENXIO; ``` With recovery attempt: ```c // NEW: Try recovery first
dev_warn(bus->dev, " I2C%d SDA=%d SCL=%d, attempting to recover\n",
...); if (npcm_i2c_recovery_tgclk(&bus->adap)) { dev_err(bus->dev,
"I2C%d init fail: SDA=%d SCL=%d\n", ...); return -ENXIO; } ``` This is a
textbook example of a good stable backport candidate: it fixes a real
bug that prevents system functionality, uses minimal changes, and has
low regression risk.

 drivers/i2c/busses/i2c-npcm7xx.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index a693ebb64edf4..7b6eb2bfb412e 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -1969,10 +1969,14 @@ static int npcm_i2c_init_module(struct npcm_i2c *bus, enum i2c_mode mode,
 
 	/* Check HW is OK: SDA and SCL should be high at this point. */
 	if ((npcm_i2c_get_SDA(&bus->adap) == 0) || (npcm_i2c_get_SCL(&bus->adap) == 0)) {
-		dev_err(bus->dev, "I2C%d init fail: lines are low\n", bus->num);
-		dev_err(bus->dev, "SDA=%d SCL=%d\n", npcm_i2c_get_SDA(&bus->adap),
-			npcm_i2c_get_SCL(&bus->adap));
-		return -ENXIO;
+		dev_warn(bus->dev, " I2C%d SDA=%d SCL=%d, attempting to recover\n", bus->num,
+				 npcm_i2c_get_SDA(&bus->adap), npcm_i2c_get_SCL(&bus->adap));
+		if (npcm_i2c_recovery_tgclk(&bus->adap)) {
+			dev_err(bus->dev, "I2C%d init fail: SDA=%d SCL=%d\n",
+				bus->num, npcm_i2c_get_SDA(&bus->adap),
+				npcm_i2c_get_SCL(&bus->adap));
+			return -ENXIO;
+		}
 	}
 
 	npcm_i2c_int_enable(bus, true);
-- 
2.39.5


