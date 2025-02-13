Return-Path: <linux-i2c+bounces-9430-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B657A34199
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 15:16:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 235DF3A2C36
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 14:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E5972222BC;
	Thu, 13 Feb 2025 14:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UueNSAIn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72994281340;
	Thu, 13 Feb 2025 14:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739455861; cv=none; b=J6yj4c0I8pjoVIYqyKUCvAE8zhtdPYyfgJq9Zkla6rOBlBBMRDrbf3HGaZyLqrB4b06fTxiBtuleucqEp9e74E9MZr3VYZeL+Da/dtkoVfUE7nGbjUhY+oElUrh8KfQM/6YWbwPZnBSjeDdKSIKFKdeQR/Nno5g+dZV6w5oYINs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739455861; c=relaxed/simple;
	bh=LW/jlQRmBR0/tm3s8iRoswrCxeV0lv1udBQdBgsISMA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nBn4uBlnTc9UHg+Pn39evWkm/O+deQRkSwQyM5d6kkOBbjVsKCtqH3g8MT/sMxuRxAGkn7E183l2y61QY6Fudt9EyLi/LdJlioX9a1DxsoLMa47IuPyQqKjy6yuEHoRPMnxQ7XjP5s2nXzWwrnSgnWwhZXm+sp6dSM8ef548Sxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UueNSAIn; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739455860; x=1770991860;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LW/jlQRmBR0/tm3s8iRoswrCxeV0lv1udBQdBgsISMA=;
  b=UueNSAInowIuXD7SvqcEsI15mGk0vIOFYymU2wY+rBp3RIKhxWH/hsl/
   yfNXF+sPAYF5ntM/jqNBjIk4iE+2PmDj0x5OV3xO3tj0MkAIC3Iv7F1tW
   g7iKvq+Dj8ihQgQfwo/144pMt4tqkM1NPCHj9xab7ClwAO2Ljrezq4EU0
   3ZNDBMNwNTVctGAcopP7SpMzuGd33k4jQvfBHRYDMR2Gw1SIy7mE8g0g0
   YuqbYQt52GgaKNXQoNX2qOFOvvngv4ItDnbxpqqdmsRJ2XWrlwhYFTQtO
   DyrHiEd/1PTxvjv4XRO631mOOml/RcVLJuS7sUQclb+MztI8vFSmvMKtV
   g==;
X-CSE-ConnectionGUID: V81/pENHS4WVwAdwYWYkcw==
X-CSE-MsgGUID: vQeRlaOTS1uhHBXfCsDtCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40022154"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="40022154"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 06:10:59 -0800
X-CSE-ConnectionGUID: 1FUUSg7TR163ZoOY/IYeZw==
X-CSE-MsgGUID: DbFEjdE7RMe9DivjowJdUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117777627"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa005.fm.intel.com with ESMTP; 13 Feb 2025 06:10:54 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 7CED648C; Thu, 13 Feb 2025 16:10:47 +0200 (EET)
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
Subject: [PATCH v2 06/10] i2c: kempld: Use i2c_10bit_addr_*_from_msg() helpers
Date: Thu, 13 Feb 2025 16:07:20 +0200
Message-ID: <20250213141045.2716943-7-andriy.shevchenko@linux.intel.com>
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
 drivers/i2c/busses/i2c-kempld.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-kempld.c b/drivers/i2c/busses/i2c-kempld.c
index 212196af68ba..9b4c7cba62b6 100644
--- a/drivers/i2c/busses/i2c-kempld.c
+++ b/drivers/i2c/busses/i2c-kempld.c
@@ -115,9 +115,7 @@ static int kempld_i2c_process(struct kempld_i2c_data *i2c)
 	if (i2c->state == STATE_ADDR) {
 		/* 10 bit address? */
 		if (i2c->msg->flags & I2C_M_TEN) {
-			addr = 0xf0 | ((i2c->msg->addr >> 7) & 0x6);
-			/* Set read bit if necessary */
-			addr |= (i2c->msg->flags & I2C_M_RD) ? 1 : 0;
+			addr = i2c_10bit_addr_hi_from_msg(msg);
 			i2c->state = STATE_ADDR10;
 		} else {
 			addr = i2c_8bit_addr_from_msg(i2c->msg);
@@ -132,10 +130,12 @@ static int kempld_i2c_process(struct kempld_i2c_data *i2c)
 
 	/* Second part of 10 bit addressing */
 	if (i2c->state == STATE_ADDR10) {
-		kempld_write8(pld, KEMPLD_I2C_DATA, i2c->msg->addr & 0xff);
+		addr = i2c_10bit_addr_lo_from_msg(msg);
+		i2c->state = STATE_START;
+
+		kempld_write8(pld, KEMPLD_I2C_DATA, addr);
 		kempld_write8(pld, KEMPLD_I2C_CMD, I2C_CMD_WRITE);
 
-		i2c->state = STATE_START;
 		return 0;
 	}
 
-- 
2.45.1.3035.g276e886db78b


