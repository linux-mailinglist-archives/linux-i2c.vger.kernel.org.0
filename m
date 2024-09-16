Return-Path: <linux-i2c+bounces-6790-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C281397A103
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 14:03:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6E381C22FB4
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 12:03:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E128158550;
	Mon, 16 Sep 2024 12:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sd6yRg1V"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B0A156F4A;
	Mon, 16 Sep 2024 12:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726488170; cv=none; b=FecSF89zYZ615s2z4BA1TdUYWf4uEKXC5/Y6Is3+BOPCD8VAeaOmXcL9GWC9Q36bUpiB3ARrQgOQZeYU4+QUdN1qfEC5kNXciK2U584clr34B1TiDTfTFsv+Ef7jf49GLIvEVn9B1a/B9Cr0e+vv6v3QzKdfMXCsxHv0j6FkoW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726488170; c=relaxed/simple;
	bh=9lNwwchqtXXJpXOahHD+7ykMGOfbN3/dx2wh9a8nQ90=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jMArBCkqnlKKOAe0b4+arzLDBsMTfsIQunQiqtlTYFLM8tdPw9GfBAXx2JHR35qOk9WK8cmpEGu37kYW3GLSFHx+3Img7KRPFl+v9F8oegEuMi2aw8OTn9BekCCYHNgm6/iaO2vNGK7BO2mdWuvOdKvd8BWQ2maig18fHGWXzlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sd6yRg1V; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726488169; x=1758024169;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9lNwwchqtXXJpXOahHD+7ykMGOfbN3/dx2wh9a8nQ90=;
  b=Sd6yRg1VZuwdNij5jDHsv3mMFZK0+ywNFvm4cr8TYAaurNa0qPo9spGP
   CmGkIxb0IYtvikahGZuocFe76e/0jqmhbq9MMje5cqSZ/nOOG6L6MYgu0
   xEsanbv/JBJoyUb0IcJY5efCBvh5+pQFJvZbYSl8NCGPos1ttKToyBd9o
   jLdqzhhTKEuILhSmG1j5wm5m/hWQ0qeFsLAzyAgUB24gHE08IxSJPmxbc
   /g/RvXsCO66/8fw6MBsmFz08im5HnTTxXTSMzGhqfRQweeM3AQLQJlxea
   q245egr5rx5KEHLv4X7//mGnqEOW7zvYN/7sUmoHwhAT5rdD/jmMI7AEu
   w==;
X-CSE-ConnectionGUID: jgifz9KZRQuD+m5Xb2q+TA==
X-CSE-MsgGUID: DVOI24wlTnKEcYWky14L9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="24842832"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="24842832"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 05:02:44 -0700
X-CSE-ConnectionGUID: PwQXyc/OQhCHIEDZIyDXHQ==
X-CSE-MsgGUID: luRzunH7TnieW1RlhEcngQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="68540780"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP; 16 Sep 2024 05:02:42 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id E9B44628; Mon, 16 Sep 2024 15:02:38 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 08/11] i2c: isch: Unify the name of the variable to hold an error code
Date: Mon, 16 Sep 2024 15:01:35 +0300
Message-ID: <20240916120237.1385982-9-andriy.shevchenko@linux.intel.com>
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

There are two different names used for the variable that holds
an error code. Unify to use one variant in all cases.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-isch.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-isch.c b/drivers/i2c/busses/i2c-isch.c
index e6b99913f4f3..d71a42fd9dd9 100644
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


