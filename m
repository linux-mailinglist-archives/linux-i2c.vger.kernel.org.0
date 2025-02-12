Return-Path: <linux-i2c+bounces-9389-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABDAA32BB4
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 17:34:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EFFCC16320C
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 16:34:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D58F256C65;
	Wed, 12 Feb 2025 16:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PlQacMNz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF00253B6A;
	Wed, 12 Feb 2025 16:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739378050; cv=none; b=J7cEAuBWAsrV1jGQkw143wW99t1bHD9bv7YQU8b5XNHQujG00S0hk9aqhzON4rxdJDbFwrBmkVTp97A00QTDW3mBApO/y97d/qxtc9EA/DdcjElSxORr5qWNzwS3EkI+0kDlWpBB6K6GSdNXEgd8js95BGGnF2kjK2H9w3klhBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739378050; c=relaxed/simple;
	bh=lw0AQ9Rpd28XddSfg/O8nWXU4S88r7p5CG7C4eayPmU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iYYrD4x6QV1KaLxcs1A5I0Cuz+N83wKcA8uA5Wuqo+EW7gaUTm/C9Yjqpi7F3baXgrO48nOSvllwfzwwZjYEqtqELALi3R9AwdCDpXmTwOvXneCfj//Tst6Iv0h8Az7HPR+JSrutnqASeEM3kr4MxMKqsJTsbjKl2XhKd+1DdyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PlQacMNz; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739378049; x=1770914049;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lw0AQ9Rpd28XddSfg/O8nWXU4S88r7p5CG7C4eayPmU=;
  b=PlQacMNz8fboZxzi8oU4IKGff+SxvqjsWSx9GVMAhhYkJcK03Ua/oFRN
   c/ZF5GxHO66cQpXoTmBpptnMSUu0hESmYRprdZx2gb+oSeE+p/Hd11wOR
   bBTJO3mvMRTAfo3auYItCHw90hdoJNNa5vZARQBkzj6W6CNBRx/kT/qfg
   rMRlHjNL9Gl4mnwJQiSWacGYPKLrrOnBAkeSe6XHZuRzy81O26BjK4Nhw
   k4Q1GfMaL8RaGuxU4an+cZ+0IuWxCBCAYd3Fz8AsUIJ2sq5nWMchQa/Zb
   c6yYRbVz4/ceP9ni3VdBu3uDzN3iq6DEFRe0griq9nyR681yD4+cD+eCy
   Q==;
X-CSE-ConnectionGUID: jinAxT10TG6UJhAf/htKYQ==
X-CSE-MsgGUID: iSK/gh4iQKmMoEpY7aao6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="39969200"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="39969200"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 08:34:08 -0800
X-CSE-ConnectionGUID: pHECftlpSbC3O2TFvy+LFw==
X-CSE-MsgGUID: RnMIYfAdRvS/SfwDNyDA1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="143815131"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 12 Feb 2025 08:34:03 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id D3A3431C; Wed, 12 Feb 2025 18:34:01 +0200 (EET)
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
	Stefan Roese <sr@denx.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: [PATCH v1 4/8] i2c: eg20t: Use i2c_10bit_addr_from_msg() helper
Date: Wed, 12 Feb 2025 18:32:29 +0200
Message-ID: <20250212163359.2407327-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.45.1.3035.g276e886db78b
In-Reply-To: <20250212163359.2407327-1-andriy.shevchenko@linux.intel.com>
References: <20250212163359.2407327-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use i2c_10bit_addr_from_msg() helper instead of local copy.
No functional change intended.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-eg20t.c | 28 +++++-----------------------
 1 file changed, 5 insertions(+), 23 deletions(-)

diff --git a/drivers/i2c/busses/i2c-eg20t.c b/drivers/i2c/busses/i2c-eg20t.c
index 4914bfbee2a9..20151408bf9c 100644
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
+		iowrite32(i2c_10bit_addr_from_msg(msgs), p + PCH_I2CDR);
 		if (first)
 			pch_i2c_start(adap);
 
@@ -403,8 +393,7 @@ static s32 pch_i2c_writebytes(struct i2c_adapter *i2c_adap,
 		if (rtn)
 			return rtn;
 
-		addr_8_lsb = (addr & I2C_ADDR_MSK);
-		iowrite32(addr_8_lsb, p + PCH_I2CDR);
+		iowrite32(msgs->addr & 0xff, p + PCH_I2CDR);
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
+		iowrite32(i2c_10bit_addr_from_msg(msgs) & ~I2C_M_RD, p + PCH_I2CDR);
 		if (first)
 			pch_i2c_start(adap);
 
@@ -518,8 +502,7 @@ static s32 pch_i2c_readbytes(struct i2c_adapter *i2c_adap, struct i2c_msg *msgs,
 		if (rtn)
 			return rtn;
 
-		addr_8_lsb = (addr & I2C_ADDR_MSK);
-		iowrite32(addr_8_lsb, p + PCH_I2CDR);
+		iowrite32(msgs->addr & 0xff, p + PCH_I2CDR);
 
 		pch_i2c_restart(adap);
 
@@ -527,8 +510,7 @@ static s32 pch_i2c_readbytes(struct i2c_adapter *i2c_adap, struct i2c_msg *msgs,
 		if (rtn)
 			return rtn;
 
-		addr_2_msb |= I2C_RD;
-		iowrite32(addr_2_msb | TEN_BIT_ADDR_MASK, p + PCH_I2CDR);
+		iowrite32(i2c_10bit_addr_from_msg(msgs), p + PCH_I2CDR);
 	} else {
 		/* 7 address bits + R/W bit */
 		iowrite32(i2c_8bit_addr_from_msg(msgs), p + PCH_I2CDR);
-- 
2.45.1.3035.g276e886db78b


