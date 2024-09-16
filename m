Return-Path: <linux-i2c+bounces-6787-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C19BF97A0FC
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 14:03:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8BD83284ED8
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 12:03:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BF58156F53;
	Mon, 16 Sep 2024 12:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UVytRDYQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B818C156237;
	Mon, 16 Sep 2024 12:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726488168; cv=none; b=pLsq+0xZPg07rC9S6Le6iuDTpikwmkYx0zFquTFe+ix+s4PT+KqLmPfL6FpLxCa7baWCMmpndejLaTI7Jv/pZ7XBEyMzIpA2bMcuo3xdTjVUB95jG1loqd20qyzX8+bSJnTQ79jE5xEapTpjPikouomu39kV0PAREbwxYFDB09A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726488168; c=relaxed/simple;
	bh=aL3gCHi3APo2vDRNIL3hkz/MXq651eltciPJzDM06GU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cD0xxMf51C/jpewPLNSJU9EQmUlq+mJZOzhkwp0SYOfgq16u505eBtvDofBnfldJN5S6tn7nvViEf/Qq+mf8IuNVMU+AbiEaGDYS2Nzkyz3hVww0PiBEZKuPBpq9txMA0MdhGKJDBZrSPSogUG8xTAKpC8wR0YAaaz3iyD7oRlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UVytRDYQ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726488167; x=1758024167;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aL3gCHi3APo2vDRNIL3hkz/MXq651eltciPJzDM06GU=;
  b=UVytRDYQVh7Bs29AwvokblmLT6fOnTFuWDBxcg5A+vlbnCeh1U5n49Qb
   afUouYIIVlsLmQFofFIdBgi9MM8XP2hiKV6XanIxWHubz5IB1hekzq59x
   LSM67OjFm8vCQIPU7Z9ptcs0ZHTLq6OrBeClv8maablKHxZI4+H7yTlq1
   nouYav42GcfqDBc+jqogBDDNM/rRo95AQuPVkWO5eqahmOFGDAgAolN/u
   DxR/8/w2iHzmVakkxkT8lsRZSPQyv//8jKG1L7vqvkrms3AipiGWN7Whx
   JiSGKu4KmKNdxuvVUoTHz8o7AxGxWI8q75uNyiq1P7g/gVX9LKTUJVaMa
   g==;
X-CSE-ConnectionGUID: vtgbe30MSIC17aZ7PgqQZQ==
X-CSE-MsgGUID: c+NZVy1/TumroeXqRLqLxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="24842819"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="24842819"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 05:02:44 -0700
X-CSE-ConnectionGUID: bl69jk88RZOBUYbkJMIvDw==
X-CSE-MsgGUID: 6I/rRm3nQsOIeIN684yRgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="68540779"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP; 16 Sep 2024 05:02:42 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id F406868A; Mon, 16 Sep 2024 15:02:38 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 09/11] i2c: isch: Don't use "proxy" headers
Date: Mon, 16 Sep 2024 15:01:36 +0300
Message-ID: <20240916120237.1385982-10-andriy.shevchenko@linux.intel.com>
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

Update header inclusions to follow IWYU (Include What You Use)
principle.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-isch.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-isch.c b/drivers/i2c/busses/i2c-isch.c
index d71a42fd9dd9..1a18a276a857 100644
--- a/drivers/i2c/busses/i2c-isch.c
+++ b/drivers/i2c/busses/i2c-isch.c
@@ -11,15 +11,17 @@
 
 /* Supports: Intel SCH chipsets (AF82US15W, AF82US15L, AF82UL11L) */
 
-#include <linux/module.h>
-#include <linux/platform_device.h>
-#include <linux/kernel.h>
 #include <linux/container_of.h>
 #include <linux/delay.h>
 #include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/gfp_types.h>
 #include <linux/i2c.h>
 #include <linux/iopoll.h>
 #include <linux/ioport.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/sprintf.h>
 #include <linux/stddef.h>
 #include <linux/string_choices.h>
 #include <linux/types.h>
-- 
2.43.0.rc1.1336.g36b5255a03ac


