Return-Path: <linux-i2c+bounces-27-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4AF37E81A9
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 19:32:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4D0B1C20AF5
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 18:32:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14D6A3A296;
	Fri, 10 Nov 2023 18:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dZOkCWKj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CAF43A28C
	for <linux-i2c@vger.kernel.org>; Fri, 10 Nov 2023 18:31:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAE6762CF3;
	Fri, 10 Nov 2023 10:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699641088; x=1731177088;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eidm3WGoLQyIQ+F+/YdqjYipuzRZroeIzP7JrslkPvk=;
  b=dZOkCWKj9EfH1fpf1Oxy9eBeRTI+J7xjftl/+lwESXuCYZ8M9MwRXV+T
   r8TL1juBC5/8gowZdj06AqE8RAfGan/OzDMDXxqxl9+zM02d4MWqg32yj
   uwrbrmEsYxW8+aMtiSeaTZE5pGEYDUCyHXLYlVID753OAnyK6bgo2y1ui
   g1PEyv8dYa+t7AMQhGnmGvStc0qx5Qg1Wyt2h/cFIe+szjgQmVIsuwJ/9
   9OtnJ9aeCqdscyIvgyHZPHoUWhDjpSeZ/SAMcdBYBSUqoO+VF+a1YkWe5
   j8eljmR0ILRCXtyz2sHRDzUur7p1V5P8hBdJGGO8lx/d2UkFI8XGEVona
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="380606864"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="380606864"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 10:29:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="792912169"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="792912169"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 10 Nov 2023 10:29:40 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id B742781E; Fri, 10 Nov 2023 20:23:07 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v3 08/25] i2c: designware: Add missing 'c' into PCI IDs variable name
Date: Fri, 10 Nov 2023 20:11:28 +0200
Message-ID: <20231110182304.3894319-9-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20231110182304.3894319-1-andriy.shevchenko@linux.intel.com>
References: <20231110182304.3894319-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing 'c' into i2c_designware_pci_ids variable name.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-pcidrv.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index 175aa18f1a04..d2ed4e77afb3 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -356,7 +356,7 @@ static void i2c_dw_pci_remove(struct pci_dev *pdev)
 	pm_runtime_get_noresume(&pdev->dev);
 }
 
-static const struct pci_device_id i2_designware_pci_ids[] = {
+static const struct pci_device_id i2c_designware_pci_ids[] = {
 	/* Medfield */
 	{ PCI_VDEVICE(INTEL, 0x0817), medfield },
 	{ PCI_VDEVICE(INTEL, 0x0818), medfield },
@@ -404,16 +404,16 @@ static const struct pci_device_id i2_designware_pci_ids[] = {
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


