Return-Path: <linux-i2c+bounces-14648-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E6483CCC70E
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Dec 2025 16:19:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 133B8309167D
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Dec 2025 15:15:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAECE34C9BF;
	Thu, 18 Dec 2025 15:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hc1NBFSe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E134349B12;
	Thu, 18 Dec 2025 15:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766070934; cv=none; b=kt2GQ83G+jkAEz4D9eQ84pD7alsmzDAvWONx11l0ZrnCA0OzZINkFXdXvEGuQuGsYJTi4GQNVMaktHAJIODgZJ+ON8adeb/lB8hcNbTrs43RGVKSfJoyP3hP5xpFuJcEWyEwFqnyfxlCb0EzqImCz9PlKq6I6VEacWA0L7mQtGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766070934; c=relaxed/simple;
	bh=JWsPyBdpcJM8iDKiSMRwUvtE1BNgxIullQfkoW1yEiA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JZs6tO5+AarLUUEEJo0/z1bSjbkhrKWoDzMYaE5+Eazx1IseYtdVXRNqrCBdEIn63ixRppVZPiCF07DnQJ86Lq6nQyGj9Ar7RKd/aY3kfvHqF4TQEkdXH2h/PWidIZ65zy2AnqW3+7tI8eCcKyDs06KF7AKiYKLJm6stgUW9HF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hc1NBFSe; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766070929; x=1797606929;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JWsPyBdpcJM8iDKiSMRwUvtE1BNgxIullQfkoW1yEiA=;
  b=Hc1NBFSerV0cgW6Yi8/Iu0RJeWZObg+5DWaqd+CRBCa9z/j8GqqvXSHH
   5BZKR3UaNRetm1tB/n3iZW59P6EXLmlB2dnNWNa1ZAFHz29aTkIx0cmoa
   nIgKcTGyrTntMkqC5QnODRqh19EF5vaxDtcAAif/MdC7rMOJ81b2rE0bM
   IFWonz4kATo3140lvYtupGjlQs807FZfMJDeJ3/YMMi9CXCzTEYduskcL
   iT/j7OImnAmtZrfV62NAAu8nQVLvYHtHtK5MfdMym43WxP34ZAEN2BRug
   4KjNKLNeiaWh/oIKF6b3yaaXjlAQ0LdEVGKcyGJ+MPYfvrM9wR/azs29L
   g==;
X-CSE-ConnectionGUID: NqoKE5KVSzWVsktSGHbMjQ==
X-CSE-MsgGUID: sGIFx9XmTK2T/WZ7jT2C9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="78739562"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; 
   d="scan'208";a="78739562"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 07:15:25 -0800
X-CSE-ConnectionGUID: X+9nPRnLRxy047bHEcrcPQ==
X-CSE-MsgGUID: QzIdjzu2SbikTLirXzpdyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; 
   d="scan'208";a="197857520"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 18 Dec 2025 07:15:24 -0800
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Raag Jadav <raag.jadav@intel.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/6] i2c: designware: Remove an unnecessary condition
Date: Thu, 18 Dec 2025 16:15:05 +0100
Message-ID: <20251218151509.361617-7-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251218151509.361617-1-heikki.krogerus@linux.intel.com>
References: <20251218151509.361617-1-heikki.krogerus@linux.intel.com>
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
index aac7b1f4710f..1981dbfa260f 100644
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


