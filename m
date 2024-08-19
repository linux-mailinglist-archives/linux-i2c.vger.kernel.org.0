Return-Path: <linux-i2c+bounces-5541-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9599C9573E6
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 20:47:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8B0A1C20E89
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 18:47:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13E3418A940;
	Mon, 19 Aug 2024 18:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UO+U3fXH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C25189BAB;
	Mon, 19 Aug 2024 18:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724093169; cv=none; b=AJV2ejdACScl+NUnZAPfWgR7kvfi39RghUB7+IpU0pW3JKhSdMCwBFB8lbCgdMOlfE6beUY9CCrlBaPfLPjmAnMlB5RjxMiJJ31DkzL7ZhGt1b8aPv0h/3XvzMkX6xVD022DXI4CzeonXuuvXWp/jwxCHcQ2a90vCPCWLn3OTUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724093169; c=relaxed/simple;
	bh=ecRXmoWtr+H4FTDexcrxBLjv16chf+goailR2t/Is70=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C54ojeIBAfaNtV2MHKkj+IJskhsZoO9Bdv2Kx8eyjoXmGV9vAzRaofG/RTIB1bf3ljVSLk7SzBfTBCoCUzBkAn3bWImHUuF0da41ZnSFCdakRQJh0s2z31C6BtShvS2gnGV9bDLSlozBULaQDXJj7AYUfFhPoob+b6G0EWzbJ5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UO+U3fXH; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724093168; x=1755629168;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ecRXmoWtr+H4FTDexcrxBLjv16chf+goailR2t/Is70=;
  b=UO+U3fXHXg2jnOpcFrRT54pPvt6t9eo3hYwSSQAAtIm91av34r7/RGnz
   HuQMVkoP/cHwRigWyXkMKjA8l1PefNZosbb7BMaNb3Ff+eG/icOD9PtuV
   ddQq5klYo5Ab5rFIj6zxluhCpircVVJWfUUG93SFa2qLKgWkE4QWk9z9G
   hyAZ6eFt/psZOlVEQTHUkWqo82hrs/YMEWd8koWaOcgNUZBOGb78+2X8Z
   4+AIhOmvX/CQlf8H14tm3SOwRPGd47zZygBjcL9UPyMIegPn3j0S8jY+a
   qJNAuztI9I9OFjG+GDJhog2hDWqxH8x4cfTkqs64l+wpfIyngz8xS4lL3
   A==;
X-CSE-ConnectionGUID: zJyhlL+TSlOVqFumFLbxuA==
X-CSE-MsgGUID: fdATBkDDTeyC8Rwdb2Pa+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="21902309"
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="21902309"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 11:46:05 -0700
X-CSE-ConnectionGUID: KxSRdwSMQTybJVmuk4gs6g==
X-CSE-MsgGUID: H+KvwN9oTaaaV2q9aa3RvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="83671053"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa002.fm.intel.com with ESMTP; 19 Aug 2024 11:46:02 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 49939719; Mon, 19 Aug 2024 21:46:01 +0300 (EEST)
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
	Kim Phillips <kim.phillips@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH v3 4/7] i2c: designware: Unify terminator in device ID tables
Date: Mon, 19 Aug 2024 21:45:10 +0300
Message-ID: <20240819184600.2256658-5-andriy.shevchenko@linux.intel.com>
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

Make the terminator entry look the same in all device ID tables.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-pcidrv.c  | 2 +-
 drivers/i2c/busses/i2c-designware-platdrv.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index 4cbcdae8cd90..cbbcbcc265c9 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -401,7 +401,7 @@ static const struct pci_device_id i2c_designware_pci_ids[] = {
 	{ PCI_VDEVICE(ATI,  0x73c4), navi_amd },
 	{ PCI_VDEVICE(ATI,  0x7444), navi_amd },
 	{ PCI_VDEVICE(ATI,  0x7464), navi_amd },
-	{ 0,}
+	{}
 };
 MODULE_DEVICE_TABLE(pci, i2c_designware_pci_ids);
 
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index d092532375b8..9ce74a8be43a 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -58,7 +58,7 @@ static const struct acpi_device_id dw_i2c_acpi_match[] = {
 	{ "HISI02A2", 0 },
 	{ "HISI02A3", 0 },
 	{ "HYGO0010", ACCESS_INTR_MASK },
-	{ }
+	{}
 };
 MODULE_DEVICE_TABLE(acpi, dw_i2c_acpi_match);
 #endif
@@ -154,7 +154,7 @@ static const struct of_device_id dw_i2c_of_match[] = {
 	{ .compatible = "snps,designware-i2c", },
 	{ .compatible = "mscc,ocelot-i2c", .data = (void *)MODEL_MSCC_OCELOT },
 	{ .compatible = "baikal,bt1-sys-i2c", .data = (void *)MODEL_BAIKAL_BT1 },
-	{},
+	{}
 };
 MODULE_DEVICE_TABLE(of, dw_i2c_of_match);
 #else
-- 
2.43.0.rc1.1336.g36b5255a03ac


