Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 110A96611D6
	for <lists+linux-i2c@lfdr.de>; Sat,  7 Jan 2023 22:41:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230224AbjAGVl5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 7 Jan 2023 16:41:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231718AbjAGVlq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 7 Jan 2023 16:41:46 -0500
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 381A8271AC
        for <linux-i2c@vger.kernel.org>; Sat,  7 Jan 2023 13:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de;
        s=default2002; h=Content-Transfer-Encoding:MIME-Version:References:
        In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID;
        bh=jQJjwqVizlDsfAUb7jHtOgoEjaitvBRqyxSpBiUuHCg=; b=X6HKbEn/+hr/2GTyXLIy/Si3pN
        qu+xhKrK0nxuF33brSeFEO7ZoQyHaYM7JyOj8Eq8TmAeRx7vqhrIQs3/xjGghSauP6wsFO1v0XHCr
        iMPk51c/+l6EV4GAEeBm4/5LPVE7JxyylpBopaIJEousInmA2ZK3YX+PL9mRxkF3qZktLN3y62jh1
        Wsx/5lI4VYHi4rKw+MNRHUexmgtLUUb8ETkU5/26mXf9jhXfEKYem7tCA1FRoV+BFtrOXGYPuDT0P
        GWwEPpvc/WqDor6MFyn+WBdREMoDLLQw9Tw9E7yKCAV8n84qXiZm5h3H+Z0ePGWLMBaMOWDSvAu5a
        Zj79il6A==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
        by www381.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <lars@metafoo.de>)
        id 1pEGbC-000IV5-Qi; Sat, 07 Jan 2023 22:19:30 +0100
Received: from [2604:5500:c0e5:eb00:da5e:d3ff:feff:933b] (helo=lars-desktop.lan)
        by sslproxy01.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <lars@metafoo.de>)
        id 1pEGbC-000KM5-Ah; Sat, 07 Jan 2023 22:19:30 +0100
From:   Lars-Peter Clausen <lars@metafoo.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>,
        linux-i2c@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>
Subject: [PATCH 5/5] i2c: cadence: Remove unnecessary register reads
Date:   Sat,  7 Jan 2023 13:18:14 -0800
Message-Id: <20230107211814.1179438-6-lars@metafoo.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230107211814.1179438-1-lars@metafoo.de>
References: <20230107211814.1179438-1-lars@metafoo.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.103.7/26774/Sat Jan  7 09:54:43 2023)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In the `cdns_i2c_mrecv()` function the CTRL register of the Cadence I2C
controller is written and read back multiple times. The register value does
not change on its own. So it is possible to remember the just written value
instead of reading it back from the hardware.

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
---
 drivers/i2c/busses/i2c-cadence.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
index bec50bfe7aad..93c6d0822468 100644
--- a/drivers/i2c/busses/i2c-cadence.c
+++ b/drivers/i2c/busses/i2c-cadence.c
@@ -613,7 +613,7 @@ static void cdns_i2c_mrecv(struct cdns_i2c *id)
 
 	/* Determine hold_clear based on number of bytes to receive and hold flag */
 	if (!id->bus_hold_flag && id->recv_count <= CDNS_I2C_FIFO_DEPTH) {
-		if (cdns_i2c_readreg(CDNS_I2C_CR_OFFSET) & CDNS_I2C_CR_HOLD) {
+		if (ctrl_reg & CDNS_I2C_CR_HOLD) {
 			hold_clear = true;
 			if (id->quirks & CDNS_I2C_BROKEN_HOLD_BIT)
 				irq_save = true;
@@ -624,7 +624,7 @@ static void cdns_i2c_mrecv(struct cdns_i2c *id)
 	addr &= CDNS_I2C_ADDR_MASK;
 
 	if (hold_clear) {
-		ctrl_reg = cdns_i2c_readreg(CDNS_I2C_CR_OFFSET) & ~CDNS_I2C_CR_HOLD;
+		ctrl_reg &= ~CDNS_I2C_CR_HOLD;
 		/*
 		 * In case of Xilinx Zynq SOC, clear the HOLD bit before transfer size
 		 * register reaches '0'. This is an IP bug which causes transfer size
-- 
2.30.2

