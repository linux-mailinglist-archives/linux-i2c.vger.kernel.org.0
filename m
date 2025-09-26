Return-Path: <linux-i2c+bounces-13203-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5BCBA38CE
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Sep 2025 13:51:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B83FE189DC05
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Sep 2025 11:51:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AE832DF6F4;
	Fri, 26 Sep 2025 11:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="noe2UbZ0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AFE2D0601
	for <linux-i2c@vger.kernel.org>; Fri, 26 Sep 2025 11:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758887462; cv=none; b=r0dYsrKBtddY36PmRiZpMrepRubw5eA01XlXRliuukOYdeO8sGI5QpELhAiQ7HV7kU8t1vR/khwPI2WyGlp4gQKsMwVZbM7YY4cqiVm2kUld+4aia1oldDs55F5RjADgkGuMWDwLyH+Oki8LiQEJC6fDyvCwigHrAEnyNOvWs14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758887462; c=relaxed/simple;
	bh=iGXf2lFbJgBzBX6TlMw9Mz/MBteNFTUj6MeTDF5LQic=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qE9Fs+6Uj1LofWY4gIS5VlUAol3vZLX7UUHT1waKbqAnjDniC18TivuEWbA/bHKhrLKDtcI0G8XG8AbQZCcf29u7zp6sP1XRNXDaT11P+8hqNS3PCy0USym8x7LxBk/sLDZ6SK6TO71zxgL9J5ncj4WlNG8tGgOj1+C7CnOWITw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=noe2UbZ0; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758887461; x=1790423461;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=iGXf2lFbJgBzBX6TlMw9Mz/MBteNFTUj6MeTDF5LQic=;
  b=noe2UbZ0RRiMDLk3qUT+lUNBd4kKc+DrSCy1tchZZB/pxj3Pw096c2Ik
   HbRD/GKRg+kZcOGh1oLV/cuU70glSflFoZfg7UgjRa0R/9NO/gHxo+qel
   XAF1dt7aoSo8BuAkq7M6DqmpFqo/47uo28sLmG5k3+IysImumkKAbcLyJ
   Zr3EFGNbSM9WcGQ2k+XatliPwTvoI4KAStG4FPnaexp/iGai8Bi9JbG34
   L8iQBeBBNEZjoAgfEki/oFucVLulbxkYPjRAbaRFvZ1rRsPKJM9g9muJF
   eAAAlReFDlTXfDF15GZG5gz4GEU3aIVs3zzRWEYOsNNQGn+c5q4jjaJPE
   A==;
X-CSE-ConnectionGUID: huB1CrinRsWXGvnIFJkIhw==
X-CSE-MsgGUID: xQDYvr3aRTuBc/3eR9DNEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="61108805"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; 
   d="scan'208";a="61108805"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2025 04:51:00 -0700
X-CSE-ConnectionGUID: B7krq+7LSc6T9Z5HECJSvw==
X-CSE-MsgGUID: +nickYMLQhm8q2qMzjcbuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; 
   d="scan'208";a="177161022"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa009.jf.intel.com with ESMTP; 26 Sep 2025 04:50:59 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id AC08F96; Fri, 26 Sep 2025 13:50:57 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-i2c@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH] MAINTAINERS: Add me as maintainer of Synopsys DesignWare I2C driver
Date: Fri, 26 Sep 2025 13:50:57 +0200
Message-ID: <20250926115057.3752771-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I volunteered as maintainer of the DesignWare I2C driver, so update my
entry from reviewer to maintainer.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e2330f9a5d76..d256222abf99 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24481,8 +24481,8 @@ F:	Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
 F:	drivers/media/platform/synopsys/hdmirx/*
 
 SYNOPSYS DESIGNWARE I2C DRIVER
+M:	Mika Westerberg <mika.westerberg@linux.intel.com>
 R:	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
-R:	Mika Westerberg <mika.westerberg@linux.intel.com>
 R:	Jan Dabros <jsd@semihalf.com>
 L:	linux-i2c@vger.kernel.org
 S:	Supported
-- 
2.50.1


