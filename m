Return-Path: <linux-i2c+bounces-10391-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B31A4A8B198
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 09:05:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD22A5A20EE
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 07:04:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F83122FAD3;
	Wed, 16 Apr 2025 07:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qj3Uvwpq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2DFF22D4D9;
	Wed, 16 Apr 2025 07:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744787060; cv=none; b=AXTJKnEx8sKz7asZaBAe1DagePFCfAksrabbg6aFSelKq4xW9ba2a2CokfYf7FRyvSD/uCwiFZ7q+53yTfP6xx3yjU6tZuVkcpubfKCwUdiq5Y7qy2oi4ZIRg/HVxJmfyXUmO33YPJ/kEQ8NhDPt9jmqAgNyTrslMImXj4ecDSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744787060; c=relaxed/simple;
	bh=2jpVZLcIGatM7QYsGa2u0dgdWMPJK8+JBwiqyHj7KFA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nm+pMPAEHfKyYWPpAeXiki+JvgtXm5olFk6IWhHJ2TfCwEfiIXKJ74BFIuCLJRcZStIO5acRfZSZvxs4N08HDuTu3WEG/FbdbuDn/yBQ/VHCb3k9DYoaD3GFqnRZJ8X2cbrdqbZyhuilWzqxEYOGaTZ/+Hw/DSkW54YqsPUovTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qj3Uvwpq; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744787059; x=1776323059;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2jpVZLcIGatM7QYsGa2u0dgdWMPJK8+JBwiqyHj7KFA=;
  b=Qj3UvwpqsQW0/1bgoQl6wGORr4fWZkiS24pZ5ltHRIO/Luw5H5E+N+aK
   JI7cM788lMGAgrXK9vpoBFXEtl8A055ateTNpyWBt9lyhIzGX5zvSRRmV
   pgjeW8w9lQqvY3eTJaQvdOGsRSSYhwEs05CkH1lxiSZMfyL30qsv34muV
   ous+49raYmIiOw/djgXcbFRuuK0Ey5mmvDQ70LfoGThhFeEjfzMyUWjaT
   07DYWZjnaDG1qUt9XsqrCn5LYkjf9QNHygxYbxtlSxsJa4zrMPuGiwWLN
   JOVojIz2nq/0mHdrxThzDWmmcyfhkgFXakc8SuSD7vsmkjGDPU2LjS9/s
   w==;
X-CSE-ConnectionGUID: 4PrA/whNRNOxK5R3o3UQVQ==
X-CSE-MsgGUID: aIstOPLoTJ6Q6UAnSQ/oKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="46241849"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="46241849"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 00:04:15 -0700
X-CSE-ConnectionGUID: dms2+h3USQu87AuJqIkwVw==
X-CSE-MsgGUID: bRw1tpL8SAWC84j8uT2mvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="131315354"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP; 16 Apr 2025 00:04:12 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id A21AB5D9; Wed, 16 Apr 2025 10:04:10 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v5 4/7] i2c: core: Reuse fwnode variable where it makes sense
Date: Wed, 16 Apr 2025 10:01:34 +0300
Message-ID: <20250416070409.1867862-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250416070409.1867862-1-andriy.shevchenko@linux.intel.com>
References: <20250416070409.1867862-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reuse fwnode variable where it makes sense. This avoids unneeded
duplication hidden in some macros and unifies the code for different
types of fwnode.

Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/i2c-core-base.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 08ff3f1eb28e..b186de31a9ee 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -567,7 +567,7 @@ static int i2c_device_probe(struct device *dev)
 
 	dev_dbg(dev, "probe\n");
 
-	status = of_clk_set_defaults(dev->of_node, false);
+	status = of_clk_set_defaults(to_of_node(fwnode), false);
 	if (status < 0)
 		goto err_clear_wakeup_irq;
 
@@ -1061,10 +1061,10 @@ void i2c_unregister_device(struct i2c_client *client)
 
 	fwnode = dev_fwnode(&client->dev);
 	if (is_of_node(fwnode)) {
-		of_node_clear_flag(client->dev.of_node, OF_POPULATED);
+		of_node_clear_flag(to_of_node(fwnode), OF_POPULATED);
 		of_node_put(client->dev.of_node);
 	} else if (is_acpi_device_node(fwnode)) {
-		acpi_device_clear_enumerated(ACPI_COMPANION(&client->dev));
+		acpi_device_clear_enumerated(to_acpi_device_node(fwnode));
 	}
 
 	device_remove_software_node(&client->dev);
-- 
2.47.2


