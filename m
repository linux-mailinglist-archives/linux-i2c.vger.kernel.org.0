Return-Path: <linux-i2c+bounces-10133-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DA447A7DA89
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 11:59:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB6E4188BCD8
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 09:59:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD9642356A1;
	Mon,  7 Apr 2025 09:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QrqOKB9c"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3954232360;
	Mon,  7 Apr 2025 09:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744019942; cv=none; b=KBK9reguaGF+skD/6u5YBYZxnGjHrFUvEONlyghV/UqWK3ytxqa70449NJGs93y98MRrfxDjuJMj/1ZLb0hX/rhb1182d2vFdwUyN+9lt2q6aJ1TfAhSd6dROCpynhOk5ul3ifp63cTO2lpg+Dq52j60p2qHG88AtC+7mJ9FfxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744019942; c=relaxed/simple;
	bh=jiMwF9dmcgH1wkfNa5VdCm9OlKEMlZNRwxi5aYQbhTc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i6c7tOhRk5yOzWf2tFhd8/xXaq/58nObGo90IkVznE9GRBQY4wm6H4MppdRWC6+vnZ3PHtocYqHoIF631io6W0FpC0j5vniC8KXbqp/wyepogBsmuAVAvmWQzhU/YpLu8UhC8+7MMwm5QcdxxCaW48Hfp1xv8ZoPMRljlTHdw7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QrqOKB9c; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744019941; x=1775555941;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jiMwF9dmcgH1wkfNa5VdCm9OlKEMlZNRwxi5aYQbhTc=;
  b=QrqOKB9czxDWyNL6gPVlpHcvvmKtntiIkjrq9ELk3fb9F890NmFXQp3X
   lk38NuyO4WlNniel5/ZVvpnPm46aO6Zwu6asiFhylFNS7NuibO/XQfj88
   29pLJBVZ7B8za5kgworCAvRHs52c74bH+7HW6R2WfOj8N3L/dj3UyBn1l
   UoJA90VsusS2Psu8veS9PA3wPlas7IXfHFJdCli0K1de6ckw/HRTChX4k
   pxZqR3EJ+7kz5XrE8fnRFgH9ghZw3xN02j4bO3ju1eO286KvY8mPK4rXo
   WkdGmudEkUVaZ47how03eja5Ml9rTIjYMuAyWBM6gAZgnHbhxDtucCe30
   w==;
X-CSE-ConnectionGUID: NuKdIpFWTy634FgOKUpK9A==
X-CSE-MsgGUID: KQVEJ5GoSfef3V9DtJIJQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="49188881"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="49188881"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 02:58:58 -0700
X-CSE-ConnectionGUID: PiAmxbQzRW+tRHJxa3xTjQ==
X-CSE-MsgGUID: CjW0eAoWQ/GTRX0h/PA24w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="128411724"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa010.fm.intel.com with ESMTP; 07 Apr 2025 02:58:55 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id B0F36484; Mon, 07 Apr 2025 12:58:54 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 4/6] i2c: core: Reuse fwnode variable where it makes sense
Date: Mon,  7 Apr 2025 12:55:15 +0300
Message-ID: <20250407095852.215809-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250407095852.215809-1-andriy.shevchenko@linux.intel.com>
References: <20250407095852.215809-1-andriy.shevchenko@linux.intel.com>
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
index 196b29e5924b..a0d3aec6c00e 100644
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


