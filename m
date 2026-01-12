Return-Path: <linux-i2c+bounces-15059-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F09D12E52
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 14:49:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B182B300CAFA
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 13:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 006C235C1AE;
	Mon, 12 Jan 2026 13:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kzK6gpft"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6304035B15F;
	Mon, 12 Jan 2026 13:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768225755; cv=none; b=Ny9OkplctdR+EeJNL7bbh0XB8XxozxXN4Rz+zzrCcLcsXHq0bXkk4RcyEe7ibAxtfhaI0X8kW/MIv9ZrCYFIgRO3ear+TFyHSwV3Edorhos9fOCYHag0c7gZgl5YoWCQ3SsAg7rzMITmJ2QSANGeUu+gcITJu6sF5PXf2CAdPyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768225755; c=relaxed/simple;
	bh=QQ0qqH3VNmZu+wMQEzW+Nf85tDjOXZ++eEjaIO+FgcA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uRtbtpyQWspeZ51wTwJGjUwaLTeVd617bn9/lc4bU8e/kUIfg/cw/nsF7YDyczPICYWjyovrfPn2e4ZevFDO/O7sa2J4wtgxY15nVliVSp0coG0sqbZ6I4lDFQXEJr1iH9BtclbhxJxH2vTst66rUWbOB3YRNyFqWgf8Xaebx1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kzK6gpft; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768225754; x=1799761754;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QQ0qqH3VNmZu+wMQEzW+Nf85tDjOXZ++eEjaIO+FgcA=;
  b=kzK6gpft/gJqPCMc+m/q4Epj05AZPepfNxRQpnH4XzYWqXKYZQ4++Y6v
   advRO5MqXBZw1Dn7xQC46VcQo/rT5kl6SBcwydVREYXX02FHfBkeSci1H
   V/of1q2uGCfiJzCH96fH8m/JOeh72ZkaheddYKr78xvMSWRJGo1dkQ7pK
   8YgmR7TVu2kSdYy/mYfxYU8YQdHrduT9LcJyChcOXK3NdQiTax83JRUS0
   02HbTRpC53ucnLkHl4sQR7c3YtvOepQVU1t8xZmhKKUuksb93PcMKVssu
   LP4uOrxjGNV481FeF6jL/9YXp4FQZpgHBlxlFB3YmNqSi+8rlDWjQ0pa6
   w==;
X-CSE-ConnectionGUID: KstXn0+fQcabQJZP2bvo0Q==
X-CSE-MsgGUID: Ba2gj9Q9THWiHmEbfWFdsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="57048292"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="57048292"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 05:49:12 -0800
X-CSE-ConnectionGUID: noLH1GPoT2e5iwBFL7qsDg==
X-CSE-MsgGUID: TPNbfTbKTRWsr+6apHjc9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="208618613"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa004.jf.intel.com with ESMTP; 12 Jan 2026 05:49:08 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id B87469B; Mon, 12 Jan 2026 14:49:06 +0100 (CET)
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
Subject: [PATCH v1 2/7] i2c: mlxbf: Use HZ_PER_GHZ constant instead of custom one
Date: Mon, 12 Jan 2026 14:46:10 +0100
Message-ID: <20260112134900.4142954-3-andriy.shevchenko@linux.intel.com>
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

Use HZ_PER_GHZ constant instead of custom one. No functional changes.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-mlxbf.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mlxbf.c b/drivers/i2c/busses/i2c-mlxbf.c
index 8345f7e6385d..746f65989138 100644
--- a/drivers/i2c/busses/i2c-mlxbf.c
+++ b/drivers/i2c/busses/i2c-mlxbf.c
@@ -20,6 +20,7 @@
 #include <linux/platform_device.h>
 #include <linux/string.h>
 #include <linux/string_choices.h>
+#include <linux/units.h>
 
 /* Defines what functionality is present. */
 #define MLXBF_I2C_FUNC_SMBUS_BLOCK \
@@ -72,8 +73,6 @@
 /* Constant used to determine the PLL frequency. */
 #define MLNXBF_I2C_COREPLL_CONST    16384ULL
 
-#define MLXBF_I2C_FREQUENCY_1GHZ  1000000000ULL
-
 /* PLL registers. */
 #define MLXBF_I2C_CORE_PLL_REG1         0x4
 #define MLXBF_I2C_CORE_PLL_REG2         0x8
@@ -1083,7 +1082,7 @@ static u32 mlxbf_i2c_get_ticks(struct mlxbf_i2c_priv *priv, u64 nanoseconds,
 	 *         Frequency
 	 */
 	frequency = priv->frequency;
-	ticks = div_u64(nanoseconds * frequency, MLXBF_I2C_FREQUENCY_1GHZ);
+	ticks = div_u64(nanoseconds * frequency, HZ_PER_GHZ);
 	/*
 	 * The number of ticks is rounded down and if minimum is equal to 1
 	 * then add one tick.
-- 
2.50.1


