Return-Path: <linux-i2c+bounces-6988-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4879860C4
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2024 16:32:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 65DE0B31275
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2024 14:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D5291A0700;
	Wed, 25 Sep 2024 12:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BdbbLujJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C6419F473;
	Wed, 25 Sep 2024 12:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727268566; cv=none; b=r/450xEX25wDVmcrlz4qQ3trlAygQNwKrt4c9sm3UifdJZF6mQNVJ++ZkJ8U4FFDmM9yJChRwijjCYbOKhMxIa4Dqr+bulLS42DD0QOsvbft5e3GAzU6GeRFS1HMeFgHckAAsRY+F2QRjffdhIERZPC6cfPXKnT/oSp5vaBZOGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727268566; c=relaxed/simple;
	bh=70t3hLSLDlpykDIVy85aCrxgzN++uWo5vy1Vhc0fPPo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OgW+bR7bJ3RKx8TRViidb3/eCF9F2T5WoXq2aWQ59hrQKbcLsv1p9B3KhNRA9iOk0HH/eWVbq+n74tn3L7YFn5R4tufvhhWyZsAjyZM99yhWoKuK2OyXLN2zUVMDOWYu5Uorg+ZOdd+duASj1RIraQ6i+Skg0QW4zs6CptJklDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BdbbLujJ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727268564; x=1758804564;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=70t3hLSLDlpykDIVy85aCrxgzN++uWo5vy1Vhc0fPPo=;
  b=BdbbLujJlb6DrJ+bKIxkhexYiY4wVlTuPFib+ZOvjipTFmuQ9sPDqpO+
   EQ/nnqn/hNJgoObR/IdKg9uN2yDGsAeBWcwXJGkpptmxzpEuSP8HyCvWl
   Sdw7uk+pyzEQ03ZXU8+gZFO0CX5ISPpeJzKiy8c68gOWdS+dZ2YISzwHL
   DGZjkjqarcMW7KfPZZxDebR0uOCEfbFYb+o66HrpqsrB2exo2oObmOu+b
   QNr9GuL6BPiV+QabvvsH7hgnN8NKvkS55HucGWyHex2IHjp1x1/gThN7O
   eAiVdMGhetatTXGznvj8H7el4vPEnZcLh2jh4hgcPjHAnv+/4dP6SP1ik
   Q==;
X-CSE-ConnectionGUID: bFKwU6pSR5+cHXtOSQ239w==
X-CSE-MsgGUID: PJ5TXRIGRqymRbT97h3vzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="36878358"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; 
   d="scan'208";a="36878358"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 05:49:21 -0700
X-CSE-ConnectionGUID: MgqSQzG7R0ObNZLcggW1YQ==
X-CSE-MsgGUID: ORXjVviiTdmoZMTejZyO8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; 
   d="scan'208";a="72577339"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP; 25 Sep 2024 05:49:18 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id B9982613; Wed, 25 Sep 2024 15:49:17 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Narasimhan.V@amd.com,
	Borislav Petkov <bp@alien8.de>,
	Kim Phillips <kim.phillips@amd.com>
Subject: [PATCH v1 4/5] i2c: designware: Use sda_hold_time variable name everywhere
Date: Wed, 25 Sep 2024 15:44:22 +0300
Message-ID: <20240925124916.976173-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240925124916.976173-1-andriy.shevchenko@linux.intel.com>
References: <20240925124916.976173-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently the PCI glue driver uses sda_hold variable name, while
the rest of the driver use sda_hold_time. This makes things harder
to grep. Use sda_hold_time variable name everywhere.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-pcidrv.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index 433cb285d3b2..38265c3dc454 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -51,7 +51,7 @@ struct dw_scl_sda_cfg {
 	u16 fs_hcnt;
 	u16 ss_lcnt;
 	u16 fs_lcnt;
-	u32 sda_hold;
+	u32 sda_hold_time;
 };
 
 struct dw_pci_controller {
@@ -76,7 +76,7 @@ static struct dw_scl_sda_cfg byt_config = {
 	.fs_hcnt = 0x55,
 	.ss_lcnt = 0x200,
 	.fs_lcnt = 0x99,
-	.sda_hold = 0x6,
+	.sda_hold_time = 0x6,
 };
 
 /* Haswell HCNT/LCNT/SDA hold time */
@@ -85,14 +85,14 @@ static struct dw_scl_sda_cfg hsw_config = {
 	.fs_hcnt = 0x48,
 	.ss_lcnt = 0x01fb,
 	.fs_lcnt = 0xa0,
-	.sda_hold = 0x9,
+	.sda_hold_time = 0x9,
 };
 
 /* NAVI-AMD HCNT/LCNT/SDA hold time */
 static struct dw_scl_sda_cfg navi_amd_config = {
 	.ss_hcnt = 0x1ae,
 	.ss_lcnt = 0x23a,
-	.sda_hold = 0x9,
+	.sda_hold_time = 0x9,
 };
 
 static u32 mfld_get_clk_rate_khz(struct dw_i2c_dev *dev)
@@ -264,7 +264,7 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
 		dev->fs_hcnt = cfg->fs_hcnt;
 		dev->ss_lcnt = cfg->ss_lcnt;
 		dev->fs_lcnt = cfg->fs_lcnt;
-		dev->sda_hold_time = cfg->sda_hold;
+		dev->sda_hold_time = cfg->sda_hold_time;
 	}
 
 	adap = &dev->adapter;
-- 
2.43.0.rc1.1336.g36b5255a03ac


