Return-Path: <linux-i2c+bounces-9435-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC3AA3418B
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 15:14:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 390BF16B5C1
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 14:12:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1E08242900;
	Thu, 13 Feb 2025 14:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lxeu3qN7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3252222CF;
	Thu, 13 Feb 2025 14:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739455863; cv=none; b=A6+3BiPUc20TgAJ3oe9Oz77h8V8CTyFAx/9c8Ie3V4gfIJDXhM8z67j+e2n0X9RTMfslK74g9OqIuiqprBie5DT9igG17Q3nhpD4oJXP3fUZyquhCImbglIbCBUBRQrR8egLWcxF+H4EUgqPztMnGruL3LEfW/9z3dEs1S5BZ5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739455863; c=relaxed/simple;
	bh=lv1tv82hXtQIfwGuvcKrMPsoiMB8uNGpqj8IbWXXAh0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FVcKeztoGQ2PpxjVdjGLo9VybsQu4cHMWChpJwDsc5lMW2+aEz/ZuExX1Jr5oJbmk3l8ifykTNnggQb2Shod5RkPugqg6rwwMFH0XTM8oMwG/IfeBOo/9Tp3BeqfwPjVGU762RjDyQ0qEsJvetqbQ7oqaeEt+1WXFM2kbjZB7/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lxeu3qN7; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739455862; x=1770991862;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lv1tv82hXtQIfwGuvcKrMPsoiMB8uNGpqj8IbWXXAh0=;
  b=lxeu3qN7+kP72Xz4ley2I6YzHvJfNS9/0N6OWfI+CQyMJLLrvb0GjLQe
   B69PiAmOoKoPE9NJBbSjFPO8IWivftoZDCh+Hgak8NOI8wPTaTYll7fEs
   gIiwQr0Paw+YCLg3rFAPzulZILUqheURygK36KtOk0smDc/rWfYhBmxZq
   8kSU5uaiSccN+StOXouVYnIzQEPl5TMjl1qHwSQRl5O/8fYAXC4l0KeFT
   w1OycDcuRwSKEdYR+SEFsicqEWheYEC+OIlwIh5xQ0+0CjPuyhZiaFV/q
   h9PlkwsviLGUiNBMJ23yR9Ekaz1AVg8BDWlb+T/zqwk3Y/i7sIwxMCWD8
   g==;
X-CSE-ConnectionGUID: Lv5oarnbTpK0V4BqwnCnjA==
X-CSE-MsgGUID: sykKI9hqT5CTEj8XZdL/Ig==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40022185"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="40022185"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 06:10:59 -0800
X-CSE-ConnectionGUID: n3V6PYqWS0S8C5PXMH2KjA==
X-CSE-MsgGUID: g0HtOaHJSpCzdWcGox5aEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117777629"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa005.fm.intel.com with ESMTP; 13 Feb 2025 06:10:54 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 9E6334D1; Thu, 13 Feb 2025 16:10:47 +0200 (EET)
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
Subject: [PATCH v2 09/10] i2c: ibm_iic: Use i2c_*bit_addr*_from_msg() helpers
Date: Thu, 13 Feb 2025 16:07:23 +0200
Message-ID: <20250213141045.2716943-10-andriy.shevchenko@linux.intel.com>
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

Use i2c_*bit_addr*_from_msg() helpers instead of local copy.
No functional change intended.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-ibm_iic.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-ibm_iic.c b/drivers/i2c/busses/i2c-ibm_iic.c
index c76c4116ddc7..6bf45d752ff9 100644
--- a/drivers/i2c/busses/i2c-ibm_iic.c
+++ b/drivers/i2c/busses/i2c-ibm_iic.c
@@ -512,19 +512,17 @@ static int iic_xfer_bytes(struct ibm_iic_private* dev, struct i2c_msg* pm,
 static inline void iic_address(struct ibm_iic_private* dev, struct i2c_msg* msg)
 {
 	volatile struct iic_regs __iomem *iic = dev->vaddr;
-	u16 addr = msg->addr;
 
 	DBG2("%d: iic_address, 0x%03x (%d-bit)\n", dev->idx,
-		addr, msg->flags & I2C_M_TEN ? 10 : 7);
+		msg->addr, msg->flags & I2C_M_TEN ? 10 : 7);
 
-	if (msg->flags & I2C_M_TEN){
+	if (msg->flags & I2C_M_TEN) {
 	    out_8(&iic->cntl, CNTL_AMD);
-	    out_8(&iic->lmadr, addr);
-	    out_8(&iic->hmadr, 0xf0 | ((addr >> 7) & 0x06));
-	}
-	else {
+	    out_8(&iic->lmadr, i2c_10bit_addr_lo_from_msg(msg));
+	    out_8(&iic->hmadr, i2c_10bit_addr_hi_from_msg(msg) & ~I2C_M_RD);
+	} else {
 	    out_8(&iic->cntl, 0);
-	    out_8(&iic->lmadr, addr << 1);
+	    out_8(&iic->lmadr, i2c_8bit_addr_from_msg(msg) & ~I2C_M_RD);
 	}
 }
 
-- 
2.45.1.3035.g276e886db78b


