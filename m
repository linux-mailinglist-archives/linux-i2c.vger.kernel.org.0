Return-Path: <linux-i2c+bounces-15061-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A434D12EAF
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 14:53:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E8A7306BF37
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 13:49:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9CD135B14A;
	Mon, 12 Jan 2026 13:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k0Mi+whW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27CF035C1BA;
	Mon, 12 Jan 2026 13:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768225762; cv=none; b=G5bWxzC7ikqVVSwp7mhH3/KTf1zPyUrys3uGXwl6qs5I3qG8GMI3iYj3tj7Og0HPE8dnNZw4GGirM22vWqgtHVZT2YnRvRlUk8UUeQyTtwHb2Z0oIv/lStTpz3JH9fruyk/r8uyrBBqsAdQP0mmEa3g01qgKqPszISyxKvSCFuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768225762; c=relaxed/simple;
	bh=JHnL0FZuz2kBPQyoqrsR5hXiCOc45yoxM7G5SyPLrLw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jJevDFroK8ez34GdtPk3BgftzDoeu47j4J9T7A+4sdEr+yH9Gww6MPymCKWW6AsOiZ4Kb4Y5FWgXvMRtZNyiBWYoK8V8aShPXWdbkIiocWg4gnZ/4ksTw8i6GkD75e73OpnxEdh9nDauW84D9BfKmt7uIKTeRdyREE3HaqML4zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k0Mi+whW; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768225756; x=1799761756;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JHnL0FZuz2kBPQyoqrsR5hXiCOc45yoxM7G5SyPLrLw=;
  b=k0Mi+whWT61BdNbzCYMnIrPCz9FtWbyWz5tGH5mMU4EH29lXbWJCuf+s
   DmdM87GJpRc4e496+Q13TUvQwOXbybUFen7GavFRKfwpFghygbK2bwszl
   N3pXQC5Kg4q7+oxw53Purt2qPgz8EGgaKMc/Mzd2aHfU9hWJWtD67qBK0
   uTqU945hKm+ZE3dFFBByLQkz328+XkmdN0OiV6KHEi7tty6oPOyKqVIWP
   889bmIu5UihF1Bwo7jvl/zcEBoivCXx43Ckex0ABJqVpCJa4psi7UxVCa
   +dbswfFXIyrPKCrq95t59uEujrE+QGgbWNgD5DaFzykg7n726q9wLLD+h
   Q==;
X-CSE-ConnectionGUID: mbjpjPiyRKuIW7qirv/+xw==
X-CSE-MsgGUID: rnZtG7ADTESVqrlOun1kWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="57048317"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="57048317"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 05:49:16 -0800
X-CSE-ConnectionGUID: Ygp7+wInRp6lKcZ+jrQnnA==
X-CSE-MsgGUID: LmQZLVZ+QeStZkDFrDfqGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="208618615"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa004.jf.intel.com with ESMTP; 12 Jan 2026 05:49:12 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id C6143A1; Mon, 12 Jan 2026 14:49:06 +0100 (CET)
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
Subject: [PATCH v1 5/7] i2c: rk3x: Use HZ_PER_GHZ constant instead of plain number
Date: Mon, 12 Jan 2026 14:46:13 +0100
Message-ID: <20260112134900.4142954-6-andriy.shevchenko@linux.intel.com>
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
 drivers/i2c/busses/i2c-rk3x.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rk3x.c b/drivers/i2c/busses/i2c-rk3x.c
index d4e9196445c0..fcede9f6ed54 100644
--- a/drivers/i2c/busses/i2c-rk3x.c
+++ b/drivers/i2c/busses/i2c-rk3x.c
@@ -19,6 +19,7 @@
 #include <linux/of_irq.h>
 #include <linux/spinlock.h>
 #include <linux/clk.h>
+#include <linux/units.h>
 #include <linux/wait.h>
 #include <linux/mfd/syscon.h>
 #include <linux/regmap.h>
@@ -896,13 +897,12 @@ static void rk3x_i2c_adapt_div(struct rk3x_i2c *i2c, unsigned long clk_rate)
 
 	clk_disable(i2c->pclk);
 
-	t_low_ns = div_u64(((u64)calc.div_low + 1) * 8 * 1000000000, clk_rate);
-	t_high_ns = div_u64(((u64)calc.div_high + 1) * 8 * 1000000000,
-			    clk_rate);
+	t_low_ns = div_u64(8ULL * HZ_PER_GHZ * (calc.div_low + 1), clk_rate);
+	t_high_ns = div_u64(8ULL * HZ_PER_GHZ * (calc.div_high + 1), clk_rate);
 	dev_dbg(i2c->dev,
-		"CLK %lukhz, Req %uns, Act low %lluns high %lluns\n",
-		clk_rate / 1000,
-		1000000000 / t->bus_freq_hz,
+		"CLK %lukHz, Req %luns, Act low %lluns high %lluns\n",
+		clk_rate / HZ_PER_KHZ,
+		HZ_PER_GHZ / t->bus_freq_hz,
 		t_low_ns, t_high_ns);
 }
 
-- 
2.50.1


