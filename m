Return-Path: <linux-i2c+bounces-11729-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A71CAEF855
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Jul 2025 14:26:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B75B64E03A7
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Jul 2025 12:26:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47962277C80;
	Tue,  1 Jul 2025 12:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fRcf4BYZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C22277CB0;
	Tue,  1 Jul 2025 12:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751372605; cv=none; b=HEQJBampk3cF6lzsRYm52rglxXqDqWJBCTmQuBjchCMy7oeYFLPC7QomKo5twL8Vf4iHJP1EgnI6Uph6AciuAFj0sGf6mgIZV0MVAUylogZZBUpdX6pVY5Gq3aRznaWKIbIgNjk4nUX0mM72vzt+MsOOwSr73sap9cVOSQH9yBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751372605; c=relaxed/simple;
	bh=gSq3WGMYzI+A+QnZWcrD3MEiKdYLg+CcJwmyoCfVs74=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=enXcyjQGvimleO5AHhzoz6pwhgwWiR5PW04jVlzMuQJJ5RDOuYZbuF32FAH21mFid8o+Az8/yiyv5PVWzo2bgcfRe/NZe0Fbp+Yf3hr+ExKSls0Qghc/kgoY4gDWHQuDF6BvZIConRSo9k0T55FTQyVYL17AO8x+vF1nR0PkFk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fRcf4BYZ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751372604; x=1782908604;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gSq3WGMYzI+A+QnZWcrD3MEiKdYLg+CcJwmyoCfVs74=;
  b=fRcf4BYZAKsjsR45hCQ1VaWH+S4SsOIocNEDKJMtvJqmFeO8DX4aSjxV
   jwrMdXWNrJwxjODvGmG6xV/3Db8WU3WAjI2nBzFAsSm8RIb1g5eoXKyFO
   QRAHxKUGHHUAS0Tc8JBsyN4kOCt8zeaqRZvwtUyHRZr7sSO+FJMOa36DD
   iu7icWDJlBCkdB0aqLLrIGijEEL5tFPyjYcg6ZYlK5Pvit3ktDqp2Py2i
   yBsTtr4ibVQtd2liuHmqkn9A+ZXV+VGpZ4zLbwMNsQouHWB0xXwPkDOIp
   g5IQtxX4t6HsBSeLdv67XwkihRANCzrU1TNvwDJLezpI9Ujfm8xh7rY3V
   Q==;
X-CSE-ConnectionGUID: 7ixQ2MI4Q5KdWiI0J1OrEQ==
X-CSE-MsgGUID: 1ErhId1BS9K8FWVe0f0b6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="71196745"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="71196745"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 05:23:23 -0700
X-CSE-ConnectionGUID: t+h40ustS4ub470TWJPQ2w==
X-CSE-MsgGUID: pwwSlZYKQK+CGBavYDtJeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="153157528"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by orviesa010.jf.intel.com with ESMTP; 01 Jul 2025 05:23:18 -0700
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
	linux-kernel@vger.kernel.org,
	Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH v6 5/5] drm/xe/xe_i2c: Add support for i2c in survivability mode
Date: Tue,  1 Jul 2025 15:22:52 +0300
Message-ID: <20250701122252.2590230-6-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250701122252.2590230-1-heikki.krogerus@linux.intel.com>
References: <20250701122252.2590230-1-heikki.krogerus@linux.intel.com>
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
2.47.2


