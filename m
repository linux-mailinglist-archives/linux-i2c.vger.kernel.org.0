Return-Path: <linux-i2c+bounces-11611-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AEDAE9F84
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Jun 2025 15:57:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 845693BE891
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Jun 2025 13:56:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DC7F2E7648;
	Thu, 26 Jun 2025 13:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gu9wGki3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C8A219317;
	Thu, 26 Jun 2025 13:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750946207; cv=none; b=Vc/15n1XW5bsS9Bves+AG1Dxrq3pJKMA5uJcsq+6UAFpaiv0yUMc2N17+7GHt///lyW1tzrRJAZVZrapBAbSsMdPOIAvGwpbJArZg0DsVA5yms0YntFWhlSfnkTBnC166KdWdLnGpEhq6xfxKITZE3wr6CDHbZLgmryqPbdeu20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750946207; c=relaxed/simple;
	bh=FSCdKuBZu83ZlNuhWTKve1fHQ1SiZ+gddU/oetdw40o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GRuJRHDY7vc/9IXwU213g9KCw/Ksa7Ln5hoorpMCCULegzg8lp5sAMIeqji81L0nUeBqZ7T6rUGhgKW8ZTi4GqdLT3/fXgkkusqXFVj9KlA/wh0tML8D2hvTlTZSJTMP3fEqFjPqVjZRRmcuN+MfVPPmlv3vugzCzxGvDuM27Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gu9wGki3; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750946206; x=1782482206;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FSCdKuBZu83ZlNuhWTKve1fHQ1SiZ+gddU/oetdw40o=;
  b=Gu9wGki36/FQ9vlpgReEXEHXZlF3N5bSJmXhweqPF5Zomh/KIh/aDIyP
   PhlpGsytsaD5/MAZLzBtnhDUrH59LJb9OFly6QbnYUNhniL+rFj0E2GWJ
   zZJbnGnaoJn3w1U7qtlsBKHaR11ysXBD9dIILX7JI6YUaSF0yLU6M4NcM
   +V7bBw4zCAK1rxOmj0ThMvLRVdyCLtfeh2DrbGHezwYA0h2PT6gt+oond
   K8I75uw3XKT6nxqSf2QCICxb04ZDaSdCloMYczg6vuZa9hkpM2CmKlntq
   38SrwinSdhH11YtwfXVJyc9jiDtpIFJ4HsVl10xxYDWZ7c2xh6E1CcqD8
   A==;
X-CSE-ConnectionGUID: WyJBmFUyQ5uV4+Dtl0+mXw==
X-CSE-MsgGUID: vbdxUcRWTmavgD5Bu2NpYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53316432"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="53316432"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:56:34 -0700
X-CSE-ConnectionGUID: 09+Pw5CDQx2o0FEHa7ZAsg==
X-CSE-MsgGUID: aQiaTLYjRf2OjVS5zgbIZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="152146975"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP; 26 Jun 2025 06:56:29 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Raag Jadav <raag.jadav@intel.com>,
	"Tauro, Riana" <riana.tauro@intel.com>,
	"Adatrao, Srinivasa" <srinivasa.adatrao@intel.com>,
	"Michael J. Ruhl" <michael.j.ruhl@intel.com>,
	intel-xe@lists.freedesktop.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/4] drm/xe/xe_i2c: Add support for i2c in survivability mode
Date: Thu, 26 Jun 2025 16:56:09 +0300
Message-ID: <20250626135610.299943-5-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250626135610.299943-1-heikki.krogerus@linux.intel.com>
References: <20250626135610.299943-1-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Riana Tauro <riana.tauro@intel.com>

Initialize i2c in survivability mode to allow firmware
update of Add-In Management Controller (AMC) in survivability mode

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Raag Jadav <raag.jadav@intel.com>
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_survivability_mode.c | 23 ++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index 1f710b3fc599..3800cc855c22 100644
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
@@ -173,20 +174,26 @@ static int enable_survivability_mode(struct pci_dev *pdev)
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
+	/*
+	 * But if it fails, device can't enter survivability
+	 * so move it back for correct error handling
+	 */
+	survivability->mode = false;
+	return ret;
 }
 
 /**
-- 
2.47.2


