Return-Path: <linux-i2c+bounces-77-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC6A7E8FFD
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Nov 2023 14:24:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB5E61C2097F
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Nov 2023 13:24:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 351C9134A9;
	Sun, 12 Nov 2023 13:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ayCFZARd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81F812B76
	for <linux-i2c@vger.kernel.org>; Sun, 12 Nov 2023 13:24:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E48A8C433D9;
	Sun, 12 Nov 2023 13:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699795453;
	bh=ju5sMtIR5PEWLuld4r3Z5XVp1jGemYzS/JCK/K6QcHI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ayCFZARdw6kO5sR2KoX6YIyZhpEdAFzkR4YIM3pmJsn7/T4pHO668gjidxV4xvFNR
	 uPgYCiGxl+7lQTBWMgOui7oxq9PXfpLa0QB6Ae3651cZpHJl+M01PYm99Xen9KVI4W
	 wwm5eU7jzyfMQprJDc7yuc2Ls5rgMtjJDzhaaK3XLBwVQhy1Zlmlkf+kuKfzivRJ9l
	 OuGAXESwRg5RcRCROIr0RB1IQEFJd6iWFxMVAcxiyv5QhF8wtHncPh5dxskkxKTS2I
	 7DEe9T4HXgYdyz7niTOYufU40G+41Yjr+rBoAMpL2ofFuoxHhjrU9AeSkzIDPffihu
	 7Y/HuDbXxhXPA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Yang Yingliang <yangyingliang@huawei.com>,
	Wolfram Sang <wsa@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 2/6] i2c: fix memleak in i2c_new_client_device()
Date: Sun, 12 Nov 2023 08:23:57 -0500
Message-ID: <20231112132408.174499-2-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231112132408.174499-1-sashal@kernel.org>
References: <20231112132408.174499-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.62
Content-Transfer-Encoding: 8bit

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

[ Upstream commit 6af79f7fe748fe6a3c5c3a63d7f35981a82c2769 ]

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
Signed-off-by: Wolfram Sang <wsa@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/i2c/i2c-core-base.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 7539b0740351d..5e3976ba52650 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -916,8 +916,9 @@ int i2c_dev_irq_from_resources(const struct resource *resources,
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
@@ -955,7 +956,6 @@ i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *inf
 	client->dev.fwnode = info->fwnode;
 
 	device_enable_async_suspend(&client->dev);
-	i2c_dev_set_name(adap, client, info);
 
 	if (info->swnode) {
 		status = device_add_software_node(&client->dev, info->swnode);
@@ -967,6 +967,7 @@ i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *inf
 		}
 	}
 
+	i2c_dev_set_name(adap, client, info);
 	status = device_register(&client->dev);
 	if (status)
 		goto out_remove_swnode;
@@ -978,6 +979,7 @@ i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *inf
 
 out_remove_swnode:
 	device_remove_software_node(&client->dev);
+	need_put = true;
 out_err_put_of_node:
 	of_node_put(info->of_node);
 out_err:
@@ -985,7 +987,10 @@ i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *inf
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
2.42.0


