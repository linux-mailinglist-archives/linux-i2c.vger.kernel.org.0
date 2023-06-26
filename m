Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D5F273ECD5
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Jun 2023 23:26:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229984AbjFZV02 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 26 Jun 2023 17:26:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229562AbjFZV01 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 26 Jun 2023 17:26:27 -0400
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EEC5BD;
        Mon, 26 Jun 2023 14:26:26 -0700 (PDT)
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4Qqgrb2JXJz5P;
        Mon, 26 Jun 2023 23:26:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1687814783; bh=A1vX/Rui6Hw1vPtrHasKkX4UxOWQFsKVaGJ8Atwa9Bo=;
        h=Date:Subject:From:To:Cc:From;
        b=XQYQ8jJussbJBbRl7T8rXwOpF/PxTFBz2SqoTjdqAHaVKqWaQGAMZT25KKHUulPPT
         ln/wYDLZ86ucnnvQh3IKygnDZJAduxMsrvc3XzD2qOoWMaDXn4T+aG4J95ZBefak0Y
         BarfWt6Fz2lU5ob9d6qVq4X+rjsq+yOH9d3TmUL4oxcmHw2MZDM+f136U/0x5nVSnE
         HmMhoHglrfEG6VD1YeXNF7c/ZeemyMtH7zHWTs8iqnOaFSeISJUcAbyyAFq26wxSkT
         7mvH1RRFJpmqk8Ai3ptzkj8q1jEULcbpb5G7sBxWt4EBMPuRPakEmRVcmC6cKdJp/f
         eD25C8KCH0kjQ==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.8 at mail
Date:   Mon, 26 Jun 2023 23:26:22 +0200
Message-Id: <6ac87dcbb660ae892bf8740c78d3eca7625d6db6.1687814664.git.mirq-linux@rere.qmqm.pl>
Subject: [PATCH 1/1] i2c: at91: constify at91_twi_pdata
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
To:     Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
---
 drivers/i2c/busses/i2c-at91-core.c   | 24 ++++++++++++------------
 drivers/i2c/busses/i2c-at91-master.c |  4 ++--
 drivers/i2c/busses/i2c-at91.h        |  2 +-
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-at91-core.c b/drivers/i2c/busses/i2c-at91-core.c
index 05ad3bc3578a..4d484e231371 100644
--- a/drivers/i2c/busses/i2c-at91-core.c
+++ b/drivers/i2c/busses/i2c-at91-core.c
@@ -62,28 +62,28 @@ void at91_init_twi_bus(struct at91_twi_dev *dev)
 		at91_init_twi_bus_master(dev);
 }
 
