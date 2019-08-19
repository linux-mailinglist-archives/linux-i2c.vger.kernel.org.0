Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1275894F51
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2019 22:49:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728018AbfHSUtI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Aug 2019 16:49:08 -0400
Received: from sauhun.de ([88.99.104.3]:55670 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727971AbfHSUtI (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 19 Aug 2019 16:49:08 -0400
Received: from localhost (p54B3355A.dip0.t-ipconnect.de [84.179.53.90])
        by pokefinder.org (Postfix) with ESMTPSA id C4B5E2C2868;
        Mon, 19 Aug 2019 22:49:06 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] i2c: make i2c_unregister_device() ERR_PTR safe
Date:   Mon, 19 Aug 2019 22:48:25 +0200
Message-Id: <20190819204825.2937-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

We are moving towards returning ERR_PTRs when i2c_new_*_device() calls
fail. Make sure its counterpart for unregistering handles ERR_PTRs as
well.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/i2c-core-base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 76cb91e064b8..e5ba612ddc1e 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -832,7 +832,7 @@ EXPORT_SYMBOL_GPL(i2c_new_device);
  */
 void i2c_unregister_device(struct i2c_client *client)
 {
-	if (!client)
+	if (IS_ERR_OR_NULL(client))
 		return;
 
 	if (client->dev.of_node) {
-- 
2.20.1

