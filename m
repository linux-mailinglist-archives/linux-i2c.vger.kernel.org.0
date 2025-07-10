Return-Path: <linux-i2c+bounces-11891-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AB867AFFAB1
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Jul 2025 09:20:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 804FF17BC24
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Jul 2025 07:20:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EE9228936E;
	Thu, 10 Jul 2025 07:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eL8be6es"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88E6289340;
	Thu, 10 Jul 2025 07:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752131992; cv=none; b=ANR30/QYrpf08iCa8Sr/kvvKMVeDYkFXpWAGtqcUwvHCN7NoaPd+jd1EGAD6IYjOEsZ+lg9xwNxZY/4PMzKjtOJISQzYPW2aOaSmZZJDWRLdk0b4qSoZNUogU5i9N1ssjQLahGR0UM1cu8uwKSH4I+KGU28UeC33/M3HxQAD0AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752131992; c=relaxed/simple;
	bh=HdZM+lCygRtcGKGdmfKOBD9czchBwnFeRqigzvpekUw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IUO5eWkaDFJJiWK3F+h1AymIcSfwCCWrvWRvFQRCLgFfSgdf/LnAZ4OWzIhur5KEJ9yG1Tv7dyb+8DbTvE/+g1pDsDTkEo++D3FOsy3UEO7DHoq4002F9IqYtffwk9BQYIeZCBLdHkbRLKoWKvCn3iqY9kAljHylQAg0u5pDghQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eL8be6es; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752131991; x=1783667991;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HdZM+lCygRtcGKGdmfKOBD9czchBwnFeRqigzvpekUw=;
  b=eL8be6escSO2frYvWjopCaLb95jch1SQI6fCBMfhuHBN/a05fmgvnT+m
   Q3ByGcrtUDQAXDD7SrdNbrNmDZFrirFXJMjuM7Rf4oBq3yVS3lHiXVmKl
   /1KhnoxUAsqXfhDmbJL9qAXIVuyRnNogbVeteQxIS1KwAMB+PXZAGsw6m
   n3YIlSlLCRH9hamgJsuxUPcwHCc6wnHP5/OMnPdZjLmIzIOttnd993k4+
   WZVhj7c+BH+NgLv1+vgCBRDfbG6oxPrOiGSdT4b5dyT7rkFUg9yYb0//t
   A1DW38M/B4JKp4jzJPdHaVwd/Slgdl+20p5A6o3JXfiqAwtS4RUn8azKk
   A==;
X-CSE-ConnectionGUID: riQpZ/J1RxiGVCZ7rXFPpg==
X-CSE-MsgGUID: APmR+fwZQVuB7U782Ufkxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54256706"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
   d="scan'208";a="54256706"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 00:19:51 -0700
X-CSE-ConnectionGUID: Inayylf0T/qB4vO/rEigNQ==
X-CSE-MsgGUID: PGyU7bqgRJmu2PVMyfTE4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
   d="scan'208";a="160323941"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
  by orviesa003.jf.intel.com with ESMTP; 10 Jul 2025 00:19:45 -0700
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
Subject: [PATCH v7 2/5] i2c: designware: Add quirk for Intel Xe
Date: Thu, 10 Jul 2025 12:46:09 +0530
Message-Id: <20250710071612.2714990-3-raag.jadav@intel.com>
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

The regmap is coming from the parent also in case of Xe
GPUs. Reusing the Wangxun quirk for that.

Originally-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-platdrv.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 3104f52e32be..a35e4c64a1d4 100644
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
 
+	if (device_is_compatible(dev->dev, "intel,xe-i2c"))
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
-- 
2.34.1


