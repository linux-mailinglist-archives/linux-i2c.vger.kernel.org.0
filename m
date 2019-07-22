Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6E9A706E7
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jul 2019 19:27:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731508AbfGVR0f (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Jul 2019 13:26:35 -0400
Received: from sauhun.de ([88.99.104.3]:42398 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731494AbfGVR0f (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 22 Jul 2019 13:26:35 -0400
Received: from localhost (p54B33E22.dip0.t-ipconnect.de [84.179.62.34])
        by pokefinder.org (Postfix) with ESMTPSA id F2EFA4A148F;
        Mon, 22 Jul 2019 19:26:33 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] media: ir-kbd-i2c: remove outdated comments
Date:   Mon, 22 Jul 2019 19:26:32 +0200
Message-Id: <20190722172632.4402-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190722172632.4402-1-wsa+renesas@sang-engineering.com>
References: <20190722172632.4402-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The "free memory" comment is obsolete since 2013 and the other ones
explain the obvious. Just remove the comments.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/media/i2c/ir-kbd-i2c.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/media/i2c/ir-kbd-i2c.c b/drivers/media/i2c/ir-kbd-i2c.c
index f46717052efc..30fde0e025c9 100644
--- a/drivers/media/i2c/ir-kbd-i2c.c
+++ b/drivers/media/i2c/ir-kbd-i2c.c
@@ -916,13 +916,9 @@ static int ir_remove(struct i2c_client *client)
 {
 	struct IR_i2c *ir = i2c_get_clientdata(client);
 
-	/* kill outstanding polls */
 	cancel_delayed_work_sync(&ir->work);
-
-	/* unregister device */
 	rc_unregister_device(ir->rc);
 
-	/* free memory */
 	return 0;
 }
 
-- 
2.20.1

