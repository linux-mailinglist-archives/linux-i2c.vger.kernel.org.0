Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A922194A0F
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Mar 2020 22:12:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727729AbgCZVJx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 Mar 2020 17:09:53 -0400
Received: from sauhun.de ([88.99.104.3]:54328 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727473AbgCZVJw (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 26 Mar 2020 17:09:52 -0400
Received: from localhost (p54B3331F.dip0.t-ipconnect.de [84.179.51.31])
        by pokefinder.org (Postfix) with ESMTPSA id 87EE82C1F8A;
        Thu, 26 Mar 2020 22:09:50 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] media: usb: cx231xx: convert to use i2c_new_client_device()
Date:   Thu, 26 Mar 2020 22:09:44 +0100
Message-Id: <20200326210947.12747-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200326210947.12747-1-wsa+renesas@sang-engineering.com>
References: <20200326210947.12747-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Move away from the deprecated API and make use of the fact that
unregistering devices is NULL- and ERR_PTR-safe.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/media/usb/cx231xx/cx231xx-input.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-input.c b/drivers/media/usb/cx231xx/cx231xx-input.c
index 9f88c640ec2b..8149702bcf89 100644
--- a/drivers/media/usb/cx231xx/cx231xx-input.c
+++ b/drivers/media/usb/cx231xx/cx231xx-input.c
@@ -88,7 +88,7 @@ int cx231xx_ir_init(struct cx231xx *dev)
 	ir_i2c_bus = cx231xx_boards[dev->model].ir_i2c_master;
 	dev_dbg(dev->dev, "Trying to bind ir at bus %d, addr 0x%02x\n",
 		ir_i2c_bus, info.addr);
-	dev->ir_i2c_client = i2c_new_device(
+	dev->ir_i2c_client = i2c_new_client_device(
 		cx231xx_get_i2c_adap(dev, ir_i2c_bus), &info);
 
 	return 0;
@@ -96,7 +96,6 @@ int cx231xx_ir_init(struct cx231xx *dev)
 
 void cx231xx_ir_exit(struct cx231xx *dev)
 {
-	if (dev->ir_i2c_client)
-		i2c_unregister_device(dev->ir_i2c_client);
+	i2c_unregister_device(dev->ir_i2c_client);
 	dev->ir_i2c_client = NULL;
 }
-- 
2.20.1

