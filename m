Return-Path: <linux-i2c+bounces-9809-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 13153A5E3E9
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Mar 2025 19:52:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D7D82189CD64
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Mar 2025 18:52:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63E0C259CAE;
	Wed, 12 Mar 2025 18:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WrOnxxR4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACAED258CD0;
	Wed, 12 Mar 2025 18:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741805511; cv=none; b=nXr04+yErsO28JkjgSqeftxVR1/Zdztkvt7mhZkLavXzX0wex52XHhveD2K3fd+WPqHbs2o8Ak+L9+/8KH5VgvGSWlKMtPrgxvTRDH4P6mbca1+nCT1zhn61UKTARESf1jKdt56l6TPTUT8Xq5Ne0wNWPyAFrKJUNnvBfbZZYQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741805511; c=relaxed/simple;
	bh=1sXys2aY5ZFW72nOUdu/mEFqc3tcXF3J8tzEyHNpwMk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gQvZ41Tbt71JbBH/CcBPIXbhqog7mU7ymlwfhklqN0osU6RDjNgW8DqcRP1YFBTKeuTGyyO/MC5qTOqaZXeRlSMlvMFLhcr4lsbt2lIJb+UQ1z54yZX4rCBAT1SjWOESxyEbebqtgLI9PN7razGrn9/w0DYtDe5uwCjp1NHvKs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WrOnxxR4; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741805510; x=1773341510;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1sXys2aY5ZFW72nOUdu/mEFqc3tcXF3J8tzEyHNpwMk=;
  b=WrOnxxR4EwUCmab5H8TW/zcQUE7aERSbsEfnTCyugTgNmT1RTv5Hu7mS
   6gVF1yuvt4PN/Qwp+flUAGffAowFwEXQm0JltHV6OgCTfdWEwXIhNGGsu
   Cu1rdqud7rX1DiYwbT+Ua+e26JDxsmakp5jZUTz+m0Rf1LvJ1ZQjku2sU
   c0UDhbKZc2QYXSnQTKVM6XXrTWudYy2fTaYJtbS8DITJNK8JRrSIUL40s
   NixzeChNNGe9qm1OjmRHTXzGHaOT+KiT1OIgKQ6Ee3Bix9g3FyAVCX0C2
   +4hpKdGCRwf6mO6n5cJk3a/hmHrrLGUgxU3b/tTHbuTUF/MBvksQ4sDFa
   w==;
X-CSE-ConnectionGUID: TuPqK5nGSPCkzKkytjWwFg==
X-CSE-MsgGUID: 0ulPcA+QQ+eMpBUE0/uJoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="30487215"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="30487215"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 11:51:45 -0700
X-CSE-ConnectionGUID: M1jHYTVpQKqeRG7Kmc+veg==
X-CSE-MsgGUID: VHGXyTN/T3SdiG4sUck3/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="157895064"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 12 Mar 2025 11:51:43 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 44C7E214; Wed, 12 Mar 2025 20:51:42 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 4/6] i2c: core: Reuse fwnode variable where it makes sense
Date: Wed, 12 Mar 2025 20:48:51 +0200
Message-ID: <20250312185137.4154173-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250312185137.4154173-1-andriy.shevchenko@linux.intel.com>
References: <20250312185137.4154173-1-andriy.shevchenko@linux.intel.com>
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

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/i2c-core-base.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index f0420cc0df26..1236061a78c3 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -568,7 +568,7 @@ static int i2c_device_probe(struct device *dev)
 
 	dev_dbg(dev, "probe\n");
 
-	status = of_clk_set_defaults(dev->of_node, false);
+	status = of_clk_set_defaults(to_of_node(fwnode), false);
 	if (status < 0)
 		goto err_clear_wakeup_irq;
 
@@ -1062,10 +1062,10 @@ void i2c_unregister_device(struct i2c_client *client)
 
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


