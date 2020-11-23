Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E0972C1684
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Nov 2020 21:29:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729624AbgKWU16 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 Nov 2020 15:27:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728156AbgKWU16 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 23 Nov 2020 15:27:58 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A94FC0613CF
        for <linux-i2c@vger.kernel.org>; Mon, 23 Nov 2020 12:27:57 -0800 (PST)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1khIRI-0007s6-02; Mon, 23 Nov 2020 21:27:56 +0100
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1khIRH-0006iq-Am; Mon, 23 Nov 2020 21:27:55 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH] i2c: pca-platform: drop two members from driver data that are assigned to only
Date:   Mon, 23 Nov 2020 21:27:46 +0100
Message-Id: <20201123202746.2817480-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

io_base and io_size are assigned to only in .probe() and otherwise unused.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/i2c/busses/i2c-pca-platform.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pca-platform.c b/drivers/i2c/busses/i2c-pca-platform.c
index 546426a470cc..86d4f75ef8d3 100644
--- a/drivers/i2c/busses/i2c-pca-platform.c
+++ b/drivers/i2c/busses/i2c-pca-platform.c
@@ -33,8 +33,6 @@ struct i2c_pca_pf_data {
 	wait_queue_head_t		wait;
 	struct i2c_adapter		adap;
 	struct i2c_algo_pca_data	algo_data;
-	unsigned long			io_base;
-	unsigned long			io_size;
 };
 
 /* Read/Write functions for different register alignments */
@@ -156,8 +154,6 @@ static int i2c_pca_pf_probe(struct platform_device *pdev)
 
 	init_waitqueue_head(&i2c->wait);
 
-	i2c->io_base = res->start;
-	i2c->io_size = resource_size(res);
 	i2c->irq = irq;
 
 	i2c->adap.nr = pdev->id;
-- 
2.29.2

