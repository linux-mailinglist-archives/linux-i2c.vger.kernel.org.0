Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0011F7B0F1
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jul 2019 19:57:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726167AbfG3R4M (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Jul 2019 13:56:12 -0400
Received: from sauhun.de ([88.99.104.3]:56000 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726964AbfG3R4M (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 30 Jul 2019 13:56:12 -0400
Received: from localhost (p54B33338.dip0.t-ipconnect.de [84.179.51.56])
        by pokefinder.org (Postfix) with ESMTPSA id 80ED42E354A;
        Tue, 30 Jul 2019 19:56:10 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Sean Young <sean@mess.org>, linux-media@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] media: ir-kbd-i2c: remove outdated comments
Date:   Tue, 30 Jul 2019 19:55:55 +0200
Message-Id: <20190730175555.14098-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190730175555.14098-1-wsa+renesas@sang-engineering.com>
References: <20190730175555.14098-1-wsa+renesas@sang-engineering.com>
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
Change since v1:

* none

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

