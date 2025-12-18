Return-Path: <linux-i2c+bounces-14644-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ACEEECCC6E7
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Dec 2025 16:17:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8DE863097C88
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Dec 2025 15:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A104F349B12;
	Thu, 18 Dec 2025 15:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DRxgNI6q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722E21CEAB2;
	Thu, 18 Dec 2025 15:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766070923; cv=none; b=QLatm0LC1A9BajjxkG1zgr/uFrrNn7uX2etjGfXaCgewCLW67lFEW4oOyJ0cSZkRye19oMSDDms9KPkydQjO+Q6dFH+wAPoVIZFYpKlimVGbd8pOe57jymBlgB3fNT2hQEVEg6F0Q4mWRWkfbQD9r1TSSYwneNH2l8xAJZ49Ht4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766070923; c=relaxed/simple;
	bh=g/FAKSOM+0mGebbWP069VvgRvcLapr4auEHHgceN9pw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rRwPR2utUljhtW0Lo6LaG0WuqVf+NKh0DnZXLv4w3NOSgWtQuP+2ruAXLlL32a/17GZkLQizPspY3aZqbnlPROphmccvVEhJ03b7xNAR1cDj4JpGGx3ciDMwNHB51BsPZc69zznw4tddInNZ1zCDhrpCSvpScEeH4czSfpjw30s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DRxgNI6q; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766070920; x=1797606920;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=g/FAKSOM+0mGebbWP069VvgRvcLapr4auEHHgceN9pw=;
  b=DRxgNI6q34txwdZm1xgxQvHL48aHeC4TN6P75ziUuTfwzmFolpTo6bRE
   6eavUv3A7o/+MXz6TAAzeXlLv+/EBi3W1XnyqJ4gGuo8DJYZPdxeEx37s
   nVMtpg/sVnasN9barl+5RZciswOHTSUyJc2SoKR8vcs3dM1efaa0gyn3L
   ZZni2RT+V/0nfUteFzQMb3/XV2WwXQPvuw+kzUpD4DYdX2pb7h7Is32HA
   BK1rI4xRrarlMbNOd/QcFs2I7vS/qZM0LOA7ncBVZx/6MlNADp1whxnG8
   Mr0JX1sKq9JgLIUNqxG4saR366kyXx0toC68ykfaf27Y5ODn/KpJVoUtC
   Q==;
X-CSE-ConnectionGUID: rBye3kOjSaqj2wdAt2sSmg==
X-CSE-MsgGUID: cma6Ou1oQKGV3CIDzIJ/yA==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="78739524"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; 
   d="scan'208";a="78739524"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 07:15:16 -0800
X-CSE-ConnectionGUID: QbV60AHPR7GEek7JdynQVw==
X-CSE-MsgGUID: UI7Cxw6XSmWoWGOhxFZGtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; 
   d="scan'208";a="197857491"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 18 Dec 2025 07:15:15 -0800
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Raag Jadav <raag.jadav@intel.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/6] i2c: designware: Remove unnecessary function exports
Date: Thu, 18 Dec 2025 16:15:01 +0100
Message-ID: <20251218151509.361617-3-heikki.krogerus@linux.intel.com>
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

The master and slave probe functions are only called from
the core.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-master.c | 1 -
 drivers/i2c/busses/i2c-designware-slave.c  | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index f247cf323207..15b3a46f0132 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -1101,7 +1101,6 @@ int i2c_dw_probe_master(struct dw_i2c_dev *dev)
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(i2c_dw_probe_master);
 
 MODULE_DESCRIPTION("Synopsys DesignWare I2C bus master adapter");
 MODULE_LICENSE("GPL");
diff --git a/drivers/i2c/busses/i2c-designware-slave.c b/drivers/i2c/busses/i2c-designware-slave.c
index 6eb16b7d75a6..1995be79544d 100644
--- a/drivers/i2c/busses/i2c-designware-slave.c
+++ b/drivers/i2c/busses/i2c-designware-slave.c
@@ -277,7 +277,6 @@ int i2c_dw_probe_slave(struct dw_i2c_dev *dev)
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(i2c_dw_probe_slave);
 
 MODULE_AUTHOR("Luis Oliveira <lolivei@synopsys.com>");
 MODULE_DESCRIPTION("Synopsys DesignWare I2C bus slave adapter");
-- 
2.50.1


