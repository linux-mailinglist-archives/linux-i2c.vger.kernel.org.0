Return-Path: <linux-i2c+bounces-5463-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36165954FBC
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Aug 2024 19:13:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5E83BB22011
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Aug 2024 17:13:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8619A1C3798;
	Fri, 16 Aug 2024 17:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fk2xCCML"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9491C2301;
	Fri, 16 Aug 2024 17:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723828361; cv=none; b=rF/vRl/XIEh1tfyTrNVEFsqA7zp1RNfmON44TZ22kTHKXPJ7CQb6DL3+YbikcbddrQJtBc5IyN/ZNtbKPzZp9VCFxbM+ITk3h9g3DXFnh4f+wZNhvBcdu+QuQuQdxvmbg4L9JL93enKoAoJrB1AeJe+Z/kBLho7thtBtXn3JfDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723828361; c=relaxed/simple;
	bh=wiNygSn0xYtYYKaHveS3CXKC0AKbBoJK3KI2wsMtOKk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VC3zG2tKZBLtlSW7Ubt0R+/k8O276iMdsLEBZqxp28iDNcbcJ/WLaB4944p8UpAD+4tGBWu5Wmf4ZPKWLzyRzxmXxSJyTEzgMTS2BR5nhImRP497NL1VSzLqNiV7/ZFc4nlXQGjug7UpQnACIRbbjoeEiDegJWEQgaDY0ZHL2pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fk2xCCML; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723828360; x=1755364360;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wiNygSn0xYtYYKaHveS3CXKC0AKbBoJK3KI2wsMtOKk=;
  b=Fk2xCCMLUluX6uv2RR2tN/U2trpkelCad++90zo+OdaozTbBqGyJQ3F+
   /QQj0iA9OygUGxxcMXzzLjlbEetp0SkuFcFsUgMBUx72FORcnJccvqxkv
   zcg/wg0lDlEezS7q8uw+wYSwIT6OhmVoWhwh0xtevsVQQaRuh/N17yXm4
   mMSQlwVtHMCw06wgJI4YeNyQGjdnSxKFz+QRPCEwDxBC5dn79K8aKaO5N
   bc6rHOowvfq9R+UlzABRoFZjrVBScF85U/aZumDp00jOM1izAOu/3gQN5
   WwVfNRZEkfHY4AzIwbaMgtBq5LxUBnTVnURPfmIrsvzuNImEJOntYXA7x
   g==;
X-CSE-ConnectionGUID: PnpIdSliQmqCRcX2LcRoWw==
X-CSE-MsgGUID: +J/ikS6GSWy0p5X9Is5qew==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="25888874"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; 
   d="scan'208";a="25888874"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2024 10:12:36 -0700
X-CSE-ConnectionGUID: C0dlg9vTRCq8SYQ4AOHWsw==
X-CSE-MsgGUID: v6ly5JksSUq9bGrF/L/GNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; 
   d="scan'208";a="59360356"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa006.fm.intel.com with ESMTP; 16 Aug 2024 10:12:33 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 918822FB; Fri, 16 Aug 2024 20:12:32 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Narasimhan.V@amd.com,
	Borislav Petkov <bp@alien8.de>,
	Kim Phillips <kim.phillips@amd.com>
Subject: [PATCH v1 3/7] i2c: designware: Add missing 'c' into PCI IDs variable name
Date: Fri, 16 Aug 2024 20:02:01 +0300
Message-ID: <20240816171225.3506844-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240816171225.3506844-1-andriy.shevchenko@linux.intel.com>
References: <20240816171225.3506844-1-andriy.shevchenko@linux.intel.com>
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


