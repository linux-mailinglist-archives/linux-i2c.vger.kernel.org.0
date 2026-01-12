Return-Path: <linux-i2c+bounces-15050-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECEFD12C15
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 14:24:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DC64C3010FA3
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 13:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27767359F80;
	Mon, 12 Jan 2026 13:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NtiY66Mz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5193596EE;
	Mon, 12 Jan 2026 13:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768224232; cv=none; b=PhKDw/XnuNiGNN3bO+tTZ3/Le+hIC9WWThg6giV9FcWHy0mg0ReCqo5Yz3siZXBPxPWqUTETm5mIIQWkftTg7gTNbxV/zb1ROlIv5zgrCN4ixUHHYGizL5U+4T3OcVHJov8Ti9A4XG13eVk9oWW7fFK3KmP2fjRaZ+LtRCNhZMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768224232; c=relaxed/simple;
	bh=eU2OTr9xXoeDQ3/pCvNSRAHGCfwyYgx+lP5XcFDwXuY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uuOp4RGz+/UqQ91t3x9b4YzEd2xbkrJUa3QKI6LzOGHiIZxz8Kx6hmU5vZ8naN0OxRswiXsRLQlPok22iys/l+QWXOtsgkoXoJAn1IF9JcGnWFFeNef6imbxH3H7Ke3EosTOZ5DgoXQ6g63Q5YT1MPxmrSExP8iPnLOso5RWqXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NtiY66Mz; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768224232; x=1799760232;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eU2OTr9xXoeDQ3/pCvNSRAHGCfwyYgx+lP5XcFDwXuY=;
  b=NtiY66MzTIuh64qD8dljs7N8a+9VRjUMirFPJDu2aB3mDruWc2UnYg0A
   GjgQ0T2/Av1KzZBw3DNKiTdaldqyFYDSXPKk2b6USbvSOjz9LkKh2Bx3G
   vUTM4K6EntfZdyrYa/EejiMGfj5MAz5/xy/4wOrUhcttke2xFRM2Y+TJE
   KDLx1IZKHvv3gszNlcGT7gMCSNAq6WDuWSimXC4yYssVJnNBoXJjYtPMW
   7hSfQ9u31iChhDEstbvAZFCelTX9QL5FFC1GCqJBs4pnzXw4vkKnLRY8K
   nO61i+P51S5Q86lNL6eZ+LxtTwo30wLEkgh7DvUkKpRAc80F3UlvXSi6N
   A==;
X-CSE-ConnectionGUID: BMVaaWbJRly9hrrqaw7jrw==
X-CSE-MsgGUID: YzniilR3QRKDKn5n5YmU5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80602708"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="80602708"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 05:23:50 -0800
X-CSE-ConnectionGUID: fHMrhEWFQyerVlNmlrzReQ==
X-CSE-MsgGUID: 4JpUL/nJRguxA68ahh6tpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="208563188"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa005.fm.intel.com with ESMTP; 12 Jan 2026 05:23:48 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id B3B339D; Mon, 12 Jan 2026 14:23:47 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 3/3] i2c: core: Use dev_fwnode()
Date: Mon, 12 Jan 2026 14:22:42 +0100
Message-ID: <20260112132346.4087258-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260112132346.4087258-1-andriy.shevchenko@linux.intel.com>
References: <20260112132346.4087258-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

irq_domain_create_linear() takes fwnode as the first argument. It can be
extracted from the struct device using dev_fwnode() helper instead of using
direct dereference().

So use the dev_fwnode() helper.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/i2c-core-base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index b9b44bed3243..f0fb0cfd56e0 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1476,7 +1476,7 @@ static int i2c_setup_host_notify_irq_domain(struct i2c_adapter *adap)
 	if (!i2c_check_functionality(adap, I2C_FUNC_SMBUS_HOST_NOTIFY))
 		return 0;
 
-	domain = irq_domain_create_linear(adap->dev.parent->fwnode,
+	domain = irq_domain_create_linear(dev_fwnode(adap->dev.parent),
 					  I2C_ADDR_7BITS_COUNT,
 					  &i2c_host_notify_irq_ops, adap);
 	if (!domain)
-- 
2.50.1


