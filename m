Return-Path: <linux-i2c+bounces-11666-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AC876AEB950
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 15:55:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3BB9F7B714F
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 13:53:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B1582DD60B;
	Fri, 27 Jun 2025 13:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JChMU5Dp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B694D2DD5FC;
	Fri, 27 Jun 2025 13:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751032420; cv=none; b=aMYXfkaJr373ZXDFkPo4o2T8ylXqPV9IXnD3+vK3IcbfH7p0B4p6X3wX4hTpaaa5Gk+yRJFP1UloWhk9XBMEyGSKoAs4F0sDrwDoNWCoS6C/MJ6oizr+7xLjqfPY+J9+JOGyw78LLj+DsKKNtt1aZ2ZoLEef42Asvslv0nE3YtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751032420; c=relaxed/simple;
	bh=XLp31nXdQ10IwSYFpgADvNGAJ8UeYAI8nzvh+F9vcYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pk5H+tmBcMLdCjw+180UhbzkgCA5dRpjr1lLKocy7i72SKNNPXFnQNgJxGUtbVk/0vw9Nzd1gHXD26/q2w0e8Oe16M8p6ouDde85rqL/u7Q/1hgO7bUmq5iLvob9NufqmV5ISPQL77gDbVYtyaM8p8EuYPpx6zdeVa5+wO8LgSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JChMU5Dp; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751032418; x=1782568418;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XLp31nXdQ10IwSYFpgADvNGAJ8UeYAI8nzvh+F9vcYQ=;
  b=JChMU5DpjygA0z86hh1pRbNsOnxd92zN1tAUgEnLrNJLNYI8Nvn1ogOX
   TaQgrDQRzTLjmJ0l/qvJo11XBby/ovZ9rvqnKWl+UC+VKW11P3kixEFhV
   IWN2Q2r9onI/7wpbIK4aZTlDe0XV/35FwwNRvsNIJxzqv/0if4UBsY20V
   YBRknfztqleK4gWInd2poeupQugweWKbQTaTDsFuwbdFKqqrzJZTtxien
   ej5DKYlaf6YE1/SEQg3wOBvywaalZrEf6qrPfkyvh6FXplhT4YsR4qkow
   ry7U8G0fs5qIKNbBUwE0ODpqZnEdrQssfiMsePbeuk4u3LxWEdBkZ2XKQ
   g==;
X-CSE-ConnectionGUID: e7FvPMknSG+iqD1gBfybLQ==
X-CSE-MsgGUID: uok0VfKTSEiRZuLlh1vqDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="53207640"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="53207640"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 06:53:38 -0700
X-CSE-ConnectionGUID: PnhSAldiQqi/kVZEl58mEg==
X-CSE-MsgGUID: E03t7aYsTHWowJXTZQkhjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="183708849"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 27 Jun 2025 06:53:34 -0700
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
Subject: [PATCH v5 4/4] drm/xe/xe_i2c: Add support for i2c in survivability mode
Date: Fri, 27 Jun 2025 16:53:14 +0300
Message-ID: <20250627135314.873972-5-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250627135314.873972-1-heikki.krogerus@linux.intel.com>
References: <20250627135314.873972-1-heikki.krogerus@linux.intel.com>
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
Reviewed-by: Raag Jadav <raag.jadav@intel.com>
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_survivability_mode.c | 23 ++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index 1f710b3fc599..76141eb2c853 100644
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
+	 * so move it back for correct error handling.
+	 */
+	survivability->mode = false;
+	return ret;
 }
 
 /**
-- 
2.47.2


