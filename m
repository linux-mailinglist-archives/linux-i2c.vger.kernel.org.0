Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DBB57B2F0E
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Sep 2023 11:20:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232519AbjI2JUC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 29 Sep 2023 05:20:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231774AbjI2JUC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 29 Sep 2023 05:20:02 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 766EB1A8
        for <linux-i2c@vger.kernel.org>; Fri, 29 Sep 2023 02:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        sang-engineering.com; h=from:to:cc:subject:date:message-id
        :mime-version:content-transfer-encoding; s=k1; bh=CPCOX8Pk808b+b
        p768FKhaTdrGjFDu5eVaZMfKQbRpU=; b=TNnoYa3iv05zXfEWTwp4/pi40Du+IF
        8heVnVxeXg0mIFyQeyzUJiBXjACBBOtgORflQmm6zwzViPMpb/bF5He6jTefXSpn
        gA3AqiR9pqbMoTBL6iqtBWkdxuAD/CSjjjz24cIXu1vwme9aYB2S8dWmG4cQyRIv
        oz45OCfOuYaGdQAHAcCo2PbDdDeE/scvWvao3bY6Hdv87S9gFIqPHooOuPgP6VRl
        uZNoAl80ATsBZEnRc3cjsyN9NY0dGmLUMxMFqRbn4E452pfc5O9vloqOcaUF10SU
        j8jyTjd465dXaZ0mDSfZ53dMzt2LAi1BhhGKcgaWLxDKFevh75MdFpDA==
Received: (qmail 3780117 invoked from network); 29 Sep 2023 11:19:56 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Sep 2023 11:19:56 +0200
X-UD-Smtp-Session: l3s3148p1@sfOD7XsGGL0ujntX
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Yang Yingliang <yangyingliang@huawei.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3] i2c: fix memleak in i2c_new_client_device()
Date:   Fri, 29 Sep 2023 11:19:52 +0200
Message-Id: <20230929091952.19957-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Yang Yingliang reported a memleak:
===

I got memory leak as follows when doing fault injection test:

unreferenced object 0xffff888014aec078 (size 8):
  comm "xrun", pid 356, jiffies 4294910619 (age 16.332s)
  hex dump (first 8 bytes):
    31 2d 30 30 31 63 00 00                          1-001c..
  backtrace:
    [<00000000eb56c0a9>] __kmalloc_track_caller+0x1a6/0x300
    [<000000000b220ea3>] kvasprintf+0xad/0x140
    [<00000000b83203e5>] kvasprintf_const+0x62/0x190
    [<000000002a5eab37>] kobject_set_name_vargs+0x56/0x140
    [<00000000300ac279>] dev_set_name+0xb0/0xe0
    [<00000000b66ebd6f>] i2c_new_client_device+0x7e4/0x9a0

If device_register() returns error in i2c_new_client_device(),
the name allocated by i2c_dev_set_name() need be freed. As
comment of device_register() says, it should use put_device()
to give up the reference in the error path.

===
I think this solution is less intrusive and more robust than he
originally proposed solutions, though.

Reported-by: Yang Yingliang <yangyingliang@huawei.com>
Closes: http://patchwork.ozlabs.org/project/linux-i2c/patch/20221124085448.3620240-1-yangyingliang@huawei.com/
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Build tested only.

@Yang Yingliang: I'd be happy if you could test it/comment on it.

 drivers/i2c/i2c-core-base.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index cc4a20465456..0d6172d6b808 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -931,8 +931,9 @@ int i2c_dev_irq_from_resources(const struct resource *resources,
 struct i2c_client *
 i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *info)
 {
-	struct i2c_client	*client;
-	int			status;
+	struct i2c_client *client;
+	bool need_put = false;
+	int status;
 
 	client = kzalloc(sizeof *client, GFP_KERNEL);
 	if (!client)
@@ -970,7 +971,6 @@ i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *inf
 	client->dev.fwnode = info->fwnode;
 
 	device_enable_async_suspend(&client->dev);
-	i2c_dev_set_name(adap, client, info);
 
 	if (info->swnode) {
 		status = device_add_software_node(&client->dev, info->swnode);
@@ -982,6 +982,7 @@ i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *inf
 		}
 	}
 
+	i2c_dev_set_name(adap, client, info);
 	status = device_register(&client->dev);
 	if (status)
 		goto out_remove_swnode;
@@ -993,6 +994,7 @@ i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *inf
 
 out_remove_swnode:
 	device_remove_software_node(&client->dev);
+	need_put = true;
 out_err_put_of_node:
 	of_node_put(info->of_node);
 out_err:
@@ -1000,7 +1002,10 @@ i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *inf
 		"Failed to register i2c client %s at 0x%02x (%d)\n",
 		client->name, client->addr, status);
 out_err_silent:
-	kfree(client);
+	if (need_put)
+		put_device(&client->dev);
+	else
+		kfree(client);
 	return ERR_PTR(status);
 }
 EXPORT_SYMBOL_GPL(i2c_new_client_device);
-- 
2.30.2

