Return-Path: <linux-i2c+bounces-657-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE365808A0F
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Dec 2023 15:17:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A75951C20A3A
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Dec 2023 14:17:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40DCC41C80;
	Thu,  7 Dec 2023 14:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HTmhcgTa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09F7E10E4;
	Thu,  7 Dec 2023 06:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701958633; x=1733494633;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FbGQyppMvHjqxAfCOr9lsle0ho7ZsN4iYIYIYz1ToPE=;
  b=HTmhcgTa40ULJGAwRcmpBfpmm9ndA0Gu69fP9ecfX4pYNSzDzbMXHyiK
   +RsEJc2IMuvWfnGnxjugtXacptNOyRp4MbiofRWwGsJojRo7lLmZEdRES
   YdorHS6Js6y0+jQiD6Xk5quEuD/VoI61eM1DXrLGVCKXq2EVQirPLw1yf
   imfarH+irR1ajuT1wKYk2qt2AJbO/NA14PmPyAJWHgz/1NnV5z93f98ew
   FgSu+rKD7gnaP5vLAG5/CTNDBhFHBXPHxCEfJw4CfD+5TeLyfTVgNY1PV
   JWm+IoIA7v+UcZJPY14KUgQ3tFnmwE1k/mRipNaDLmITM2qUZMUZ5Ytgb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="460726122"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="460726122"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 06:17:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="889756081"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="889756081"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 07 Dec 2023 06:17:08 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 0ABF6B50; Thu,  7 Dec 2023 16:17:03 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Serge Semin <fancer.lancer@gmail.com>
Subject: [PATCH v5 12/24] i2c: designware: Drop return value from dw_i2c_of_configure()
Date: Thu,  7 Dec 2023 16:13:52 +0200
Message-ID: <20231207141653.2785124-13-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20231207141653.2785124-1-andriy.shevchenko@linux.intel.com>
References: <20231207141653.2785124-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dw_i2c_of_configure() is called without checking of the returned
value, hence just drop it by converting to void.

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Tested-by: Serge Semin <fancer.lancer@gmail.com>
Link: https://lore.kernel.org/r/20231120144641.1660574-13-andriy.shevchenko@linux.intel.com
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-platdrv.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 15f19ec20b33..7449f1b37ecf 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -110,7 +110,7 @@ static int mscc_twi_set_sda_hold_time(struct dw_i2c_dev *dev)
 	return 0;
 }
 
-static int dw_i2c_of_configure(struct platform_device *pdev)
+static void dw_i2c_of_configure(struct platform_device *pdev)
 {
 	struct dw_i2c_dev *dev = platform_get_drvdata(pdev);
 
@@ -123,8 +123,6 @@ static int dw_i2c_of_configure(struct platform_device *pdev)
 	default:
 		break;
 	}
-
-	return 0;
 }
 #else
 static int bt1_i2c_request_regs(struct dw_i2c_dev *dev)
@@ -132,9 +130,8 @@ static int bt1_i2c_request_regs(struct dw_i2c_dev *dev)
 	return -ENODEV;
 }
 
-static inline int dw_i2c_of_configure(struct platform_device *pdev)
+static inline void dw_i2c_of_configure(struct platform_device *pdev)
 {
-	return -ENODEV;
 }
 #endif
 
-- 
2.43.0.rc1.1.gbec44491f096


