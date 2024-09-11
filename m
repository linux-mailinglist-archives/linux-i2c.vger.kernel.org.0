Return-Path: <linux-i2c+bounces-6574-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BEE975780
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 17:49:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12D611F21B95
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 15:49:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 460721AE87F;
	Wed, 11 Sep 2024 15:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YKHeTNVq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE871AC891;
	Wed, 11 Sep 2024 15:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726069712; cv=none; b=TALnaAl97uEf78r7UIkfvck7kDwJYHkoFm4tJpQHOeXTaEGDg9wHm2Kg0SiuAP9qVCvmDOkcYLTOEUK5660iQA6b4ZoPN5md27tR0ibB/PWSpvDpboTfxRMkUcvJMURuPIH9WPpxFr7zoWjquv0/h0OzxaCjKqC++XuY0Ltff58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726069712; c=relaxed/simple;
	bh=WxtYlBGVCCxL+Las691qhrqx8d/+iyr6qXtIQAGc/Ic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dpik0xcntvj0k5E+ON5lUDGPKbRofWkpJO3laiF4/vKE6WAQZCgnMVJbeD72T4b5E9XyHdQqSCInslMcXWfmZuJGoTRp29/HoKyk6EfnQlMbqPanr65uiY94dq0CqmKaXPzpXQ9Rz0xv6ntW68QkgtcrZT2McT1BoedbZiIx1kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YKHeTNVq; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726069709; x=1757605709;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WxtYlBGVCCxL+Las691qhrqx8d/+iyr6qXtIQAGc/Ic=;
  b=YKHeTNVqZb0TvcxGJCOP3ZVBhSDGKKY91K9tcQ5wHgvCnJvBoUO82xpr
   QR1SktTwvOuK6M4U764bI9tHRV8jS4AjP80P21bcq89TiNXHUouqgnx0p
   DF1FnykbY7M8SCMeYjOOio4RRZyu3eawBMejBxr7hvtsWgXTBC680rYv3
   IBEK8IopoWUkyTqnrElZG1Z0qQbZHfC9X2BfzYZaczZGvHJ61NyqmC9dC
   uUBTPXGoTHgA7YuSK1GH2VhTmPLPRrPf88xADkT6Zg/VftnloNZoHTq5E
   oAScKC3sGZcuThU2QsQJYzj79+qxMUUT+58RyBkkkcvS+HuLRuyw5hvM6
   Q==;
X-CSE-ConnectionGUID: 47DMqu3NRg+s/DtyBszISA==
X-CSE-MsgGUID: TMb3YVfgRe6jkiFt40yi4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="24701831"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="24701831"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 08:48:24 -0700
X-CSE-ConnectionGUID: INwMGD0+S+GR9cQH3BYEEQ==
X-CSE-MsgGUID: IwqPKdIvRFuAvHy2Y450yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="67255179"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa010.jf.intel.com with ESMTP; 11 Sep 2024 08:48:23 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 5C769432; Wed, 11 Sep 2024 18:48:21 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v1 02/12] i2c: isch: Pass pointer to struct i2c_adapter down
Date: Wed, 11 Sep 2024 18:39:15 +0300
Message-ID: <20240911154820.2846187-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240911154820.2846187-1-andriy.shevchenko@linux.intel.com>
References: <20240911154820.2846187-1-andriy.shevchenko@linux.intel.com>
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


