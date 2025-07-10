Return-Path: <linux-i2c+bounces-11890-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FE6AFFAAF
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Jul 2025 09:19:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA3F417EE88
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Jul 2025 07:19:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1830F288C27;
	Thu, 10 Jul 2025 07:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U6kOCnN8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F4E288C0A;
	Thu, 10 Jul 2025 07:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752131986; cv=none; b=M34qn8shR7ElZJdH3kvdEFJ224ROAKT0g6l6hzXot04rTJybxv0cVKNFGrLxeFtb93M4W4eoV6gCMORPAKDJqG1gBZ8VYhPXWwUqhJOhJl2zNzBGRr3Zhy4hqXrymRurqxpnOgM9J580cDRzO3pAK2cmncn6oZB1oPCf+7NDS0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752131986; c=relaxed/simple;
	bh=eO42llR5MAMKPH3xJzmuqVCVmJD4rwgy+TanImTIm3c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=W6d8hjVzacOGiM4keUPoPjIK+LzqdQJ+a2m3eEmnNWz+v4WC+v+eP/zaARO6AG9G44E2B8ImSAZu+NkaFit0auA32judkq1V6XBb1qazpfQ3/cGqQiA4S2ZrNyeynOkc14rKfxYRIvSTs2mbBVmI/T7ROfQTQygCZImZFozEHJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U6kOCnN8; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752131985; x=1783667985;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eO42llR5MAMKPH3xJzmuqVCVmJD4rwgy+TanImTIm3c=;
  b=U6kOCnN8467d3U8PW9tQIlL/OPE4YcujW7XEcvjlKs3lpnmhMPSok2+T
   erRJ/P48UuqmG0xiVS/cRHPLO8byZHs1D1ZC1/0gU9NT35Qy+gSh02X7C
   3zrf0dCkBcxq6tB1fRYaomTIXfInmTwNtnk20/exahs9XR9imteaLtoip
   fI/M4i7lQBm0rrlVT8eMY/7naOkmDnLxl5YgYuHxjlaOAKySm5T2z2GVl
   cLPvHhrDy2Qi3VL9mkuDEDBOZMhpi9asT8y/kuEhP1Yt0knfPFjTOvIsc
   KdjfqBrJlA8NaPorwNTNKYbfzOJq+0a2oWnWXBhI9zrkrMBA1NdY1gbE3
   A==;
X-CSE-ConnectionGUID: Kn7Xp2rlSs2W77LP725+ew==
X-CSE-MsgGUID: dPvx8nl2SNy9A7FqwlXCVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54256685"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
   d="scan'208";a="54256685"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 00:19:45 -0700
X-CSE-ConnectionGUID: B/sOHe+/RBeT1WWsvnPKfw==
X-CSE-MsgGUID: nGiYzyD4RNKbKq2QGJutCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
   d="scan'208";a="160323933"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
  by orviesa003.jf.intel.com with ESMTP; 10 Jul 2025 00:19:40 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	thomas.hellstrom@linux.intel.com,
	rodrigo.vivi@intel.com
Cc: jarkko.nikula@linux.intel.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	andriy.shevchenko@linux.intel.com,
	mika.westerberg@linux.intel.com,
	jsd@semihalf.com,
	andi.shyti@kernel.org,
	raag.jadav@intel.com,
	riana.tauro@intel.com,
	srinivasa.adatrao@intel.com,
	michael.j.ruhl@intel.com,
	intel-xe@lists.freedesktop.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH v7 1/5] i2c: designware: Use polling by default when there is no irq resource
Date: Thu, 10 Jul 2025 12:46:08 +0530
Message-Id: <20250710071612.2714990-2-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250710071612.2714990-1-raag.jadav@intel.com>
References: <20250710071612.2714990-1-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Heikki Krogerus <heikki.krogerus@linux.intel.com>

The irq resource itself can be used as a generic way to
determine when polling is needed.

This not only removes the need for special additional device
properties that would soon be needed when the platform may
or may not have the irq, but it also removes the need to
check the platform in the first place in order to determine
is polling needed or not.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-platdrv.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 879719e91df2..3104f52e32be 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -205,25 +205,28 @@ static void i2c_dw_remove_lock_support(struct dw_i2c_dev *dev)
 
 static int dw_i2c_plat_probe(struct platform_device *pdev)
 {
+	u32 flags = (uintptr_t)device_get_match_data(&pdev->dev);
 	struct device *device = &pdev->dev;
 	struct i2c_adapter *adap;
 	struct dw_i2c_dev *dev;
 	int irq, ret;
 
-	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
+	irq = platform_get_irq_optional(pdev, 0);
+	if (irq == -ENXIO)
+		flags |= ACCESS_POLLING;
+	else if (irq < 0)
 		return irq;
 
 	dev = devm_kzalloc(device, sizeof(*dev), GFP_KERNEL);
 	if (!dev)
 		return -ENOMEM;
 
-	dev->flags = (uintptr_t)device_get_match_data(device);
 	if (device_property_present(device, "wx,i2c-snps-model"))
-		dev->flags = MODEL_WANGXUN_SP | ACCESS_POLLING;
+		flags = MODEL_WANGXUN_SP | ACCESS_POLLING;
 
 	dev->dev = device;
 	dev->irq = irq;
+	dev->flags = flags;
 	platform_set_drvdata(pdev, dev);
 
 	ret = dw_i2c_plat_request_regs(dev);
-- 
2.34.1


