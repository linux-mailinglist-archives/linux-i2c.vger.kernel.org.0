Return-Path: <linux-i2c+bounces-6571-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D558997577A
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 17:48:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 148EF1C23017
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 15:48:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 451F61AB6FE;
	Wed, 11 Sep 2024 15:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JmkKexNn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A463B19CC19;
	Wed, 11 Sep 2024 15:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726069708; cv=none; b=tg4InurhTkLltTIHAxsRAtxqorq1Si5OelEsx5x7MclEGGsjMI40nVHkZK8UFIQIGJXHOc1SGwRabQREWOmTWfi+X68NViYNA8MmNraCiozcz7Pzcyd1DT4NewWrFhF4t/NtCgQtomLNm1gVtoACM+HDLDKHadEIzVDR4X4Jdrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726069708; c=relaxed/simple;
	bh=Taa17+tLPBdmnRuoMJ/IqSoAFLOrHizGCjbHljk5goo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eADBe6WfhGlxN/8aO2zpLFT7E1tfUvacVs7niml1U0OOXTAsKKiSbRhxVOm1hRdsGgvh3RJ+0jEiBSBVafr9BPZZfus4IIR7kCFQ4PuAId23ndSYbEQZIjNyEIMvb8t8BglB7HAxdfEE9/jWXdPK7iNcggKMZVnf7wb41yEdYEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JmkKexNn; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726069707; x=1757605707;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Taa17+tLPBdmnRuoMJ/IqSoAFLOrHizGCjbHljk5goo=;
  b=JmkKexNnJkMaLNVXNqbmnGJoDD79NfiMVaUn9RvZypfCplGdGUoE+7tY
   DKb1ih+D3gsiInDxWmvdAmEq/fIr+BC5zbjbfun9VpqZOC90gx0xk2rBp
   ne2kTHZGIOIq54rEy9KXxIlOSwGK8l3EVu6l2MCOK70CfjD2J1RuC+po1
   oK6SklsDHiAB/BAS+vSXySb/5gfTx2HkxmVAHghr7A9lZGjydBxlAGgFs
   g1Ggcno719h42ONosua2swJU/2C1L+tarADMEwzwaZkrYCW46eVfRBT30
   NsSm4L3O2IdBc8zxhQKAUe93MVLWUyOE9/wN81DBzMNbgEvi4ybs3yxEM
   g==;
X-CSE-ConnectionGUID: ph9cYR6yQIWUkamHJfo70g==
X-CSE-MsgGUID: A8gBdP22SWaTxKOydqps8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="24701824"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="24701824"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 08:48:24 -0700
X-CSE-ConnectionGUID: scawFjl2TCCIbXh63Rur3w==
X-CSE-MsgGUID: URChb2e2TJ+0RRbFp6VtOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="67255176"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa010.jf.intel.com with ESMTP; 11 Sep 2024 08:48:23 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 61A3E44A; Wed, 11 Sep 2024 18:48:21 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v1 03/12] i2c: isch: Use string_choices API instead of ternary operator
Date: Wed, 11 Sep 2024 18:39:16 +0300
Message-ID: <20240911154820.2846187-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240911154820.2846187-1-andriy.shevchenko@linux.intel.com>
References: <20240911154820.2846187-1-andriy.shevchenko@linux.intel.com>
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


