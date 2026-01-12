Return-Path: <linux-i2c+bounces-15060-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E4233D12EA0
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 14:52:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CDE1630738AE
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 13:49:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDE59359FA1;
	Mon, 12 Jan 2026 13:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XdhBpf5k"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7517F35BDDF;
	Mon, 12 Jan 2026 13:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768225762; cv=none; b=QRCqDBXBYFTzX89dnIbb/IGaZZYuiHMf3+H/IiMJ9LS8WdI0wbC0NmdVqXit+CdX4I5L1PaQtiBlf8rXC8ZP9IZyOIru3qKhignmMMf6Ps7xo8q+fvyqggcrQgyPabsH1I0PY/ZEecwoxt4WGQl5cDcN3THlcFEqjX1VATataQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768225762; c=relaxed/simple;
	bh=aiS8gJGj98x4YF0TjH5ep93m3zw75AdG3q/DYsX48BU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N17FZnlgtxfAyktfa2r/Pyxp/MY34mSNulspKM19wZZVjaurPzMpzjG0xAPnkKjRHwgygQCCnMUaGtcLQixetuSMUjZ7gNWHpnqaFmjFEOHVh5Oyw2t7L79Hwl4XT5zhrNn81bBuWjzih0qeIdBkGCHWCVaHAIEAgiMWY66nIzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XdhBpf5k; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768225755; x=1799761755;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aiS8gJGj98x4YF0TjH5ep93m3zw75AdG3q/DYsX48BU=;
  b=XdhBpf5k2WYN8eCnvWdxa3QokeYcdJuG0ItNBfY6DeALnimTN/RV/3zH
   CorCqdTZxbk/KYy2fFaTgF3qpeI9WmEEE1bM9NnkNNZijmxYWL7mbboI0
   YEwJVpJhRehpVN6bT5NfWUkRFQ53aFIr6sxFh7F6KwAlnbVKjY1OZvDfo
   9UXlDAIy6iS5FIMwtB2Cn1QTH6ZoBRSfhxLcRPvqdO3O7cev2eCMHWxew
   PWz5Mvv8hOcUy74+mT/4nsN3UFXRCDuxFtLgDKeq4IAiuojNDX7b6g3N5
   daq4hFh/9qhi46h9dGu7dzaZsME5ma4WWErOigtoSLSWJwMtG0zJczEnd
   A==;
X-CSE-ConnectionGUID: mSPI5K6bSk6i9Mg4gckvEg==
X-CSE-MsgGUID: jsJXyv+jSXCWJdP99XhnBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="57048304"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="57048304"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 05:49:12 -0800
X-CSE-ConnectionGUID: z96OLkJSTgCwr15rdYtM+A==
X-CSE-MsgGUID: T0ekkUYUT62isAvklhoXVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="208618612"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa004.jf.intel.com with ESMTP; 12 Jan 2026 05:49:08 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id BD2BE9D; Mon, 12 Jan 2026 14:49:06 +0100 (CET)
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
Subject: [PATCH v1 3/7] i2c: mt65xx: Use HZ_PER_GHZ constant instead of plain number
Date: Mon, 12 Jan 2026 14:46:11 +0100
Message-ID: <20260112134900.4142954-4-andriy.shevchenko@linux.intel.com>
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
 drivers/i2c/busses/i2c-mt65xx.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index aefdbee1f03c..cb4d3aa709d0 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -24,6 +24,7 @@
 #include <linux/scatterlist.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
+#include <linux/units.h>
 
 #define I2C_RS_TRANSFER			(1 << 4)
 #define I2C_ARB_LOST			(1 << 3)
@@ -685,7 +686,7 @@ static int mtk_i2c_get_clk_div_restri(struct mtk_i2c *i2c,
  * Check and Calculate i2c ac-timing
  *
  * Hardware design:
- * sample_ns = (1000000000 * (sample_cnt + 1)) / clk_src
+ * sample_ns = (HZ_PER_GHZ * (sample_cnt + 1)) / clk_src
  * xxx_cnt_div =  spec->min_xxx_ns / sample_ns
  *
  * Sample_ns is rounded down for xxx_cnt_div would be greater
@@ -701,9 +702,8 @@ static int mtk_i2c_check_ac_timing(struct mtk_i2c *i2c,
 {
 	const struct i2c_spec_values *spec;
 	unsigned int su_sta_cnt, low_cnt, high_cnt, max_step_cnt;
-	unsigned int sda_max, sda_min, clk_ns, max_sta_cnt = 0x3f;
-	unsigned int sample_ns = div_u64(1000000000ULL * (sample_cnt + 1),
-					 clk_src);
+	unsigned int sda_max, sda_min, max_sta_cnt = 0x3f;
+	unsigned int clk_ns, sample_ns;
 
 	if (!i2c->dev_comp->timing_adjust)
 		return 0;
@@ -713,8 +713,9 @@ static int mtk_i2c_check_ac_timing(struct mtk_i2c *i2c,
 
 	spec = mtk_i2c_get_spec(check_speed);
 
+	sample_ns = div_u64(1ULL * HZ_PER_GHZ * (sample_cnt + 1), clk_src);
 	if (i2c->dev_comp->ltiming_adjust)
-		clk_ns = 1000000000 / clk_src;
+		clk_ns = HZ_PER_GHZ / clk_src;
 	else
 		clk_ns = sample_ns / 2;
 
-- 
2.50.1


