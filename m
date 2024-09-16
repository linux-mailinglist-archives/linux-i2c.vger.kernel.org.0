Return-Path: <linux-i2c+bounces-6789-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DD57D97A101
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 14:03:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 62EA9B2127C
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 12:03:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFB2E15821A;
	Mon, 16 Sep 2024 12:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KDWAeeJL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C2D156C5F;
	Mon, 16 Sep 2024 12:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726488169; cv=none; b=GG16hs/gS4pMXNK5P0EKEbQ2c/3JJu5WZi8ODbMPKvIf7+yXHNIfp+2dpKqCrdSw8BwMYStubwo/McygxoQls06/CQkLYWzeB9Q1diRWP1CBkvgFrZ2OdcBEUZiQixpY3/StlIrSqU+nFZmSK8Wt1bFx7BYZBHPFI6tdllglCuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726488169; c=relaxed/simple;
	bh=yPXkWpV/o+wi6jClcgywPYyS6yUsGonyYmuAXlI/UB4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BWvy3QA1kk3sdpdbHvLuFhK4VacQtPP2K8tS3fmx8Wv3Xh0IH6y+tarLlqCDoyC2eJwgG+bpjBVcJoOfDT8cRTp5ZfeGV8CQ3m+gwZgUhUP9cXVEQePzddH7IDUG3opIoMnIUHrQU9LxdmTxvpKO0kF7rJjIH+MXN7tXYr0TEo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KDWAeeJL; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726488168; x=1758024168;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yPXkWpV/o+wi6jClcgywPYyS6yUsGonyYmuAXlI/UB4=;
  b=KDWAeeJLX1J+9sfgHXS76P4b91KCp96BRCJhCL0ihFLQpodMQMUfH0fX
   fC1GMqpbxOY4cbRx27ThsiwRxnox4epoL4YrWrkANSqK0rLwIdxhX6ZGT
   l6uGjkKqKDLA1JF5nHowDOvCt0LH4M7hM/C3rRF/ehlbBNIb4MAB2g+lZ
   w7I5GlfrVCGxNYIirNaeosyXSrhTs96ukiBcolRamQ7qXR/yBMoDTyj8w
   3hCfE6CwYry3XADh53lnRw63NUtYjFkWnD12ljaDPUR8frnWqCcI1GaNL
   gKr1FQq864odMeFIbf+qbO1je3kn1fUB9GkPeNZBY0PftEQM0gWYwRwG6
   w==;
X-CSE-ConnectionGUID: LMj70TkVSju9JOE7ihcgJQ==
X-CSE-MsgGUID: mhxOsu+CQ0ehi/0VHqZRYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="24842824"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="24842824"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 05:02:44 -0700
X-CSE-ConnectionGUID: fIL4VNWrSpedNTVlJX2i1Q==
X-CSE-MsgGUID: IGHl9Vk1RFWwkmjHBazNmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="68540778"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP; 16 Sep 2024 05:02:42 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id E17C567E; Mon, 16 Sep 2024 15:02:38 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 07/11] i2c: isch: Use read_poll_timeout()
Date: Mon, 16 Sep 2024 15:01:34 +0300
Message-ID: <20240916120237.1385982-8-andriy.shevchenko@linux.intel.com>
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

Simplify the code by using read_poll_timeout().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-isch.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-isch.c b/drivers/i2c/busses/i2c-isch.c
index d0098b7139a0..e6b99913f4f3 100644
--- a/drivers/i2c/busses/i2c-isch.c
+++ b/drivers/i2c/busses/i2c-isch.c
@@ -17,9 +17,9 @@
 #include <linux/container_of.h>
 #include <linux/delay.h>
 #include <linux/device.h>
-#include <linux/ioport.h>
 #include <linux/i2c.h>
-#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/ioport.h>
 #include <linux/stddef.h>
 #include <linux/string_choices.h>
 #include <linux/types.h>
@@ -34,9 +34,6 @@
 #define SMBHSTDAT1	0x07
 #define SMBBLKDAT	0x20
 
-/* Other settings */
-#define MAX_RETRIES	5000
-
 /* I2C constants */
 #define SCH_QUICK		0x00
 #define SCH_BYTE		0x01
@@ -83,7 +80,6 @@ static int sch_transaction(struct i2c_adapter *adap)
 	struct sch_i2c *priv = container_of(adap, struct sch_i2c, adapter);
 	int temp;
 	int result = 0;
-	int retries = 0;
 
 	dev_dbg(&adap->dev,
 		"Transaction (pre): CNT=%02x, CMD=%02x, ADD=%02x, DAT0=%02x, DAT1=%02x\n",
@@ -112,15 +108,11 @@ static int sch_transaction(struct i2c_adapter *adap)
 	temp |= 0x10;
 	sch_io_wr8(priv, SMBHSTCNT, temp);
 
-	do {
-		usleep_range(100, 200);
-		temp = sch_io_rd8(priv, SMBHSTSTS) & 0x0f;
-	} while ((temp & 0x08) && (retries++ < MAX_RETRIES));
-
+	result = read_poll_timeout(sch_io_rd8, temp, !(temp & 0x08), 200, 500000, true,
+				   priv, SMBHSTSTS);
 	/* If the SMBus is still busy, we give up */
-	if (retries > MAX_RETRIES) {
+	if (result) {
 		dev_err(&adap->dev, "SMBus Timeout!\n");
-		result = -ETIMEDOUT;
 	} else if (temp & 0x04) {
 		result = -EIO;
 		dev_dbg(&adap->dev, "Bus collision! SMBus may be locked until next hard reset. (sorry!)\n");
@@ -130,7 +122,7 @@ static int sch_transaction(struct i2c_adapter *adap)
 		dev_err(&adap->dev, "Error: no response!\n");
 	} else if (temp & 0x01) {
 		dev_dbg(&adap->dev, "Post complete!\n");
-		sch_io_wr8(priv, SMBHSTSTS, temp);
+		sch_io_wr8(priv, SMBHSTSTS, temp & 0x0f);
 		temp = sch_io_rd8(priv, SMBHSTSTS) & 0x07;
 		if (temp & 0x06) {
 			/* Completion clear failed */
-- 
2.43.0.rc1.1336.g36b5255a03ac


