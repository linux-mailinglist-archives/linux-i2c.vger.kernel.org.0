Return-Path: <linux-i2c+bounces-15062-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F11D12EC7
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 14:54:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F2D93043548
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 13:49:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64A0C35B13D;
	Mon, 12 Jan 2026 13:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oHhFFFOV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E5735C1A9;
	Mon, 12 Jan 2026 13:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768225771; cv=none; b=bmbTirXZ2+NYyfVLqZR6Oi8FfZX9qDUw7qsuoEYZPiPAk6tA39YDrh1wjRInqJhGMaxWQk0N3tke70XzSyHTP4lBBLeSBI8thptLvFTcHdW74QaWUYYySNBAlzgA/lUfRWWUVTe7g9fG768Fg5zqnYIBDdkaKzxIDRJYbFpX7h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768225771; c=relaxed/simple;
	bh=ZqRF2S+uC/la4xASlNwAVf8XwHR045VHyV+nkWo2bqE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZuXBTwPQZYypDwZ281BFWVUuxoKbwfB/BP9eDUVteicj07XK8uUmen3udMj/DLp2e/RQO+81AVl0DEv4dOzw461VlOjGREBjcjfLzOdtUlC9y+wVRO4G93RHKoJPK7BYQCIepL4ykykg+j3rWWUMmAVScizxxk9VyGvgxothMvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oHhFFFOV; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768225756; x=1799761756;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZqRF2S+uC/la4xASlNwAVf8XwHR045VHyV+nkWo2bqE=;
  b=oHhFFFOVUZsc288H224CdO9qpTWUTitU832Nyqjela4CxSx+4uHNo+0s
   uaw2CKXwUc4+O621IXOvAy7OYxI/lJWGyU06gsc2Xl1XhORTS4XrdYECa
   eRDKrX2/dJpGRBAKShOVsvXdAV6LDR1PB3w+zQd2bPjWWNk/H/TLx7BSu
   JZ+wL4cPrwx1cntcmLZqxYD4qwuGV0BbF5rR/VRew904b40H4ZYIgpqLb
   EBEeZIAp+Yp4ptDor1hmqEobAWyXXcDzp5C0o2cXVgIh7QIIfoVc8Pf3t
   F1VW1UdKcFK45PDUEYy1cC9y2zbXbSZDiaUrIQjE2k8B9H33ZjCOlyMao
   g==;
X-CSE-ConnectionGUID: dAxBtjOkQ8G6mW5QKGT+Tw==
X-CSE-MsgGUID: Ef7Bw7s8SJuS3nY/us5u7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80604530"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="80604530"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 05:49:16 -0800
X-CSE-ConnectionGUID: 09zSswo8RW2YuLa4zP79hA==
X-CSE-MsgGUID: iW3vkA1mTMqjQfUAGX7uIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="208568103"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa005.fm.intel.com with ESMTP; 12 Jan 2026 05:49:12 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id CA8B5A2; Mon, 12 Jan 2026 14:49:06 +0100 (CET)
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
Subject: [PATCH v1 6/7] i2c: st: Use HZ_PER_GHZ constant instead of plain number
Date: Mon, 12 Jan 2026 14:46:14 +0100
Message-ID: <20260112134900.4142954-7-andriy.shevchenko@linux.intel.com>
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
 drivers/i2c/busses/i2c-st.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-st.c b/drivers/i2c/busses/i2c-st.c
index 97d70e667227..751ea421caaf 100644
--- a/drivers/i2c/busses/i2c-st.c
+++ b/drivers/i2c/busses/i2c-st.c
@@ -20,6 +20,7 @@
 #include <linux/of.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
+#include <linux/units.h>
 
 /* SSC registers */
 #define SSC_BRG				0x000
@@ -285,7 +286,7 @@ static void st_i2c_hw_config(struct st_i2c_dev *i2c_dev)
 	writel_relaxed(val, i2c_dev->base + SSC_CTL);
 
 	rate = clk_get_rate(i2c_dev->clk);
-	ns_per_clk = 1000000000 / rate;
+	ns_per_clk = HZ_PER_GHZ / rate;
 
 	/* Baudrate */
 	val = rate / (2 * t->rate);
-- 
2.50.1


