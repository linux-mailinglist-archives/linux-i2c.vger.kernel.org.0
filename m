Return-Path: <linux-i2c+bounces-9394-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B65A32BBF
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 17:35:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC3F01889FD8
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 16:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3A4D25A633;
	Wed, 12 Feb 2025 16:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PKrKXApI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E062580CF;
	Wed, 12 Feb 2025 16:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739378054; cv=none; b=e3TGEocFHq7YsnmBAX11FX2+p12b4wotXjPVx1jjJsOWmXxrnoH6MHGVbPXoNAgm1FW7Mj6C6DBerDlejtzXqQeVk5A5OjU67JB37IneLf0SH1h5eNASuRmDVpNHiKExy+ILuZljlsql3NBsy+eQg++Jk/P0Os6Gli9FFVb/BzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739378054; c=relaxed/simple;
	bh=34yUH4FReh//Shi3Q14PxOJohJbKhtrPmtlmxuM90Cw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MQzQlbgAC6McEXuoJH39GzGSwRgpoRz0jzY4hklnyQoOe3SD+sjAaP88/i59salMTYKuV0zDXq38pPHyDyuox9y0tcVHisBPU5aIIRYJRun1rZqVGBjplKYDTKF4g5FFkO7u0pmGUj/6l/2qf66/v/QTxQv8rPokfpbyBEDRqUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PKrKXApI; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739378053; x=1770914053;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=34yUH4FReh//Shi3Q14PxOJohJbKhtrPmtlmxuM90Cw=;
  b=PKrKXApIfURcRxczAdbn2gpl5u4kqBFaHD1QWbhaQ5raWU+neENjWBiz
   B2ca++sF25532JVJtsClSL7IGvflW8GeJQOOZd7fKBMq3hSj2jZicggYj
   Xqgp1FxrokPb1tF6JjseWn5mAnvyqM4k49pEqbJSGZPrqT0Ae7c1AWpNb
   rjzcgBukKqYktY+kcT266PmXH8EzGWg1JYqOoXLDXQCi4Bu6DDEJjcqyT
   BX447KgRKlwjps82h2+YVz8Se5tKhnYNNOZmz51VbL5vsFeVD0a/rpmGp
   ULpdkLueY2YllTClHZkfES5wWkw7+OTAXNyM5Oz4dBBaaiqDwt3P0R1ED
   Q==;
X-CSE-ConnectionGUID: PCrDZbtrTumpo1aCvH/W6g==
X-CSE-MsgGUID: uBLy22CxQMuQ0VEtTkTYNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="43811889"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="43811889"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 08:34:13 -0800
X-CSE-ConnectionGUID: +vdWh79iQG6OMwT6nXvM4w==
X-CSE-MsgGUID: MwpZszTMTVaYHbh6HJ9xRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="143815136"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 12 Feb 2025 08:34:08 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 0F81F4D1; Wed, 12 Feb 2025 18:34:02 +0200 (EET)
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
Subject: [PATCH v1 8/8] i2c: rzv2m: Use i2c_10bit_addr_from_msg() helper
Date: Wed, 12 Feb 2025 18:32:33 +0200
Message-ID: <20250212163359.2407327-9-andriy.shevchenko@linux.intel.com>
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
 drivers/i2c/busses/i2c-rzv2m.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rzv2m.c b/drivers/i2c/busses/i2c-rzv2m.c
index 02b76e24a476..55c5ce3b0f97 100644
--- a/drivers/i2c/busses/i2c-rzv2m.c
+++ b/drivers/i2c/busses/i2c-rzv2m.c
@@ -287,13 +287,9 @@ static int rzv2m_i2c_send_address(struct rzv2m_i2c_priv *priv,
 	int ret;
 
 	if (msg->flags & I2C_M_TEN) {
-		/*
-		 * 10-bit address
-		 *   addr_1: 5'b11110 | addr[9:8] | (R/nW)
-		 *   addr_2: addr[7:0]
-		 */
-		addr = 0xf0 | ((msg->addr & GENMASK(9, 8)) >> 7);
-		addr |= !!(msg->flags & I2C_M_RD);
+		/* 10-bit address */
+		addr = i2c_10bit_addr_from_msg(msg);
+
 		/* Send 1st address(extend code) */
 		ret = rzv2m_i2c_write_with_ack(priv, addr);
 		if (ret)
-- 
2.45.1.3035.g276e886db78b


