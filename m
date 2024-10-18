Return-Path: <linux-i2c+bounces-7467-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBD99A3383
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Oct 2024 05:49:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3FEE41F24563
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Oct 2024 03:49:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9533115EFA1;
	Fri, 18 Oct 2024 03:49:40 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123CE20E31D;
	Fri, 18 Oct 2024 03:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729223380; cv=none; b=i2iMLA0RxQl7Jwn6QTLsQQzMC/9NVQ9LJc9bsXFkp369MVgpCOp2qT9hD2lGLl98Q5S22h3TwTa54ZV/PemrzMU3jYaUsZHlDT3hMrWiSQsKYZ7zg1FJsour8jzAOOvS/NwS4MOQTjKYWgjyjjWFSljlMP15Rcvk516Qmqif2t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729223380; c=relaxed/simple;
	bh=tzFav4/qDoi0lVANe0ulqjdJ+7qcJQHUIYkPIJ3kLlw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ht6jpQRejprTHuEBoPCwKDUb+3Mj1jNcz4nSGVnWIVlPNDJMnlMHfr+4qj+YpybL5FWclfkjANNft9MY//fCEKmVgVewLz1UIfnMRlsUZDuSEs94iO37KdVFxuZY4u07FNrEWjEEYUpm3Js/xYraEA3lFupxOqcI8O/9WVzvNTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 18 Oct
 2024 11:49:19 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 18 Oct 2024 11:49:19 +0800
From: Tommy Huang <tommy_huang@aspeedtech.com>
To: <brendanhiggins@google.com>, <benh@kernel.crashing.org>, <joel@jms.id.au>,
	<andi.shyti@kernel.org>
CC: <linux-i2c@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>,
	<BMC-SW@aspeedtech.com>
Subject: [PATCH] i2c: aspeed: Consider i2c reset for muti-master case
Date: Fri, 18 Oct 2024 11:49:19 +0800
Message-ID: <20241018034919.974025-1-tommy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

In the original code, the device reset would not be triggered
when the driver is set to multi-master and bus is free.
It needs to be considered with multi-master condition.

Fixes: <f327c686d3ba> ("i2c: aspeed: Reset the i2c controller when timeout occurs")

Signed-off-by: Tommy Huang <tommy_huang@aspeedtech.com>
---
 drivers/i2c/busses/i2c-aspeed.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index cc5a26637fd5..7639ae3ace67 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -716,14 +716,15 @@ static int aspeed_i2c_master_xfer(struct i2c_adapter *adap,
 	if (time_left == 0) {
 		/*
 		 * In a multi-master setup, if a timeout occurs, attempt
-		 * recovery. But if the bus is idle, we still need to reset the
-		 * i2c controller to clear the remaining interrupts.
+		 * recovery device. But if the bus is idle,
+		 * we still need to reset the i2c controller to clear
+		 * the remaining interrupts or reset device abnormal condition.
 		 */
-		if (bus->multi_master &&
-		    (readl(bus->base + ASPEED_I2C_CMD_REG) &
-		     ASPEED_I2CD_BUS_BUSY_STS))
-			aspeed_i2c_recover_bus(bus);
-		else
+		if ((readl(bus->base + ASPEED_I2C_CMD_REG) &
+			ASPEED_I2CD_BUS_BUSY_STS)){
+			if (bus->multi_master)
+				aspeed_i2c_recover_bus(bus);
+		} else
 			aspeed_i2c_reset(bus);
 
 		/*
-- 
2.25.1


