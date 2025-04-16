Return-Path: <linux-i2c+bounces-10415-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F62A8B690
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 12:17:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04284189F073
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 10:17:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28243238C29;
	Wed, 16 Apr 2025 10:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="csTsuOXO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D5E238177;
	Wed, 16 Apr 2025 10:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744798638; cv=none; b=mQnNfvZc8WUjq1bdEiFCeBk4W6gXJHFQOvjEP/9Krx7C5fFUrRJn3mCN3nxcvTeE79GHUmW4ykllFSInRnjH4DgzutYLe5dydXdPAC4lMTgds+4pXPRtc+zE2Nn6QEVSJYp4sqb7XzR8hTwohO/8BokFF5jLBba8UFS11jTHw9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744798638; c=relaxed/simple;
	bh=syFNB16+rK3gdet27U6GHad1bDdbvsx6+zFInmrGubE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QIczlOuslUz3LwojvGCFHPc312kCmGZUzmiym1AzRQVN8xRneOO8DwbPifqRxWr1Ek6BIjP2a+cPgustpeAjHMNSfdySSAtPpiXy0S4MB6xQanGQO3ppc8Fcd9B/ItPwsf+vq21Wsh53gTfX8/YNvicEC4a8JTFE4p3twZi5TTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=csTsuOXO; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744798638; x=1776334638;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=syFNB16+rK3gdet27U6GHad1bDdbvsx6+zFInmrGubE=;
  b=csTsuOXOa5INoh6jjhJsdmRum/FwlHOxnIMngc5vRYvxY+pleIlJyW87
   ekV6UjQ08MOjlh3vpubvEBaGZKF5ZA5EA7OP4oTy6fi4kPfOoQ6tgL5e7
   e3+mGnZ6ysASIrws0cl9bHcy3c4+wMWyv3prCpUPzBGIbK3yW8NO1yTGs
   3Gbsq58JtfLtCC7I3ZBfEr2AYM5tmLhcZmcIM2owbWZdZ0UbtKvGL+lXP
   MKhJ08BFXIO/w8XUlI8upRQxoeiOwGlDwrVIu93eNe+YUvr6xiU4Mm/Ax
   sPTH6HaFLEZklcuxMvfiqu6Hui8dHqX6ZbIP1FGWVFEkfJEiKS9+vcpWj
   A==;
X-CSE-ConnectionGUID: IqWb/c+BSv2RPq/r6uxj6A==
X-CSE-MsgGUID: OjXaw8fnTRaxNACRe6R0UQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="46464950"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="46464950"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 03:17:17 -0700
X-CSE-ConnectionGUID: 0XKG7WLQTMekDl3xgg1UAA==
X-CSE-MsgGUID: vPGXiA75R/OaX8YcMDY8eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="135588527"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP; 16 Apr 2025 03:17:15 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 8A2B0F4; Wed, 16 Apr 2025 13:17:13 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>
Subject: [PATCH v1 1/1] i2c: designware: Use better constants from units.h
Date: Wed, 16 Apr 2025 13:17:02 +0300
Message-ID: <20250416101702.2128740-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When we use constants in a time or frequency related contexts,
it's better to utilise the respective definitions that have
encoded units in them. This will make code better to read and
understand.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-platdrv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index d6e1ee935399..879719e91df2 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -34,7 +34,7 @@
 
 static u32 i2c_dw_get_clk_rate_khz(struct dw_i2c_dev *dev)
 {
-	return clk_get_rate(dev->clk) / KILO;
+	return clk_get_rate(dev->clk) / HZ_PER_KHZ;
 }
 
 #ifdef CONFIG_OF
-- 
2.47.2


