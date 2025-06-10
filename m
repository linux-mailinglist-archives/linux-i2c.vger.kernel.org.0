Return-Path: <linux-i2c+bounces-11335-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3121CAD3320
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Jun 2025 12:05:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D38B174DC9
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Jun 2025 10:05:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7858E28D834;
	Tue, 10 Jun 2025 10:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k5uaUIwL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8E228D846;
	Tue, 10 Jun 2025 10:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749549817; cv=none; b=PittlfBmzRfCoq+Ee/71brIxOWg4scQ7pJ5wSSF/khv8pGGdUvoFjd/ezJ9n5q9GhK0wzpjrLluuic8LkKZWPT3Z1f4jFPC9RnUQQZhj3GaWXCDKmZejEmeqGaY3XyX0kxtfMiQS/xxVCxY+rYHDxF8mnGmwiGKkgJ+TN51lPw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749549817; c=relaxed/simple;
	bh=FSCdKuBZu83ZlNuhWTKve1fHQ1SiZ+gddU/oetdw40o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fb3+4KyxjW/oBqlGlhz9Yi9xPYvt2ABnO8ko0AWn6+lLbXpqnKtqopgDZGcH1VYAMg2ucG6jaGjbEt+izktWuW9W1RCy/B3hJgUwJBGKPxei4ZyVnUVQMESmXDIqIsOgyK9GuSvQncsbpbqE9wjvlO721b0Sd0pH59qQQR626hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k5uaUIwL; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749549815; x=1781085815;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FSCdKuBZu83ZlNuhWTKve1fHQ1SiZ+gddU/oetdw40o=;
  b=k5uaUIwLyJazZwrHSCYJ0cLwh2sT9ib9xnlJp4iHTl59OUTiSzXcflcr
   ljLb2Dh7fmo+h206QofN7SBWz1q6r4pumkc5U/8NKJodOi7gM1h2NyBFw
   VKtciDCrcy5RMwkF5oYqQbmvxzYg4R+/qFLP3uMbCZC0OjHh5WuGbof8f
   HBJ/2WxroJ3NrDu0Gd9PEVSqz+YirGD05GFYw1qcYntH8pFDxaD8i4vhq
   05LbE6O3Bh8eT9E66Ye00q1g11dXTxMdtqSaI2j2+U08q0XZyc39xoTYj
   ryrWvdgPd6VBSx7xcp/p4+vpZmhisYUuw5AwejmDyiDC3wi00ZjWcJixd
   Q==;
X-CSE-ConnectionGUID: a6D39pM1QhWcjGe5zq10Zw==
X-CSE-MsgGUID: vc38FoA7QyujiOXH2EbYfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="69094651"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="69094651"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 03:03:35 -0700
X-CSE-ConnectionGUID: 6jJQ/l85T+OKFWQZAfSeAQ==
X-CSE-MsgGUID: TK+U5QtSQhua4kmfhu7vzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="147295434"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmviesa010.fm.intel.com with ESMTP; 10 Jun 2025 03:03:31 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: David Airlie <airlied@gmail.com>,
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
Subject: [PATCH v2 4/4] drm/xe/xe_i2c: Add support for i2c in survivability mode
Date: Tue, 10 Jun 2025 13:03:10 +0300
Message-ID: <20250610100311.2245871-5-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250610100311.2245871-1-heikki.krogerus@linux.intel.com>
References: <20250610100311.2245871-1-heikki.krogerus@linux.intel.com>
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


