Return-Path: <linux-i2c+bounces-1396-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B952B8359C1
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jan 2024 04:31:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3BBABB2331A
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jan 2024 03:31:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F08CE4C9B;
	Mon, 22 Jan 2024 03:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NqlT+7uH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFDA1FB3;
	Mon, 22 Jan 2024 03:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705894280; cv=none; b=s8XyoneHxQZqR7yt6mhEDMd5kJjU9OPuegwu28zeb4UA4xzMVeb7j4h9XpPWivSEm/V8dNYzk+r0U02zmbMxNVKLDVpd+Tfz20LPRlldtGvaJeKdPzhKG3Wk0gZTCY5GrNr2hcNfGhqhyim3doIcNrUmLcNJuDZfci51wU82yO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705894280; c=relaxed/simple;
	bh=zer1jRV/GAIWj9fYX2ouZMY4bsuRLMRPLMmAQ3RyJEQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WkCWBmOQF2VuMRjTxLyPkQz4u2zoIOwondxc1hm0GBkhtlkW0phN+yrig78eRHLmVoZDvBmXCUZsugVA85MMvssTajH5djCy7/YxilPlHe1y9U/PRxo5/PXSIZ1x/pxwoD/DCKx/DLYCypA4yp9JJg8rgB2QFYuJ17jPEyuwA+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=none smtp.mailfrom=ecsmtp.iind.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NqlT+7uH; arc=none smtp.client-ip=192.55.52.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ecsmtp.iind.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705894279; x=1737430279;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zer1jRV/GAIWj9fYX2ouZMY4bsuRLMRPLMmAQ3RyJEQ=;
  b=NqlT+7uHP4/x5SpMC9jC6xYT3patRfdKzgWDNX0828qAP/iW68Ncg2uQ
   SOUXS8HzLontkZp3briU5eKuBGm3OmaHt2sGsh9Q8uHA2lqUbQtQzYHH1
   ky5BvJyWoTulToz0bFRHbgNe08TEbaJoWbKnz6qMiJDaMtUTBmNuwOOXx
   OUOK4q4Hscu/B1dLEB3ScM6RhN6zWlk8F3solKaCuscIUkw9FK/6tP8ya
   uSMTIYNBi8IY2MFavAl9zFELtnSveoAV4AUrPkJt/+efUBEvYX2nB/ElF
   +HjX+t6+4XmASot/dDIjP+4JEXANNmPDT3SOLqvj2MQnJIQvLtVMDhkpq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="398255344"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="398255344"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2024 19:31:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="1066919"
Received: from inesxmail01.iind.intel.com ([10.223.57.40])
  by orviesa005.jf.intel.com with ESMTP; 21 Jan 2024 19:31:15 -0800
Received: from inlubt0316.iind.intel.com (inlubt0316.iind.intel.com [10.191.20.213])
	by inesxmail01.iind.intel.com (Postfix) with ESMTP id 53E044851;
	Mon, 22 Jan 2024 09:01:14 +0530 (IST)
Received: by inlubt0316.iind.intel.com (Postfix, from userid 12101951)
	id 513501600101; Mon, 22 Jan 2024 09:01:14 +0530 (IST)
From: Raag Jadav <raag.jadav@intel.com>
To: jarkko.nikula@linux.intel.com,
	mika.westerberg@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	jsd@semihalf.com,
	andi.shyti@kernel.org
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1 2/2] i2c: designware: constify regmap_config
Date: Mon, 22 Jan 2024 09:01:08 +0530
Message-Id: <20240122033108.31053-2-raag.jadav@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240122033108.31053-1-raag.jadav@intel.com>
References: <20240122033108.31053-1-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We never modify regmap_config, mark it as const.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/i2c/busses/i2c-designware-platdrv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 855b698e99c0..d122ef349b1c 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -100,7 +100,7 @@ static int bt1_i2c_write(void *context, unsigned int reg, unsigned int val)
 		BT1_I2C_CTL_GO | BT1_I2C_CTL_WR | (reg & BT1_I2C_CTL_ADDR_MASK));
 }
 
-static struct regmap_config bt1_i2c_cfg = {
+static const struct regmap_config bt1_i2c_cfg = {
 	.reg_bits = 32,
 	.val_bits = 32,
 	.reg_stride = 4,
-- 
2.35.3


