Return-Path: <linux-i2c+bounces-9428-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BB57FA34181
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 15:14:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 807AE1649CF
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 14:11:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0FAF2139C4;
	Thu, 13 Feb 2025 14:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J4/EjmP5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC9C281360;
	Thu, 13 Feb 2025 14:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739455859; cv=none; b=Pv/mO6es6oMMY2ubEBGPqSMDOxiY0OvnhEaee764+AL1pNBLnNM5YiACcJAyec7GKigaxRRo2EdgKQ/CNXyX2foKv27JwGbqfv0gUSVPyxnCe9uU+Lp9WrqIxE/synZfamhnPRuaHWExXuprwigwlTNzGAJ9tDjydeIVKwW5hYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739455859; c=relaxed/simple;
	bh=5ayFkGzSgHATsYNHDJUcvnqqtd8yZvVr8eovxy/IOis=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qzMyiNk0sKTOlxknmoijFvtP5k1aSMksAODlwBGpYTvrNoJn0PH6Hq8cwmDDpJFPXq/yd4dlnvbQlcBHucle/m61x+uB0nUs+mN60nngNG99vdzGJ3RMOdGQGd2BmUOQN9KEdIe5nPDrXp//wg/Hyu43OvnRLjqa5K55ifFzFRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J4/EjmP5; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739455858; x=1770991858;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5ayFkGzSgHATsYNHDJUcvnqqtd8yZvVr8eovxy/IOis=;
  b=J4/EjmP5SkXJv7eI02UhKNJE7bYA572rPUtn3QhgDMZzqHM3w4qllpSA
   uui4wE9b/0f5YYyNSFG2lfnn/qx1ivIg/62ZUpnIzMIvA4tnftVbra7yc
   s1PJ2I/RynbdwmOWX9n0plOqDxRbXuRzWp+026P9RmhfIKcoY1iv+KOH/
   qjiGjFKfHNnlaLo2WHf7miaQWFh4gu+uzIyGIttUD6F82V7k9S2ILEVje
   3h8anOTivm082BBI4ee42A8akiBZznbuCs4Nv959RNyBRYd/tsQnG+tLy
   zpdZ4NlSC2UHHg6vRDZmVCsO197ATXZ9P3M8+60k9JvnZW2PXvBGRP4wW
   A==;
X-CSE-ConnectionGUID: 8uhHfO2aSCi8uOhY4m0rdw==
X-CSE-MsgGUID: cNT+s3ddRJeMns6Ia+gPbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40273338"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="40273338"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 06:10:54 -0800
X-CSE-ConnectionGUID: Fg6w4WWGQwiWwz3xKH3QUQ==
X-CSE-MsgGUID: jHiuxOpcTsq10u94SUHpXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="113815325"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 13 Feb 2025 06:10:48 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 431BF2CA; Thu, 13 Feb 2025 16:10:47 +0200 (EET)
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
Subject: [PATCH v2 02/10] i2c: axxia: Use i2c_10bit_addr_*_from_msg() helpers
Date: Thu, 13 Feb 2025 16:07:16 +0200
Message-ID: <20250213141045.2716943-3-andriy.shevchenko@linux.intel.com>
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
 drivers/i2c/busses/i2c-axxia.c | 21 +++------------------
 1 file changed, 3 insertions(+), 18 deletions(-)

diff --git a/drivers/i2c/busses/i2c-axxia.c b/drivers/i2c/busses/i2c-axxia.c
index 48916cf45ff7..50030256cd85 100644
--- a/drivers/i2c/busses/i2c-axxia.c
+++ b/drivers/i2c/busses/i2c-axxia.c
@@ -255,11 +255,6 @@ static int i2c_m_rd(const struct i2c_msg *msg)
 	return (msg->flags & I2C_M_RD) != 0;
 }
 
-static int i2c_m_ten(const struct i2c_msg *msg)
-{
-	return (msg->flags & I2C_M_TEN) != 0;
-}
-
 static int i2c_m_recv_len(const struct i2c_msg *msg)
 {
 	return (msg->flags & I2C_M_RECV_LEN) != 0;
@@ -439,20 +434,10 @@ static void axxia_i2c_set_addr(struct axxia_i2c_dev *idev, struct i2c_msg *msg)
 {
 	u32 addr_1, addr_2;
 
-	if (i2c_m_ten(msg)) {
-		/* 10-bit address
-		 *   addr_1: 5'b11110 | addr[9:8] | (R/nW)
-		 *   addr_2: addr[7:0]
-		 */
-		addr_1 = 0xF0 | ((msg->addr >> 7) & 0x06);
-		if (i2c_m_rd(msg))
-			addr_1 |= 1;	/* Set the R/nW bit of the address */
-		addr_2 = msg->addr & 0xFF;
+	if (msg->flags & I2C_M_TEN) {
+		addr_1 = i2c_10bit_addr_hi_from_msg(msg);
+		addr_2 = i2c_10bit_addr_lo_from_msg(msg);
 	} else {
-		/* 7-bit address
-		 *   addr_1: addr[6:0] | (R/nW)
-		 *   addr_2: dont care
-		 */
 		addr_1 = i2c_8bit_addr_from_msg(msg);
 		addr_2 = 0;
 	}
-- 
2.45.1.3035.g276e886db78b


