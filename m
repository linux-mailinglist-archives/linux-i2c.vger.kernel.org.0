Return-Path: <linux-i2c+bounces-9390-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB062A32BB8
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 17:34:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0721A3A7186
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 16:34:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9822256C9A;
	Wed, 12 Feb 2025 16:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UR7+OXbW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0710D254AFB;
	Wed, 12 Feb 2025 16:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739378051; cv=none; b=LcjZS9wvqPlE1TnTA9PJowal2U7lBg0bV3fMKFStW6Vm5V1SuwTpaX04BzN4Ay2oCWq1KKwV2j8GUODBmjsnGlBbrkB9veKDPRGPg8o9gBYieyEbw+WWLohdyX1SnrGzf7bHdnOdODNmAul+dHsgw2AUNuUU8Uym4gZNc4Sf+Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739378051; c=relaxed/simple;
	bh=2DuNQD3CiVM6sMHqctlFn9JOuTyVK4PWMPLxN9OjiMU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M2LMo7HcrZHmNOUX8YqtCXS1hgZfFzIXnGKmVCL9284LG6nqBhSITviGXbW0x7u3m7eUzhPyJOT1e5zPLPbNIsRU6p42hFm8NkEyNR4QijVDY0g2Ner3Q5wzqkb355r6BPdlT7dtF/zLe8fV+eFSOGZbHUNTty0KLkRjgUoAqzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UR7+OXbW; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739378050; x=1770914050;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2DuNQD3CiVM6sMHqctlFn9JOuTyVK4PWMPLxN9OjiMU=;
  b=UR7+OXbW+BXQhGLYSFc7a93MBvl/+Tg4tb7RIB6o8cFFjZQJ6Z/Kh2Nt
   KqWL9kiysseegGclquKnlX4g8/kwQSmBnzFYqB+hzjMDsvdILdLpHgeFu
   GQYWDWGUZQez5NqSXTPlzuQJstt9NYvtX84g4V6Y3vwv0FWFO1hbW0of1
   gp6+ZN+b+mNbFp0XT+PYlLbyWZLqnXqigk+d/dwS4H3LolF8VfskDHsIZ
   gDcLEc5r1Yjt/Eicv9mbCAr49NkWzYobd/VTS8n+uLYHXz0knwqA9C5i3
   hhyKTp0Y/NLlxGmO/wMT4towRgYj+cn6gJnu3A0R/QyGGk8OYifjijeUp
   g==;
X-CSE-ConnectionGUID: eIlBCmflTD+NKfsjBdb0iQ==
X-CSE-MsgGUID: E2++Yr/6RsSAkm0aBwXmWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="51032349"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="51032349"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 08:34:08 -0800
X-CSE-ConnectionGUID: KXHlTlg2SpWG16syJE4uWQ==
X-CSE-MsgGUID: 5M5XTvAcTKCeP3lw6CTN9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="117879144"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 12 Feb 2025 08:34:02 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id B28651FD; Wed, 12 Feb 2025 18:34:01 +0200 (EET)
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
Subject: [PATCH v1 2/8] i2c: axxia: Use i2c_10bit_addr_from_msg() helper
Date: Wed, 12 Feb 2025 18:32:27 +0200
Message-ID: <20250212163359.2407327-3-andriy.shevchenko@linux.intel.com>
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
 drivers/i2c/busses/i2c-axxia.c | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/drivers/i2c/busses/i2c-axxia.c b/drivers/i2c/busses/i2c-axxia.c
index 741ee4636759..bee56e33531b 100644
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
+	if (msg->flags & I2C_M_TEN) {
+		addr_1 = i2c_10bit_addr_from_msg(msg);
 		addr_2 = msg->addr & 0xFF;
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


