Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12A8AA8CBC
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2019 21:30:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732059AbfIDQQw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 4 Sep 2019 12:16:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:34010 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732391AbfIDP72 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 4 Sep 2019 11:59:28 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B13E52339E;
        Wed,  4 Sep 2019 15:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567612768;
        bh=RBiB+nszUOZlllJwJQPDLHwFxoOujyJoImu0eDIhmHY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gYOeI0vrwwSgkYBapMSx4bRndp3K+cws0YKnH0NEX7szUAuLtpNos6Evy1OA1MMl9
         y8b0yW5MC2+9NltFzPMcQltm9n4QgJhRxsrkc1275wjMEt05PwMZWGr8psU2wmutwx
         kDhoNga0xr5TihIW9EOyWKvaaZEjjy1H9ob782cQ=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Krzysztof Adamski <krzysztof.adamski@nokia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Sasha Levin <sashal@kernel.org>, linux-i2c@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 70/94] i2c: designware: Synchronize IRQs when unregistering slave client
Date:   Wed,  4 Sep 2019 11:57:15 -0400
Message-Id: <20190904155739.2816-70-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190904155739.2816-1-sashal@kernel.org>
References: <20190904155739.2816-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Jarkko Nikula <jarkko.nikula@linux.intel.com>

[ Upstream commit c486dcd2f1bbdd524a1e0149734b79e4ae329650 ]

Make sure interrupt handler i2c_dw_irq_handler_slave() has finished
before clearing the the dev->slave pointer in i2c_dw_unreg_slave().

There is possibility for a race if i2c_dw_irq_handler_slave() is running
on another CPU while clearing the dev->slave pointer.

Reported-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
Reported-by: Wolfram Sang <wsa@the-dreams.de>
Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/i2c/busses/i2c-designware-slave.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-designware-slave.c b/drivers/i2c/busses/i2c-designware-slave.c
index e7f9305b2dd9f..f5f001738df5e 100644
--- a/drivers/i2c/busses/i2c-designware-slave.c
+++ b/drivers/i2c/busses/i2c-designware-slave.c
@@ -94,6 +94,7 @@ static int i2c_dw_unreg_slave(struct i2c_client *slave)
 
 	dev->disable_int(dev);
 	dev->disable(dev);
+	synchronize_irq(dev->irq);
 	dev->slave = NULL;
 	pm_runtime_put(dev->dev);
 
-- 
2.20.1

