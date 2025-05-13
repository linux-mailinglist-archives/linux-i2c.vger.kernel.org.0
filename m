Return-Path: <linux-i2c+bounces-10957-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EA8AB5517
	for <lists+linux-i2c@lfdr.de>; Tue, 13 May 2025 14:43:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D90947B77C3
	for <lists+linux-i2c@lfdr.de>; Tue, 13 May 2025 12:39:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7811127CCDD;
	Tue, 13 May 2025 12:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g5GuO1DE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C47419E975;
	Tue, 13 May 2025 12:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747140022; cv=none; b=Pi2ax6dIrfKNZkeP6w/GMqP++HbTve433mXAL4EfsCig/DbzBjxZ+IzkSOYJLomAQWMk2UVCSIJRxQlHxLlP1F61R2J0+7RvCs66xlVMkkVbCuk5aYpgv6gyMhoiRFlrY2Ea05hXqwmV2BAaLAl8GeGlv0Zid0u1jxc7O8ygd1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747140022; c=relaxed/simple;
	bh=20X5CqaN/oQtrSsf2qkowYuAjnTkGpDQ0C6wvs0hwRc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QjVR9LR8YI55nUGIbleoOH+Hueftr7bEutjJd7f4S73ykoxmMAH3vFLoFv0zizR6U7DF+bkvP5ZJrGGnYL3CEFmE0RTVQTXB0ySWu+EwOmeyfiD744bQv/ADcKa/Y+4WaUxMv6JgZmsSzedRJ2VIdE4bcR27HekchkYGQO9X6R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g5GuO1DE; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747140020; x=1778676020;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=20X5CqaN/oQtrSsf2qkowYuAjnTkGpDQ0C6wvs0hwRc=;
  b=g5GuO1DEgd8rbL7GTBj4dHOzBRNXTAvw4qo5SkyKppCz2/2mf3FNDnPj
   YMKHe/1g1ZxRFaRLlXkxuRwXgyQuA7UVQPLXrqDVaOq5AKWhGDjAXKaFU
   iwSpo/tYW9zmOAwzO3I6EOAIROqwnL6VEu6QYUu/tNwLZ39eGGdUkV+91
   kiR2pazrWFue4fWzn0z0zALGZZviMcb1YEJhhCfpIfMD9iJ6Mp5AaYuO6
   lul4LhyAx0mQ6cH4/ua+sGpeTfiT3mrcZDLZ0Q/Yn/EgYEklJ51mYWt78
   hboMGmtzRyw5n/gyL1aQlJwdXydPgVThu6Ocx+cDqtYY81qnFJJZ+lCN3
   Q==;
X-CSE-ConnectionGUID: X33HL/pVTeOUxgtxnXvRfQ==
X-CSE-MsgGUID: i4/4jK4uTE+ayGgef0Igmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="48090669"
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; 
   d="scan'208";a="48090669"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 05:40:19 -0700
X-CSE-ConnectionGUID: R8Z6F+80RjKFOEjOnnmYUQ==
X-CSE-MsgGUID: PfyrR670R/W93o9ZGHdMlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; 
   d="scan'208";a="142884896"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP; 13 May 2025 05:40:17 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Raag Jadav <raag.jadav@intel.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] i2c: designware: Don't warn about missing get_clk_rate_khz
Date: Tue, 13 May 2025 15:40:15 +0300
Message-ID: <20250513124015.2568924-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Converting the WARN_ON() to a dev_dbg() message in
i2c_dw_clk_rate().

That removes the need to supply a dummy implementation for
the callback (or alternatively a dummy clk device) when the
fallback path is preferred where the existing values already
in the clock registers are used - when a firmware has
programmed the clock registers.

The fallback path was introduced in commit 4fec76e0985c
("i2c: designware: Fix wrong setting for {ss,fs,hs}_{h,l}cnt
registers").

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-common.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index 8eb7bd640f8d..5b1e8f74c4ac 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -572,8 +572,10 @@ u32 i2c_dw_clk_rate(struct dw_i2c_dev *dev)
 	 * Clock is not necessary if we got LCNT/HCNT values directly from
 	 * the platform code.
 	 */
-	if (WARN_ON_ONCE(!dev->get_clk_rate_khz))
+	if (!dev->get_clk_rate_khz) {
+		dev_dbg_once(dev->dev, "Callback get_clk_rate_khz() is not defined\n");
 		return 0;
+	}
 	return dev->get_clk_rate_khz(dev);
 }
 
-- 
2.47.2


