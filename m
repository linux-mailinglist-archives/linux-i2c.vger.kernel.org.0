Return-Path: <linux-i2c+bounces-11223-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E276ACD2EA
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Jun 2025 03:12:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B23DC3A1CB4
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Jun 2025 01:12:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7A2225D1ED;
	Wed,  4 Jun 2025 00:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cSx14Ixc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE071D5143;
	Wed,  4 Jun 2025 00:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748998799; cv=none; b=lOV1evTipuNncH8wI39pFA3eAhm9xwZEGoX/mVT6VyeSFQMaO7bMFRwLKNvyzEKpWZw9BtlRIaD+9MqqWkfY++EaCpQTwyugcVqiWfRtIuvhNRVudFSRyx/LqoOrQrWp87aqUeEjb0w8+GSimkCuDuQMsB76GH77TmcSOriS3vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748998799; c=relaxed/simple;
	bh=y5YzulCfIwzJhCOkklClcTkb3kMTCOR84CxsbYbSuug=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KGkE6Qd+jSDV/IAIT64WfIKtsn90CqucfJVN8Yc5eU5TqVbGeFYstoUHCs6H2jIANk3aC0b/UmZ9aRILJLN/VQA0M9bO/DP5XmS0zdR83+YUYm7aow6kcwcLMTyaspY8bn4hFiIUAd89e8ye8JNjoOC+2ELcRQtqXzFsiCgicns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cSx14Ixc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F215C4CEF4;
	Wed,  4 Jun 2025 00:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748998799;
	bh=y5YzulCfIwzJhCOkklClcTkb3kMTCOR84CxsbYbSuug=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cSx14IxcFLcccn/7IHE8o2srBhu1GxaYx8tY/Q+8FViTN46mU85NY7eNtlfqJt546
	 4BIf96denOHeaGO9uEVlRhs1vvJIn7LDBD7uOQzmqJOREk79PqcylZioWoaAUKAEhE
	 z+EjnuxXLWNQ6ql+hf8ohk5MDhLxXcG+VI0SCJGiqho76Vi/bi617r0o9Blp3+uefb
	 5PZH0YRWCcSxTz1DbHNqMJYQW5KrCSvhXe1W8E94TBsANAzTVcAQOKQS0pwunKkMdJ
	 cMPatsoUVLSx3qEkIc2kCD+QLTdxtwj6M8iyqEOElBjBUvhwTjXAoL7z9gBSu87YUQ
	 DtFNJrE+I/M8g==
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
Subject: [PATCH AUTOSEL 6.12 19/93] i2c: tegra: check msg length in SMBUS block read
Date: Tue,  3 Jun 2025 20:58:05 -0400
Message-Id: <20250604005919.4191884-19-sashal@kernel.org>
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
index 1df5b42041427..89ce8a62b37c6 100644
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


