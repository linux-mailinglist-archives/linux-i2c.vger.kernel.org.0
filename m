Return-Path: <linux-i2c+bounces-312-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F367F15FE
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 15:47:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9B172825A6
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 14:47:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0779413FFB;
	Mon, 20 Nov 2023 14:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jrSMHWWC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F11F136;
	Mon, 20 Nov 2023 06:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700491614; x=1732027614;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gjsS9WB6rIKOIRRhpkjunbSf5RtqeGG3wArFecHMPbQ=;
  b=jrSMHWWC5az1SqvN8ELBkYFjA8Se3tV5UTHwxMat9X4FxAKrWte5VN3G
   kU5ESsoPfv43lLb1Tk9FnDx/myZJZuej13KMzySGPlGW5X5ApATgFl8yU
   2NnCuMg5lvzvaIe3rAchnHxO6P+Uc2d2ls/zLSINYRaY1SnktW7IUqeAl
   AtWD5Wo6G3Wj4zwpNmyDmDiLKVejS/PKymRkaHS3zg1lZQaG6tYZVc0D5
   4TANYGqc77ossmOD5u9njZpcLbo0zDHUqt98LD5K8m7ICgYhFQ6B8DhEf
   CELmi3/7cUgGpF/+NcPS3PMzafuhWYqDvs+so+3Mnz/QY2grP4cyXMd7X
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="455956458"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="455956458"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 06:46:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="801193153"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="801193153"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 20 Nov 2023 06:46:49 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 721E99F; Mon, 20 Nov 2023 16:46:44 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v4 07/24] i2c: designware: Add missing 'c' into PCI IDs variable name
Date: Mon, 20 Nov 2023 16:41:49 +0200
Message-ID: <20231120144641.1660574-8-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20231120144641.1660574-1-andriy.shevchenko@linux.intel.com>
References: <20231120144641.1660574-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing 'c' into i2c_designware_pci_ids variable name.

Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-pcidrv.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index e67956845c19..ed2f9e7ba5d3 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -355,7 +355,7 @@ static void i2c_dw_pci_remove(struct pci_dev *pdev)
 	i2c_del_adapter(&dev->adapter);
 }
 
-static const struct pci_device_id i2_designware_pci_ids[] = {
+static const struct pci_device_id i2c_designware_pci_ids[] = {
 	/* Medfield */
 	{ PCI_VDEVICE(INTEL, 0x0817), medfield },
 	{ PCI_VDEVICE(INTEL, 0x0818), medfield },
@@ -403,16 +403,16 @@ static const struct pci_device_id i2_designware_pci_ids[] = {
 	{ PCI_VDEVICE(ATI,  0x7464), navi_amd },
 	{ 0,}
 };
-MODULE_DEVICE_TABLE(pci, i2_designware_pci_ids);
+MODULE_DEVICE_TABLE(pci, i2c_designware_pci_ids);
 
 static struct pci_driver dw_i2c_driver = {
 	.name		= DRIVER_NAME,
-	.id_table	= i2_designware_pci_ids,
 	.probe		= i2c_dw_pci_probe,
 	.remove		= i2c_dw_pci_remove,
 	.driver         = {
 		.pm     = &i2c_dw_pm_ops,
 	},
+	.id_table	= i2c_designware_pci_ids,
 };
 module_pci_driver(dw_i2c_driver);
 
-- 
2.43.0.rc1.1.gbec44491f096


