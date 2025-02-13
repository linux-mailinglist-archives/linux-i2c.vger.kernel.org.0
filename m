Return-Path: <linux-i2c+bounces-9426-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6503DA34197
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 15:16:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A2DF41895956
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 14:11:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E06F281349;
	Thu, 13 Feb 2025 14:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TDaKGdhh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852C9281344;
	Thu, 13 Feb 2025 14:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739455855; cv=none; b=maxbeGFJEKFM/1mLuasDLGMbmsa2Ih8wciN3iRHnzmF4MXm9pjKVajamp0NbvRWi2CNxNyQqoCVF6ZwbgYe/ouh9gabjcVUUO1XB2injDwVZSDW/q5uEIN2OlEtbR3ntU+QYVEJQ/rBAnVe63diMlaXm8epSYqGdKcYjkDgWbDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739455855; c=relaxed/simple;
	bh=ctb+xk7MY+w2rTHBydALLPpKRzkmBYWDd9xLRSlOFgk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kskDPIQDUmUnmoAHhilzDiO8piAcPSb7/4qItARgrKmKFe29Cjf7G+ExOL2H46lmGyd2FZ/gPNF2SPMY+xO1UJWth5LN93DGu5EDvaUhNuGqGsBRenChc5X4fCicMTW/W+TGYwPydjsj9he2VZsD7721ytuk0ILhNDVlPGa8+WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TDaKGdhh; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739455854; x=1770991854;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ctb+xk7MY+w2rTHBydALLPpKRzkmBYWDd9xLRSlOFgk=;
  b=TDaKGdhh0E/Zl0vJORBN+rZDZDaeuXuoYguQ7fcvMzIfwyWwA8o0vFqR
   3F6GXx8oLfXbd7lf1VLvtQYWfpUPHJoINrhA4jTHGm6b4Xay2A3lKxfPb
   IuJvyKtnfC1gfr5XHB8e1y/vzDUAfrXbbXWXyM1woESRlsn0dJDeJueiC
   e/T04HqxNaXK0UsK0IJFetMYCPyVzBr+LX6Ub+dbUpr56raxahAXGT2Bh
   jHWfjjhoEeDa+uxyrsfUfiU0+bE7M3xZzCxLcOytKz4B70Irf28JkQN68
   RRJbNyVqGFHdXr9xbICFOl30aFwLeC5RuMeX4/M+Fjmt+nCeBZLfataZe
   A==;
X-CSE-ConnectionGUID: TlqD/77cTVyAnGTFIEGIUQ==
X-CSE-MsgGUID: W7I08v6eSQmo/yy8hx9v7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40280879"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="40280879"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 06:10:53 -0800
X-CSE-ConnectionGUID: PFagJQ/uTyy19AXdvQFGPQ==
X-CSE-MsgGUID: xtLFa7DZSjSggc3zBYFKzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="113682998"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa010.fm.intel.com with ESMTP; 13 Feb 2025 06:10:48 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 623E1322; Thu, 13 Feb 2025 16:10:47 +0200 (EET)
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
Subject: [PATCH v2 04/10] i2c: brcmstb: Use i2c_10bit_addr_*_from_msg() helpers
Date: Thu, 13 Feb 2025 16:07:18 +0200
Message-ID: <20250213141045.2716943-5-andriy.shevchenko@linux.intel.com>
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
 drivers/i2c/busses/i2c-brcmstb.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-brcmstb.c b/drivers/i2c/busses/i2c-brcmstb.c
index 00f1a046e985..5fa30e8926c5 100644
--- a/drivers/i2c/busses/i2c-brcmstb.c
+++ b/drivers/i2c/busses/i2c-brcmstb.c
@@ -414,23 +414,22 @@ static int brcmstb_i2c_do_addr(struct brcmstb_i2c_dev *dev,
 
 	if (msg->flags & I2C_M_TEN) {
 		/* First byte is 11110XX0 where XX is upper 2 bits */
-		addr = 0xF0 | ((msg->addr & 0x300) >> 7);
+		addr = i2c_10bit_addr_hi_from_msg(msg) & ~I2C_M_RD;
 		bsc_writel(dev, addr, chip_address);
 
 		/* Second byte is the remaining 8 bits */
-		addr = msg->addr & 0xFF;
+		addr = i2c_10bit_addr_lo_from_msg(msg);
 		if (brcmstb_i2c_write_data_byte(dev, &addr, 0) < 0)
 			return -EREMOTEIO;
 
 		if (msg->flags & I2C_M_RD) {
 			/* For read, send restart without stop condition */
-			brcmstb_set_i2c_start_stop(dev, COND_RESTART
-						   | COND_NOSTOP);
+			brcmstb_set_i2c_start_stop(dev, COND_RESTART | COND_NOSTOP);
+
 			/* Then re-send the first byte with the read bit set */
-			addr = 0xF0 | ((msg->addr & 0x300) >> 7) | 0x01;
+			addr = i2c_10bit_addr_hi_from_msg(msg);
 			if (brcmstb_i2c_write_data_byte(dev, &addr, 0) < 0)
 				return -EREMOTEIO;
-
 		}
 	} else {
 		addr = i2c_8bit_addr_from_msg(msg);
-- 
2.45.1.3035.g276e886db78b


