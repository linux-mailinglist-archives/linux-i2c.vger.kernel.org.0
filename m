Return-Path: <linux-i2c+bounces-9393-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A723EA32BC7
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 17:35:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A5293A9499
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 16:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56D4725A352;
	Wed, 12 Feb 2025 16:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WvQ3xSrL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915EB257AD3;
	Wed, 12 Feb 2025 16:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739378054; cv=none; b=e3hWAwIJ+SNIsUWm9wv8TYTZLQacT3DgDAHzfcJNLHyvoMkipHFAo9ZQKsqWVR5XS3lHOZi7cow4CCo2ZrK6LAFriA///HSRgb7xuWILuDW6xtaZkm73vbzrf0ylazzFdTd7bFne9Jnexbcd8rJwU9gaVUQAZfMW96M4kysyvFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739378054; c=relaxed/simple;
	bh=Hb3P1Z7fp3eHA+WMWeBY9ywHmJku1uAyrgRk9oKvYTM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U39kr+GRe1CzGjR18kpSWRqHIcjUPgpaTbNuyDPcVxIyrIDxz1VFwLeHzqlaD6BTkBT1VDlgMjsqvWLC4C8XCdbXFXTxWauMlc73/032I7nIYcHQJwsbEvOkbMVNH1nEQHJfeFcsu0CYW5dZWcpiwPVYbgh/Q3OyelQOC0KNZSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WvQ3xSrL; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739378053; x=1770914053;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Hb3P1Z7fp3eHA+WMWeBY9ywHmJku1uAyrgRk9oKvYTM=;
  b=WvQ3xSrLoRgCIjKaddw+4sttPrCnbDo9BHBDedjKoZS+dsamdP3B9w7j
   fL7rTrRrvdXiV6y7Perg9WVJYOd4vg0bVj+qD1sv+kwlHs59iN+NK7uJj
   BWCyAaCczqFFY+WCiife5IlUcCcoYQavLj6wL2e6zuuuAQbIo8rzNSc0n
   7qc7uj/Gya3UJnvQeOfge0BpoQn9fL1htmINNhaOxVdR9kYP/LNmJyt1y
   zBpGavrppk2ntppoPJeXYKMClY344f83fcT1GDvN/I+0q/g/ylX09bphY
   ziF1/0e8bS3CX3kCZ/Q/gQAT+9lmvjmQPbLyNzfmrBL9Gd63g2u2Gv3zd
   g==;
X-CSE-ConnectionGUID: GY/gElTVRLCaJ7A6ny80ow==
X-CSE-MsgGUID: +XxTDJ3jSS+bih2/8tW/Jw==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="39969216"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="39969216"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 08:34:12 -0800
X-CSE-ConnectionGUID: 8OZBwWCSShK6pBCksmcUPA==
X-CSE-MsgGUID: 14jO9aJVT/CiG7rJ6BlqOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="143815135"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 12 Feb 2025 08:34:08 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 043304B0; Wed, 12 Feb 2025 18:34:01 +0200 (EET)
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
Subject: [PATCH v1 7/8] i2c: mv64xxx: Use i2c_*bit_addr_from_msg() helpers
Date: Wed, 12 Feb 2025 18:32:32 +0200
Message-ID: <20250212163359.2407327-8-andriy.shevchenko@linux.intel.com>
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

Use i2c_*bit_addr_from_msg() helpers instead of local copy.
No functional change intended.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-mv64xxx.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mv64xxx.c b/drivers/i2c/busses/i2c-mv64xxx.c
index 874309580c33..3f83c68947cc 100644
--- a/drivers/i2c/busses/i2c-mv64xxx.c
+++ b/drivers/i2c/busses/i2c-mv64xxx.c
@@ -27,7 +27,6 @@
 #include <linux/err.h>
 #include <linux/delay.h>
 
-#define MV64XXX_I2C_ADDR_ADDR(val)			((val & 0x7f) << 1)
 #define MV64XXX_I2C_BAUD_DIV_N(val)			(val & 0x7)
 #define MV64XXX_I2C_BAUD_DIV_M(val)			((val & 0xf) << 3)
 
@@ -176,22 +175,17 @@ static void
 mv64xxx_i2c_prepare_for_io(struct mv64xxx_i2c_data *drv_data,
 	struct i2c_msg *msg)
 {
-	u32	dir = 0;
-
 	drv_data->cntl_bits = MV64XXX_I2C_REG_CONTROL_ACK |
 			      MV64XXX_I2C_REG_CONTROL_TWSIEN;
 
 	if (!drv_data->atomic)
 		drv_data->cntl_bits |= MV64XXX_I2C_REG_CONTROL_INTEN;
 
-	if (msg->flags & I2C_M_RD)
-		dir = 1;
-
 	if (msg->flags & I2C_M_TEN) {
-		drv_data->addr1 = 0xf0 | (((u32)msg->addr & 0x300) >> 7) | dir;
+		drv_data->addr1 = i2c_10bit_addr_from_msg(msg);
 		drv_data->addr2 = (u32)msg->addr & 0xff;
 	} else {
-		drv_data->addr1 = MV64XXX_I2C_ADDR_ADDR((u32)msg->addr) | dir;
+		drv_data->addr1 = i2c_8bit_addr_from_msg(msg);
 		drv_data->addr2 = 0;
 	}
 }
-- 
2.45.1.3035.g276e886db78b


