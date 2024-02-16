Return-Path: <linux-i2c+bounces-1833-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E08C857C55
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Feb 2024 13:10:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36B00285584
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Feb 2024 12:10:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 592A578670;
	Fri, 16 Feb 2024 12:10:08 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from TWMBX01.aspeed.com (211-20-114-70.hinet-ip.hinet.net [211.20.114.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC151BC57;
	Fri, 16 Feb 2024 12:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708085408; cv=none; b=ZJhb+p89WiHBmHs5H5FaY7fcGcDBtaIkopY02HcN2tv1nAZ8OuMtA4X/vlFdP9oCqnQvrSUlyqnE1OfA5+rrkoJKOkmqxrfFcFvUP4Zq/n92m+pECEIwT+txvWor5qtDRKxeB6DKgCbLudilthEsbhxccG902bqfcJvTYG7g3Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708085408; c=relaxed/simple;
	bh=/Cn0GaGjavwprH4dlcyGZLnvLz0zGHMC+umQ8K0F/5I=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=D61lMLhr+Gj0rSHpqftP8OJEvn9yAQcJnNQcsyFekZdvgJMNba0IeJ+sOuYzADMAm5ke0As0r7HukmOA1KAVsggJm6LnAkUwBJtP72VMM9PuCzANiHRiHweJFnSTcHwjkSF1NHyYQEDks9zv1y2hLrVBO6SQjFcExZn2e+GBEnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=aspeedtech.com; spf=fail smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=aspeedtech.com
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX01.aspeed.com
 (192.168.0.124) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Fri, 16 Feb
 2024 20:05:44 +0800
Received: from twmbx02.aspeed.com (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 16 Feb 2024 20:04:57 +0800
From: Tommy Huang <tommy_huang@aspeedtech.com>
To: <brendan.higgins@linux.dev>, <andi.shyti@kernel.org>,
	<p.zabel@pengutronix.de>, <linux-i2c@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>
CC: <benh@kernel.crashing.org>, <joel@jms.id.au>, <andrew@aj.id.au>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <BMC-SW@aspeedtech.com>
Subject: [PATCH] i2c: aspeed: Fix the dummy irq expected print
Date: Fri, 16 Feb 2024 20:04:55 +0800
Message-ID: <20240216120455.4138642-1-tommy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

When the i2c error condition occurred and master state was not idle,
the master irq function will goto complete state without any other
interrupt handling. It would cause dummy irq expected print. Under
this condition, assign the irq_status into irq_handle.

Signed-off-by: Tommy Huang <tommy_huang@aspeedtech.com>
---
 drivers/i2c/busses/i2c-aspeed.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index 5511fd46a65e..ce8c4846b7fa 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -445,6 +445,7 @@ static u32 aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
 			irq_status);
 		irq_handled |= (irq_status & ASPEED_I2CD_INTR_MASTER_ERRORS);
 		if (bus->master_state != ASPEED_I2C_MASTER_INACTIVE) {
+			irq_handled = irq_status;
 			bus->cmd_err = ret;
 			bus->master_state = ASPEED_I2C_MASTER_INACTIVE;
 			goto out_complete;
-- 
2.25.1


