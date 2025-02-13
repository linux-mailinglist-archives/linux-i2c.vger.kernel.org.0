Return-Path: <linux-i2c+bounces-9434-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8B8A3419F
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 15:17:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF4AC3AA3EC
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 14:12:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F53523F42D;
	Thu, 13 Feb 2025 14:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iq7PF/fN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906192222C3;
	Thu, 13 Feb 2025 14:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739455863; cv=none; b=aq05Z7LFtjjusQuimTJGk3NF1Dtd5jfqPRg0C8eBOyq7AoPKaCLOROUaAO4eOB8lSsQGquEScymMdMW/yS7hADBsIUMgjwl4eTLCR0P2AP021GkuuVyGFXLuOoDge2LkTyqWVqAyQ+oYzzJ9gMaRy+6t8jFXHAw4+HIf4/uRC88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739455863; c=relaxed/simple;
	bh=VA1tfbqQVZF5jK+NE8+kVijBTK5o1VLx6VaYd48u/1E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L7wl33gyi3CA4BCui6qp/RfW/ERPJ/9G7XHBzZ/T73WmqxfPZnurgI+yH2D+XcXnHA6OavaAUc7jr3nimSSb58fpdqxWBE7KPKeiOqQqQUnoDcaZMUhLwS0LtKNPtNFwZbxQamW1mNcM+tptx+CFPITLWLDwayMl0urYREuTe68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iq7PF/fN; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739455862; x=1770991862;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VA1tfbqQVZF5jK+NE8+kVijBTK5o1VLx6VaYd48u/1E=;
  b=iq7PF/fNiJev5id6TGOsi3z9Tr3zWGRtOE0QiaFvQqRL4tJzbmf7TuLQ
   lp973ENHqhQjfwdsjV3SdeXjbC6TwSGFxsMqlQfLjAV3AZ+E7A2nt0fmP
   8zyCSJL8UoKzXuX1zTURBbLhRaco/lHKhNMQ1kmHuubZsMfWP07+rx2sa
   YETfjmuS4Ut9/yq7QHk1j24+ZAATmQw1D3fpCiE8enzKRKQHa6orYazB8
   2iGVXtaQdUIM60etNv1GW8t/BABshPbbE1/kgCGurCDExTw7zFSKFSDx/
   O7jcFKYVsuVEPyEQkxDz4BIvgkCbRVfxZ9nn2bor4mJ9WHz+er5BLuguI
   w==;
X-CSE-ConnectionGUID: EiLCZZXcQPO/oadTK7BGmg==
X-CSE-MsgGUID: d8tf/KtPSA2PizGLX2ARTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40190582"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="40190582"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 06:10:59 -0800
X-CSE-ConnectionGUID: CC5XQBZoRu+4nrrfc8HM9A==
X-CSE-MsgGUID: /UI5GoifQOepe8vvQPR4ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="118162151"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 13 Feb 2025 06:10:54 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id A899058B; Thu, 13 Feb 2025 16:10:47 +0200 (EET)
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
Subject: [PATCH v2 10/10] i2c: mv64xxx: Use i2c_*bit_addr*_from_msg() helpers
Date: Thu, 13 Feb 2025 16:07:24 +0200
Message-ID: <20250213141045.2716943-11-andriy.shevchenko@linux.intel.com>
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
 drivers/i2c/busses/i2c-mv64xxx.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mv64xxx.c b/drivers/i2c/busses/i2c-mv64xxx.c
index 874309580c33..8fc26a511320 100644
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
-		drv_data->addr2 = (u32)msg->addr & 0xff;
+		drv_data->addr1 = i2c_10bit_addr_hi_from_msg(msg);
+		drv_data->addr2 = i2c_10bit_addr_lo_from_msg(msg);
 	} else {
-		drv_data->addr1 = MV64XXX_I2C_ADDR_ADDR((u32)msg->addr) | dir;
+		drv_data->addr1 = i2c_8bit_addr_from_msg(msg);
 		drv_data->addr2 = 0;
 	}
 }
-- 
2.45.1.3035.g276e886db78b


