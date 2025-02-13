Return-Path: <linux-i2c+bounces-9433-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F2106A34175
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 15:12:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 004167A2E34
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 14:11:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5186A23A9BF;
	Thu, 13 Feb 2025 14:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aNMqMZwV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9932222BB;
	Thu, 13 Feb 2025 14:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739455863; cv=none; b=NjgVC0bAlHyj84uirl9RpFGWK7NzkVOJqbEOvkoSIiu7lWnzVUtLj4rWFCqaVe+VRGWdRtU9w/R8FO/xEm2aWY24lvbVqM4qp1yp6duBDgFMW6ZodJI7laPuRG4WJySvGE7rDvTDRE56LuVpVtLL7iB/ICsfLNU9jFmHusFC6/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739455863; c=relaxed/simple;
	bh=ybN5Nygx8hZ29vGg+klw6Hx6uz4qirA/yKTm+8272bo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J9goqkP2RJEc7Gec91GpRN6bA/03Wdz/ZntuXdv4+qJVzDpF5BLP0kkFjnltXsQYhqKHP/vSJJG34ZOLME/2LWoQ55JFj8dbpVbf/zDTqsomBp9OO2M4d4q+GXTnFuiyIA/rpUX+R0iLVca18PmiGXrfBD9yeGNRnw8Expo4vro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aNMqMZwV; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739455862; x=1770991862;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ybN5Nygx8hZ29vGg+klw6Hx6uz4qirA/yKTm+8272bo=;
  b=aNMqMZwVlMV6V7OBTn9YiXo0UVPw1jS902+QiLm/Gf6MhMEkgMrnzShJ
   mezlkF+a/VJ8FF5udJ4Y03CQVqSHxdzAsJgxs91GxUcy8J5WTmvdi0Ezk
   7kJcx04UuoCq3C7kChNtPd1yC1GGePp+ZxYwgt5pr5AahV0cOdDwlbucV
   UNdC3/iQ19h0tLLJbsfnuI8tl7IrGMHqJpow7BXFw6a3GpdZfRQH30Toq
   erEk7hccchK+ufSqDsMywruJX6HvUhWph9YaQTgjSCd++DBrsJu5vWQeK
   TqX2B1jcSsMl6yNBpLDXIkP+RmXwygend64qseI+BASGA7DTgqdQgr7HQ
   w==;
X-CSE-ConnectionGUID: 6XaxE0fxTNi+prpXnJLglw==
X-CSE-MsgGUID: cNm5Yk11RI2gE61BoQADSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40022169"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="40022169"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 06:10:59 -0800
X-CSE-ConnectionGUID: BwV8tZeoSYuucBgwq9XW7g==
X-CSE-MsgGUID: zwLfW2AwRTybHJ9Kyd0XPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117777628"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa005.fm.intel.com with ESMTP; 13 Feb 2025 06:10:54 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 6F5333BA; Thu, 13 Feb 2025 16:10:47 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Cc: Krzysztof Adamski <krzysztof.adamski@nokia.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Kamal Dasu <kamal.dasu@broadcom.com>,
	Stefan Roese <sr@denx.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: [PATCH v2 05/10] i2c: eg20t: Use i2c_10bit_addr_*_from_msg() helpers
Date: Thu, 13 Feb 2025 16:07:19 +0200
Message-ID: <20250213141045.2716943-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.45.1.3035.g276e886db78b
In-Reply-To: <20250213141045.2716943-1-andriy.shevchenko@linux.intel.com>
References: <20250213141045.2716943-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use i2c_10bit_addr_*_from_msg() helpers instead of local copy.
No functional change intended.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-eg20t.c | 28 +++++-----------------------
 1 file changed, 5 insertions(+), 23 deletions(-)

diff --git a/drivers/i2c/busses/i2c-eg20t.c b/drivers/i2c/busses/i2c-eg20t.c
index 4914bfbee2a9..efdaddf99f9e 100644
--- a/drivers/i2c/busses/i2c-eg20t.c
+++ b/drivers/i2c/busses/i2c-eg20t.c
@@ -48,8 +48,6 @@
 
 #define BUS_IDLE_TIMEOUT	20
 #define PCH_I2CCTL_I2CMEN	0x0080
-#define TEN_BIT_ADDR_DEFAULT	0xF000
-#define TEN_BIT_ADDR_MASK	0xF0
 #define PCH_START		0x0020
 #define PCH_RESTART		0x0004
 #define PCH_ESR_START		0x0001
@@ -58,7 +56,6 @@
 #define PCH_ACK			0x0008
 #define PCH_GETACK		0x0001
 #define CLR_REG			0x0
-#define I2C_RD			0x1
 #define I2CMCF_BIT		0x0080
 #define I2CMIF_BIT		0x0002
 #define I2CMAL_BIT		0x0010
