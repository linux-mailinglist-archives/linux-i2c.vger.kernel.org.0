Return-Path: <linux-i2c+bounces-11217-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC68ACD13F
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Jun 2025 02:53:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 61B29177E4D
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Jun 2025 00:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2305619E7D0;
	Wed,  4 Jun 2025 00:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AQVzTD85"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB66E224CC;
	Wed,  4 Jun 2025 00:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748998299; cv=none; b=DXdRK2hwglnyeqRvRiD+bfbyh9YAJx+UrzqlcG2up6iPkb1PWlWK439iucL4jEwN5NISL+SLL4Fjpkfyzorlu2VGt8TaHW2JQoesaD1xEFnXEbrWbLTttyFB1/u1ZhtVvH8RqFBP4ANLC6WrqmLKKfJsLJfQHczWgJUxr6+HlmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748998299; c=relaxed/simple;
	bh=i2guXKq/zzHATlE+CQ8FXCickmwgBEE1jP63DXsldoM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hEhc8IHbm+Ac8OF4FTww0zyVTg2eap7rKkKPon1GDB071CgHp/xhvpCB9CMJ9ih6wyp3dqhGbhNaerenWM1o/Z5HwCx3p/3gRtLubmYxv+CxIMrlUhZ16cQ7zLkahVu1ZV1/uV+1WeRhFQ4yH68jGoAO2uXSXITwPFCIDGgt5J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AQVzTD85; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 983B3C4CEEF;
	Wed,  4 Jun 2025 00:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748998299;
	bh=i2guXKq/zzHATlE+CQ8FXCickmwgBEE1jP63DXsldoM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AQVzTD85R3zrqLUEBtuwoLPt3sLfaFkf4E4JD493Y8scQ4dlavKM0xbsuWwXgqvUQ
	 zX1fxUCY0Ym1A/CHBS/KZEPe01OVlliHYl5zxB9YFZVJdrPiDhYRNB+ZXKhTGlXZhs
	 43Ghr2QGrL4SRglSo89kUspDtaNZA0IdDg8VJx7j31YoeM8ZxrWm18ciaM/cqppYSl
	 CnHuBQURdr7VfjMlrxJpf1m7abogAtpF+O/0dBemhHBteBIV8mEHT+3qyV5DpZGqfj
	 78D2ZxbLmIz763WKOLzuowCXMtOM5Fszccdw10LVfpcfI3LmFzbmh1WZd/3ZMkyccL
	 BT4JUbSpGZuUQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Hector Martin <marcan@marcan.st>,
	Neal Gompa <neal@gompa.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Sven Peter <sven@svenpeter.dev>,
	Andi Shyti <andi.shyti@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	sven@kernel.org,
	j@jannau.net,
	linuxppc-dev@lists.ozlabs.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org
Subject: [PATCH AUTOSEL 6.15 024/118] i2c: pasemi: Enable the unjam machine
Date: Tue,  3 Jun 2025 20:49:15 -0400
Message-Id: <20250604005049.4147522-24-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250604005049.4147522-1-sashal@kernel.org>
References: <20250604005049.4147522-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.15
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Hector Martin <marcan@marcan.st>

[ Upstream commit 88fe3078b54c9efaea7d1adfcf295e37dfb0274f ]

The I2C bus can get stuck under some conditions (desync between
controller and device). The pasemi controllers include an unjam feature
that is enabled on reset, but was being disabled by the driver. Keep it
enabled by explicitly setting the UJM bit in the CTL register. This
should help recover the bus from certain conditions, which would
otherwise remain stuck forever.

Signed-off-by: Hector Martin <marcan@marcan.st>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Signed-off-by: Sven Peter <sven@svenpeter.dev>
Link: https://lore.kernel.org/r/20250427-pasemi-fixes-v3-1-af28568296c0@svenpeter.dev
Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

Based on my thorough analysis of the commit and the surrounding
codebase, I can now provide a comprehensive assessment. **YES** ##
Extensive Analysis ### Nature of the Fix This commit addresses a **real
hardware bug** where I2C buses can become permanently stuck under
certain conditions. The analysis shows: 1. **Hardware Feature**: CTL_UJM
is defined as `BIT(8)` in the control register and stands for "UnJaM
mode" - a hardware feature specifically designed to automatically detect
and recover from bus jam conditions. 2. **Real Problem**: The codebase
reveals extensive jam detection mechanisms: - `SMSTA_JAM` (BIT(24)) and
`SMSTA_JMD` (BIT(25)) status bits for detecting jams - Bus status
polling that specifically waits for `!(status & SMSTA_JAM)` - Automatic
resets triggered when `SMSTA_JMD` is detected 3. **User Impact**: The
commit message states "The I2C bus can get stuck under some conditions
(desync between controller and device)" and "would otherwise remain
stuck forever" - indicating this causes **complete system functionality
loss** for affected I2C peripherals. ### Code Change Analysis The fix is
**minimal and surgical**: ```c -u32 val = (CTL_MTR | CTL_MRR |
(smbus->clk_div & CTL_CLK_M)); +u32 val = (CTL_MTR | CTL_MRR | CTL_UJM |
(smbus->clk_div & CTL_CLK_M)); ``` This single-line change adds
`CTL_UJM` to the control register value during reset, enabling the
hardware unjam feature that was previously being disabled. ### Stability
Criteria Assessment ✅ **Fixes Important Bug**: Resolves permanent I2C
bus lockups affecting system functionality ✅ **Small and Contained**:
Single bit flip in one register during reset operation ✅ **Minimal
Risk**: - Uses existing hardware feature (CTL_UJM already defined) -
Only affects reset behavior - Hardware designed to handle this bit
safely - No architectural changes ✅ **Clear Side Effects**: Only enables
a hardware recovery mechanism - no negative side effects expected ✅
**Critical Subsystem**: I2C is fundamental infrastructure used by many
system components ### Platform Context This affects **production
hardware**: - Apple Silicon (M1, M2, etc.) devices - Maintained by
active Asahi Linux team - Real users depend on functional I2C for USB-
PD, audio, and other critical peripherals ### Comparison to Similar
Commits This aligns closely with **Similar Commit #2** (marked YES)
which also addressed I2C bus recovery by improving lockup detection and
triggering recovery mechanisms. Both commits: - Fix real I2C bus lockup
issues - Make minimal, targeted changes - Improve hardware recovery
capabilities - Have low regression risk ### Conclusion This commit
represents an ideal stable backport candidate: it fixes a serious
hardware issue that completely breaks I2C functionality with a minimal,
low-risk change that enables an existing hardware recovery feature. The
fix prevents permanent system failures on affected hardware platforms.

 drivers/i2c/busses/i2c-pasemi-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c-pasemi-core.c
index bd128ab2e2ebb..27ab09854c927 100644
--- a/drivers/i2c/busses/i2c-pasemi-core.c
+++ b/drivers/i2c/busses/i2c-pasemi-core.c
@@ -71,7 +71,7 @@ static inline int reg_read(struct pasemi_smbus *smbus, int reg)
 
 static void pasemi_reset(struct pasemi_smbus *smbus)
 {
-	u32 val = (CTL_MTR | CTL_MRR | (smbus->clk_div & CTL_CLK_M));
+	u32 val = (CTL_MTR | CTL_MRR | CTL_UJM | (smbus->clk_div & CTL_CLK_M));
 
 	if (smbus->hw_rev >= 6)
 		val |= CTL_EN;
-- 
2.39.5


