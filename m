Return-Path: <linux-i2c+bounces-9429-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BCEA3416B
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 15:11:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8AA757A5176
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 14:10:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0DFB211A36;
	Thu, 13 Feb 2025 14:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GnWMFkAn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBF9281369;
	Thu, 13 Feb 2025 14:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739455859; cv=none; b=Qw/ca+xxKNCE1OxLO5KPj3hjlq3vX2Aa/FGjAtxnEqnpg2lNyrnja4Vj5Sj2XpvwouHtG6y8uEMEau2hY4Csm7Z+sf2e6xUzzegL4XFRZP03MZo4eMa+uLIFEy/692GrAUFk+e6xxw5EMFWE0FeI4iH0Pnncj8eAbIX1NM7HY9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739455859; c=relaxed/simple;
	bh=w5OIcmlLWZ5owUnVqwY4hOy9GeQY3Ik9w5ZZ4hRMggA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RpzCsq0zdTpVpioi/NAWQpoqwDD6UirOBnppdevjB4QzUcH37KYMIBLXwSoPmOmyHhkVASAumF2Zj0U4L4C7TkFwi6GZZFyWo5ZTo570ixM+1mgSWtAG2iJfFWyvELCxfyi5+2kBj2RBs26W81Uk/scDfNBKTCvv/M36sGFWGT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GnWMFkAn; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739455858; x=1770991858;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=w5OIcmlLWZ5owUnVqwY4hOy9GeQY3Ik9w5ZZ4hRMggA=;
  b=GnWMFkAngEVEJINZz+btJN/Ibr8Co5ynejvvDrXgGvjvj+f7xf/qIPXV
   f7bhgUgx8m3i4k/68RWT2rRjukqfyHu72AXrk60zOld68mtdY8z/ORS/X
   3ZvmJBpVFETKpkSSlKY27HFNVVAr/hfdsDfHoai8zEjiYk/cqppKYrt/b
   Ja+z3pkfJ45Dttl4ev8HgqisCLPntJ9z4seiw/j2sbHcx10P98FSwSiyB
   wV4VDLidOu/4HbZGNFxvAiDM7loJ0eU9oQtQ1PrQgUbnUbsD/i1R+l70+
   bHKV4qQfFRqoboXUqYEIIcNHrrUKEAw3zB8F54QKzhvY+k9pgn+Grtv5r
   g==;
X-CSE-ConnectionGUID: 9RFSUT42Sq6LA1MmjZ1xQA==
X-CSE-MsgGUID: P95A80TkSmeD5y1pK2zeQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40273349"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="40273349"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 06:10:54 -0800
X-CSE-ConnectionGUID: RpVy3KmLSyCp1ahol+ineA==
X-CSE-MsgGUID: DCwuJTz5RTSR209KgyRuBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="113815327"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 13 Feb 2025 06:10:48 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 54C1E31C; Thu, 13 Feb 2025 16:10:47 +0200 (EET)
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
Subject: [PATCH v2 03/10] i2c: bcm-kona: Use i2c_10bit_addr_*_from_msg() helpers
Date: Thu, 13 Feb 2025 16:07:17 +0200
Message-ID: <20250213141045.2716943-4-andriy.shevchenko@linux.intel.com>
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
 drivers/i2c/busses/i2c-bcm-kona.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-bcm-kona.c b/drivers/i2c/busses/i2c-bcm-kona.c
index 340fe1305dd9..9d8838bbd938 100644
--- a/drivers/i2c/busses/i2c-bcm-kona.c
+++ b/drivers/i2c/busses/i2c-bcm-kona.c
@@ -471,12 +471,12 @@ static int bcm_kona_i2c_do_addr(struct bcm_kona_i2c_dev *dev,
 
 	if (msg->flags & I2C_M_TEN) {
 		/* First byte is 11110XX0 where XX is upper 2 bits */
-		addr = 0xF0 | ((msg->addr & 0x300) >> 7);
+		addr = i2c_10bit_addr_hi_from_msg(msg) & ~I2C_M_RD;
 		if (bcm_kona_i2c_write_byte(dev, addr, 0) < 0)
 			return -EREMOTEIO;
 
 		/* Second byte is the remaining 8 bits */
-		addr = msg->addr & 0xFF;
+		addr = i2c_10bit_addr_lo_from_msg(msg);
 		if (bcm_kona_i2c_write_byte(dev, addr, 0) < 0)
 			return -EREMOTEIO;
 
@@ -486,7 +486,7 @@ static int bcm_kona_i2c_do_addr(struct bcm_kona_i2c_dev *dev,
 				return -EREMOTEIO;
 
 			/* Then re-send the first byte with the read bit set */
-			addr = 0xF0 | ((msg->addr & 0x300) >> 7) | 0x01;
+			addr = i2c_10bit_addr_hi_from_msg(msg);
 			if (bcm_kona_i2c_write_byte(dev, addr, 0) < 0)
 				return -EREMOTEIO;
 		}
-- 
2.45.1.3035.g276e886db78b


