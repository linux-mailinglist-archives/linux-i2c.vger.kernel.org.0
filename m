Return-Path: <linux-i2c+bounces-9391-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC79CA32BBB
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 17:35:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A5831680D7
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 16:34:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 271D12580FC;
	Wed, 12 Feb 2025 16:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RlQ8RR35"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCE3256C8E;
	Wed, 12 Feb 2025 16:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739378052; cv=none; b=h86vBdC+jpmzOI9817J1Aip6dAPoGAcHPI1abEsexx0d7rcn1MNdTClr0Q6fqTe50ylBSrD8NW+yUl8KZ+ryU0yj8wZIbg231Q3uyZ/mJRE0G/UVfrJs9EAbs1fn/1AXGKvHFngBWm1FbkSrDrVAVMqOu1FDzQSxJS8GYBGraIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739378052; c=relaxed/simple;
	bh=cFAmhZLC1N9cY0krqeopnZfqHOnQfFAHi/9obr5Jw5o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UPkcQHI+ZsQT9tEB2YsAQQJhdDqDwZyN2bObF9HEiJXFwut2CatOBZ/J6ZPgwBQ5WVxi5jI/zYNWN9nGviVekEu0fLZRqsk/+fTWo/qlxatFyGq1sEf6UTelKe47LyzN6YPZ8xWbwehfW5FKAhOusL01GkkrprvY6O7QvehK+xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RlQ8RR35; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739378052; x=1770914052;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cFAmhZLC1N9cY0krqeopnZfqHOnQfFAHi/9obr5Jw5o=;
  b=RlQ8RR35KrSxIzR1Vr3kMk9flq7tqj8GzwAxs8rndbbYe96DZUS5W1Zp
   UR66F2ZYqXXhFMLWWE5A0SEAHrfYjLt2cagXmOHg5Gpw48aF1ol+qPXpC
   XUgoQXGpUO/mEAZWceMQaMfhKTrOF4SXtFdw7YQVyazZCVayM3D4EF6zX
   bLmUJwjLA0Lv8HqfO/eh0EFfjb2tnMA3LKViVDaWMZEG0PvlXb6z3rSDd
   CbSpM93GUiWe+uAD9mLU+Bc1ls6KDbvJc8e8ekiqG5B68oezqAbDKhr2/
   GlkA+lIL2IFctV36ucYNZZC+g8RJEDVN3g+h52ifHvmM7w/ZXSy0Ylf5K
   Q==;
X-CSE-ConnectionGUID: sTb2vnCCQnm9roQWTiU5KA==
X-CSE-MsgGUID: c290W5UrTFKGXwo6XlWiRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="51032366"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="51032366"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 08:34:08 -0800
X-CSE-ConnectionGUID: bkY3AmBeToa/2bmPgYXaGw==
X-CSE-MsgGUID: q1C7xXqvRNyam24tlM4+2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="117879146"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 12 Feb 2025 08:34:02 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id C33142CA; Wed, 12 Feb 2025 18:34:01 +0200 (EET)
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
Subject: [PATCH v1 3/8] i2c: bcm-kona: Use i2c_10bit_addr_from_msg() helper
Date: Wed, 12 Feb 2025 18:32:28 +0200
Message-ID: <20250212163359.2407327-4-andriy.shevchenko@linux.intel.com>
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

Use i2c_10bit_addr_from_msg() helper instead of local copy.
No functional change intended.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-bcm-kona.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-bcm-kona.c b/drivers/i2c/busses/i2c-bcm-kona.c
index 340fe1305dd9..f8826e2d3ec2 100644
--- a/drivers/i2c/busses/i2c-bcm-kona.c
+++ b/drivers/i2c/busses/i2c-bcm-kona.c
@@ -470,14 +470,14 @@ static int bcm_kona_i2c_do_addr(struct bcm_kona_i2c_dev *dev,
 	unsigned char addr;
 
 	if (msg->flags & I2C_M_TEN) {
+		addr = i2c_10bit_addr_from_msg(msg);
+
 		/* First byte is 11110XX0 where XX is upper 2 bits */
-		addr = 0xF0 | ((msg->addr & 0x300) >> 7);
-		if (bcm_kona_i2c_write_byte(dev, addr, 0) < 0)
+		if (bcm_kona_i2c_write_byte(dev, addr & ~I2C_M_RD, 0) < 0)
 			return -EREMOTEIO;
 
 		/* Second byte is the remaining 8 bits */
-		addr = msg->addr & 0xFF;
-		if (bcm_kona_i2c_write_byte(dev, addr, 0) < 0)
+		if (bcm_kona_i2c_write_byte(dev, msg->addr & 0xFF, 0) < 0)
 			return -EREMOTEIO;
 
 		if (msg->flags & I2C_M_RD) {
@@ -486,7 +486,6 @@ static int bcm_kona_i2c_do_addr(struct bcm_kona_i2c_dev *dev,
 				return -EREMOTEIO;
 
 			/* Then re-send the first byte with the read bit set */
-			addr = 0xF0 | ((msg->addr & 0x300) >> 7) | 0x01;
 			if (bcm_kona_i2c_write_byte(dev, addr, 0) < 0)
 				return -EREMOTEIO;
 		}
-- 
2.45.1.3035.g276e886db78b


