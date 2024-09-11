Return-Path: <linux-i2c+bounces-6580-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9AC97579D
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 17:53:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B2D74B28738
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 15:50:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85C3E1B372E;
	Wed, 11 Sep 2024 15:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V1U5JtNb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF271AE872;
	Wed, 11 Sep 2024 15:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726069715; cv=none; b=LWxklE4knmx/lzmfxQvKsaDopDsw3vQx+n+z7lGszgd34gIfbSML04T2yOD2TGJZfBUGr94XAkVBarUoR7tkj/B3UdSueAK/mu+QR9QCl73NiR8PD7BL15uoRkS6hJvtrPVZDmIJtFBn2+/fQ4FiUyvQHGc08SQ2rXUGU4WpoLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726069715; c=relaxed/simple;
	bh=3D9BbQm0Q0Hk/HBpwjTL0a2bZYqY7RF6LaNA4j8CN0I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jau6JKTAjqLB6cPniK52PptxxXkypfkS+fv66w149LSO+3LjWH0HGRaTg/6UqSuOrVPbYoFNZdC5WcaHjrEN8sJ7Nf2f7wpR/8qrW5OEw1+PA3qS5vVU2HkTANuOQqNlzy3+jCmZoFEKU3ZCPM5DkRLKdeuSHyD3p+4jOsDls2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V1U5JtNb; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726069714; x=1757605714;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3D9BbQm0Q0Hk/HBpwjTL0a2bZYqY7RF6LaNA4j8CN0I=;
  b=V1U5JtNbPGkIs9i4mEf3bkwG2MQ73CTersmK6eZffpfk25xcssKpKgBr
   ymSkyqwO5/Wd28iL0zlYA0v6iXNwedf2R0T2U9R8arSRpLEjp5j1/fJhy
   +ec5XqTT+jzjiBNtpYgnUD0ORFlic/5/a4GDRatpPfn86tEN9muNc1ybz
   U2I7i2ceVmeIeV4tqV7ayiRKS+A156V69BSAXyDs920JTxGtEYDpvcnKQ
   eLAiPB9Ore8X09YG5b/8Pvm2StIR1ODQD/dyyekASXf8+beuPCoJ+/u0m
   2VrzXvZvmbS6L7gl4Y3UeiMO5304xW/5Mr0vj/Is3pfN3kfBgr/2pv3ht
   Q==;
X-CSE-ConnectionGUID: ltDU6JOaTDiApxHQ+rp+/w==
X-CSE-MsgGUID: 33ORBX76T1WwrBgSGAxepQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="24701852"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="24701852"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 08:48:26 -0700
X-CSE-ConnectionGUID: 3ucPdmHlTyiXxveHpE2h9Q==
X-CSE-MsgGUID: uMHDS7ACTBK1MUN/mBYmdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="72388565"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 11 Sep 2024 08:48:25 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 9F30C575; Wed, 11 Sep 2024 18:48:21 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v1 08/12] i2c: isch: Use read_poll_timeout()
Date: Wed, 11 Sep 2024 18:39:21 +0300
Message-ID: <20240911154820.2846187-9-andriy.shevchenko@linux.intel.com>
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

Simplify the code by using read_poll_timeout().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-isch.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-isch.c b/drivers/i2c/busses/i2c-isch.c
index bbcfa3218a81..3a8cf7efb592 100644
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


