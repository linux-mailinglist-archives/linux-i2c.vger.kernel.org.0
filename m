Return-Path: <linux-i2c+bounces-9432-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41ED4A34171
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 15:12:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D422C7A5F4B
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 14:11:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C07FD2222D2;
	Thu, 13 Feb 2025 14:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fuXLthHC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C730E221541;
	Thu, 13 Feb 2025 14:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739455861; cv=none; b=TnRryiPURsRQirMx2moH4Qau4kjp9PvK5X52CyxWXJBRoAfi01xwCQK4hHN2aQWI2vM/MFz3sQdIHKstWqTQ6Ysa0OXyK3Q+NyRtTH5MHJcwjCpoOkZD05sFjEEqSQQ3I+UHR3ffpXZYD9lBpyR3YtEWs06oZ5EPC+dDZJN4ncQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739455861; c=relaxed/simple;
	bh=1jajp4kJf0AGawBV2YpqEpiYtshZwSib+DRflhjaZMg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C8TX4kvW+v0hydtU6O4IX4hrSlyLrWca4RqInhGE6BT3I6NBADLOx7sKgU8EAJ4IxNNSyu3qB8SZtFdCFxUnuJrecNPf3guxVzTM8y3F0C0tJnUBUmIdXAt4/O3NW1P0g6UMfTdWvTB1wbHEPW21dfsfMKCYmjsU4GLtgQu/RAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fuXLthHC; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739455860; x=1770991860;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1jajp4kJf0AGawBV2YpqEpiYtshZwSib+DRflhjaZMg=;
  b=fuXLthHCTEtfTDb14CCwhwcAIlKfMm+VRmnuKmOI75zM+QAYFjbl2Bj9
   Ola2HvdMlkp2Oex+VMZQ+ucSR2LZt4JdyH3goaM1ais6QuqCxRqHdLFj9
   zjgb8xpP1m6VVJT7CIUeOu3YGsLqeR5XNEUmCCdiXpwjka5oKXUW5hJGj
   4Q90G8Hd+Rii+nDODObWskfrUr/Drmw064rvLzjzZGfGTZzfk7bSacMx+
   1y0qJgFSxkjd9loS1zfrdJA6yaEfMBh5JOpK894tKcyxFb+UcFj9czLq4
   KOGHEBSEu2CGmNBxx1QGg0IKJALZmTg0I31iqryw7mCvz6xRlKqKvYE+e
   Q==;
X-CSE-ConnectionGUID: hLm4HMEaTFSqJoJCelrdxQ==
X-CSE-MsgGUID: ysooSF+kTiSu4FmlGnzoMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40190567"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="40190567"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 06:10:59 -0800
X-CSE-ConnectionGUID: +puV+GHOQzSmmh3V0YhlCg==
X-CSE-MsgGUID: f8x//h/JTNyLD4hu3lbJmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="118162152"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 13 Feb 2025 06:10:54 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 8995F4AE; Thu, 13 Feb 2025 16:10:47 +0200 (EET)
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
Subject: [PATCH v2 07/10] i2c: mt7621: Use i2c_10bit_addr_*_from_msg() helpers
Date: Thu, 13 Feb 2025 16:07:21 +0200
Message-ID: <20250213141045.2716943-8-andriy.shevchenko@linux.intel.com>
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
 drivers/i2c/busses/i2c-mt7621.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
index 2103f21f9ddd..0a288c998419 100644
--- a/drivers/i2c/busses/i2c-mt7621.c
+++ b/drivers/i2c/busses/i2c-mt7621.c
@@ -164,22 +164,18 @@ static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 		/* write address */
 		if (pmsg->flags & I2C_M_TEN) {
 			/* 10 bits address */
-			addr = 0xf0 | ((pmsg->addr >> 7) & 0x06);
-			addr |= (pmsg->addr & 0xff) << 8;
-			if (pmsg->flags & I2C_M_RD)
-				addr |= 1;
-			iowrite32(addr, i2c->base + REG_SM0D0_REG);
-			ret = mtk_i2c_cmd(i2c, SM0CTL1_WRITE, 2);
-			if (ret)
-				goto err_timeout;
+			addr = i2c_10bit_addr_hi_from_msg(pmsg);
+			addr |= i2c_10bit_addr_lo_from_msg(pmsg) << 8;
+			len = 2;
 		} else {
 			/* 7 bits address */
 			addr = i2c_8bit_addr_from_msg(pmsg);
-			iowrite32(addr, i2c->base + REG_SM0D0_REG);
-			ret = mtk_i2c_cmd(i2c, SM0CTL1_WRITE, 1);
-			if (ret)
-				goto err_timeout;
+			len = 1;
 		}
+		iowrite32(addr, i2c->base + REG_SM0D0_REG);
+		ret = mtk_i2c_cmd(i2c, SM0CTL1_WRITE, len);
+		if (ret)
+			goto err_timeout;
 
 		/* check address ACK */
 		if (!(pmsg->flags & I2C_M_IGNORE_NAK)) {
-- 
2.45.1.3035.g276e886db78b


