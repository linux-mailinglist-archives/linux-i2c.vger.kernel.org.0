Return-Path: <linux-i2c+bounces-3710-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE0E8D45CB
	for <lists+linux-i2c@lfdr.de>; Thu, 30 May 2024 09:12:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7EEF71C21A4D
	for <lists+linux-i2c@lfdr.de>; Thu, 30 May 2024 07:12:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B4BF4D8B4;
	Thu, 30 May 2024 07:12:09 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4866E4D8A6;
	Thu, 30 May 2024 07:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717053129; cv=none; b=DusNy3BV3h/MsBifcerSUoVuI2goFJAbP1Rqk7D9lTxlgBAqWszCQerlvJO9wOWCrIx/Un4ELQLWz17APaFcsIMzjXbonp0s+L6c9jGXAhsvxS1zKVI8opw8sjpq0KCXvPy52mIFiKo8ZJqKG4MQfJCceVBilgQEwrIknhTGdP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717053129; c=relaxed/simple;
	bh=A8QA5xiuTXpYm2b3qlN0XfhdUwCEKH7elZsg/fbQ2VY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=q66nGvZE5Es2hgPW5uuI5dEgeWa0jFHvppYMsFaEUbCMRgKHm66u3aiU/SIwsQcyj5OOTmOIpgqdiVY77AQlzuOdG56L+ZMadqs+Y9jjJKMybg6Thzlbg4mftlltCV8FqtXRaH1NB4229kxQpMEsiJpZnu09vVTBBzBMYDYTLmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 30 May
 2024 15:06:56 +0800
Received: from twmbx02.aspeed.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 30 May 2024 15:06:56 +0800
From: Tommy Huang <tommy_huang@aspeedtech.com>
To: <brendan.higgins@linux.dev>, <benh@kernel.crashing.org>, <joel@jms.id.au>,
	<andi.shyti@kernel.org>, <andrew@codeconstruct.com.au>, <wsa@kernel.org>
CC: <linux-i2c@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <BMC-SW@aspeedtech.com>
Subject: [PATCH] i2c: aspeed: Update the stop sw state when the bus recovry occurs
Date: Thu, 30 May 2024 15:06:56 +0800
Message-ID: <20240530070656.3841066-1-tommy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

When the i2c bus recovey occurs, driver will send i2c stop command
in the scl low condition. In this case the sw state will still keep
original situation. Under multi-master usage, i2c bus recovery will
be called when i2c transfer timeout occurs. Update the stop command
calling with aspeed_i2c_do_stop function to update master_state.

Fixes: f327c686d3ba ("i2c: aspeed: added driver for Aspeed I2C")

Signed-off-by: Tommy Huang <tommy_huang@aspeedtech.com>
---
 drivers/i2c/busses/i2c-aspeed.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index ce8c4846b7fa..32f8b0c1c174 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -169,6 +169,7 @@ struct aspeed_i2c_bus {
 };
 
 static int aspeed_i2c_reset(struct aspeed_i2c_bus *bus);
+static void aspeed_i2c_do_stop(struct aspeed_i2c_bus *bus);
 
 static int aspeed_i2c_recover_bus(struct aspeed_i2c_bus *bus)
 {
@@ -187,7 +188,7 @@ static int aspeed_i2c_recover_bus(struct aspeed_i2c_bus *bus)
 			command);
 
 		reinit_completion(&bus->cmd_complete);
-		writel(ASPEED_I2CD_M_STOP_CMD, bus->base + ASPEED_I2C_CMD_REG);
+		aspeed_i2c_do_stop(bus);
 		spin_unlock_irqrestore(&bus->lock, flags);
 
 		time_left = wait_for_completion_timeout(
-- 
2.25.1


