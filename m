Return-Path: <linux-i2c+bounces-1395-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFC78359BF
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jan 2024 04:31:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9119D1C21F24
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jan 2024 03:31:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C2AD1FBA;
	Mon, 22 Jan 2024 03:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M1J9nSq4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E825015D4;
	Mon, 22 Jan 2024 03:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705894279; cv=none; b=Zd/cldr0YIlmjAPGx5gdKGm3pHxt2qzHi/6NT4zXvaxBNLFOw39bRdyTU9WXHTTRNNCql+FCBxN6VLmXW5WYWu8MGpCriixnB8hXT4CGerX+3Lqb7ZxMVcqao6XkwoNfLS8C/6llVKs21Ik+OhJl4EuGbvByypllOQELzxozUTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705894279; c=relaxed/simple;
	bh=cNhYmUaJ/MtYdbuiiYE+NihfTHoRTdwyE/YWHLSVRWk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mNIqCkbiuPrDL1u5zhgZCsiNBQttaIceosWP/W7EtR2j3QBjrc+FrarpXL8Csd+nALBbBY70rgCSIojqo7/04rSu2D56f+8XxS8FOJ8fDxssFdYePNqefr9o6CunoLf0r13hAJ18HGm6BIjZis9dWKOg0I09Ur9k7C57ZqXZF9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=none smtp.mailfrom=ecsmtp.iind.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M1J9nSq4; arc=none smtp.client-ip=192.55.52.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ecsmtp.iind.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705894277; x=1737430277;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cNhYmUaJ/MtYdbuiiYE+NihfTHoRTdwyE/YWHLSVRWk=;
  b=M1J9nSq4NazHhf+7ZG0FJQCnBKDgGZHzDNrkrBXQ+IJ4HdaGNZXdPxqb
   uzhE0tW8NIz6Orsf5aVd0tdui1vM29aSi3XfvhGsFSKNpMOZtjtP7Ix2/
   k83op3xHxNFqgABKGxESpbN69wsCZwosmzqQYsP/JAeNNdcXzQrIdu9UR
   K+F7LIqBUApqwINeAfMVPJ9Iem4et9tTfHeSMeS08O9jsyRQsuKTdqD4+
   dywK2FcRWpWX6ejlvxiB3cNmkqTLsXMRS1XGpqQHXYMHxOhsUzCjviwaK
   OLVIGa6BJ5+VsT3o9vsvuDLN7LaRIVsqPaTbac2spsF/RWhmhTqFdMjqF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="398255341"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="398255341"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2024 19:31:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="1066917"
Received: from inesxmail01.iind.intel.com ([10.223.57.40])
  by orviesa005.jf.intel.com with ESMTP; 21 Jan 2024 19:31:15 -0800
Received: from inlubt0316.iind.intel.com (inlubt0316.iind.intel.com [10.191.20.213])
	by inesxmail01.iind.intel.com (Postfix) with ESMTP id 53DEF484E;
	Mon, 22 Jan 2024 09:01:14 +0530 (IST)
Received: by inlubt0316.iind.intel.com (Postfix, from userid 12101951)
	id 4F79D1600100; Mon, 22 Jan 2024 09:01:14 +0530 (IST)
From: Raag Jadav <raag.jadav@intel.com>
To: jarkko.nikula@linux.intel.com,
	mika.westerberg@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	jsd@semihalf.com,
	andi.shyti@kernel.org
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1 1/2] i2c: designware: constify abort_sources
Date: Mon, 22 Jan 2024 09:01:07 +0530
Message-Id: <20240122033108.31053-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.35.3
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We never modify abort_sources, mark it as const.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/i2c/busses/i2c-designware-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index affcfb243f0f..39c956b0a72d 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -28,7 +28,7 @@
 
 #include "i2c-designware-core.h"
 
-static char *abort_sources[] = {
+static const char *const abort_sources[] = {
 	[ABRT_7B_ADDR_NOACK] =
 		"slave address not acknowledged (7bit mode)",
 	[ABRT_10ADDR1_NOACK] =
-- 
2.35.3


