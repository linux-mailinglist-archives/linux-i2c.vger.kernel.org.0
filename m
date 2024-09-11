Return-Path: <linux-i2c+bounces-6577-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 206C1975788
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 17:49:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 526561C23656
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 15:49:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E780C1B1509;
	Wed, 11 Sep 2024 15:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Stl3OhyW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1A21AE87D;
	Wed, 11 Sep 2024 15:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726069713; cv=none; b=toWauFBy4dTJYORG0BpCt7fnmspGDlchcZiz0UUNQ1OF6mwKF8XFezbMsQ4HPHzhJIV6vNQwb8NSNBNppcgs3CSfsn8CD/eLaY34Pvv1WEUT87RV2U+GJlv9/WcOuOyBAApC4Iq+pnivBbHDYGGGfkBCK6/ovfGk1YU/ChqWN10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726069713; c=relaxed/simple;
	bh=isi+04wbl8vH0mvOh/b/CSiA5S3TK2K3TxOhAVvzGfE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u08dMMY406mPb9rXK8KaaoD+JJ+8HxC5BuJOHVaM06bkpJ1CwrSeNaCNi9uAyKW7Djo03rma+ZwxduyF1oLvTUBsGSufw/vnRaAJGn39CYtYAZRYMGtJAmZFCAQSOQ09QJOY8mE6ZjpvQqLLR94fFpSACkfVBJPP+5GqwV+x2CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Stl3OhyW; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726069712; x=1757605712;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=isi+04wbl8vH0mvOh/b/CSiA5S3TK2K3TxOhAVvzGfE=;
  b=Stl3OhyWdUmyYvs/ZgtXhnbZdhAMbZh3FFPbkivBMLoVt/bq06TlCxP4
   5JzeDaIOw08VFJ9YxAhHLOAXj6HHokKpF4JKg4kNYqUjVbyd8W8nk8uEp
   pTSSy0K8JBFhBxLw6+SK9XXMrymMFKCAVu38flqL4p17jCNEipEandXwC
   TF/i+FyiJnmeW0JHd9HUdkisf/Rq5YH1EgQe5mNSGqTMBPgm40uDkLAEV
   B2wSeInvfT8ePkv3I0Dg2b0E3y3KGfCtzlaqtTYjPIUwhtaEHV3LwzT1p
   iw0JMZlaxWl9BVV4ExHiqABY3vQW432lq42RzDYuChmzzQT1SXe+Yw2K9
   w==;
X-CSE-ConnectionGUID: Ty8TfGYPTzm1qVIKzo599g==
X-CSE-MsgGUID: g0g9qWYkTUaJToRunQ7BIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="24701843"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="24701843"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 08:48:26 -0700
X-CSE-ConnectionGUID: jy1tDTlASMmK7lfLgc+VLg==
X-CSE-MsgGUID: mj57lbU3RYO9smA72hPDAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="72388566"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 11 Sep 2024 08:48:25 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id B1569598; Wed, 11 Sep 2024 18:48:21 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v1 09/12] i2c: isch: Unify the name of the variable to hold an error code
Date: Wed, 11 Sep 2024 18:39:22 +0300
Message-ID: <20240911154820.2846187-10-andriy.shevchenko@linux.intel.com>
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

There are two different names used for the variable that holds
an error code. Unify to use one variant in all cases.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-isch.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-isch.c b/drivers/i2c/busses/i2c-isch.c
index 3a8cf7efb592..bb5e09feea61 100644
--- a/drivers/i2c/busses/i2c-isch.c
+++ b/drivers/i2c/busses/i2c-isch.c
@@ -79,7 +79,7 @@ static int sch_transaction(struct i2c_adapter *adap)
 {
 	struct sch_i2c *priv = container_of(adap, struct sch_i2c, adapter);
 	int temp;
-	int result = 0;
+	int rc;
 
 	dev_dbg(&adap->dev,
 		"Transaction (pre): CNT=%02x, CMD=%02x, ADD=%02x, DAT0=%02x, DAT1=%02x\n",
@@ -108,17 +108,16 @@ static int sch_transaction(struct i2c_adapter *adap)
 	temp |= 0x10;
 	sch_io_wr8(priv, SMBHSTCNT, temp);
 
-	result = read_poll_timeout(sch_io_rd8, temp, !(temp & 0x08), 200, 500000, true,
-				   priv, SMBHSTSTS);
+	rc = read_poll_timeout(sch_io_rd8, temp, !(temp & 0x08), 200, 500000, true, priv, SMBHSTSTS);
 	/* If the SMBus is still busy, we give up */
-	if (result) {
+	if (rc) {
 		dev_err(&adap->dev, "SMBus Timeout!\n");
 	} else if (temp & 0x04) {
-		result = -EIO;
+		rc = -EIO;
 		dev_dbg(&adap->dev, "Bus collision! SMBus may be locked until next hard reset. (sorry!)\n");
 		/* Clock stops and target is stuck in mid-transmission */
 	} else if (temp & 0x02) {
-		result = -EIO;
+		rc = -EIO;
 		dev_err(&adap->dev, "Error: no response!\n");
 	} else if (temp & 0x01) {
 		dev_dbg(&adap->dev, "Post complete!\n");
@@ -130,14 +129,14 @@ static int sch_transaction(struct i2c_adapter *adap)
 				"Failed reset at end of transaction (%02x), Bus error!\n", temp);
 		}
 	} else {
-		result = -ENXIO;
+		rc = -ENXIO;
 		dev_dbg(&adap->dev, "No such address.\n");
 	}
 	dev_dbg(&adap->dev, "Transaction (post): CNT=%02x, CMD=%02x, ADD=%02x, DAT0=%02x, DAT1=%02x\n",
 		sch_io_rd8(priv, SMBHSTCNT), sch_io_rd8(priv, SMBHSTCMD),
 		sch_io_rd8(priv, SMBHSTADD),
 		sch_io_rd8(priv, SMBHSTDAT0), sch_io_rd8(priv, SMBHSTDAT1));
-	return result;
+	return rc;
 }
 
 /*
-- 
2.43.0.rc1.1336.g36b5255a03ac


