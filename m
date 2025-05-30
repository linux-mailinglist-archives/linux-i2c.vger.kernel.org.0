Return-Path: <linux-i2c+bounces-11164-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 48277AC9158
	for <lists+linux-i2c@lfdr.de>; Fri, 30 May 2025 16:18:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 79AA61C0581B
	for <lists+linux-i2c@lfdr.de>; Fri, 30 May 2025 14:18:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D46822CBD0;
	Fri, 30 May 2025 14:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fo7+A2uF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3708922FE18;
	Fri, 30 May 2025 14:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748614679; cv=none; b=bvFw8mA/QEs6KMqycjY+raZeiZtLVr5DcxZ317BAplvbGa/WcHbCz3SFZbHTnPRDl3sy5x5P08d947If8qu3PLPoGM9LzV0o5zHmkxMCpcSzNT2jEAaoLj3apPKaWPMuLwWE2wtmJAusFnhnBS6mMcTEXuEsT4vTsMDG6+aDl2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748614679; c=relaxed/simple;
	bh=pOubz1yOyBwEzFJgfvsZx7xzhGw39bf3F4Ktiue6J5A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BRFZsZxGcTdlFcfruq3NYI2BPTzCyRsetcTrF/nCuO6433qt86Z8nb3q3njalH0Y6iRfbbGFlZQoIAIHa/cz8qUOxozvBWOzO4mEKDz2io/qt/de7LD8SgkA8LvBIMVcDzBNl54fjPSoWHAjtKOLnmraux7spKd7nH6s3r6QKgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fo7+A2uF; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748614674; x=1780150674;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pOubz1yOyBwEzFJgfvsZx7xzhGw39bf3F4Ktiue6J5A=;
  b=fo7+A2uFXpkFdXyWFLDFCPZZTErbB3HSrgMTvldjfNf2yqH77OGLTHVp
   Y0KgQXYWglNhUEVMVKpZwCIJvnfGmZBq9JUmDqlXu4B+7/sTSQ078N/Cx
   YIksul8CF3lEfcVPfjqn99gHLOl6lKvIUjfUcyr4DwgTOZb03r24PqYaN
   9QRhVJoyGwPr4BSwS0GJ7ALaBVagOrgycbC/B10AFSiH1wE2FXUjb8Lda
   M9pyW4T6/jaV1xS4mulEWK9b0+BtmtuVhP40zygHtz9fp5VJh+KC67+3/
   +mqA4q8R46AfY7KZp0/yCqcL4JYHK7k3bDQeUaqSuwlc6ledvS5Upq6bA
   g==;
X-CSE-ConnectionGUID: G1skZzoZR821M3JRggtOlQ==
X-CSE-MsgGUID: /Pk0+v6ZRGqIg+I5vUrqCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="53339255"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="53339255"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 07:17:53 -0700
X-CSE-ConnectionGUID: LJ80mVRQTeOvkm2laL51ag==
X-CSE-MsgGUID: Y1d34P85TWys2bqcDf3Xdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="144222556"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmviesa008.fm.intel.com with ESMTP; 30 May 2025 07:17:49 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Raag Jadav <raag.jadav@intel.com>,
	"Tauro, Riana" <riana.tauro@intel.com>,
	"Adatrao, Srinivasa" <srinivasa.adatrao@intel.com>,
	intel-xe@lists.freedesktop.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: [PATCH v1 1/2] i2c: designware: Add quirk for Intel Xe
Date: Fri, 30 May 2025 17:17:43 +0300
Message-ID: <20250530141744.3605983-2-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250530141744.3605983-1-heikki.krogerus@linux.intel.com>
References: <20250530141744.3605983-1-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The regmap is coming from the parent also in case of Xe
GPUs. Reusing the Wangxun quirk for that.

Originally-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-platdrv.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 879719e91df2..a417e571197a 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -101,7 +101,7 @@ static int bt1_i2c_request_regs(struct dw_i2c_dev *dev)
 }
 #endif
 
-static int txgbe_i2c_request_regs(struct dw_i2c_dev *dev)
+static int dw_i2c_get_parent_regmap(struct dw_i2c_dev *dev)
 {
 	dev->map = dev_get_regmap(dev->dev->parent, NULL);
 	if (!dev->map)
@@ -123,12 +123,15 @@ static int dw_i2c_plat_request_regs(struct dw_i2c_dev *dev)
 	struct platform_device *pdev = to_platform_device(dev->dev);
 	int ret;
 
+	if (device_is_compatible(dev->dev, "intel,xe-mcu-i2c"))
+		return dw_i2c_get_parent_regmap(dev);
+
 	switch (dev->flags & MODEL_MASK) {
 	case MODEL_BAIKAL_BT1:
 		ret = bt1_i2c_request_regs(dev);
 		break;
 	case MODEL_WANGXUN_SP:
-		ret = txgbe_i2c_request_regs(dev);
+		ret = dw_i2c_get_parent_regmap(dev);
 		break;
 	default:
 		dev->base = devm_platform_ioremap_resource(pdev, 0);
@@ -205,25 +208,28 @@ static void i2c_dw_remove_lock_support(struct dw_i2c_dev *dev)
 
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
2.47.2


