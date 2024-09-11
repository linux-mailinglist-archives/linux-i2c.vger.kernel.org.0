Return-Path: <linux-i2c+bounces-6582-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D39F1975797
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 17:52:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 12509B28EB9
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 15:50:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E58A31B581D;
	Wed, 11 Sep 2024 15:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fEup0Q8q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3702B1B29DD;
	Wed, 11 Sep 2024 15:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726069716; cv=none; b=FQMD85KTz/A6yukktG82P3ogjYqBwutxW/wJdphei782ixC6V9lZxb5fS75zyQC4YVd6SCevqeCSz2S4r3LzL+JwtRlj2ODYWhXUvLR5bpyuMhq6TvfW6T6HCbmvJf79KJ9CPdwKEx1vdRWUBZHZeAO8QCukfkG63rzla/x81Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726069716; c=relaxed/simple;
	bh=SC6aPHjvdUPkLLyTAuTyV/dPbapcW7yTm63oCTE93ew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cMNFhyRlQgJEgksZ8AX1Ug00+Ooz1w7h5sfH8sAYMHj8rxTt8j0rnW/ID5ZrLXUQ/cUEsiC3F6I1jBbLoWSXMdluQHRd/Fgr6T0yIN6iotNwUjtM79OILe1TKpH9Gh9x9ETsNmSmPsRzhVscwKIlxboV7MvaWspgQCze0DQcWSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fEup0Q8q; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726069715; x=1757605715;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SC6aPHjvdUPkLLyTAuTyV/dPbapcW7yTm63oCTE93ew=;
  b=fEup0Q8qwXeQk4yLLKWf5dWfDKMjRhGXX4hAEzQOzPm8pnz5xOTnIpUY
   93hJJmJwZiEH68L36PFm2idExPgoojI7dfNWInZGiCpOd8qWn5fQq280i
   KIU39bcKN8Qv/epnsoDUNjeRBXnz1tGYxysyIoR6UY4M0ajQJVQyblobE
   WM2/kg+M9zlrr6PVE++4XZjeHJCo9jQmbp0+gkz5jyr0e0Rx6GRHuZDY1
   6aY7sN3RxOsy/Su7r9NPD6Myw1t7mlT+UNTND+IP3zisCQlmRq+oJONg2
   lUySemj/ccuSV3OXy0DVpsjmZC1Xovfj96RR3/HuquyNvPAC79eplWPHN
   g==;
X-CSE-ConnectionGUID: AiIrEIChRGWUn8yAv+oOYw==
X-CSE-MsgGUID: J36VlOVRRlCNCdU3s1IdDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="24701858"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="24701858"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 08:48:27 -0700
X-CSE-ConnectionGUID: bpd5qyd/RKOi50ZucUOrxw==
X-CSE-MsgGUID: 1iLSTESwSo+G3VLYqm9h+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="72388568"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 11 Sep 2024 08:48:25 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id B67D6593; Wed, 11 Sep 2024 18:48:21 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v1 10/12] i2c: isch: Don't use "proxy" headers
Date: Wed, 11 Sep 2024 18:39:23 +0300
Message-ID: <20240911154820.2846187-11-andriy.shevchenko@linux.intel.com>
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

Update header inclusions to follow IWYU (Include What You Use)
principle.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-isch.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-isch.c b/drivers/i2c/busses/i2c-isch.c
index bb5e09feea61..8fa48a346e12 100644
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


