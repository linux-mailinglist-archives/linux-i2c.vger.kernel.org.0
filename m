Return-Path: <linux-i2c+bounces-15063-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9ADD12E73
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 14:50:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 344CD300E81B
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 13:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B780335BDA7;
	Mon, 12 Jan 2026 13:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CTjhIP7A"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA10B355051;
	Mon, 12 Jan 2026 13:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768225772; cv=none; b=YwQcbklTZgn2poq9zZ3PgLw/aowvJ5um/nUA8GdKt9jBjXNeQ24o6WT5KypIOi1R4ilLLLtgeBae9+HdiFtcazo2HAtI6azCo4sdl34sWtbXocOA7ikVOyG8J49+zfbbMVLsy27lyPXzM0atoS3CpwbPSHyMBgqf6hamzuAtDdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768225772; c=relaxed/simple;
	bh=bvkjFMtSsNyVlD/gDmFcbP4PilFhSduRbbSoTWljZyA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sI2XwSTq1vobQES/B93pQcBM698MHlmnf/4yi8yF4DgnqzzOz82n5x0p8eamBSsfmarg0kpsUw+xxXJeywyTfrcqbzDQ7JRVhv6wfdK74o5jT4wDilaz8RzM2kKXcmJkWzoxafvbfC6e9W72xpBkpHQlvD0na2TC11hetug8+qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CTjhIP7A; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768225765; x=1799761765;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bvkjFMtSsNyVlD/gDmFcbP4PilFhSduRbbSoTWljZyA=;
  b=CTjhIP7AI69gqDdIuu3byfuXRjWexXfvlNLMlaQyaFrG+LonUmiF8yfl
   1Q2XrtIu4pwE6FGtf1Dl2tT5iPT8qJyO3x7GGXBOhorEK5aN1n7oRm3/T
   ebeNKC/xcTsYWHrb2vFP+FtNLYg1ZpLxJb8QwcomqHolcNEIzkyZyzkvf
   rDdl2D+6BYUH0l1rClCjcOKRi/4SwtyvSxkFn39QWXQOwPjO4SwclpzEb
   k30bWBQSDG7F0d4fwCaOEWbtkBUhAkp7oPL6LnuitwrmkQcdh8ovszUi0
   xYAdpjkTod/WidGK2dPx8umsnodyvNFzqcNbtAXGokDPH+C9hA0jnn4K0
   w==;
X-CSE-ConnectionGUID: +YgO98dvRU2uND/vtwFCAw==
X-CSE-MsgGUID: UJGONPP/ROiSFPBOap9KEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="57048329"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="57048329"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 05:49:16 -0800
X-CSE-ConnectionGUID: qxmDXGGUSi2DaE8/GG5AqQ==
X-CSE-MsgGUID: /vn6Qq1uQVGqJCdFULVPXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="208618616"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa004.jf.intel.com with ESMTP; 12 Jan 2026 05:49:12 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id CEC9DA4; Mon, 12 Jan 2026 14:49:06 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andi Shyti <andi@smida.it>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Cc: Khalil Blaiech <kblaiech@nvidia.com>,
	Asmaa Mnebhi <asmaa@nvidia.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Qii Wang <qii.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH v1 7/7] i2c: synquacer: Use HZ_PER_GHZ constant instead of plain number
Date: Mon, 12 Jan 2026 14:46:15 +0100
Message-ID: <20260112134900.4142954-8-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260112134900.4142954-1-andriy.shevchenko@linux.intel.com>
References: <20260112134900.4142954-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use defined constant to avoid the possible mistakes and to provide
an additional information on the units.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-synquacer.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-synquacer.c b/drivers/i2c/busses/i2c-synquacer.c
index 1230f51e1624..4891d68bf0ee 100644
--- a/drivers/i2c/busses/i2c-synquacer.c
+++ b/drivers/i2c/busses/i2c-synquacer.c
@@ -18,9 +18,10 @@
 #include <linux/sched.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
+#include <linux/units.h>
 
 #define WAIT_PCLK(n, rate)	\
-	ndelay(DIV_ROUND_UP(DIV_ROUND_UP(1000000000, rate), n) + 10)
+	ndelay(DIV_ROUND_UP(DIV_ROUND_UP(HZ_PER_GHZ, rate), n) + 10)
 
 /* I2C register address definitions */
 #define SYNQUACER_I2C_REG_BSR		(0x00 << 2) // Bus Status
-- 
2.50.1


