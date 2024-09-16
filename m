Return-Path: <linux-i2c+bounces-6791-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5BC97A107
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 14:04:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF15E1C23073
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 12:04:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0AAC15921D;
	Mon, 16 Sep 2024 12:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HaVvNJGB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E628F158DA0;
	Mon, 16 Sep 2024 12:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726488173; cv=none; b=hQPJY3rvRtmhCDpcjuV3LAQUeyBGLUiR8tpurTMQ1w1fBWN/nGkqNVfYuZlUGWDIp/eChRRkvlFnTvZH/K4GosM7VQCy+5eFvBrc3y4OBhtSL/Ztx7jeqlYMECpCtZiNEjG1StuMwzAJFcOuf04eo5CYKqHXLLVeb33fzwYCmxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726488173; c=relaxed/simple;
	bh=WxtYlBGVCCxL+Las691qhrqx8d/+iyr6qXtIQAGc/Ic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FgvJrpLe1A1uxgcuA//4nCEg4ONPFv4mq0g32cdkVrzu4W7JZol917Z3xM0wKpWVcj4N+B9y1wLT1LE7Ze2WaiTSAFNSj3Gh2QvFnBbHxSL/r6DKI+GIDk0miKZIhJpZmMuU+iEhaUR8Yc9b4XRaLThPLDSKtuvJLj1cWz5HpJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HaVvNJGB; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726488172; x=1758024172;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WxtYlBGVCCxL+Las691qhrqx8d/+iyr6qXtIQAGc/Ic=;
  b=HaVvNJGBN50oi2JAlGSlegXmDBwcq6Zw0J2eackhXO/3dYgs2xaCIiQP
   8Eq5lKfSEz0WYoyin6Lt7r6O4Hnn7huLF3+qbtahIvsBG6D0azSzVEDTb
   s2nF2+j5XVHK0GiPecVjzmLq5IWwf1oRDI6+wKM79bUunR+DQ3w1ESLYv
   vW9VcvulJwHMVbc2nqFteehZuu6D60YchxGtXOoup5lLV8XoqRClGqI5m
   R+Y5nPMDZJUrn5SAmmZysD1lAVpk/laWKz6BlnnxT2iuzPCHsaTWMlL1J
   Z0i/J5/M/o4nbxhX4Do7zUKIyrPd9XZt3oBQprU2Bn93C1nvjJZoiVKGL
   g==;
X-CSE-ConnectionGUID: fyF7t7kzR+a6dTuU2kE8cA==
X-CSE-MsgGUID: rNCrHRzORAWk1n6nuyhIiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="50725465"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="50725465"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 05:02:41 -0700
X-CSE-ConnectionGUID: oIHKOEOwRnO4a2ffpVE3BQ==
X-CSE-MsgGUID: 1uBf27j1SnGh25yb0UNc1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="72939876"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa003.fm.intel.com with ESMTP; 16 Sep 2024 05:02:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id AB6F03CB; Mon, 16 Sep 2024 15:02:38 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 01/11] i2c: isch: Pass pointer to struct i2c_adapter down
Date: Mon, 16 Sep 2024 15:01:28 +0300
Message-ID: <20240916120237.1385982-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240916120237.1385982-1-andriy.shevchenko@linux.intel.com>
References: <20240916120237.1385982-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are a lot of messaging calls that use global variable of
struct i2c_adapter. Instead, to make code better and flexible
for further improvements, pass the pointer to the actual adapter
used for transfers.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-isch.c | 53 +++++++++++++++--------------------
 1 file changed, 23 insertions(+), 30 deletions(-)

diff --git a/drivers/i2c/busses/i2c-isch.c b/drivers/i2c/busses/i2c-isch.c
index f59158489ad9..96ee73fe6e81 100644
--- a/drivers/i2c/busses/i2c-isch.c
+++ b/drivers/i2c/busses/i2c-isch.c
@@ -55,14 +55,15 @@ MODULE_PARM_DESC(backbone_speed, "Backbone speed in kHz, (default = 33000)");
  * and this function will execute it.
  * return 0 for success and others for failure.
  */
