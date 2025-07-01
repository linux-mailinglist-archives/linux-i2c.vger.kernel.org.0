Return-Path: <linux-i2c+bounces-11725-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C581DAEF84A
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Jul 2025 14:25:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5030A3B08AA
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Jul 2025 12:24:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F21FA27586C;
	Tue,  1 Jul 2025 12:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U9RoPHoy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323FF2749E6;
	Tue,  1 Jul 2025 12:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751372584; cv=none; b=XrN+8G9ZsqckMwIiDEBUPZROUHaDPJVtSZJO+6yRL1+d6gYFt4tywudGgwBdVT0rsgCBKY19nRfd/NW4H1Y8ApFsauZWKWqTYP2+WO4ffamRgWqJoZL4SeXOxsTD3tlJ8W0tLwByHrtPJlyFvcYyq5m096UNW8Vf8kuqaBDzl6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751372584; c=relaxed/simple;
	bh=xqnSqFWVDFEdXMupII25qfhOfaCrf8mtjfBCLWS3law=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WvlIIZyDkMShr4+t3n5KblRW/RvpSC2GgHtE0hIiIpg3BuzyIELwrfcnUqP3apNZnV8iv6ea7XpXDYifwY7chUOs1Z2TL7PEekKwWiE+JVjAQg1671MgCmQQVpkCKftRmk4CG9QkYuDx6ES78CL1xv3+/0f/RONP+k6uIsiIWZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U9RoPHoy; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751372583; x=1782908583;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xqnSqFWVDFEdXMupII25qfhOfaCrf8mtjfBCLWS3law=;
  b=U9RoPHoyUtNDNQOpHm2Uyw7QpLHkJAxatN/gjuWRkrtwWk+DHIfb2Cn4
   +BxFh3sMRxSUyC6N7wA1eYO8hTqSt7lAbtlBDNBd6VGIsKLXkMrBZfLGK
   luZhGRDHdp7II1ylh1rSHh7awXktobdKYMWiN+F3helliKrVK+FilbSUl
   JR7AJJ08XlNMNfuFEdvURqN9kuRgyNLo8fJR1UtCMGZit6mrUhjl0GldE
   f86rx6kxxlYh1bslhjs9Oij8gDt+3xLNd8b8BW2Zngl1vpAxlKrx29qP8
   LAA5ZjLfnSy0Z8nSLh4+vyf3eqjua1tJAWC9cRSmTAbldCItFqS6B7fTp
   w==;
X-CSE-ConnectionGUID: 2O87YIFcSEyrQcBEXJvA/A==
X-CSE-MsgGUID: gEDx9NRZRdue323Z/FJ/Uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="71196710"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="71196710"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 05:23:03 -0700
X-CSE-ConnectionGUID: ++ucMJKlRuq50S7eA+Hx+A==
X-CSE-MsgGUID: T0PbFfzBRwSllAtX/se9AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="153157409"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by orviesa010.jf.intel.com with ESMTP; 01 Jul 2025 05:22:58 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Raag Jadav <raag.jadav@intel.com>,
	"Tauro, Riana" <riana.tauro@intel.com>,
	"Adatrao, Srinivasa" <srinivasa.adatrao@intel.com>,
	"Michael J. Ruhl" <michael.j.ruhl@intel.com>,
	intel-xe@lists.freedesktop.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/5] i2c: designware: Use polling by default when there is no irq resource
Date: Tue,  1 Jul 2025 15:22:48 +0300
Message-ID: <20250701122252.2590230-2-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250701122252.2590230-1-heikki.krogerus@linux.intel.com>
References: <20250701122252.2590230-1-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The irq resource itself can be used as a generic way to
determine when polling is needed.

This not only removes the need for special additional device
properties that would soon be needed when the platform may
or may not have the irq, but it also removes the need to
check the platform in the first place in order to determine
is polling needed or not.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
Hi guys,

I found the thread with Jarkko's comments from my archives. He wanted
the local flags variable to be added because he wants the order of the
calls to remain as it is now - the device is allocated only after the
irq is checked.

thanks,
---
 drivers/i2c/busses/i2c-designware-platdrv.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 879719e91df2..3104f52e32be 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -205,25 +205,28 @@ static void i2c_dw_remove_lock_support(struct dw_i2c_dev *dev)
 
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


