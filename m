Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB777194A1C
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Mar 2020 22:12:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727899AbgCZVKF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 Mar 2020 17:10:05 -0400
Received: from sauhun.de ([88.99.104.3]:54372 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727884AbgCZVKF (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 26 Mar 2020 17:10:05 -0400
Received: from localhost (p54B3331F.dip0.t-ipconnect.de [84.179.51.31])
        by pokefinder.org (Postfix) with ESMTPSA id AAAC42C1F90;
        Thu, 26 Mar 2020 22:10:03 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Boris Brezillon <bbrezillon@kernel.org>,
        linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] i3c: convert to use i2c_new_client_device()
Date:   Thu, 26 Mar 2020 22:10:02 +0100
Message-Id: <20200326211002.13241-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200326211002.13241-1-wsa+renesas@sang-engineering.com>
References: <20200326211002.13241-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Move away from the deprecated API.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i3c/master.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 925e1ed18a2a..d79cd6d54b3a 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2160,7 +2160,7 @@ static int i3c_master_i2c_adapter_init(struct i3c_master_controller *master)
 	 * correctly even if one or more i2c devices are not registered.
 	 */
 	i3c_bus_for_each_i2cdev(&master->bus, i2cdev)
-		i2cdev->dev = i2c_new_device(adap, &i2cdev->boardinfo->base);
+		i2cdev->dev = i2c_new_client_device(adap, &i2cdev->boardinfo->base);
 
 	return 0;
 }
-- 
2.20.1

