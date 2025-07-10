Return-Path: <linux-i2c+bounces-11894-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DFFAFFAB9
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Jul 2025 09:21:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BA8D71C81D0A
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Jul 2025 07:21:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 432F2289E2E;
	Thu, 10 Jul 2025 07:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RKyODRN9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1A728935D;
	Thu, 10 Jul 2025 07:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752132010; cv=none; b=tXF3ARTz9rT4BdxlHXnECUQC4b5NPbnh/g6wGkbJ0kn2OM6lKOl+HY3yF8XKqDAUAuXLiUXWMQlk0Qd1+11AuCIvnyaqHgt1BlJKj3BEy901gsPop4o9AW4Wo0deJVfGhk/onKFtS/2pe5vqHPRB4s0s9kUaRkBTQxCXAOl0L+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752132010; c=relaxed/simple;
	bh=eDgyFNCgu4JicpIGG07OSk6fqOrWP0ja+PHV9H01Oa0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JYvNAx9IOVaAHkarDfsZXU3zjMbqPBFPMdQ/bDGJa31S4ppLelwuKlW20U93TpE47oBkeANt53+2u3jMy3IKtTCKbE38b8Q4VXbDSyzXhkW4pycXD9VrHBYE3xevgkeW9JZxQot4+RA7oIyq2LvwtVHk27AFIYO6wgFiwn4HpG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RKyODRN9; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752132009; x=1783668009;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eDgyFNCgu4JicpIGG07OSk6fqOrWP0ja+PHV9H01Oa0=;
  b=RKyODRN9tHOs+AKUzRPz3OSFCuxlur0ngU5Du6/9lvJkQIo9/oyXQGn6
   5GAO+ds8cbXwmzBeVXgvi23VgRrn/UbN9PCuB2uZm37aNUEloxlR9HG/Y
   Kdpj/ku2MB6fxo9rZLy8Mn/Y/W8btqju+Mwl+32H5NVp4fXFUXQHHgPJx
   b6JqwBKPz7rWiOKQ6nCS9Da5SVhp9bGwp8H+V6weqLnB8lv9ZpfMYrVCd
   WHAGtp9BMfotoGG6Cdd8gdjfOPdtK40zXjZEACCRfJjP+gnl2ZYc76sUO
   jLJ8MVzX7ANHk5FIFQEu6pAfd/xAKYgk44izrJpzUELKKPbM71JAChvVG
   w==;
X-CSE-ConnectionGUID: QW4nJl0ETcaN1S3UODsUQQ==
X-CSE-MsgGUID: namH3tddQXGefmwesxks0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54256746"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
   d="scan'208";a="54256746"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 00:20:08 -0700
X-CSE-ConnectionGUID: wxyUNwkBSaqM6p7EKD6arQ==
X-CSE-MsgGUID: c534Jed4S+e0kQ6Jkn6abQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
   d="scan'208";a="160324007"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
  by orviesa003.jf.intel.com with ESMTP; 10 Jul 2025 00:20:03 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	thomas.hellstrom@linux.intel.com,
	rodrigo.vivi@intel.com
Cc: jarkko.nikula@linux.intel.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	andriy.shevchenko@linux.intel.com,
	mika.westerberg@linux.intel.com,
	jsd@semihalf.com,
	andi.shyti@kernel.org,
	raag.jadav@intel.com,
	riana.tauro@intel.com,
	srinivasa.adatrao@intel.com,
	michael.j.ruhl@intel.com,
	intel-xe@lists.freedesktop.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH v7 5/5] drm/xe/xe_i2c: Add support for i2c in survivability mode
Date: Thu, 10 Jul 2025 12:46:12 +0530
Message-Id: <20250710071612.2714990-6-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250710071612.2714990-1-raag.jadav@intel.com>
References: <20250710071612.2714990-1-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Riana Tauro <riana.tauro@intel.com>

Initialize i2c in survivability mode to allow firmware
update of Add-In Management Controller (AMC) in
survivability mode.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Reviewed-by: Raag Jadav <raag.jadav@intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_survivability_mode.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index 1f710b3fc599..41705f5d52e3 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -14,6 +14,7 @@
 #include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_heci_gsc.h"
+#include "xe_i2c.h"
 #include "xe_mmio.h"
 #include "xe_pcode_api.h"
 #include "xe_vsec.h"
@@ -173,20 +174,22 @@ static int enable_survivability_mode(struct pci_dev *pdev)
 	survivability->mode = true;
 
 	ret = xe_heci_gsc_init(xe);
-	if (ret) {
-		/*
-		 * But if it fails, device can't enter survivability
-		 * so move it back for correct error handling
-		 */
-		survivability->mode = false;
-		return ret;
-	}
+	if (ret)
+		goto err;
 
 	xe_vsec_init(xe);
 
+	ret = xe_i2c_probe(xe);
+	if (ret)
+		goto err;
+
 	dev_err(dev, "In Survivability Mode\n");
 
 	return 0;
+
+err:
+	survivability->mode = false;
+	return ret;
 }
 
 /**
-- 
2.34.1


