Return-Path: <linux-i2c+bounces-12539-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 556CFB3E3CF
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Sep 2025 15:00:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0CE023AA49E
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Sep 2025 13:00:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EABDE334391;
	Mon,  1 Sep 2025 13:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XNLL2hTg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3802773FB;
	Mon,  1 Sep 2025 13:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756731603; cv=none; b=bt8nUFSTQvTRdjfsUobMylPyeot3Uih7HOMQjKBDqhybYUxwOR8H5918XkiXpNv7q2Ro05+mz62ortZSJV5c1TCL3AHGfQjRYStJb2qbP5L8YIwugy4tmChlGL+YZ8iCJbU+G9P4ew2T4mTFL0Ni1vrnfHtK8KDNPMGZzHZmzo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756731603; c=relaxed/simple;
	bh=DH6a3pyoYn3ATBRSgAOH51prI3soF9SNPDXpoAdnWog=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F/Wp52Obh35LlPedAZG9LV96+DhBb+dG4qhrCxHYXMY7kgrZk1VS9eQPrHZhJpLGjGuqOrKnYm5eS1YMu2MPuZ9Bh6OdplTiu7YhAYwtdg1eqRAkad4tygra8TijbIQansbFh8nxhN0rcLFobetGr4CI4CVep3wSZxbwJi+1c70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XNLL2hTg; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756731602; x=1788267602;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DH6a3pyoYn3ATBRSgAOH51prI3soF9SNPDXpoAdnWog=;
  b=XNLL2hTgMqdxsLfsp/JFeROUDo3eL9VBS+42MLN3G1PdxVoW90YaLMCT
   9VjPM+KlZBcBbX3GuwpiOJp5XrsNS7T7q08990Ov5K48PnKvkPY69LTdk
   0ZYutrS0YxG4i8v3uAyctOfRm0pAZ95iwSa4mwB3kL3K2LkUE87Fkbdi4
   JYaBF60PsIyR9J59mtp98mB8TmxogXvGN45ggNJ5DOpp5u5xCXzgdN6f4
   pnkiUXuePg6CxuSyidr2OBDc9HiEQkZ2nqOS3bffxfLYWPAsIyd9iF1EG
   Ics1bB3f2bTyg4Dpn4wUu/bxu/eu/d/OiUszveYsEdmix/VeBGHxXkJSt
   g==;
X-CSE-ConnectionGUID: 1TOojo8aS/uWzkFBPnb0uQ==
X-CSE-MsgGUID: VMh0S38DQgCb8Yl/wBx/3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="61624678"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="61624678"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 06:00:01 -0700
X-CSE-ConnectionGUID: xwZZeoL/T0aoxgmhL7FbRw==
X-CSE-MsgGUID: JqYRR8LmT6SoeUPOPCZ9ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="170990663"
Received: from chiasheng-server.itwn.intel.com ([10.225.75.39])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 05:59:59 -0700
From: Chiasheng Lee <chiasheng.lee@linux.intel.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-i2c@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Chiasheng Lee <chiasheng.lee@linux.intel.com>,
	stable@vger.kernel.org
Subject: [PATCH] i2c: i801: Hide Intel Birch Stream SoC TCO WDT
Date: Mon,  1 Sep 2025 20:59:43 +0800
Message-ID: <20250901125943.916522-1-chiasheng.lee@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hide the Intel Birch Stream SoC TCO WDT feature since it was removed.

On platforms with PCH TCO WDT, this redundant device might be rendering
errors like this:

[   28.144542] sysfs: cannot create duplicate filename '/bus/platform/devices/iTCO_wdt'

Fixes: 8c56f9ef25a3 ("i2c: i801: Add support for Intel Birch Stream SoC")
Cc: <stable@vger.kernel.org>
Signed-off-by: Chiasheng Lee <chiasheng.lee@linux.intel.com>
Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Link: https://bugzilla.kernel.org/show_bug.cgi?id=220320
---
 drivers/i2c/busses/i2c-i801.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index a7f89946dad4..e94ac746a741 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1052,7 +1052,7 @@ static const struct pci_device_id i801_ids[] = {
 	{ PCI_DEVICE_DATA(INTEL, METEOR_LAKE_P_SMBUS,		FEATURES_ICH5 | FEATURE_TCO_CNL) },
 	{ PCI_DEVICE_DATA(INTEL, METEOR_LAKE_SOC_S_SMBUS,	FEATURES_ICH5 | FEATURE_TCO_CNL) },
 	{ PCI_DEVICE_DATA(INTEL, METEOR_LAKE_PCH_S_SMBUS,	FEATURES_ICH5 | FEATURE_TCO_CNL) },
-	{ PCI_DEVICE_DATA(INTEL, BIRCH_STREAM_SMBUS,		FEATURES_ICH5 | FEATURE_TCO_CNL) },
+	{ PCI_DEVICE_DATA(INTEL, BIRCH_STREAM_SMBUS,		FEATURES_ICH5)			 },
 	{ PCI_DEVICE_DATA(INTEL, ARROW_LAKE_H_SMBUS,		FEATURES_ICH5 | FEATURE_TCO_CNL) },
 	{ PCI_DEVICE_DATA(INTEL, PANTHER_LAKE_H_SMBUS,		FEATURES_ICH5 | FEATURE_TCO_CNL) },
 	{ PCI_DEVICE_DATA(INTEL, PANTHER_LAKE_P_SMBUS,		FEATURES_ICH5 | FEATURE_TCO_CNL) },
-- 
2.43.0