@@ -76,8 +73,6 @@
 #define I2CMBB_BIT		0x0020
 #define BUFFER_MODE_MASK	(I2CBMFI_BIT | I2CBMAL_BIT | I2CBMNA_BIT | \
 				I2CBMTO_BIT | I2CBMIS_BIT)
-#define I2C_ADDR_MSK		0xFF
-#define I2C_MSB_2B_MSK		0x300
 #define FAST_MODE_CLK		400
 #define FAST_MODE_EN		0x0001
 #define SUB_ADDR_LEN_MAX	4
@@ -371,16 +366,12 @@ static s32 pch_i2c_writebytes(struct i2c_adapter *i2c_adap,
 	struct i2c_algo_pch_data *adap = i2c_adap->algo_data;
 	u8 *buf;
 	u32 length;
-	u32 addr;
-	u32 addr_2_msb;
-	u32 addr_8_lsb;
 	s32 wrcount;
 	s32 rtn;
 	void __iomem *p = adap->pch_base_address;
 
 	length = msgs->len;
 	buf = msgs->buf;
-	addr = msgs->addr;
 
 	/* enable master tx */
 	pch_setbit(adap->pch_base_address, PCH_I2CCTL, I2C_TX_MODE);
@@ -394,8 +385,7 @@ static s32 pch_i2c_writebytes(struct i2c_adapter *i2c_adap,
 	}
 
 	if (msgs->flags & I2C_M_TEN) {
-		addr_2_msb = ((addr & I2C_MSB_2B_MSK) >> 7) & 0x06;
-		iowrite32(addr_2_msb | TEN_BIT_ADDR_MASK, p + PCH_I2CDR);
+		iowrite32(i2c_10bit_addr_hi_from_msg(msgs), p + PCH_I2CDR);
 		if (first)
 			pch_i2c_start(adap);
 
@@ -403,8 +393,7 @@ static s32 pch_i2c_writebytes(struct i2c_adapter *i2c_adap,
 		if (rtn)
 			return rtn;
 
-		addr_8_lsb = (addr & I2C_ADDR_MSK);
-		iowrite32(addr_8_lsb, p + PCH_I2CDR);
+		iowrite32(i2c_10bit_addr_lo_from_msg(msgs), p + PCH_I2CDR);
 	} else {
 		/* set 7 bit slave address and R/W bit as 0 */
 		iowrite32(i2c_8bit_addr_from_msg(msgs), p + PCH_I2CDR);
@@ -490,15 +479,11 @@ static s32 pch_i2c_readbytes(struct i2c_adapter *i2c_adap, struct i2c_msg *msgs,
 	u8 *buf;
 	u32 count;
 	u32 length;
-	u32 addr;
-	u32 addr_2_msb;
-	u32 addr_8_lsb;
 	void __iomem *p = adap->pch_base_address;
 	s32 rtn;
 
 	length = msgs->len;
 	buf = msgs->buf;
-	addr = msgs->addr;
 
 	/* enable master reception */
 	pch_clrbit(adap->pch_base_address, PCH_I2CCTL, I2C_TX_MODE);
@@ -509,8 +494,7 @@ static s32 pch_i2c_readbytes(struct i2c_adapter *i2c_adap, struct i2c_msg *msgs,
 	}
 
 	if (msgs->flags & I2C_M_TEN) {
-		addr_2_msb = ((addr & I2C_MSB_2B_MSK) >> 7);
-		iowrite32(addr_2_msb | TEN_BIT_ADDR_MASK, p + PCH_I2CDR);
+		iowrite32(i2c_10bit_addr_hi_from_msg(msgs) & ~I2C_M_RD, p + PCH_I2CDR);
 		if (first)
 			pch_i2c_start(adap);
 
@@ -518,8 +502,7 @@ static s32 pch_i2c_readbytes(struct i2c_adapter *i2c_adap, struct i2c_msg *msgs,
 		if (rtn)
 			return rtn;
 
-		addr_8_lsb = (addr & I2C_ADDR_MSK);
-		iowrite32(addr_8_lsb, p + PCH_I2CDR);
+		iowrite32(i2c_10bit_addr_lo_from_msg(msgs), p + PCH_I2CDR);
 
 		pch_i2c_restart(adap);
 
@@ -527,8 +510,7 @@ static s32 pch_i2c_readbytes(struct i2c_adapter *i2c_adap, struct i2c_msg *msgs,
 		if (rtn)
 			return rtn;
 
-		addr_2_msb |= I2C_RD;
-		iowrite32(addr_2_msb | TEN_BIT_ADDR_MASK, p + PCH_I2CDR);
+		iowrite32(i2c_10bit_addr_hi_from_msg(msgs), p + PCH_I2CDR);
 	} else {
 		/* 7 address bits + R/W bit */
 		iowrite32(i2c_8bit_addr_from_msg(msgs), p + PCH_I2CDR);
-- 
2.45.1.3035.g276e886db78b


