Return-Path: <linux-i2c+bounces-5483-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C51AA9565BD
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 10:40:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F15BF1C215A9
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 08:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9021A15B57B;
	Mon, 19 Aug 2024 08:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M9LCR+OT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FBA15821D;
	Mon, 19 Aug 2024 08:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724056816; cv=none; b=hSYMK4eWaSIEisSD79ZnIxG2w6PxNk0wFFc0I52bRGCIZy99Kfjl0FAPj6p4DOmXpusv0CjDgqCAzig8QXx7/I7spTvYbe5VgQpOcY47pDcDAU+U4lD62oKU4VfZ+9H83yyKhmcqpxssroMw+XC3BUzF/K/vgwxOPupo8ORQeNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724056816; c=relaxed/simple;
	bh=wiNygSn0xYtYYKaHveS3CXKC0AKbBoJK3KI2wsMtOKk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zh/K2G8vCy4AZR8o4Z1e6SaHNf0hZ+XRQazTYMW456cYwa1d+7ttPWLky4nDZhf6mgMPzEkH61GSETSlDN8QDmBiVmZ/jLyCHuriE4dgNYsFZ0r7JTnj3/euTMHkYPNDmuz3nubqbvnc/T5KFkAJIQiXDc2YvByfii9hgO3KTiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M9LCR+OT; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724056815; x=1755592815;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wiNygSn0xYtYYKaHveS3CXKC0AKbBoJK3KI2wsMtOKk=;
  b=M9LCR+OT5DsvTP7vs7obgsHzgVyoMCjt18j1wY7PCwA1TIXKfsF7t3Vk
   sUdf0BlSWDHmfBEd0L6n0i8ZBPJd/VwihJsCahP1z+tmm+tYEzmB8wIiO
   bIIbgamDC1ykTjbPwzBQvav6i7/36mLMNmqNiW2btqZKaOJHor2QsUrKI
   X2wMGtHyUyLroY4NyVvRhzdLlBo0OPy/qbFxCIcbIBkkg/FRlZfWAhsaN
   Zmd76EjFXv2HqO3sw3rrRq6Cy6d6/quRuxIAQpQ/u8FUj0TqbBkFKriAz
   ida6BWEGBIFKUrnwEvuFSIWKGIG2okXKyC7FsbeJPJluJpKbxz3iXX6jB
   g==;
X-CSE-ConnectionGUID: gtWD+7ZjQKeWer63mUDw7A==
X-CSE-MsgGUID: Byf2p9gwRdeO9fpJh9Xlow==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="22170966"
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; 
   d="scan'208";a="22170966"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 01:40:12 -0700
X-CSE-ConnectionGUID: SNM3NK3jTaq8r3sYiYrqcw==
X-CSE-MsgGUID: lrJDITHiRrycMZnQNDhvGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; 
   d="scan'208";a="60007797"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP; 19 Aug 2024 01:40:10 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id EE6BA34A; Mon, 19 Aug 2024 11:40:08 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Narasimhan.V@amd.com,
	Borislav Petkov <bp@alien8.de>,
	Kim Phillips <kim.phillips@amd.com>
Subject: [PATCH v2 3/7] i2c: designware: Add missing 'c' into PCI IDs variable name
Date: Mon, 19 Aug 2024 11:39:07 +0300
Message-ID: <20240819084007.3700433-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240819084007.3700433-1-andriy.shevchenko@linux.intel.com>
References: <20240819084007.3700433-1-andriy.shevchenko@linux.intel.com>
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
index 507e114332cd..4cbcdae8cd90 100644
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
2.43.0.rc1.1336.g36b5255a03ac


