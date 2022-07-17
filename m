Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A2A85776CF
	for <lists+linux-i2c@lfdr.de>; Sun, 17 Jul 2022 16:52:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229781AbiGQOw4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 17 Jul 2022 10:52:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229775AbiGQOwz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 17 Jul 2022 10:52:55 -0400
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32EA4C8
        for <linux-i2c@vger.kernel.org>; Sun, 17 Jul 2022 07:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de;
         s=default2002; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
        Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References;
        bh=tZCFVOQE4T8h9oS4eyzMJqjoUYeoknmn/5HbSFhQz+k=; b=DsUP+ivM9jOP4sfNI/6nd4uCRW
        pKBs/qKpLWjBv86vINzOdo588UWx0WyvrwpP+AJMg71iGySyP7hFrZHZAgmSPUzxJ0kwrK6p1/uRn
        oUVqnfowYg+nur7gNTh2GVBNqxVzxAuZ6lnnHphL8mqK5jjBI9Ouz1E8u37NzomHVJudE0fRFVYdG
        NdRPAGPSMonl+NRhYZciVm/LNxrhLcWBbLiqd2pcnm6ndqvbZsBsi49cK9QR+lPo1gZVg+dhnir5G
        KEzh4yMftxyg259kSIYZb0Z8tIGgunRuE1HYX+VRx5i8my/FjoVsXN/0AKf2+miw0j7A/anWnwnKx
        +76s/AcQ==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
        by www381.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92.3)
        (envelope-from <lars@metafoo.de>)
        id 1oD5dc-0000Dc-K3; Sun, 17 Jul 2022 16:52:52 +0200
Received: from [2001:a61:2a49:8301:9e5c:8eff:fe01:8578] (helo=lars-desktop.fritz.box)
        by sslproxy05.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <lars@metafoo.de>)
        id 1oD5dc-000899-D0; Sun, 17 Jul 2022 16:52:52 +0200
From:   Lars-Peter Clausen <lars@metafoo.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>,
        Michal Simek <michal.simek@amd.com>, linux-i2c@vger.kernel.org,
        Lars-Peter Clausen <lars@metafoo.de>
Subject: [PATCH] i2c: cadence: Support PEC for SMBus block read
Date:   Sun, 17 Jul 2022 16:52:44 +0200
Message-Id: <20220717145244.652278-1-lars@metafoo.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.103.6/26604/Sun Jul 17 09:58:15 2022)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SMBus packet error checking (PEC) is implemented by appending one
additional byte of checksum data at the end of the message. This provides
additional protection and allows to detect data corruption on the I2C bus.

SMBus block reads support variable length reads. The first byte in the read
message is the number of available data bytes.

The combination of PEC and block read is currently not supported by the
Cadence I2C driver.
 * When PEC is enabled the maximum transfer length for block reads
   increases from 33 to 34 bytes.
 * The I2C core smbus emulation layer relies on the driver updating the
   `i2c_msg` `len` field with the number of received bytes. The updated
   length is used when checking the PEC.

Add support to the Cadence I2C driver for handling SMBus block reads with
PEC. To determine the maximum transfer length uses the initial `len` value
of the `i2c_msg`. When PEC is enabled this will be 2, when it is disabled
it will be 1.

Once a read transfer is done also increment the `len` field by the amount
of received data bytes.

This change has been tested with a UCM90320 PMBus power monitor, which
requires block reads to access certain data fields, but also has PEC
enabled by default.

Fixes: df8eb5691c48 ("i2c: Add driver for Cadence I2C controller")
Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
---
 drivers/i2c/busses/i2c-cadence.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
index 630cfa4ddd46..33f5588a50c0 100644
--- a/drivers/i2c/busses/i2c-cadence.c
+++ b/drivers/i2c/busses/i2c-cadence.c
@@ -573,8 +573,13 @@ static void cdns_i2c_mrecv(struct cdns_i2c *id)
 	ctrl_reg = cdns_i2c_readreg(CDNS_I2C_CR_OFFSET);
 	ctrl_reg |= CDNS_I2C_CR_RW | CDNS_I2C_CR_CLR_FIFO;
 
+	/*
+	 * Receive up to I2C_SMBUS_BLOCK_MAX data bytes, plus one message length
+	 * byte, plus one checksum byte if PEC is enabled. p_msg->len will be 2 if
+	 * PEC is enabled, otherwise 1.
+	 */
 	if (id->p_msg->flags & I2C_M_RECV_LEN)
-		id->recv_count = I2C_SMBUS_BLOCK_MAX + 1;
+		id->recv_count = I2C_SMBUS_BLOCK_MAX + id->p_msg->len;
 
 	id->curr_recv_count = id->recv_count;
 
@@ -789,6 +794,9 @@ static int cdns_i2c_process_msg(struct cdns_i2c *id, struct i2c_msg *msg,
 	if (id->err_status & CDNS_I2C_IXR_ARB_LOST)
 		return -EAGAIN;
 
+	if (msg->flags & I2C_M_RECV_LEN)
+		msg->len += min_t(unsigned int, msg->buf[0], I2C_SMBUS_BLOCK_MAX);
+
 	return 0;
 }
 
-- 
2.30.2

