Return-Path: <linux-i2c+bounces-6786-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3712197A0FA
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 14:03:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 696441C22CB2
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 12:03:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC223156C6F;
	Mon, 16 Sep 2024 12:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q1Xqre9Q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404E4155C8A;
	Mon, 16 Sep 2024 12:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726488167; cv=none; b=Bx5DiF9uTshC2Ls+ucZW3kIlzP97LiVLILgNcPovIrxLOtaiAVwZUZ2Eyz16AmXzp6dsDFpyWV13ps/cQEjlfpCmAiqrqLZf8ZszdCFzgD9PQR1eEK+ncqidPvsycdFq+CRK9LxBIGT+v1gLaRuHlryF1floHaSHUZ4Hi6B2Svc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726488167; c=relaxed/simple;
	bh=Taa17+tLPBdmnRuoMJ/IqSoAFLOrHizGCjbHljk5goo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qnzfl0TS3gD1bKcZbQBy5EpY7Tv3nPaFyERyE0b5rBGyKzXjl2Nu6Asrct3dB5oCVMmIW6drRjhdF+qsFSw5fWePHU7HAjRHsV/x+6QNYDN/2luxsoBp+AHG9fb8TeIhzRP0Q4TDo/ii8riWJ/kDAV8TWkJw+sGHxO+6eFcNjiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q1Xqre9Q; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726488166; x=1758024166;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Taa17+tLPBdmnRuoMJ/IqSoAFLOrHizGCjbHljk5goo=;
  b=Q1Xqre9Qxng1RxmeKdk2YscqdRD3CLPX+M4/uY907173D6TUO+AA4FV3
   rRDl3xh03GhFo4upxuOstdmULHXQLNu8ICB/JC4LoZG1Scw5ZENObkgvi
   SWeorTVGTFicnFc9Ix3sEkckD9vv6RAlEzmRGzcSJhb/gCHuwTK8Q1gFk
   X+TxpVXE+7ROgbGovV6asl/tn4x2qms2gK/JjQqaQzl8TpSUvCley2yIF
   bvxHLNsQ8le4rYoQo8v+q4yMJ6CDuPgxLc/gbTGqOdD3pEvTuEs9L31jv
   9nxRr13f04fgrhyAEyhxquhA2KQgWJ+MoDclIwmcvN2XkvKJqXftQYTZF
   Q==;
X-CSE-ConnectionGUID: 8nLRCup8QUmOt6BSznCA/g==
X-CSE-MsgGUID: W2cjrPwtRSivFpK+4vi4wg==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="24842810"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="24842810"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 05:02:42 -0700
X-CSE-ConnectionGUID: MoCSaXX/QtyfMPUayobVEQ==
X-CSE-MsgGUID: jZzh7f3FT16GMinzuOY77Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="68540770"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP; 16 Sep 2024 05:02:39 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id B4D9C640; Mon, 16 Sep 2024 15:02:38 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 02/11] i2c: isch: Use string_choices API instead of ternary operator
Date: Mon, 16 Sep 2024 15:01:29 +0300
Message-ID: <20240916120237.1385982-3-andriy.shevchenko@linux.intel.com>
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

Use modern string_choices API instead of manually determining the
output using ternary operator.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-isch.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-isch.c b/drivers/i2c/busses/i2c-isch.c
index 96ee73fe6e81..f44c5fa276dc 100644
--- a/drivers/i2c/busses/i2c-isch.c
+++ b/drivers/i2c/busses/i2c-isch.c
@@ -19,10 +19,11 @@
 #include <linux/platform_device.h>
 #include <linux/kernel.h>
 #include <linux/delay.h>
-#include <linux/stddef.h>
 #include <linux/ioport.h>
 #include <linux/i2c.h>
 #include <linux/io.h>
+#include <linux/stddef.h>
+#include <linux/string_choices.h>
 
 /* SCH SMBus address offsets */
 #define SMBHSTCNT	(0 + sch_smba)
@@ -153,7 +154,7 @@ static s32 sch_access(struct i2c_adapter *adap, u16 addr,
 		outw(backbone_speed / (4 * 100), SMBHSTCLK);
 	}
 
-	dev_dbg(&adap->dev, "access size: %d %s\n", size, (read_write)?"READ":"WRITE");
+	dev_dbg(&adap->dev, "access size: %d %s\n", size, str_read_write(read_write));
 	switch (size) {
 	case I2C_SMBUS_QUICK:
 		outb((addr << 1) | read_write, SMBHSTADD);
-- 
2.43.0.rc1.1336.g36b5255a03ac


