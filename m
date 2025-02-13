Return-Path: <linux-i2c+bounces-9431-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA56A3419B
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 15:16:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F6F63A989E
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 14:11:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C06D1281374;
	Thu, 13 Feb 2025 14:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QmQMcXe+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0B320A5FC;
	Thu, 13 Feb 2025 14:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739455861; cv=none; b=ONj6Jp/Nwh69Xwn0WfRaT6MQqw3DdzzG54fczHb5fbu6HonCE9at5IOh4YP41Yk9QOo0PuvV80Ou9itQ5hfsRyMgkgob9e00VgvMg6rxG3vikk/oYnZL8sOPLh1IuK4R6syi4usRYnQmhJUZmEtyGAbo9j6kwkrIEe04WS/d5xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739455861; c=relaxed/simple;
	bh=Yp4FrWXW4JaF+mT3WDe29SXBFmsQXNetyMj2cbrB3Lc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tNvIdlW890n/w8SQTwNXRbFXlCStiEXo/tjFme6XMmNr9zqOVYXaqhsICp2xU0lHU5tEUbCD3NwAUNPRgt4qUgkXkj1uNbW7aBZxUiFTamHcZ7HpkQXANb9C8KhK0r0Z9bi3MzIdxGxkrjwRECQ5AExrOZv6+xhgo5se3ps7OsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QmQMcXe+; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739455860; x=1770991860;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Yp4FrWXW4JaF+mT3WDe29SXBFmsQXNetyMj2cbrB3Lc=;
  b=QmQMcXe+0Jw/YQFAgK6i+OYyk3rAG6SnYoFN28hZJnIaKoW5S5xwL+5x
   OYtYCB5YmdklzjItgXlmwYnix2TTUWwW45fjPIofwLaUlaqQHC6pVSqgJ
   KCHHUbk9wBcim5B8DKay17A9GcApIbQ2xsgQQ98Nh/F2T0Kt76TcnoxCA
   XOcTTpcU/M5JLhwCAUGR4Gwhm8NZ51efx5sjPB3QxKVYKAoPA3uOWT6/n
   kEg7CdBVvIAlvAQrZi+8K9svHf2QYtBUGfB5IbsOKAznVmBQvlxM1bIiO
   fuYuXhxQEqR733460I3NFyujQnlF1N8OlU7pLBqn/cMTXFnpne84W7pZC
   A==;
X-CSE-ConnectionGUID: 0TjNgBOVSO6tvN/kGGrCNw==
X-CSE-MsgGUID: ogAOugOcREmAS1fxZHCsMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40273362"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="40273362"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 06:10:55 -0800
X-CSE-ConnectionGUID: N12ApcrZTLmSWu4H86qDJw==
X-CSE-MsgGUID: 59+8kRuIQtSBaiDwgv5slQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="113815328"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 13 Feb 2025 06:10:48 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 31DD11F5; Thu, 13 Feb 2025 16:10:47 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Cc: Krzysztof Adamski <krzysztof.adamski@nokia.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Kamal Dasu <kamal.dasu@broadcom.com>,
	Stefan Roese <sr@denx.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: [PATCH v2 01/10] i2c: Introduce i2c_10bit_addr_*_from_msg() helpers
Date: Thu, 13 Feb 2025 16:07:15 +0200
Message-ID: <20250213141045.2716943-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.45.1.3035.g276e886db78b
In-Reply-To: <20250213141045.2716943-1-andriy.shevchenko@linux.intel.com>
References: <20250213141045.2716943-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are already a lot of drivers that have been using
i2c_8bit_addr_from_msg() for 7-bit addresses, now it's time
to have the similar for 10-bit addresses.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/i2c.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 997e80649889..e23b373b6b57 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -952,6 +952,20 @@ static inline u8 i2c_8bit_addr_from_msg(const struct i2c_msg *msg)
 	return (msg->addr << 1) | (msg->flags & I2C_M_RD);
 }
 
+/*
+ * 10-bit address
+ *   addr_1: 5'b11110 | addr[9:8] | (R/nW)
+ *   addr_2: addr[7:0]
+ */
+static inline u8 i2c_10bit_addr_hi_from_msg(const struct i2c_msg *msg)
+{
+	return 0xf0 | ((msg->addr & GENMASK(9, 8)) >> 7) | (msg->flags & I2C_M_RD);
+}
+static inline u8 i2c_10bit_addr_lo_from_msg(const struct i2c_msg *msg)
+{
+	return msg->addr & GENMASK(7, 0);
+}
+
 u8 *i2c_get_dma_safe_msg_buf(struct i2c_msg *msg, unsigned int threshold);
 void i2c_put_dma_safe_msg_buf(u8 *buf, struct i2c_msg *msg, bool xferred);
 
-- 
2.45.1.3035.g276e886db78b


