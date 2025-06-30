Return-Path: <linux-i2c+bounces-11708-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 834DEAEE23E
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Jun 2025 17:20:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E60437A8238
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Jun 2025 15:17:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ED9B28C014;
	Mon, 30 Jun 2025 15:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MB9FvA5P"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D248B282FA;
	Mon, 30 Jun 2025 15:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751296714; cv=none; b=DdwmV3D4yV1lfbei4bNIH5Lu00kl3frPpCAPoPWCu/E1vUEOnuaywGkk6+8Ul7OuWRWF5tliurweThW3uDuiwHcdd4sSbAYvIzdkxHkpUOiQWn6KROtPo33v/mtDUALCUd9ziUsKa83nRI90K+QBzM1LBWVv1foVIbQ62usGVIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751296714; c=relaxed/simple;
	bh=U2AYkXyi+bUCWm6XmkTuKdxo0QAUk/3UJs9F/FPmIvM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pEOJIlHcBA4GXoY19/IK1f/yckdgDxBavY6lb9HNFym7/Vx4BvmhFthUwsuT2wz1lX9qA/QM1aduDaCwWqTnUoOASTddMNpcAhQtClP6SqmLQp6xACeRoydI03+KGhIWeCBwPm2WPn8z5vJfZvik42+kTBITJ38yyUpFdSK2X8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MB9FvA5P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11977C4CEE3;
	Mon, 30 Jun 2025 15:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751296713;
	bh=U2AYkXyi+bUCWm6XmkTuKdxo0QAUk/3UJs9F/FPmIvM=;
	h=From:To:Cc:Subject:Date:From;
	b=MB9FvA5PIfo17Jn/nQpX16XsA48DWqZJLAdz5ni1iKTs4wt12oQC1ssB9nfRZXJW6
	 kqFKm8dWQ+H4C0o/R3t1LfbZhdbTGdsANIT3COJq93RY3Vhru4pf571VF4HX/L4Qc2
	 BkbMs5Srb+nagw6Lyty1mtqMo0OpS/E1/0qNXJb1AESHbRddWlhOAjlZKSqgcj2gnm
	 b3RejUVB6y3P/swZ+CuORp24dgBsCWhZsS9XhemnS8hpFBdAAgz6J++pVYkCuiMlIF
	 91Amns1p+CjZczY0ltTx9oyWLQNM6ZKtcak8t9zogHap8WeVw616ulZj16XwkC8DNm
	 2eTieZfDB1Z2Q==
From: Conor Dooley <conor@kernel.org>
To: linux-i2c@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] i2c: microchip-core: re-fix fake detections w/ i2cdetect
Date: Mon, 30 Jun 2025 16:18:17 +0100
Message-ID: <20250630-shopper-proven-500f4075e7d6@spud>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1992; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=5O2qCUOtftgmnPM/slUO0ZOp22pdYgLs1D49HYsG/IY=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDBlJq3b4PCrc51RfNG3Boxq/pRv6Vbcv2/e6/cztJ2n/n VbMXLnBoqOUhUGMg0FWTJEl8XZfi9T6Py47nHvewsxhZQIZwsDFKQATmW3ByHCYJ+rlCSM3MX+Z +PM5FTaNS58/fHMyddXMnqiprtNef45g+GcodVE5xF5vRrCs3kPJIPnld1+azpQM+Pb18Emd/he q+5gB
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

Introducing support for smbus re-broke i2cdetect, causing it to detect
devices at every i2c address, just as it did prior to being fixed in
commit 49e1f0fd0d4cb ("i2c: microchip-core: fix "ghost" detections").
This was caused by an oversight, where the new smbus code failed to
check the return value of mchp_corei2c_xfer(). Check it, and propagate
any errors.

Fixes: d6ceb40538263 ("i2c: microchip-corei2c: add smbus support")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
v3:
- actually set ret before returning it, not whatever my debug code was
  doing...

v2:
- replace "if (ret)" with "if (ret < 0)" because the xfer callback,
  which the smbus code re-uses, can return positive numbers in success
  cases.

CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Andi Shyti <andi.shyti@kernel.org>
CC: linux-i2c@vger.kernel.org
CC: linux-kernel@vger.kernel.org
---
 drivers/i2c/busses/i2c-microchip-corei2c.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-microchip-corei2c.c b/drivers/i2c/busses/i2c-microchip-corei2c.c
index 492bf4c34722c..2be9e8c720b10 100644
--- a/drivers/i2c/busses/i2c-microchip-corei2c.c
+++ b/drivers/i2c/busses/i2c-microchip-corei2c.c
@@ -435,6 +435,7 @@ static int mchp_corei2c_smbus_xfer(struct i2c_adapter *adap, u16 addr, unsigned
 	u8 tx_buf[I2C_SMBUS_BLOCK_MAX + 2];
 	u8 rx_buf[I2C_SMBUS_BLOCK_MAX + 1];
 	int num_msgs = 1;
+	int ret;
 
 	msgs[CORE_I2C_SMBUS_MSG_WR].addr = addr;
 	msgs[CORE_I2C_SMBUS_MSG_WR].flags = 0;
@@ -505,7 +506,10 @@ static int mchp_corei2c_smbus_xfer(struct i2c_adapter *adap, u16 addr, unsigned
 		return -EOPNOTSUPP;
 	}
 
-	mchp_corei2c_xfer(&idev->adapter, msgs, num_msgs);
+	ret = mchp_corei2c_xfer(&idev->adapter, msgs, num_msgs);
+	if (ret < 0)
+		return ret;
+
 	if (read_write == I2C_SMBUS_WRITE || size <= I2C_SMBUS_BYTE_DATA)
 		return 0;
 
-- 
2.45.2


