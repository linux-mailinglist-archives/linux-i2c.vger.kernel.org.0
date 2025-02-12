Return-Path: <linux-i2c+bounces-9396-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1A5A32BCC
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 17:36:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2450B3A9BB1
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 16:35:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F76D25C6EB;
	Wed, 12 Feb 2025 16:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R5KaA8gr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25EEB2580EF;
	Wed, 12 Feb 2025 16:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739378054; cv=none; b=Ah6wngHyoXSJDBZkSpEJMVckDrXXuCCTb6mgZpnCfKIU2NHf5TbI22MnmgPvwgVa1knX+uekO6wuTj66WXcosi/Ea6O8k7nHnthgi/QKPx4YTc/cZq9rTZq0P8Jill118f7YOyvKtxELpoWSc4HcDnEViFLyeJsbAETQEe7Pd4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739378054; c=relaxed/simple;
	bh=R5mEhGWTo6M3w0F741dBYLgdNEX23+SYVxfBs3QbmrM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kcduG8Mwh0FISn6TNFmwrDIbtvR4TFyBqCftYmlUN3sN45a7x4dEyR60TurRqW5gOsNYBxV8wTJ1bZmaciJ9preYRff6Ln8I5CfQKgRaU3ptAk+3jf1h9Q4SsJasLjnZvsF1FGWuHBB0sNz9Y6Ni/nAwrvES1MfqBaXHCPPzMG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R5KaA8gr; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739378054; x=1770914054;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=R5mEhGWTo6M3w0F741dBYLgdNEX23+SYVxfBs3QbmrM=;
  b=R5KaA8groKXxC6KOHfMCdaejCJUeV0c9L6B6btjxG9CyjP+cXW+WyN9H
   kIRGP3E5/fTDzbym52OgaxYbeZblmO4Y8z6us/iwny9AOj/hk6jLGEroz
   qTTV/WKLBEfjC87p21EiNKGZMp4Upg92CkLkQBWdu50y4ysddBC5UEmP7
   M6X+cYK3w+vM0+x+IG7w7RCO0EneuP3eugeBYalDkj5TYITlA1rqotH1l
   ADD1NRL7ZxHL+/fqOCjlYU8n14eW6J8pnZHePAw6a6tk2GZbT1v/rRcln
   x9TZD//OloP3aaqmQh6vcjK+DtIU8F8iJ2ve/9t23BwFvsyxFrX/8e9lD
   w==;
X-CSE-ConnectionGUID: NV7PcVVaREyFgyBR1VPNPw==
X-CSE-MsgGUID: gp6rQAKqQQWkNldd0n1dXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="51032386"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="51032386"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 08:34:13 -0800
X-CSE-ConnectionGUID: jWJsVpz+S6CetFgqQaumcw==
X-CSE-MsgGUID: jyAYbCBiTU+yhgP+2k/P+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="117879159"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 12 Feb 2025 08:34:08 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id ED65B4AE; Wed, 12 Feb 2025 18:34:01 +0200 (EET)
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
Subject: [PATCH v1 6/8] i2c: mt7621: Use i2c_10bit_addr_from_msg() helper
Date: Wed, 12 Feb 2025 18:32:31 +0200
Message-ID: <20250212163359.2407327-7-andriy.shevchenko@linux.intel.com>
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
 drivers/i2c/busses/i2c-mt7621.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
index 2103f21f9ddd..125dc91fb329 100644
--- a/drivers/i2c/busses/i2c-mt7621.c
+++ b/drivers/i2c/busses/i2c-mt7621.c
@@ -164,10 +164,8 @@ static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 		/* write address */
 		if (pmsg->flags & I2C_M_TEN) {
 			/* 10 bits address */
-			addr = 0xf0 | ((pmsg->addr >> 7) & 0x06);
+			addr = i2c_10bit_addr_from_msg(pmsg);
 			addr |= (pmsg->addr & 0xff) << 8;
-			if (pmsg->flags & I2C_M_RD)
-				addr |= 1;
 			iowrite32(addr, i2c->base + REG_SM0D0_REG);
 			ret = mtk_i2c_cmd(i2c, SM0CTL1_WRITE, 2);
 			if (ret)
-- 
2.45.1.3035.g276e886db78b


