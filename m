Return-Path: <linux-i2c+bounces-3926-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DE032900F8D
	for <lists+linux-i2c@lfdr.de>; Sat,  8 Jun 2024 06:42:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F00E91C21231
	for <lists+linux-i2c@lfdr.de>; Sat,  8 Jun 2024 04:42:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACF8110A1A;
	Sat,  8 Jun 2024 04:42:18 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E516FC01;
	Sat,  8 Jun 2024 04:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717821738; cv=none; b=fqvomZYHmlEU1LYBcR6bhB5nRmCMT71fW7KD5W78NT+QQSsOW5D1OKHTHfty1d9zWg7rY0h3XOfzDpdzPJM1WIMD3mj/9DkooCo/UaqeCToZMLfc6tqEm1lZDQtUjdMJv3faUvkMwiGX1XmoEH4Qmqv1wU2N8H10JcNrmBj3a2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717821738; c=relaxed/simple;
	bh=aZNIDronOWOXmDWaTQFeyQ04nj2HQc3TXTZHwnR/AXQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pMqkTmqzsAyp+boPKqP+hVoBnAih0n4S6nYmFXXdefrOcPWXvcfpinVJ65hGqTLLBrEMz0ScER61ZwvujtW5lp4Nz+qqKlYL2rURySt0QVI2ZFWDEoLA5gEQGoUfruKN12+Mqht9fvuf+ZjVOh6TU5kaR9h06UaKl2rZaZuMO88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Sat, 8 Jun
 2024 12:36:54 +0800
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX02.aspeed.com
 (192.168.0.25) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Sat, 8 Jun
 2024 12:36:54 +0800
Received: from twmbx02.aspeed.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Sat, 8 Jun 2024 12:36:53 +0800
From: Tommy Huang <tommy_huang@aspeedtech.com>
To: <brendan.higgins@linux.dev>, <benh@kernel.crashing.org>, <joel@jms.id.au>,
	<andi.shyti@kernel.org>, <andrew@codeconstruct.com.au>, <wsa@kernel.org>
CC: <linux-i2c@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>,
	<BMC-SW@aspeedtech.com>
Subject: [PATCH v2] i2c: aspeed: Update the stop sw state when the bus recovery occurs
Date: Sat, 8 Jun 2024 12:36:53 +0800
Message-ID: <20240608043653.4086647-1-tommy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: Fail (TWMBX02.aspeed.com: domain of tommy_huang@aspeedtech.com
 does not designate 192.168.10.10 as permitted sender)
 receiver=TWMBX02.aspeed.com; client-ip=192.168.10.10;
 helo=twmbx02.aspeed.com;

When the i2c bus recovery occurs, driver will send i2c stop command
in the scl low condition. In this case the sw state will still keep
original situation. Under multi-master usage, i2c bus recovery will
be called when i2c transfer timeout occurs. Update the stop command
calling with aspeed_i2c_do_stop function to update master_state.

Fixes: f327c686d3ba ("i2c: aspeed: added driver for Aspeed I2C")

Cc: <stable@vger.kernel.org> # v4.13+
Signed-off-by: Tommy Huang <tommy_huang@aspeedtech.com>
---
 drivers/i2c/busses/i2c-aspeed.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index ce8c4846b7fa..be64e419adf0 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -25,6 +25,8 @@
 #include <linux/reset.h>
 #include <linux/slab.h>
 
+static void aspeed_i2c_do_stop(struct aspeed_i2c_bus *bus);
+
 /* I2C Register */
 #define ASPEED_I2C_FUN_CTRL_REG				0x00
 #define ASPEED_I2C_AC_TIMING_REG1			0x04
@@ -187,7 +189,7 @@ static int aspeed_i2c_recover_bus(struct aspeed_i2c_bus *bus)
 			command);
 
 		reinit_completion(&bus->cmd_complete);
-		writel(ASPEED_I2CD_M_STOP_CMD, bus->base + ASPEED_I2C_CMD_REG);
+		aspeed_i2c_do_stop(bus);
 		spin_unlock_irqrestore(&bus->lock, flags);
 
 		time_left = wait_for_completion_timeout(
-- 
2.25.1


