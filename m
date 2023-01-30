Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A23BC681510
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Jan 2023 16:33:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236811AbjA3PdA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Jan 2023 10:33:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236320AbjA3Pc7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 30 Jan 2023 10:32:59 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 880B5BBA4
        for <linux-i2c@vger.kernel.org>; Mon, 30 Jan 2023 07:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1675092777; x=1706628777;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YXkQPJ4Fwf72eWcx4a6gkKFeKJ2We9s1nTw8/musS0w=;
  b=V53BRhShWp4gf+utFqmaAxoGyjDjw5iNsh1/VU0orMTM5L9eFaZ8kN2U
   9jZmy+xj+9ywjrDQ1epQLrETAKw7YTRJI1fcbYOGDipTc2N1TfKt/gxll
   Xjl7G/UAOTSLsAGPUSVsJhX3rdj7A1VlQR2ix7nGWnTY/8jTrRHb9j9lt
   86iOiiU2US7sZaDNNUE4TU0KK3tSs2NMcSWKY3LmT3+6egP577N07+5TP
   BLtcEc7VDee/mtrOjosx4Uk2nvjlaidMsY6dYirSzYH/40ljc2m/+XHl7
   tKr2iRGjWh+TU46I+ZfLd3GlAAIeg/g09RpiOZNoHLaf9ryTeKUXOytSL
   A==;
X-IronPort-AV: E=Sophos;i="5.97,258,1669071600"; 
   d="scan'208";a="28747102"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 30 Jan 2023 16:32:53 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 30 Jan 2023 16:32:53 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 30 Jan 2023 16:32:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1675092773; x=1706628773;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YXkQPJ4Fwf72eWcx4a6gkKFeKJ2We9s1nTw8/musS0w=;
  b=CNz6HSvQa3xdE6hN3Ef1Zu3RPMyQwTYZ19vnEDqYnCOYb37h9ZN/4wm3
   4EAv3Xs7N4JUsGWkK0HhSMgyx1xMd+V8VW2XoAttQgyfIUsiuOK7cx5MT
   6wNRMtv609jBV87BL+4VqVUwgCKHJSgAkZUjbz5xKbAWKWyIaTM2wXXlC
   Ct8KCAr8BpcvN6MQFbhknC8D1QyyXhWEfZoXA0LLrRoobYqx6txZ/Hau4
   GS5sYXKFRRys5rDt3eP5rxlJTLoBVdrZdLVQCnXMa1diMTtkRZvI3zxbJ
   6aK4pkLDwa+ofWYsE+jscCn6HCUkTGnphe9Tl8Lm9bVEjRuagwR/sqQJq
   A==;
X-IronPort-AV: E=Sophos;i="5.97,258,1669071600"; 
   d="scan'208";a="28747101"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 30 Jan 2023 16:32:52 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 41AA6280072;
        Mon, 30 Jan 2023 16:32:52 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] i2c: imx-lpi2c: check only for enabled interrupt flags
Date:   Mon, 30 Jan 2023 16:32:47 +0100
Message-Id: <20230130153247.445027-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130153247.445027-1-alexander.stein@ew.tq-group.com>
References: <20230130153247.445027-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

When reading from I2C, the Tx watermark is set to 0. Unfortunately the
TDF (transmit data flag) is enabled when Tx FIFO entries is equal or less
than watermark. So it is set in every case, hence the reset default of 1.
This results in the MSR_RDF _and_ MSR_TDF flags to be set thus trying
to send Tx data on a read message.
Mask the IRQ status to filter for wanted flags only.

Fixes: a55fa9d0e42e ("i2c: imx-lpi2c: add low power i2c bus driver")
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
To be honest I'm wondering why this didn't occur to somebody else before.
The behaviour also matches the downstream kernel which does

> if (temp & MSR_RDF)
>	lpi2c_imx_read_rxfifo(lpi2c_imx);
> else if (temp & MSR_TDF)
>	lpi2c_imx_write_txfifo(lpi2c_imx);

avoiding handling both Rx and Tx events.

 drivers/i2c/busses/i2c-imx-lpi2c.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index c6d0225246e6..a49b14d52a98 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -505,10 +505,14 @@ static int lpi2c_imx_xfer(struct i2c_adapter *adapter,
 static irqreturn_t lpi2c_imx_isr(int irq, void *dev_id)
 {
 	struct lpi2c_imx_struct *lpi2c_imx = dev_id;
+	unsigned int enabled;
 	unsigned int temp;
 
+	enabled = readl(lpi2c_imx->base + LPI2C_MIER);
+
 	lpi2c_imx_intctrl(lpi2c_imx, 0);
 	temp = readl(lpi2c_imx->base + LPI2C_MSR);
+	temp &= enabled;
 
 	if (temp & MSR_RDF)
 		lpi2c_imx_read_rxfifo(lpi2c_imx);
-- 
2.34.1

