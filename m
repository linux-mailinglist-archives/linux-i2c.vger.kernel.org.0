Return-Path: <linux-i2c+bounces-5540-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 188329573E3
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 20:47:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B78321F243A2
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 18:47:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 547A418A6D3;
	Mon, 19 Aug 2024 18:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iRXpmHEh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985BD189BA6;
	Mon, 19 Aug 2024 18:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724093169; cv=none; b=osSNtJ95yeXMxH2faVnJvHb0J2BlhjJGz4T/b04vtAQIHytr2MXCrItgyweqETnwx6Y3+OmL9BkGzLjoTRgSBcwoWbC192XQqfnuOo2zL4N7juBh7TA5KARwwJSObAK6VtMhc9Q32uVeMHgexGSYRubmU6z11SRq+VoR9kZlEqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724093169; c=relaxed/simple;
	bh=wiNygSn0xYtYYKaHveS3CXKC0AKbBoJK3KI2wsMtOKk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=smNWwhFPwmzBFbDSEDbjqool2SSDBFxxjCdSvr4iONi+G3L3VIjOcKnG4DKs6Qx/jQo5npAVmUgrU7ljSvTxPYqoB9QO4623wYZPRYJsc9NmJZeiPyXmwomUW7uEi7hxPst5Jvbgim1/ubJfiTNoV1eBryG5g7sL1lR6LPry5Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iRXpmHEh; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724093168; x=1755629168;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wiNygSn0xYtYYKaHveS3CXKC0AKbBoJK3KI2wsMtOKk=;
  b=iRXpmHEhx2aDJij6XjMUpwHM5QHjGdJC/J9HYgdd+fx+ONfmS2rJRvG5
   Sn2u1Nh4uFuSZUpoRAjswJLTdchwDcj/X9XPZN6JUiXIL470i49TSADIT
   WZdGhuAZkKH1K+LrK7hY5OcFhtDk4qqbcmNPGMYRJNX2OCuPIm1iHUufz
   XAg5HazoqolOtjHrb0zSHAO4gnsAu/As3iC0FKKUfQ4gm46toxpjEFImb
   1PVAQehLDzVex0gicb/KeK3SU4msg8ebUmygrClciKeiYQy5MxrJZqoym
   AH+Cr0Q/Mj74v+4v7YfD6EzoVinBEquCpKPrYB8mZR/+MuW7j/hraLz2C
   A==;
X-CSE-ConnectionGUID: qpJs/G+gTIiHBHXCQ+aOqg==
X-CSE-MsgGUID: JDaxlWU0QxCMvIHCkZI3+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="22537648"
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="22537648"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 11:46:05 -0700
X-CSE-ConnectionGUID: s20/WfE9QX6mF2fXKHRk/g==
X-CSE-MsgGUID: hLqKjEM9Sy+xa2pI/B+5rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="60433947"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa009.jf.intel.com with ESMTP; 19 Aug 2024 11:46:02 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 384F651C; Mon, 19 Aug 2024 21:46:01 +0300 (EEST)
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
Subject: [PATCH v3 3/7] i2c: designware: Add missing 'c' into PCI IDs variable name
Date: Mon, 19 Aug 2024 21:45:09 +0300
Message-ID: <20240819184600.2256658-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240819184600.2256658-1-andriy.shevchenko@linux.intel.com>
References: <20240819184600.2256658-1-andriy.shevchenko@linux.intel.com>
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


