Return-Path: <linux-i2c+bounces-14579-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DD2CC34F5
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 14:44:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 21D643035A41
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 13:39:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03F86393DF2;
	Tue, 16 Dec 2025 13:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ElWVQPTA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E05393786;
	Tue, 16 Dec 2025 13:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765890898; cv=none; b=RSKorZirMA6qbWkF97xPIhbTDiL4/ejIxRPJVSfR6kDxShpj5aNFh4i+x8Ms9Exy9p2/2WTOTEf/UYkgy8YjLTWniKHb54SPHfMpjl3poaxFomRZD5cKJ9UQCi7AZRURa2wVj4Y6KgXmzkTSWXUAaoqOvGYHsOFgu4d1J/c8BqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765890898; c=relaxed/simple;
	bh=0h1eC1lmvQOz1bOKx+cUVuZEUfivwprQcZPj5o6d014=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j7MYCxqVk0petofFLiVGzlxA9RHin2iDmaQT+Cx/oqkDYIuwgZ/rkz8yQvhlupsLs02kC3CKcEAxfmYuTtzmX7RTho1SJI6kbamv/kkHrCYbqIBO+E2x8rFiBXawsW6wxqH2MEhppOEtoLT1Hl7r5E0/Q0E1BYXGsXnhPOI36hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ElWVQPTA; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765890897; x=1797426897;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0h1eC1lmvQOz1bOKx+cUVuZEUfivwprQcZPj5o6d014=;
  b=ElWVQPTAqzf7HjxEXIuCoZI55N4eEFmbTkbbz9kQXy1zNuGOz4B+2hwa
   WDrvr6lz2YRL2r+Xep6geeXhvoIbzwwBvG7/EuC9T9bgCpktXQbsefjdr
   Ro1a8axtOl0qeDk1rLGYmSXtBk5eNo+XCbLpWuruQVBs9rYlR6WoLlOAH
   IGQvrq2yz3RJaGM3F03cEdDfVmNCyKfnT3eH6tBww7OAquHjlVsxPL4U6
   MxrWJts7MMtWCnRVK1yqWfEj2qr+9nvu35PHe7UWRbILSXXpjzaG6UIOq
   3pq3jsg7XMEEDgKqEvuZ0q7A4tNHVUc3GElSe/0fpjBDwmzs8tA15gajn
   Q==;
X-CSE-ConnectionGUID: ElN0KTqdS12vLj0S+S3Wjw==
X-CSE-MsgGUID: HVG6nixoTe6rkFmolV6glg==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="78444927"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="78444927"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 05:14:57 -0800
X-CSE-ConnectionGUID: 13KbGT/MSTy8z6B0UqTq3Q==
X-CSE-MsgGUID: Ic5AX7zlT26+e+6dzB1shw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="198274426"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 16 Dec 2025 05:14:55 -0800
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Jan Dabros <jsd@semihalf.com>,
	Raag Jadav <raag.jadav@intel.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 6/6] i2c: designware: Remove an unnecessary condition
Date: Tue, 16 Dec 2025 14:14:41 +0100
Message-ID: <20251216131442.8464-7-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251216131442.8464-1-heikki.krogerus@linux.intel.com>
References: <20251216131442.8464-1-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Writing also the high speed timing registers unconditionally.
The reset value for these registers is 0, so this should
always be safe.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-common.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index ca229202a4d7..a62395571349 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -391,11 +391,9 @@ static void i2c_dw_write_timings(struct dw_i2c_dev *dev)
 	regmap_write(dev->map, DW_IC_FS_SCL_HCNT, dev->fs_hcnt);
 	regmap_write(dev->map, DW_IC_FS_SCL_LCNT, dev->fs_lcnt);
 
-	/* Write high speed timing parameters if supported */
-	if (dev->hs_hcnt && dev->hs_lcnt) {
-		regmap_write(dev->map, DW_IC_HS_SCL_HCNT, dev->hs_hcnt);
-		regmap_write(dev->map, DW_IC_HS_SCL_LCNT, dev->hs_lcnt);
-	}
+	/* Write high speed timing parameters */
+	regmap_write(dev->map, DW_IC_HS_SCL_HCNT, dev->hs_hcnt);
+	regmap_write(dev->map, DW_IC_HS_SCL_LCNT, dev->hs_lcnt);
 }
 
 /**
-- 
2.50.1


