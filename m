Return-Path: <linux-i2c+bounces-15064-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C5926D12FA5
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 15:02:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A74E302F686
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 13:56:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80E3135BDAD;
	Mon, 12 Jan 2026 13:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M3qVTILW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335B235971D;
	Mon, 12 Jan 2026 13:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768226168; cv=none; b=QUKf0afwNihIE4SB4CoCIxANwZ/e6k79+fnAAfBmRttRIXbU9XZvjxifMm9yWIv/I+Z/xFuEQ2sJsKGQ3FdR0ZIHAFfPBqho8W+038z+vdGJUGLAXnMjUFoD2CDvwXjnr5SHrPcSRaG35Ul0DQa+RqLZ/B8pqy3oaJUJ1Skva1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768226168; c=relaxed/simple;
	bh=zr0L0xcQVOTIb9P13uLsJDLbi2uvupl4x5jP+Qo+EV8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MxT05GNZJE3ehkBWRfXjWctmikN750t6bd+clzLsyLXBKOHUE+Ho3hzfD46sPpfCxTAtOVy/rSTmV/sgQ0hIVDbTGo+dLEsRnwH90Fyb0dBlSqUgTrbxDx9CJpzGgWbJFoAIXTV+aSz5gSuaMT2AodQt/PMGTHDu2T8ZYiN6hGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M3qVTILW; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768226167; x=1799762167;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zr0L0xcQVOTIb9P13uLsJDLbi2uvupl4x5jP+Qo+EV8=;
  b=M3qVTILWhemsIpamSxxiP+ar77b41OLVRST/8u+Y4Od2ZsfC5nxwLoHy
   7v/1EH0X5Mae33acMygDDov7z83vazRqQex5ievN+Ynb4cPd1FzXrjgjw
   bRwZ35ZF3EWmS7RybOJOqBrqYPQLQjx4Epenk13TOJZlot9GgY93tGNbK
   iqN+lJbxT97A7M0cmSswNZUDM6VeiPhIKyPHuLinMnxiu7Q8HoBx9smyp
   tJGlJRouOjlVEfzIpiw5LARGA84OVhsxnNAEjfq5yffiYeob/HPNYSMX7
   K1pcGSm9shZpv5tG95FN2wT7XSqtjFXOE5MuTbGwEaqVxvZ3bvPUOoKYm
   Q==;
X-CSE-ConnectionGUID: fIajq8ISS1257GKLvc9cYw==
X-CSE-MsgGUID: 7vs9Dn48RRaxNjIoXtN7uA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69397028"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="69397028"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 05:56:07 -0800
X-CSE-ConnectionGUID: Q+X5rLBlSZOlnJQDSncHtQ==
X-CSE-MsgGUID: 163tr24BQLOfvOyq+Pm89A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="208246184"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP; 12 Jan 2026 05:56:05 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 89B209B; Mon, 12 Jan 2026 14:56:04 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Khalil Blaiech <kblaiech@nvidia.com>,
	Asmaa Mnebhi <asmaa@nvidia.com>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v1 2/2] i2c: mlxbf: Use HZ_PER_KHZ in the driver
Date: Mon, 12 Jan 2026 14:55:11 +0100
Message-ID: <20260112135603.4150952-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260112135603.4150952-1-andriy.shevchenko@linux.intel.com>
References: <20260112135603.4150952-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use predefined HZ_PER_MHZ constant where it is appropriate.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-mlxbf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-mlxbf.c b/drivers/i2c/busses/i2c-mlxbf.c
index 9f0048044112..6c1cfe9ec8ac 100644
--- a/drivers/i2c/busses/i2c-mlxbf.c
+++ b/drivers/i2c/busses/i2c-mlxbf.c
@@ -66,7 +66,7 @@
  * strongly dependent on the core clock frequency of the SMBus
  * Master. Default value is set to 400MHz.
  */
-#define MLXBF_I2C_TYU_PLL_OUT_FREQ  (400 * 1000 * 1000)
+#define MLXBF_I2C_TYU_PLL_OUT_FREQ  (400 * HZ_PER_MHZ)
 /* Reference clock for Bluefield - 156 MHz. */
 #define MLXBF_I2C_PLL_IN_FREQ       156250000ULL
 
-- 
2.50.1


