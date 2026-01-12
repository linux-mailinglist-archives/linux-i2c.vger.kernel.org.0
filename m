Return-Path: <linux-i2c+bounces-15058-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 55136D12E8B
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 14:51:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB2613034A2B
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 13:49:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8895235C182;
	Mon, 12 Jan 2026 13:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FEl8TskE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F1435B144;
	Mon, 12 Jan 2026 13:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768225755; cv=none; b=CioggAJXvHgwBKO/GyqKvwWQzwiNDtKxFH4ZZVFfS9WVqb0uxjUyRdnsBXexdr+UrDd9OzER4qNuiQl90oHO+H4yV7+1ZfgKEcFPD4lbsJup624ZJlePWqPSwJcA4mp2RTH7GnLobftQ0Kmo+HhuXL2V6DWuI14970kiRRjwlAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768225755; c=relaxed/simple;
	bh=s4D8kw7OoyHkWsenYF7E+9Z6vB4aK7eDBACFxTCsJgQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UDBys61DprNv3f/Wr/r4Uway6ihg9OtJfYjlZwZ09lNwq95CREsau//8SIQBBXnkSS/mdaAdMT+YWM/l8iE5I8ZMtRFcVnXDQjC6tYKbDHUAu6EvpNOLg+mi4Nk3tFLpATAOQCPJCKPexPpN4vFt3QTSH9NK5WLd5Pw+B4khht0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FEl8TskE; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768225754; x=1799761754;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=s4D8kw7OoyHkWsenYF7E+9Z6vB4aK7eDBACFxTCsJgQ=;
  b=FEl8TskEboUQ3b0RkHdWWocSac6a7mTfc+L7fH7q6BJc1vjpl0p5SzO4
   tHgMvG59L3bmx8SYLTauJwSTHZuBKcJagy6yRKXUoeRukt7mJpCQwR+vj
   LIPh7MMkP2aHdS+bC1h8cM8r6C22ESD5ToRRaDM9ZYYdgGBLFYHPTFVrd
   WzHEvy/lEC8aAPWswikvDkZQE+z/mvLIw6bPRGXBY8s6VqDQEOlcVN5m5
   0JMmPBXARPyJ6stZ9XaXcuZVRV8oSNKab33EGoDD3wAB4oay1l4TD3FCB
   CAfVkN1L6TSoeqqI4iOarsohg7m24FL1OFbaxgquPL8fLT683Gi21Zt1e
   g==;
X-CSE-ConnectionGUID: uoS8yg4FSau78+iGDXUQ5A==
X-CSE-MsgGUID: peDSjD2kRx2RAPaXLlnOEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="57048269"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="57048269"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 05:49:11 -0800
X-CSE-ConnectionGUID: RSGfaLd6QVqd0LuDupeO2Q==
X-CSE-MsgGUID: JO2qZ07QS3e8APOkDDRiqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="208618599"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa004.jf.intel.com with ESMTP; 12 Jan 2026 05:49:08 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id C1CDE9E; Mon, 12 Jan 2026 14:49:06 +0100 (CET)
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
Subject: [PATCH v1 4/7] i2c: nomadik: Use HZ_PER_GHZ constant instead of plain number
Date: Mon, 12 Jan 2026 14:46:12 +0100
Message-ID: <20260112134900.4142954-5-andriy.shevchenko@linux.intel.com>
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

While at it, drop unneeded 64-bit division, all operands fit 32-bit.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-nomadik.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index 19b648fc094d..b63ee51c1652 100644
--- a/drivers/i2c/busses/i2c-nomadik.c
+++ b/drivers/i2c/busses/i2c-nomadik.c
@@ -31,6 +31,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
+#include <linux/units.h>
 
 #define DRIVER_NAME "nmk-i2c"
 
@@ -419,10 +420,10 @@ static void setup_i2c_controller(struct nmk_i2c_dev *priv)
 	 * modes are 250ns, 100ns, 10ns respectively.
 	 *
 	 * As the time for one cycle T in nanoseconds is
-	 * T = (1/f) * 1000000000 =>
-	 * slsu = cycles / (1000000000 / f) + 1
+	 * T = (1/f) * HZ_PER_GHZ =>
+	 * slsu = cycles / (HZ_PER_GHZ / f) + 1
 	 */
-	ns = DIV_ROUND_UP_ULL(1000000000ULL, i2c_clk);
+	ns = DIV_ROUND_UP(HZ_PER_GHZ, i2c_clk);
 	switch (priv->sm) {
 	case I2C_FREQ_MODE_FAST:
 	case I2C_FREQ_MODE_FAST_PLUS:
-- 
2.50.1


