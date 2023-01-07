Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F2CC6611D8
	for <lists+linux-i2c@lfdr.de>; Sat,  7 Jan 2023 22:42:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232641AbjAGVl7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 7 Jan 2023 16:41:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232675AbjAGVlv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 7 Jan 2023 16:41:51 -0500
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BD5B30568
        for <linux-i2c@vger.kernel.org>; Sat,  7 Jan 2023 13:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de;
        s=default2002; h=Content-Transfer-Encoding:MIME-Version:References:
        In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID;
        bh=WijF59gYFE7TyJcWQqc6Jvdfwgsz0L6hxpCmWfBEWw4=; b=gfWBTbNFq/frE6FJ/otkNBgR6h
        ZxivAsS8b7OMU3Q6Eo46b7AsUasgSxmkDElfCXmFTC2jz/Uysg+LN08dZ+NNGqzvDdiIgrWgDh4fJ
        USPMNEZrzfhbhMhjf/+FbGNv8JAnkCf09jrzWQoeIRyEAEkJnp4u0J8Zw8yi4W/IYKq3jBdmH2Oz5
        b395q18UkU5YoAQGQ69zsw/qr8KU648fcMhaYisaV4KhLH6zBDfnobZokVvcKHIi44ud+CyHTulk4
        b6fl4or/b5xxZRnpHbUc+Qhn5FNvvgP2CrC+8XQxS2w/8QUdJ9fxhkXIu4yq4mXpAknNVfAa46QFP
        o3T+M5ew==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
        by www381.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <lars@metafoo.de>)
        id 1pEGb9-000ITr-Uw; Sat, 07 Jan 2023 22:19:27 +0100
Received: from [2604:5500:c0e5:eb00:da5e:d3ff:feff:933b] (helo=lars-desktop.lan)
        by sslproxy01.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <lars@metafoo.de>)
        id 1pEGb9-000KM5-De; Sat, 07 Jan 2023 22:19:27 +0100
From:   Lars-Peter Clausen <lars@metafoo.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>,
        linux-i2c@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>
Subject: [PATCH 3/5] i2c: cadence: Remove redundant expression in if clause
Date:   Sat,  7 Jan 2023 13:18:12 -0800
Message-Id: <20230107211814.1179438-4-lars@metafoo.de>
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

In the mrecv() function the Cadence I2C driver has the following expression
in an if clause.

	((id->p_msg->flags & I2C_M_RECV_LEN) != I2C_M_RECV_LEN) &&
	 (id->recv_count <= CDNS_I2C_FIFO_DEPTH))

Earlier in the same function when I2C_M_RECV_LEN is set the recv_count is
initialized to a value that is larger than CDNS_I2C_FIFO_DEPTH. This means
if the first expression is false the second expression is also false.
Checking the first expression is thus redundant and can be removed.

This slightly simplifies the logic.

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
---
 drivers/i2c/busses/i2c-cadence.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
index e2a4cb694cfb..b5d22e7282c2 100644
--- a/drivers/i2c/busses/i2c-cadence.c
+++ b/drivers/i2c/busses/i2c-cadence.c
@@ -612,9 +612,7 @@ static void cdns_i2c_mrecv(struct cdns_i2c *id)
 	}
 
 	/* Determine hold_clear based on number of bytes to receive and hold flag */
-	if (!id->bus_hold_flag &&
-	    ((id->p_msg->flags & I2C_M_RECV_LEN) != I2C_M_RECV_LEN) &&
-	    (id->recv_count <= CDNS_I2C_FIFO_DEPTH)) {
+	if (!id->bus_hold_flag && id->recv_count <= CDNS_I2C_FIFO_DEPTH) {
 		if (cdns_i2c_readreg(CDNS_I2C_CR_OFFSET) & CDNS_I2C_CR_HOLD) {
 			hold_clear = true;
 			if (id->quirks & CDNS_I2C_BROKEN_HOLD_BIT)
-- 
2.30.2

