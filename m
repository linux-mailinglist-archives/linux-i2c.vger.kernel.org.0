Return-Path: <linux-i2c+bounces-11371-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5B2AD6EB7
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Jun 2025 13:14:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B74D1895762
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Jun 2025 11:14:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AB8B239E92;
	Thu, 12 Jun 2025 11:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="RfD52Ozb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A723236A9F;
	Thu, 12 Jun 2025 11:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749726857; cv=none; b=SmNsL4T+niSscPkY5c2fhnnqnY0ra7d8pmYcb5ARyfBM04IZvBuSVmteb9juKmJou+Yv2UzXBAvnN+APrcsV8FzmfMuGwmfwFEtBrg48SPHMFE2yom76NiDBlbd5IzVsmTiHnoxMJYHcWzOHEIWmQjKkAvtFJsYCp1kREfJtvu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749726857; c=relaxed/simple;
	bh=/Yo6O8SI0+IWA2XkJwjWpPVbipozk8mlgRIa5ULwmeI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=c46ltpr1+pCH7mJvsBaw0mXFWvoyTBrFOmOCk7r0lsATEfsR05wbw8JDRVCCGu6v0iWPZgFYhYog/BKJw4ogClQnmfM/J6VPfiL0HgSF5y+2agcWqIMCpRKCyfFtuRLwddGhy5h9tj6hffkz/wms3ayzSBgNHmteJQSMWHImVF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=RfD52Ozb; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1749726856; x=1781262856;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/Yo6O8SI0+IWA2XkJwjWpPVbipozk8mlgRIa5ULwmeI=;
  b=RfD52Ozbn9/VtvClwGW8qiUJbMSPx/qiUZzWoKGsggw85khpnAsstdou
   S1F3jbAFP2LnH62f5os/AZzaTQJydPzcKl8FHr35bsuQMWd3QEl+jiSjX
   X0QtwX/UXdWrxbVj30h7NYXy79xKCC7K+kiSAekSKWbcInJ94qHmBRUxa
   M3hS0ef8nirFYhx42zYFrn0eyF7itM4Y1lEkwIeHIup1/JTvj+jRIaRj1
   cY16GlNX9SxHyc/phtMOr9BE6tug1gx1yja6T3h2Fb7EEDUsCq0I/6tQu
   iDFZWtzkNjaiiepXiZJHrmNnI4fcA0tKbuvyfyoT/xuPLqZDtgXftTE2Y
   A==;
X-CSE-ConnectionGUID: XKX4+bGSRJuOKv/zrTvxRw==
X-CSE-MsgGUID: K4YPm728TP2LJl8QyeZUiA==
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; 
   d="scan'208";a="43292364"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Jun 2025 04:14:13 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 12 Jun 2025 04:14:06 -0700
Received: from wendy.microchip.com (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Thu, 12 Jun 2025 04:14:05 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <linux-i2c@vger.kernel.org>
CC: Conor Dooley <conor.dooley@microchip.com>, Daire McNamara
	<daire.mcnamara@microchip.com>, Andi Shyti <andi.shyti@kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [RESEND PATCH v1] i2c: microchip-core: re-fix fake detections w/ i2cdetect
Date: Thu, 12 Jun 2025 12:12:49 +0100
Message-ID: <20250612-jaybird-arrange-53b6200548e9@wendy>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1850; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=/Yo6O8SI0+IWA2XkJwjWpPVbipozk8mlgRIa5ULwmeI=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDBle24xjb0jsq/crelFha76gy1ro4FSxPRcXX7+cwH5w0qn7 vy/yd5SyMIhxMMiKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAiinMZGb4e+pOt9Ull3YFLm286J6 m3fdY+O9sicwnH0rf5KWty2moY/vCblPxvaWrXW8GjOH3JnM2iErN7p+401crMOOLx5u3Nbk4A
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Introducing support for smbus re-broke i2cdetect, causing it to detect
devices at every i2c address, just as it did prior to being fixed in
commit 49e1f0fd0d4cb ("i2c: microchip-core: fix "ghost" detections").
This was caused by an oversight, where the new smbus code failed to
check the return value of mchp_corei2c_xfer(). Check it, and propagate
any errors.

Fixes: d6ceb40538263 ("i2c: microchip-corei2c: add smbus support")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---

Resending cos I think it attempted a send using my korg address on a
network where that is not possible.

CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Andi Shyti <andi.shyti@kernel.org>
CC: linux-i2c@vger.kernel.org
CC: linux-kernel@vger.kernel.org
---
 drivers/i2c/busses/i2c-microchip-corei2c.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-microchip-corei2c.c b/drivers/i2c/busses/i2c-microchip-corei2c.c
index 492bf4c34722c..a4611381c4f0b 100644
--- a/drivers/i2c/busses/i2c-microchip-corei2c.c
+++ b/drivers/i2c/busses/i2c-microchip-corei2c.c
@@ -435,6 +435,7 @@ static int mchp_corei2c_smbus_xfer(struct i2c_adapter *adap, u16 addr, unsigned
 	u8 tx_buf[I2C_SMBUS_BLOCK_MAX + 2];
 	u8 rx_buf[I2C_SMBUS_BLOCK_MAX + 1];
 	int num_msgs = 1;
+	int ret;
 
 	msgs[CORE_I2C_SMBUS_MSG_WR].addr = addr;
 	msgs[CORE_I2C_SMBUS_MSG_WR].flags = 0;
@@ -505,7 +506,10 @@ static int mchp_corei2c_smbus_xfer(struct i2c_adapter *adap, u16 addr, unsigned
 		return -EOPNOTSUPP;
 	}
 
-	mchp_corei2c_xfer(&idev->adapter, msgs, num_msgs);
+	ret = mchp_corei2c_xfer(&idev->adapter, msgs, num_msgs);
+	if (ret)
+		return ret;
+
 	if (read_write == I2C_SMBUS_WRITE || size <= I2C_SMBUS_BYTE_DATA)
 		return 0;
 
-- 
2.49.0


