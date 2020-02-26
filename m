Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CF7A16FC79
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Feb 2020 11:47:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727709AbgBZKrq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Feb 2020 05:47:46 -0500
Received: from cmccmta2.chinamobile.com ([221.176.66.80]:6600 "EHLO
        cmccmta2.chinamobile.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726679AbgBZKrq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Feb 2020 05:47:46 -0500
X-Greylist: delayed 543 seconds by postgrey-1.27 at vger.kernel.org; Wed, 26 Feb 2020 05:47:44 EST
Received: from spf.mail.chinamobile.com (unknown[172.16.121.13]) by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee85e564a9b2e7-50c0b; Wed, 26 Feb 2020 18:38:20 +0800 (CST)
X-RM-TRANSID: 2ee85e564a9b2e7-50c0b
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[112.3.208.163])
        by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee75e564a99c06-d63c9;
        Wed, 26 Feb 2020 18:38:19 +0800 (CST)
X-RM-TRANSID: 2ee75e564a99c06-d63c9
From:   tangbin <tangbin@cmss.chinamobile.com>
To:     wsa@the-dreams.de
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        tangbin <tangbin@cmss.chinamobile.com>
Subject: [PATCH] i2c:i2c-core-of:remove redundant dev_err message
Date:   Wed, 26 Feb 2020 18:39:01 +0800
Message-Id: <20200226103901.21520-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.20.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

of_i2c_register_device already contains error message, so remove
the redundant dev_err message

Signed-off-by: tangbin <tangbin@cmss.chinamobile.com>
---
 drivers/i2c/i2c-core-of.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
index 6787c1f71..7b0a786d3 100644
--- a/drivers/i2c/i2c-core-of.c
+++ b/drivers/i2c/i2c-core-of.c
@@ -103,9 +103,7 @@ void of_i2c_register_devices(struct i2c_adapter *adap)
 
 		client = of_i2c_register_device(adap, node);
 		if (IS_ERR(client)) {
-			dev_err(&adap->dev,
-				 "Failed to create I2C device for %pOF\n",
-				 node);
+			return PTR_ERR(client);
 			of_node_clear_flag(node, OF_POPULATED);
 		}
 	}
@@ -246,8 +244,6 @@ static int of_i2c_notify(struct notifier_block *nb, unsigned long action,
 
 		client = of_i2c_register_device(adap, rd->dn);
 		if (IS_ERR(client)) {
-			dev_err(&adap->dev, "failed to create client for '%pOF'\n",
-				 rd->dn);
 			put_device(&adap->dev);
 			of_node_clear_flag(rd->dn, OF_POPULATED);
 			return notifier_from_errno(PTR_ERR(client));
-- 
2.20.1.windows.1



