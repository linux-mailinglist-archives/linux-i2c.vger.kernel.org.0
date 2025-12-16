Return-Path: <linux-i2c+bounces-14575-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 779BECC329D
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 14:24:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 305EC3020399
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 13:23:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4A0E390212;
	Tue, 16 Dec 2025 13:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IFteMunX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A23385CA0;
	Tue, 16 Dec 2025 13:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765890890; cv=none; b=leBSB9VlStvzbS33UPBoImI+AJRTPz1iRKc1gzucCi7sDJahKyKbFLsBabvDjUd1p1HmgZ2BzhnsT2Bg9r8EJssQ8ftKtqN8hAmkPTvFwMGaPnLhyJH6MSa4V5ljdGnw4XR/YMx41u+/m0il7pvRlzU2MPWw3/jmGRTDF6u95pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765890890; c=relaxed/simple;
	bh=g/FAKSOM+0mGebbWP069VvgRvcLapr4auEHHgceN9pw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y2HRNoegEDovNM+iE5AnpVqCZ0lYeXK138I1DEk5D9fiEytvAqeLPcUkMNWJvyq+9QYpFx/sTu8lwD02CqTrOeCRHE7iEP/GwR2kXJrBz6TuvkGAQNg8yBaamnN8LB+uCRQKVYgdl3yvXzb6Gbn0hyciZonCIG/XQOszjgCfpKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IFteMunX; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765890889; x=1797426889;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=g/FAKSOM+0mGebbWP069VvgRvcLapr4auEHHgceN9pw=;
  b=IFteMunXPh/q6l1LrjND3AlCvwdPCIv7vtY+2vYVYXzlw6G206vbGd7q
   smu30oLGLTY5c1Xea/jwlI0Ciz3gUYtxIZY6tiuT1sI+mcxEfGfVQpvDF
   goBXRt6zfWurU2aJ2gd1K53Iorts6qDMmygx3Xtc2jsnI5ws1/UFzQrba
   +fCgdbLvnC/v/06Zw59ASKbJt9Ey491vfMqHD/Qg8T77xmdi6Nngvkcb0
   ULdl1nHRdPy0Ixf9rL7qMAalr9sgr3mAg0ugx7EwSE4+FKd0k1yjkGqi0
   K6/k2Hb7yLi0mrMCVTjW/Hixa5DgrIsmEu3Y/x/PQgeENmXU29pZ8lk5n
   A==;
X-CSE-ConnectionGUID: VJwuq7GHTCSjFsJs5dB0yg==
X-CSE-MsgGUID: rIHohJAxRB+eRQqrcomdrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="78444897"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="78444897"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 05:14:49 -0800
X-CSE-ConnectionGUID: QVvREVNeTXSpYeXhhkPgtA==
X-CSE-MsgGUID: uULAZdFzShS6heAwA502Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="198274407"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 16 Dec 2025 05:14:47 -0800
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Jan Dabros <jsd@semihalf.com>,
	Raag Jadav <raag.jadav@intel.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/6] i2c: designware: Remove unnecessary function exports
Date: Tue, 16 Dec 2025 14:14:37 +0100
Message-ID: <20251216131442.8464-3-heikki.krogerus@linux.intel.com>
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


