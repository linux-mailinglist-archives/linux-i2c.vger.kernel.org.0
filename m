Return-Path: <linux-i2c+bounces-6794-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D81C97A10F
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 14:04:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 032911F2486B
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 12:04:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 672CE156220;
	Mon, 16 Sep 2024 12:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UCt4DuEM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95AAE1598EE;
	Mon, 16 Sep 2024 12:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726488177; cv=none; b=SSxlwL8nudqc3Rau8Bwr/eXoeUcp3/gPMzXEUTJeRVVIxQeIDYaqgtYodnoaOaIfMyzvQRUeQcrvSLidlHMMZgeqgLafVVSgX4uB25AirUG70sanOsBgeCa+G50WO2Wx2MlmOEpOE+LmsP/bHg/eySjVnbO8M1r9lp/HqlODKJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726488177; c=relaxed/simple;
	bh=tYYLqHDhvAMug+JLroLRFL/8xmd21D9xE2RL7OIZZnE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nWgPwaoZVAWQ+ZcShNd7w6MwVeRPIHZpcR5sk91ogQTQ1iVEnSiaQON+/YDvI4ayFYQeJl8k1bIT4XADP3aoGP+7strlUB+00l7fZZzBZtEcl//3k6sLxOAvM9Z7zHMeE93NUDOAUow1XCwG9G8ydHXQ9up+q2Xi4svyP+O+Afw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UCt4DuEM; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726488175; x=1758024175;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tYYLqHDhvAMug+JLroLRFL/8xmd21D9xE2RL7OIZZnE=;
  b=UCt4DuEMMHwbT/K5L865gApLZCZ2xnpaSivJYiXXf3iRmSLwHi+nk8TJ
   sSiwa2sI0NSWT75YlhiQHySFXFfGul0jmE7hMEitXgqGsL1UUH+zzc60o
   3PoUFLygFaCh88p6j6bDRnIScOAj+bpKm9Ql4QpWDSHk9QM+PT4I8Cliv
   g+e7RYlDLx8+Kl2CyVnVpdNwNTRSU12y8HLVNg0mThQgCkPPw9JlAJlnY
   AdTNFupYLtebZ3j7B1vTFCgmPry+jUmROhKhLuMSZ2XoDQwS30nsikNzu
   kQEWQmOc1Uktb2tLMxmn+EDSXr6D45oPWawdbKN2tT9HZISe62IxLFDv9
   Q==;
X-CSE-ConnectionGUID: 5LcR1WvYQB+wska45n4Zog==
X-CSE-MsgGUID: M6M9SKWeTui1vYSR7iTW8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="50725488"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="50725488"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 05:02:44 -0700
X-CSE-ConnectionGUID: hUFkAKh2S4Ga7KZ32PoM7A==
X-CSE-MsgGUID: HUEW9ShXSAOy3NIN7Xjw2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="72939897"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa003.fm.intel.com with ESMTP; 16 Sep 2024 05:02:42 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 1335E708; Mon, 16 Sep 2024 15:02:39 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 10/11] i2c: isch: Prefer to use octal permission
Date: Mon, 16 Sep 2024 15:01:37 +0300
Message-ID: <20240916120237.1385982-11-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240916120237.1385982-1-andriy.shevchenko@linux.intel.com>
References: <20240916120237.1385982-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Octal permissions are preferred over the symbolics ones
for readbility. This ceases warning message pointed by checkpatch.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-isch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-isch.c b/drivers/i2c/busses/i2c-isch.c
index 1a18a276a857..b2857e8e1c58 100644
--- a/drivers/i2c/busses/i2c-isch.c
+++ b/drivers/i2c/busses/i2c-isch.c
@@ -49,7 +49,7 @@ struct sch_i2c {
 };
 
 static int backbone_speed = 33000; /* backbone speed in kHz */
-module_param(backbone_speed, int, S_IRUSR | S_IWUSR);
+module_param(backbone_speed, int, 0600);
 MODULE_PARM_DESC(backbone_speed, "Backbone speed in kHz, (default = 33000)");
 
 static inline u8 sch_io_rd8(struct sch_i2c *priv, unsigned int offset)
-- 
2.43.0.rc1.1336.g36b5255a03ac


