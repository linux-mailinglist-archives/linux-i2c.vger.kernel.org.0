Return-Path: <linux-i2c+bounces-13115-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A34B96016
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Sep 2025 15:26:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 838882E1690
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Sep 2025 13:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5F89326D60;
	Tue, 23 Sep 2025 13:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NON6Twrs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D77013AD05;
	Tue, 23 Sep 2025 13:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758633975; cv=none; b=CdwCm5FIYWFIbGW4EcrQIkG5bGgUpWYGYVRq5wCRQnFEK+hijXJIpFG1xRRsHy9sTGzRCKBF8hzZr4q4p/+oYyAUMnzCnoy8jUe8l13Kuc112EQIvFDCoQZtukRaX5TpbSe2Mu01yP4ntIvmCV5WIQL8E9tJjgIIkIwj4syYQDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758633975; c=relaxed/simple;
	bh=Z+CV1XJ0rwLmbrW4LMQf/wuUBUu/s+7mV8q+jAIDfEY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tida3J+nDVe1//3hgq2mUTY+4KXwjMhuvqi8H5uaVrNF7T+ue6j0MyMzBAR4sKHagJHmP+RbeXPJME7/KQ80MMBaRQNlnLR7TCOzBZkRSQVLcriVgDMqodpkMFSiAzpetONwNFafRxUSG0+EHzhm2RuIz7DajaJF5F6sWdQodv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NON6Twrs; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758633973; x=1790169973;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Z+CV1XJ0rwLmbrW4LMQf/wuUBUu/s+7mV8q+jAIDfEY=;
  b=NON6TwrsNiOC3U3nQV20x8OUTJNjzpXMhx3O5Kae3L/RF7mCQQbfbtxW
   M30JSHe/YcL2kZ3wl0IxUdwLMWTYXhrDKAZT1ovFa1YHGBhEq2ov1ZW/l
   7nfjcIjBMuMVkQ9wqlvjbMfew9kPk+B5XCuZXRF9n9qb43TQJThEsJ55z
   Si51OB7n9yF3ssH+h0ntzU1ppOezNffeUVxalGDIVN/bRS9o0cRYkA6gh
   DqgUOv1azmk6sDYGDGLpLQ2RsLKRWt2ousysgLCkqCs2RjwzhEgKT9rKi
   5oVn7jgg9LSJdDXRZ3hhc0vcDSJ5vbhY1LUKl5nHrUvO5Z5gILzCtm9vM
   A==;
X-CSE-ConnectionGUID: HUOzoEFIT2W4XBLMxgc3Cg==
X-CSE-MsgGUID: O/avfCDxQq2HaJx7yFuPNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="48480737"
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; 
   d="scan'208";a="48480737"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 06:26:13 -0700
X-CSE-ConnectionGUID: j30tIlVbRaq1rUibIQZVNA==
X-CSE-MsgGUID: Jmlse9t5TW64i4gE9DMFCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; 
   d="scan'208";a="181149946"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.151])
  by fmviesa005.fm.intel.com with ESMTP; 23 Sep 2025 06:26:10 -0700
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH] MAINTAINERS: Remove myself as Synopsys DesignWare I2C maintainer
Date: Tue, 23 Sep 2025 16:26:03 +0300
Message-ID: <20250923132603.50202-1-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

My address is going to bounce soon and I won't have access to the
Synopsys datasheets so I'm going step down being a maintainer for this
driver.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 520fb4e379a3..b9fc91b4ce4f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24486,7 +24486,6 @@ F:	Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
 F:	drivers/media/platform/synopsys/hdmirx/*
 
 SYNOPSYS DESIGNWARE I2C DRIVER
-M:	Jarkko Nikula <jarkko.nikula@linux.intel.com>
 R:	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
 R:	Mika Westerberg <mika.westerberg@linux.intel.com>
 R:	Jan Dabros <jsd@semihalf.com>
-- 
2.47.3


