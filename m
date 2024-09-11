Return-Path: <linux-i2c+bounces-6583-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3A197578E
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 17:50:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C86C28A4D6
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 15:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F7141B5EA2;
	Wed, 11 Sep 2024 15:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hQmqwlZu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629F91B2EEE;
	Wed, 11 Sep 2024 15:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726069716; cv=none; b=Oj1NlgMp63dhXunm7rQVq5x2Xe1bOY9jCh3/dy8tUGy0qXd9uk2GneheuY5DP8GcSpeG/CbD+q6faxMywfDrfGWTuBj5olE57V4x2tjMzxHUYA6bRMHHkxf3dnLYHvVX0o5SuKtKwRkzLM6onZs9xreT+4wl3AvZX8SmUcct6BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726069716; c=relaxed/simple;
	bh=Z85dlwjxQ5jyCTFky2Fj1VuG9sUGBr/josCRaT4zpz0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UWUhTjULZ9o7RwPotcyK6syDaDu9BogBln/WcsIH8cksvju5DLUGF67kP2wwVy8Wa+EsdPnCLPE6zf3TzBF+mgcyF/MiwERbD4WDSs4VKCQ+/J978CsymoNoeZqZhXqItxplwCIHlnYKS/gncMd30PzQ+3FKlXPBUfxa5KU8RbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hQmqwlZu; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726069715; x=1757605715;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Z85dlwjxQ5jyCTFky2Fj1VuG9sUGBr/josCRaT4zpz0=;
  b=hQmqwlZuHE/Hl3kVh97ENxj0h+DJU6uOBgxuQuCvDeacHw9Bz1eAOdTN
   geqWsXcWw75XiWPW8/DuSlPKBsQSlbxwhdK9TOfJE4aHotliOlXo91tps
   Qqk+Ga4z1yCgi1dFe4WQGIsQBCDWeuYe2cHpsnmX1K9KXtHPMv2V6ifNU
   2wwRPLMGmD0/ILxU0E3KBxw5sNk74wAY/SyAy7iUucz8ORgFeDogn7SFl
   JOl5Cz2yFNGE6+Nkp+0SVsO1LU1KhydbjOKLuGs3d4OfpUFYXy3fHaL+0
   LLICTgsssIcH1xvlHDg3FKuiUpPSMp9TDbvw74LVEEw5ofwL6oEF7meP/
   g==;
X-CSE-ConnectionGUID: GYd2dIk9RI+oVBzAaFAagA==
X-CSE-MsgGUID: IZUJiaTeSHqQUWB0Esabcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="24701861"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="24701861"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 08:48:27 -0700
X-CSE-ConnectionGUID: MuNGJxScSp6I5jGOi5gsBA==
X-CSE-MsgGUID: l2rauxjeQZCPelNupG0eKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="72388569"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 11 Sep 2024 08:48:25 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id BF6C65BF; Wed, 11 Sep 2024 18:48:21 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v1 11/12] i2c: isch: Prefer to use octal permission
Date: Wed, 11 Sep 2024 18:39:24 +0300
Message-ID: <20240911154820.2846187-12-andriy.shevchenko@linux.intel.com>
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

Octal permissions are preferred over the symbolics ones
for readbility. This ceases warning message pointed by checkpatch.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-isch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-isch.c b/drivers/i2c/busses/i2c-isch.c
index 8fa48a346e12..a6aa28000568 100644
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


