Return-Path: <linux-i2c+bounces-9436-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E52A3418E
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 15:14:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7709C16BC70
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 14:12:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 029E3242910;
	Thu, 13 Feb 2025 14:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NDMWqf1G"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2CA221574;
	Thu, 13 Feb 2025 14:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739455863; cv=none; b=DMFB4gkTvNMthWPUB6QfcHDD9AoZ69PynpLOxW3SFg8n60x+llBl8POrS0ydRG+L4kjfMkfRJShjks5GaFZOUohGybqwYljXGZ6UUR1/W/mljXcF9l181gr3CnPT+E8QE9dmh+TCA0JE4ZOJqGPjBT103xYL2ZhpsA989NtBABU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739455863; c=relaxed/simple;
	bh=NuQBePCeibtx8uP9iufq1Kz+enaMxX19L9oTrmUixUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zmyb0rzJzr372HlQc4O4T+zAvQ8FjSK+UZtwuzSoXYn3oooDQ/3CEmXrb9YLHvTUi63T29lAOqXOsjEQhYrTNO/2IO4oGevmdqUd+zlyDLGqpDShWM14gKIGImbLf7IYgUzLUoeH+EEEDKUGIyj6vwB+Gc+bt0kF5T61FgaUSZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NDMWqf1G; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739455863; x=1770991863;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NuQBePCeibtx8uP9iufq1Kz+enaMxX19L9oTrmUixUQ=;
  b=NDMWqf1GA6jhoSv3oz8CQutkTGfZRxNdH3CluOHLOFuf5ibf7pFwk+59
   wswEr7fwWBVbMOWGjJiDcf+eOS0kBO+yu2NcZ9bPjgdOOEruS8BWPdJgK
   AR8NSkK8BvA6fYM4gD16p+JkJgW6M0K7FsxkchgsPiWh2T3mwOHJm5INf
   x7ZPXyAA096qbv3c3Jc0yYDzscxEhv9913XP3Lv/GTB9gt5pOBSbsFfFd
   6a9zp6nKgY8PLonTxoTfPeHFxeIjgjqJosRb5BThB9SYZ6wqilqxdoHby
   HQf0yEwP+NDM9yepRoUGDvXr6U1Z6OetiSJpLSSp088gbEZytqNb1Prad
   w==;
X-CSE-ConnectionGUID: dF5Sdw5eRraNFwDQp15qMA==
X-CSE-MsgGUID: athNnS14QxK/uSUYIO8XHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40190588"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="40190588"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 06:11:00 -0800
X-CSE-ConnectionGUID: Ozai6iqES8u4+I7UPbMlLg==
X-CSE-MsgGUID: wXVa540yT0SgcbkKIN8gyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="118162153"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 13 Feb 2025 06:10:54 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 940F74B0; Thu, 13 Feb 2025 16:10:47 +0200 (EET)
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
Subject: [PATCH v2 08/10] i2c: rzv2m: Use i2c_10bit_addr_*_from_msg() helpers
Date: Thu, 13 Feb 2025 16:07:22 +0200
Message-ID: <20250213141045.2716943-9-andriy.shevchenko@linux.intel.com>
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

Use i2c_10bit_addr_*_from_msg() helpers instead of local copy.
No functional change intended.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-rzv2m.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rzv2m.c b/drivers/i2c/busses/i2c-rzv2m.c
index 02b76e24a476..53762cc56d28 100644
--- a/drivers/i2c/busses/i2c-rzv2m.c
+++ b/drivers/i2c/busses/i2c-rzv2m.c
@@ -287,20 +287,15 @@ static int rzv2m_i2c_send_address(struct rzv2m_i2c_priv *priv,
 	int ret;
 
 	if (msg->flags & I2C_M_TEN) {
-		/*
-		 * 10-bit address
-		 *   addr_1: 5'b11110 | addr[9:8] | (R/nW)
-		 *   addr_2: addr[7:0]
-		 */
-		addr = 0xf0 | ((msg->addr & GENMASK(9, 8)) >> 7);
-		addr |= !!(msg->flags & I2C_M_RD);
-		/* Send 1st address(extend code) */
+		/* 10-bit address: Send 1st address(extend code) */
+		addr = i2c_10bit_addr_hi_from_msg(msg);
 		ret = rzv2m_i2c_write_with_ack(priv, addr);
 		if (ret)
 			return ret;
 
-		/* Send 2nd address */
-		ret = rzv2m_i2c_write_with_ack(priv, msg->addr & 0xff);
+		/* 10-bit address: Send 2nd address */
+		addr = i2c_10bit_addr_lo_from_msg(msg);
+		ret = rzv2m_i2c_write_with_ack(priv, addr);
 	} else {
 		/* 7-bit address */
 		addr = i2c_8bit_addr_from_msg(msg);
-- 
2.45.1.3035.g276e886db78b


