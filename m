Return-Path: <linux-i2c+bounces-9395-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC82BA32BC0
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 17:35:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D21E188A181
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 16:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAF5925B69B;
	Wed, 12 Feb 2025 16:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SHpoqde6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0957E2580D7;
	Wed, 12 Feb 2025 16:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739378054; cv=none; b=G2HUGvddWOBHveY1KrNGiwpe8tJej2z7nJTfuaELtN2lHLltyQw3fP9Jow6r6Fge8RPr2Wp3bEojmvaR7RGDRkOD+KmQRXZRNNdVCmV29DWDSiFM5Oio48Odd7juPd6JXw7PzPsZ/sZn1nTWfNR2PANuwy3bRa+w+WlB1DaKO7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739378054; c=relaxed/simple;
	bh=6LcH/n/8RKz7Qn8xIS3YjC1iiVGNtYLVAm7DIZYYkeY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q6snL9YcqgMCYZwvSGNenVezKpe8uEqgAX+tyOT6utroDvk9OLZeeI6UeRWW7AYN0rL+fqHMWGJTtQ1oRoCBLYh02ws+qN971Yc0vLmxLOOZO+HFSl+CdDHrOjaoFaBrtXE+vPhTrrlLQj1N4ePM2Zlv72nt8Mpos6WXV97S95Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SHpoqde6; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739378053; x=1770914053;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6LcH/n/8RKz7Qn8xIS3YjC1iiVGNtYLVAm7DIZYYkeY=;
  b=SHpoqde6Nm+tECA6jCwZdx08DLm/BXl9wko974GOVBt18ej6zv0U4iyd
   7jbRkbC32yv/1hBDRZ7f9tHm+zBK3ViVY6YSc6OLfSxJ1r4VE3Zm8qq39
   PRI54Z+pqKE8K1e1jL7t6Rfgj1iQ1foheifnT03tGq7fcidbpj2z55un2
   y7u8vAs15CAgayrAJdscEApZf89UFBl6boNOSSGD19lFv2Le9d/M3e1NY
   vYbIzkNlHKDrIiJ+SZV9LQnz5dMLLLg79PS4B+WNAh9GQfQczgPS0p4Iy
   LnF7kXmPo6pZKmXSf8QPfJCw+R5xB10nnsvkYtkr5wCeNlM0d+QkrSgWg
   g==;
X-CSE-ConnectionGUID: 19uXkYfwTDqzZdO2DHmq3A==
X-CSE-MsgGUID: DrlbTWJrTTKmZqygaXNw8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="51032405"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="51032405"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 08:34:13 -0800
X-CSE-ConnectionGUID: ywYT84jHTgqIZemsslPwlQ==
X-CSE-MsgGUID: 1fXgybwmTnmsx5GqXBiEuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="117879160"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 12 Feb 2025 08:34:08 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id E0A00322; Wed, 12 Feb 2025 18:34:01 +0200 (EET)
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
Subject: [PATCH v1 5/8] i2c: kempld: Use i2c_10bit_addr_from_msg() helper
Date: Wed, 12 Feb 2025 18:32:30 +0200
Message-ID: <20250212163359.2407327-6-andriy.shevchenko@linux.intel.com>
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
 drivers/i2c/busses/i2c-kempld.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-kempld.c b/drivers/i2c/busses/i2c-kempld.c
index 212196af68ba..7508cc7a33a6 100644
--- a/drivers/i2c/busses/i2c-kempld.c
+++ b/drivers/i2c/busses/i2c-kempld.c
@@ -115,9 +115,7 @@ static int kempld_i2c_process(struct kempld_i2c_data *i2c)
 	if (i2c->state == STATE_ADDR) {
 		/* 10 bit address? */
 		if (i2c->msg->flags & I2C_M_TEN) {
-			addr = 0xf0 | ((i2c->msg->addr >> 7) & 0x6);
-			/* Set read bit if necessary */
-			addr |= (i2c->msg->flags & I2C_M_RD) ? 1 : 0;
+			addr = i2c_10bit_addr_from_msg(msg);
 			i2c->state = STATE_ADDR10;
 		} else {
 			addr = i2c_8bit_addr_from_msg(i2c->msg);
-- 
2.45.1.3035.g276e886db78b


