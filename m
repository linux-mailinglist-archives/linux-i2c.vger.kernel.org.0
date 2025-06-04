Return-Path: <linux-i2c+bounces-11220-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2EBACD223
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Jun 2025 03:03:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 177C7168A01
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Jun 2025 01:03:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB1C820CCF3;
	Wed,  4 Jun 2025 00:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X6qMUb4A"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8E14AEE0;
	Wed,  4 Jun 2025 00:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748998579; cv=none; b=WqJMgymJl4ubSv4i+OORFg2NUmNgbsqKD1jE7ijZV7fEEsRRW+QqpnlDjr59ULFvuh0Bk+QCpuCCQCxmYweasb4i6IImLRS1BS8vBxiD1QuU2xMLPSFsc8QHiZFEwoT7oaqyMhIJkxfdMHtiWvYHWKdJCKWmLGYap0RSsYe2Ruc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748998579; c=relaxed/simple;
	bh=9nYkW3WOfD9ZTiIkSZXcDzADWTK4YLHDkxj/pHoXQsE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZUl3BHstUnNfpnW1xJ3OWrruTkOw91PS69E54SClA2+iNzvMPWOLPRRNWlHH/LVJqPUOsuKTD6Vcx45a3QcKY3/qoOR846GyQp7nM02xMP6Tj5RA3dIGVe0Kb4fM5GWlGqmpGLkyjm8CqtKEmiS5IAmrbHVV8s9InKV8+jDYp3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X6qMUb4A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 186A0C4CEEF;
	Wed,  4 Jun 2025 00:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748998579;
	bh=9nYkW3WOfD9ZTiIkSZXcDzADWTK4YLHDkxj/pHoXQsE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X6qMUb4AaoZ2lGhsmK3p95BgtD0DCl6Vev5wv38+kn+aFvZ/FhXINzYT1XeE8btv4
	 Zq+n/A9Vrv59qeEzFJ07BthOLGpDUP3jI8PDpD5gS1sGfUk78y599rLrZuSJQV/mqe
	 OXxrlBNnh079WW+YcuPgzBCd7FKySFVsag1G5T3QzmoT1wK6WKGDzlj6K71PnLL8Ck
	 VEI6j1t5Nh959479s4ii27DDSpJEBruO80r5n0Mr3W3gBxJZa55b40I9mh+mIDz+nh
	 +jDbYPJjTDI5+PTwE5pbHhVWhnJm5QKWOBbjDXoa4BEM5TK/GnStFhF2Ff8ehp8AZ0
	 yC099KTwL6fWA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Akhil R <akhilrajeev@nvidia.com>,
	Thierry Reding <treding@nvidia.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	ldewangan@nvidia.com,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	linux-i2c@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH AUTOSEL 6.14 022/108] i2c: tegra: check msg length in SMBUS block read
Date: Tue,  3 Jun 2025 20:54:05 -0400
Message-Id: <20250604005531.4178547-22-sashal@kernel.org>
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
Content-Transfer-Encoding: 8bit

From: Akhil R <akhilrajeev@nvidia.com>

[ Upstream commit a6e04f05ce0b070ab39d5775580e65c7d943da0b ]

For SMBUS block read, do not continue to read if the message length
passed from the device is '0' or greater than the maximum allowed bytes.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
Acked-by: Thierry Reding <treding@nvidia.com>
Link: https://lore.kernel.org/r/20250424053320.19211-1-akhilrajeev@nvidia.com
Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

Based on my analysis of both the commit message, code changes, and the
kernel tree context, here is my assessment: **YES** This commit should
be backported to stable kernel trees for the following reasons: ##
Analysis of Code Changes The commit adds a critical validation check for
SMBUS block read operations: ```c /bin /bin.usr-is-merged /boot /dev
/etc /home /init /lib /lib.usr-is-merged /lib64 /lost+found /media /mnt
/opt /proc /root /run /sbin /sbin.usr-is-merged /snap /srv /sys /tmp
/usr /var Validate message length before proceeding linux/ if
(msgs[i].buf[0] == 0 || msgs[i].buf[0] > I2C_SMBUS_BLOCK_MAX) break; ```
## Why This Should Be Backported: ### 1. **Security and Data Integrity
Protection** The change prevents two critical issues: - **Buffer
overflow protection**: Without this check, a malicious or faulty device
could specify a block length > 32 bytes (I2C_SMBUS_BLOCK_MAX), causing
the driver to read beyond allocated buffer boundaries - **Zero-length
validation**: Prevents processing zero-length blocks which could cause
undefined behavior in subsequent operations ### 2. **Clear Bug Fix
Nature** This is a straightforward bug fix that: - Adds missing input
validation for a critical path - Uses existing constants
(I2C_SMBUS_BLOCK_MAX = 32) - Follows validation patterns used in other
I2C drivers - Is confined to a single, well-understood code path ### 3.
**Minimal Risk and Contained Change** - Only 3 lines of code added -
Simple conditional check with well-defined behavior - No architectural
changes or new features - Limited to SMBUS block read functionality in
Tegra I2C driver ### 4. **Alignment with Stable Tree Criteria**
Examining the similar commits provided: - **Similar Commit #2** (YES
status): Also a bug fix for SMBUS block read functionality - **Similar
Commit #4** (YES status): Simple validation improvement using core
functionality - Both demonstrate that contained I2C validation fixes are
appropriate for backporting ### 5. **Critical Subsystem Protection** I2C
is a fundamental communication protocol used throughout embedded
systems. SMBUS block reads are commonly used for: - Battery management
systems - Temperature sensors - EEPROM access - Hardware monitoring
Unvalidated block lengths could lead to system instability or security
vulnerabilities. ### 6. **Follows Precedent** The commit references
fixing behavior "for SMBUS block read" - this type of protocol-specific
validation fix has been consistently backported in similar scenarios. ##
Risk Assessment: **LOW** - Simple validation addition - Well-tested I2C
constant (I2C_SMBUS_BLOCK_MAX) - Fail-safe behavior (breaks loop on
invalid input) - No impact on valid use cases This commit represents
exactly the type of important, low-risk bug fix that stable trees are
designed to include.

 drivers/i2c/busses/i2c-tegra.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 87976e99e6d00..049b4d154c233 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1395,6 +1395,11 @@ static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 			ret = tegra_i2c_xfer_msg(i2c_dev, &msgs[i], MSG_END_CONTINUE);
 			if (ret)
 				break;
+
+			/* Validate message length before proceeding */
+			if (msgs[i].buf[0] == 0 || msgs[i].buf[0] > I2C_SMBUS_BLOCK_MAX)
+				break;
+
 			/* Set the msg length from first byte */
 			msgs[i].len += msgs[i].buf[0];
 			dev_dbg(i2c_dev->dev, "reading %d bytes\n", msgs[i].len);
-- 
2.39.5