-static int sch_transaction(void)
+static int sch_transaction(struct i2c_adapter *adap)
 {
 	int temp;
 	int result = 0;
 	int retries = 0;
 
-	dev_dbg(&sch_adapter.dev, "Transaction (pre): CNT=%02x, CMD=%02x, "
-		"ADD=%02x, DAT0=%02x, DAT1=%02x\n", inb(SMBHSTCNT),
+	dev_dbg(&adap->dev,
+		"Transaction (pre): CNT=%02x, CMD=%02x, ADD=%02x, DAT0=%02x, DAT1=%02x\n",
+		inb(SMBHSTCNT),
 		inb(SMBHSTCMD), inb(SMBHSTADD), inb(SMBHSTDAT0),
 		inb(SMBHSTDAT1));
 
@@ -70,19 +71,14 @@ static int sch_transaction(void)
 	temp = inb(SMBHSTSTS) & 0x0f;
 	if (temp) {
 		/* Can not be busy since we checked it in sch_access */
-		if (temp & 0x01) {
-			dev_dbg(&sch_adapter.dev, "Completion (%02x). "
-				"Clear...\n", temp);
-		}
-		if (temp & 0x06) {
-			dev_dbg(&sch_adapter.dev, "SMBus error (%02x). "
-				"Resetting...\n", temp);
-		}
+		if (temp & 0x01)
+			dev_dbg(&adap->dev, "Completion (%02x). Clear...\n", temp);
+		if (temp & 0x06)
+			dev_dbg(&adap->dev, "SMBus error (%02x). Resetting...\n", temp);
 		outb(temp, SMBHSTSTS);
 		temp = inb(SMBHSTSTS) & 0x0f;
 		if (temp) {
-			dev_err(&sch_adapter.dev,
-				"SMBus is not ready: (%02x)\n", temp);
+			dev_err(&adap->dev, "SMBus is not ready: (%02x)\n", temp);
 			return -EAGAIN;
 		}
 	}
@@ -97,31 +93,30 @@ static int sch_transaction(void)
 
 	/* If the SMBus is still busy, we give up */
 	if (retries > MAX_RETRIES) {
-		dev_err(&sch_adapter.dev, "SMBus Timeout!\n");
+		dev_err(&adap->dev, "SMBus Timeout!\n");
 		result = -ETIMEDOUT;
 	} else if (temp & 0x04) {
 		result = -EIO;
-		dev_dbg(&sch_adapter.dev, "Bus collision! SMBus may be "
-			"locked until next hard reset. (sorry!)\n");
+		dev_dbg(&adap->dev, "Bus collision! SMBus may be locked until next hard reset. (sorry!)\n");
 		/* Clock stops and target is stuck in mid-transmission */
 	} else if (temp & 0x02) {
 		result = -EIO;
-		dev_err(&sch_adapter.dev, "Error: no response!\n");
+		dev_err(&adap->dev, "Error: no response!\n");
 	} else if (temp & 0x01) {
-		dev_dbg(&sch_adapter.dev, "Post complete!\n");
+		dev_dbg(&adap->dev, "Post complete!\n");
 		outb(temp, SMBHSTSTS);
 		temp = inb(SMBHSTSTS) & 0x07;
 		if (temp & 0x06) {
 			/* Completion clear failed */
-			dev_dbg(&sch_adapter.dev, "Failed reset at end of "
-				"transaction (%02x), Bus error!\n", temp);
+			dev_dbg(&adap->dev,
+				"Failed reset at end of transaction (%02x), Bus error!\n", temp);
 		}
 	} else {
 		result = -ENXIO;
-		dev_dbg(&sch_adapter.dev, "No such address.\n");
+		dev_dbg(&adap->dev, "No such address.\n");
 	}
-	dev_dbg(&sch_adapter.dev, "Transaction (post): CNT=%02x, CMD=%02x, "
-		"ADD=%02x, DAT0=%02x, DAT1=%02x\n", inb(SMBHSTCNT),
+	dev_dbg(&adap->dev, "Transaction (post): CNT=%02x, CMD=%02x, ADD=%02x, DAT0=%02x, DAT1=%02x\n",
+		inb(SMBHSTCNT),
 		inb(SMBHSTCMD), inb(SMBHSTADD), inb(SMBHSTDAT0),
 		inb(SMBHSTDAT1));
 	return result;
@@ -143,7 +138,7 @@ static s32 sch_access(struct i2c_adapter *adap, u16 addr,
 	/* Make sure the SMBus host is not busy */
 	temp = inb(SMBHSTSTS) & 0x0f;
 	if (temp & 0x08) {
-		dev_dbg(&sch_adapter.dev, "SMBus busy (%02x)\n", temp);
+		dev_dbg(&adap->dev, "SMBus busy (%02x)\n", temp);
 		return -EAGAIN;
 	}
 	temp = inw(SMBHSTCLK);
@@ -154,13 +149,11 @@ static s32 sch_access(struct i2c_adapter *adap, u16 addr,
 		 * 100 kHz. If we actually run at 25 MHz the bus will be
 		 * run ~75 kHz instead which should do no harm.
 		 */
-		dev_notice(&sch_adapter.dev,
-			"Clock divider uninitialized. Setting defaults\n");
+		dev_notice(&adap->dev, "Clock divider uninitialized. Setting defaults\n");
 		outw(backbone_speed / (4 * 100), SMBHSTCLK);
 	}
 
-	dev_dbg(&sch_adapter.dev, "access size: %d %s\n", size,
-		(read_write)?"READ":"WRITE");
+	dev_dbg(&adap->dev, "access size: %d %s\n", size, (read_write)?"READ":"WRITE");
 	switch (size) {
 	case I2C_SMBUS_QUICK:
 		outb((addr << 1) | read_write, SMBHSTADD);
@@ -205,10 +198,10 @@ static s32 sch_access(struct i2c_adapter *adap, u16 addr,
 		dev_warn(&adap->dev, "Unsupported transaction %d\n", size);
 		return -EOPNOTSUPP;
 	}
-	dev_dbg(&sch_adapter.dev, "write size %d to 0x%04x\n", size, SMBHSTCNT);
+	dev_dbg(&adap->dev, "write size %d to 0x%04x\n", size, SMBHSTCNT);
 	outb((inb(SMBHSTCNT) & 0xb0) | (size & 0x7), SMBHSTCNT);
 
-	rc = sch_transaction();
+	rc = sch_transaction(adap);
 	if (rc)	/* Error in transaction */
 		return rc;
 
-- 
2.43.0.rc1.1336.g36b5255a03ac


