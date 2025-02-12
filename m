Return-Path: <linux-i2c+bounces-9392-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 12143A32BBD
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 17:35:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D5FEF1631C0
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 16:35:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84DDF2586E8;
	Wed, 12 Feb 2025 16:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dlpQoUis"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26B8256C96;
	Wed, 12 Feb 2025 16:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739378053; cv=none; b=Ny8jeDl08lgqHnqwKkhVidtPfVLq+vFBkkplExRE2Y2Rk4/LTDj6cy7zfv7hwGN4p7WeFdnzrWiR+/5Vu/7H3bQZDRF6lf2f/X9DXU4afsm9cFLIhoukL7N9RoFhqxEiHYKxfxAX+29HgPNmEnoziBSJcGSQM0mnklT7NNKIp7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739378053; c=relaxed/simple;
	bh=oGp2bSSFfKzAg37Gu5Gmi9/S21sWW7TvcVISpEG/3cs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AOCZmALypkU22zkEbwTS6A1Z/Pa5E1//s9auvhRxZL2hufKEc7NafnLAzGrLSnaAuE47M/9Kf2vOZtUsBoEJ7WH3gSj0aXHFEhE+ZOPA5ZG/3XpTUJ7KcRohY8L0NmwIf47giMYNGzb6RAq51ba399oNRlhihas81XjmaqoUn5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dlpQoUis; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739378052; x=1770914052;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oGp2bSSFfKzAg37Gu5Gmi9/S21sWW7TvcVISpEG/3cs=;
  b=dlpQoUisJBb5IhwthMbMT7aIoXz8VEKr8dgTETiXK8DTe+EWlzR3Athi
   dlMjpYPyFHO08lTniEtAXLYJRi6rXTeLIqvFBgIlaNq4+zpNC+CpZqhiW
   xhNSc8Y2tApNF2K6vIGqcd0tP57rbzLMUYb7+xSXfz9YrptPhL/LnLTwU
   WqSOPwasfrmazGjyJoctT8OBDArSVhnNbgv2n2h96aC/RYu2aRP/pCdw9
   3yu7MKVOoAjmF1006IpbJUfieKvD/KN54BuFURsrnVTNr9wDOdZhawtaS
   Y3pWXgy9MPMpcZ0T6gMTpXmvGI5JLEuNo8+eEWuU60nIMC3MAYOcEKvaW
   A==;
X-CSE-ConnectionGUID: KDhApbufSluUkwZTErfWig==
X-CSE-MsgGUID: WMR5IFQPR0yp5B1kk2ZFqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="51032371"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="51032371"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 08:34:08 -0800
X-CSE-ConnectionGUID: sL7QU6DURcK9HnFMaJ3MFw==
X-CSE-MsgGUID: QXIAKTKjSJyFZbLr1csgZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="117879145"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 12 Feb 2025 08:34:02 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 9D9B210F; Wed, 12 Feb 2025 18:34:01 +0200 (EET)
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
	Stefan Roese <sr@denx.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: [PATCH v1 1/8] i2c: Introduce i2c_10bit_addr_from_msg()
Date: Wed, 12 Feb 2025 18:32:26 +0200
Message-ID: <20250212163359.2407327-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.45.1.3035.g276e886db78b
In-Reply-To: <20250212163359.2407327-1-andriy.shevchenko@linux.intel.com>
References: <20250212163359.2407327-1-andriy.shevchenko@linux.intel.com>
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
 include/linux/i2c.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 997e80649889..4d281ff5582b 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -952,6 +952,16 @@ static inline u8 i2c_8bit_addr_from_msg(const struct i2c_msg *msg)
 	return (msg->addr << 1) | (msg->flags & I2C_M_RD);
 }
 
+static inline u8 i2c_10bit_addr_from_msg(const struct i2c_msg *msg)
+{
+	/*
+	 * 10-bit address
+	 *   addr_1: 5'b11110 | addr[9:8] | (R/nW)
+	 *   addr_2: addr[7:0]
+	 */
+	return 0xf0 | ((msg->addr & GENMASK(9, 8)) >> 7) | (msg->flags & I2C_M_RD);
+}
+
 u8 *i2c_get_dma_safe_msg_buf(struct i2c_msg *msg, unsigned int threshold);
 void i2c_put_dma_safe_msg_buf(u8 *buf, struct i2c_msg *msg, bool xferred);
 
-- 
2.45.1.3035.g276e886db78b


