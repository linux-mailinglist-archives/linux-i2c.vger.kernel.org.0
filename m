Return-Path: <linux-i2c+bounces-10325-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DAB2A87CCD
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Apr 2025 12:04:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9B0D3B3F39
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Apr 2025 10:04:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD180268C6B;
	Mon, 14 Apr 2025 10:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KKqL9F04"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3FC2673A6;
	Mon, 14 Apr 2025 10:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744625061; cv=none; b=l4E/4NTdrAIAEBLOssEV3iaOLhOSOCFQMSkNzVjnl3d6lF9fRK+wE9AMJtI7sSMidWM4sePLRuk21tT55ID/0hHpDwWTnhUO4ZYXcjCXZfhtZh/sbfJj+jqnhH5y0Zc13aEJzRnHvPhURF1C0/DXv+jC/a8IQC5GQJ88ga5NSLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744625061; c=relaxed/simple;
	bh=jl66AMgy5B656FFMXcI3o9RT1swQVY7zVyfhfqfCPB4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hEqnMatkCLj/DdBhIClD9JOZObWIYt9SwYnBP5UeMTyQHzD9uOu8Hai5NbR+KnNTMLEBkwi/7Mzy0iGLM/eyOiTeJolieIQYy+SQcZe1hqlC8DlsFWJ87LLy0FPf/PuaGFk37IwgIB+T8sJFXIYQw7amk/r2nP400ooA99whM5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KKqL9F04; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744625060; x=1776161060;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jl66AMgy5B656FFMXcI3o9RT1swQVY7zVyfhfqfCPB4=;
  b=KKqL9F04VdIzgERlWdvOE6sjuG8E4XCkYHHmIcfLzCMf1LZ7WKkD8aX8
   Z10JDu2JH/OEk7gtzFWO2Ig5Jqzi2KqzDpL5TvUZOA+kg9tg/58/hIniD
   1pxYyCa8bEKOMcN2cMkdngqahpe5YUhdVFnAklwXBW6E9iL4Y0tr5S/+Z
   W6l4xeBM1G1LT0Ws0Rg9KXuMpFzn3ob5Js6rviHq8Ijfe+yTZ/lSX+dxl
   fMTrhwl+Z8+VcJk6uqY5HatF5ERm2qCTLN1CR6HG3JG7lb5oZ9/IjYLcO
   DsH/WNKhKL+qn0j5/3m03ed8UsUzjI/jgzKFCP4gU3ipgjXX5d1n/du3g
   A==;
X-CSE-ConnectionGUID: HYtPufw9RE+q/KxrWAF+JA==
X-CSE-MsgGUID: /EJMirQBTdy1Zdw/Csb1EQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="56747122"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="56747122"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 03:04:16 -0700
X-CSE-ConnectionGUID: WhnZ8idATl2j8to66/oDbA==
X-CSE-MsgGUID: y41loHTKT/6co87Z/nMIUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="134747320"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 14 Apr 2025 03:04:13 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id F129AAD4; Mon, 14 Apr 2025 13:04:11 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v4 4/7] i2c: core: Reuse fwnode variable where it makes sense
Date: Mon, 14 Apr 2025 13:01:54 +0300
Message-ID: <20250414100409.3910312-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250414100409.3910312-1-andriy.shevchenko@linux.intel.com>
References: <20250414100409.3910312-1-andriy.shevchenko@linux.intel.com>
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
index 04985abe0e5d..9ca1ade043ed 100644
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
 	} else if (is_acpi_device_node(fwnode))
-		acpi_device_clear_enumerated(ACPI_COMPANION(&client->dev));
+		acpi_device_clear_enumerated(to_acpi_device_node(fwnode));
 
 	device_remove_software_node(&client->dev);
 	device_unregister(&client->dev);
-- 
2.47.2


