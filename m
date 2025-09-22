Return-Path: <linux-i2c+bounces-13083-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 433B1B910DF
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Sep 2025 14:07:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 27FBF7B0C3C
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Sep 2025 12:05:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A8D2308F30;
	Mon, 22 Sep 2025 12:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jq6gBx9G"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF652306B09;
	Mon, 22 Sep 2025 12:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758542804; cv=none; b=eRd62yqC3sKTBHKF0kYLHDlyxbTE/zMIuoHrqC7UznieoRjbhkRYf20Z0mPpcJno0+iuPNOgOStsV50W2q6fX4CWuTfr8rWSmUrGAO0pN7eWNQ62DJWfBvyoRD1c5kmpP5cS6bnA23A2/l2snQRJhOVyPHaAl39l7D7xeUydGGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758542804; c=relaxed/simple;
	bh=BqqaY02AaKRz6FYXRgBC7tGdga5OnpwR2SDTy3uOWLI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JwKr2bbzagI+wxKj5Uz6/fr9vSJVdRfPXyUsO15woyYz2su4L4lnscz8SxU6ER52Ho/RzDYZQkYuX0OpGWv1W+/Oa7vcFbSTBZV0dS4igEHYp3NscW8KRKlUO9vXkHUBM2O04ziXZgU3KEYdpnzByL+KY1mKueRk02C6IOS8Re0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jq6gBx9G; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758542802; x=1790078802;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BqqaY02AaKRz6FYXRgBC7tGdga5OnpwR2SDTy3uOWLI=;
  b=Jq6gBx9GO68WFLd7zbBeca7AZQ5HVCTuyXccU/f6kAZcwKjOx8pcsX+4
   f7PetNIdpHb8az7v9Q8jn3Dm0RVzVf2OqKwsnWfKqNNQAapnAtanmqb3n
   Yn5ACULnysPYB2NTrh1G/QHvU/BLKMpsg8tKQxU/ElZ5eNUVcXUtFHE2b
   wDop4Nq7R5CffO3ZlwAsFEyYsdZgvnHh3pFHllFrt9PM6ColSu9tx2JWY
   d4jttuxQKkmW+ecFT8crhg/HFauF8KQPhx/pl5YVjQPpNO4BIRy4DPQmA
   64HWJV+Ekvs+XdYQUA9xDYESyMrfWhme1+Q2CbrU8EECgItnEiQcs4EQ0
   A==;
X-CSE-ConnectionGUID: pj/7MX/XStCeHk0nrOHlEQ==
X-CSE-MsgGUID: kXrO0miXRdi/Zld322YywA==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="63431642"
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; 
   d="scan'208";a="63431642"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 05:06:38 -0700
X-CSE-ConnectionGUID: pzO72+6BRwejA/Z5VIiATQ==
X-CSE-MsgGUID: LeALQ2uhTX6inN6lFWINnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; 
   d="scan'208";a="176842517"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.61])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 05:06:35 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 01F45121F08;
	Mon, 22 Sep 2025 15:06:33 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1v0fJQ-000000002jJ-4AhS;
	Mon, 22 Sep 2025 15:06:32 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-kernel@vger.kernel.org
Cc: Lixu Zhang <lixu.zhang@intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mark Brown <broonie@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH 5/5] mei: vsc: Remove Wentong's e-mail address
Date: Mon, 22 Sep 2025 15:06:32 +0300
Message-ID: <20250922120632.10460-5-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250922120632.10460-1-sakari.ailus@linux.intel.com>
References: <20250922120632.10460-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Wentong's e-mail address no longer works, remove it.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/misc/mei/platform-vsc.c | 2 +-
 drivers/misc/mei/vsc-tp.c       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/mei/platform-vsc.c b/drivers/misc/mei/platform-vsc.c
index b2b5a20ae3fa..ce43668ad9fd 100644
--- a/drivers/misc/mei/platform-vsc.c
+++ b/drivers/misc/mei/platform-vsc.c
@@ -453,7 +453,7 @@ static struct platform_driver mei_vsc_drv = {
 };
 module_platform_driver(mei_vsc_drv);
 
-MODULE_AUTHOR("Wentong Wu <wentong.wu@intel.com>");
+MODULE_AUTHOR("Wentong Wu");
 MODULE_AUTHOR("Zhifeng Wang <zhifeng.wang@intel.com>");
 MODULE_DESCRIPTION("Intel Visual Sensing Controller Interface");
 MODULE_LICENSE("GPL");
diff --git a/drivers/misc/mei/vsc-tp.c b/drivers/misc/mei/vsc-tp.c
index 5ecf99883996..a75d8307a0f2 100644
--- a/drivers/misc/mei/vsc-tp.c
+++ b/drivers/misc/mei/vsc-tp.c
@@ -571,7 +571,7 @@ static struct spi_driver vsc_tp_driver = {
 };
 module_spi_driver(vsc_tp_driver);
 
-MODULE_AUTHOR("Wentong Wu <wentong.wu@intel.com>");
+MODULE_AUTHOR("Wentong Wu");
 MODULE_AUTHOR("Zhifeng Wang <zhifeng.wang@intel.com>");
 MODULE_DESCRIPTION("Intel Visual Sensing Controller Transport Layer");
 MODULE_LICENSE("GPL");
-- 
2.47.3


