Return-Path: <linux-i2c+bounces-2189-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE6787124E
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Mar 2024 02:24:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E5601C212CE
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Mar 2024 01:24:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DCEC125C1;
	Tue,  5 Mar 2024 01:24:19 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from TWMBX01.aspeed.com (211-20-114-70.hinet-ip.hinet.net [211.20.114.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8E6FBE9;
	Tue,  5 Mar 2024 01:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709601859; cv=none; b=eLS1xQR+pFmCCrOoCW0SyexrS9O+WH+lhRcMSLpS8cc+kyOXNJi79/GAcH5WTRrbSJsn4n7rE6o7zOTjK/PZgVccSwlbbSqc4zoTTVER84b+35tLPROYrwfo/7I8vZO+8oheE9SsSIZB0faYvUn84u3qD0LdwzoZpPlLyh858lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709601859; c=relaxed/simple;
	bh=SiTU3/lQ/JkgDkpTq0F6QQJUJBb284UfhlEgXg8DB/Y=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nagu5/vinP8BIssbHXz6+NpjbDxB3FRgOg1nmibPPHvoA2u5Pywjl/4rKtZV/uGwv70DaP5St3uRQyvw/CnBfLiE4JRR+p9YYwRbmp9OkznqXcx0jwy1YpimldDDfOZ8u2FITxQMCSWIOccC7P9J9EhXkUxqraoxrkxxMwSoG6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=aspeedtech.com; spf=fail smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=aspeedtech.com
Received: from TWMBX03.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.124) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Tue, 5 Mar
 2024 09:20:08 +0800
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX03.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 5 Mar
 2024 09:20:08 +0800
Received: from twmbx02.aspeed.com (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 5 Mar 2024 09:19:08 +0800
From: Tommy Huang <tommy_huang@aspeedtech.com>
To: <brendan.higgins@linux.dev>, <benh@kernel.crashing.org>, <joel@jms.id.au>,
	<andi.shyti@kernel.org>, <andrew@codeconstruct.com.au>,
	<jae.hyun.yoo@linux.intel.com>, <wsa@kernel.org>
CC: <linux-i2c@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <BMC-SW@aspeedtech.com>
Subject: [PATCH v2] i2c: aspeed: Fix the dummy irq expected print
Date: Tue, 5 Mar 2024 09:19:06 +0800
Message-ID: <20240305011906.2745639-1-tommy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

When the i2c error condition occurred and master state was not
idle, the master irq function will goto complete state without any
other interrupt handling. It would cause dummy irq expected print.
Under this condition, assign the irq_status into irq_handle.

For example, when the abnormal start / stop occurred (bit 5) with
normal stop status (bit 4) at same time. Then the normal stop status
would not be handled and it would cause irq expected print in
the aspeed_i2c_bus_irq.

...
aspeed-i2c-bus x. i2c-bus: irq handled != irq.
Expected 0x00000030, but was 0x00000020
...

Fixes: 3e9efc3299dd ("i2c: aspeed: Handle master/slave combined irq events properly")
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>

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