-static struct at91_twi_pdata at91rm9200_config = {
+static const struct at91_twi_pdata at91rm9200_config = {
 	.clk_max_div = 5,
 	.clk_offset = 3,
 	.has_unre_flag = true,
 };
 
-static struct at91_twi_pdata at91sam9261_config = {
+static const struct at91_twi_pdata at91sam9261_config = {
 	.clk_max_div = 5,
 	.clk_offset = 4,
 };
 
-static struct at91_twi_pdata at91sam9260_config = {
+static const struct at91_twi_pdata at91sam9260_config = {
 	.clk_max_div = 7,
 	.clk_offset = 4,
 };
 
-static struct at91_twi_pdata at91sam9g20_config = {
+static const struct at91_twi_pdata at91sam9g20_config = {
 	.clk_max_div = 7,
 	.clk_offset = 4,
 };
 
-static struct at91_twi_pdata at91sam9g10_config = {
+static const struct at91_twi_pdata at91sam9g10_config = {
 	.clk_max_div = 7,
 	.clk_offset = 4,
 };
@@ -110,19 +110,19 @@ static const struct platform_device_id at91_twi_devtypes[] = {
 };
 
 #if defined(CONFIG_OF)
-static struct at91_twi_pdata at91sam9x5_config = {
+static const struct at91_twi_pdata at91sam9x5_config = {
 	.clk_max_div = 7,
 	.clk_offset = 4,
 };
 
-static struct at91_twi_pdata sama5d4_config = {
+static const struct at91_twi_pdata sama5d4_config = {
 	.clk_max_div = 7,
 	.clk_offset = 4,
 	.has_hold_field = true,
 	.has_dig_filtr = true,
 };
 
-static struct at91_twi_pdata sama5d2_config = {
+static const struct at91_twi_pdata sama5d2_config = {
 	.clk_max_div = 7,
 	.clk_offset = 3,
 	.has_unre_flag = true,
@@ -134,7 +134,7 @@ static struct at91_twi_pdata sama5d2_config = {
 	.has_clear_cmd = false,	/* due to errata, CLEAR cmd is not working */
 };
 
-static struct at91_twi_pdata sam9x60_config = {
+static const struct at91_twi_pdata sam9x60_config = {
 	.clk_max_div = 7,
 	.clk_offset = 3,
 	.has_unre_flag = true,
@@ -181,7 +181,7 @@ static const struct of_device_id atmel_twi_dt_ids[] = {
 MODULE_DEVICE_TABLE(of, atmel_twi_dt_ids);
 #endif
 
-static struct at91_twi_pdata *at91_twi_get_driver_data(
+static const struct at91_twi_pdata *at91_twi_get_driver_data(
 					struct platform_device *pdev)
 {
 	if (pdev->dev.of_node) {
@@ -189,9 +189,9 @@ static struct at91_twi_pdata *at91_twi_get_driver_data(
 		match = of_match_node(atmel_twi_dt_ids, pdev->dev.of_node);
 		if (!match)
 			return NULL;
-		return (struct at91_twi_pdata *)match->data;
+		return match->data;
 	}
-	return (struct at91_twi_pdata *) platform_get_device_id(pdev)->driver_data;
+	return (const void *) platform_get_device_id(pdev)->driver_data;
 }
 
 static int at91_twi_probe(struct platform_device *pdev)
diff --git a/drivers/i2c/busses/i2c-at91-master.c b/drivers/i2c/busses/i2c-at91-master.c
index c0c35785a0dc..0434aabb66fe 100644
--- a/drivers/i2c/busses/i2c-at91-master.c
+++ b/drivers/i2c/busses/i2c-at91-master.c
@@ -32,7 +32,7 @@
 
 void at91_init_twi_bus_master(struct at91_twi_dev *dev)
 {
-	struct at91_twi_pdata *pdata = dev->pdata;
+	const struct at91_twi_pdata *pdata = dev->pdata;
 	u32 filtr = 0;
 
 	/* FIFO should be enabled immediately after the software reset */
@@ -67,7 +67,7 @@ void at91_init_twi_bus_master(struct at91_twi_dev *dev)
 static void at91_calc_twi_clock(struct at91_twi_dev *dev)
 {
 	int ckdiv, cdiv, div, hold = 0, filter_width = 0;
-	struct at91_twi_pdata *pdata = dev->pdata;
+	const struct at91_twi_pdata *pdata = dev->pdata;
 	int offset = pdata->clk_offset;
 	int max_ckdiv = pdata->clk_max_div;
 	struct i2c_timings timings, *t = &timings;
diff --git a/drivers/i2c/busses/i2c-at91.h b/drivers/i2c/busses/i2c-at91.h
index 942e9c3973bb..f0c80b89e502 100644
--- a/drivers/i2c/busses/i2c-at91.h
+++ b/drivers/i2c/busses/i2c-at91.h
@@ -147,7 +147,7 @@ struct at91_twi_dev {
 	unsigned transfer_status;
 	struct i2c_adapter adapter;
 	unsigned twi_cwgr_reg;
-	struct at91_twi_pdata *pdata;
+	const struct at91_twi_pdata *pdata;
 	bool use_dma;
 	bool use_alt_cmd;
 	bool recv_len_abort;
-- 
2.39.2

