Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FA37132D80
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2020 18:48:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728454AbgAGRso (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Jan 2020 12:48:44 -0500
Received: from sauhun.de ([88.99.104.3]:53374 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728407AbgAGRsV (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 7 Jan 2020 12:48:21 -0500
Received: from localhost (p5486CF8B.dip0.t-ipconnect.de [84.134.207.139])
        by pokefinder.org (Postfix) with ESMTPSA id 5C1642C3959;
        Tue,  7 Jan 2020 18:48:19 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 07/12] i2c: xiic: convert to use i2c_new_client_device()
Date:   Tue,  7 Jan 2020 18:47:41 +0100
Message-Id: <20200107174748.9616-8-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200107174748.9616-1-wsa+renesas@sang-engineering.com>
References: <20200107174748.9616-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Move away from the deprecated API and return the shiny new ERRPTR where
useful.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
Build tested only.

 drivers/i2c/busses/i2c-xiic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index d8d49f1814c7..61e081b186cc 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -806,7 +806,7 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 	if (pdata) {
 		/* add in known devices to the bus */
 		for (i = 0; i < pdata->num_devices; i++)
-			i2c_new_device(&i2c->adap, pdata->devices + i);
+			i2c_new_client_device(&i2c->adap, pdata->devices + i);
 	}
 
 	return 0;
-- 
2.20.1

