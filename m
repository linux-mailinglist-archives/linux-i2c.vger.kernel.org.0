Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0B1857EC18
	for <lists+linux-i2c@lfdr.de>; Sat, 23 Jul 2022 06:33:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233283AbiGWEd2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 23 Jul 2022 00:33:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbiGWEd2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 23 Jul 2022 00:33:28 -0400
Received: from mail-m973.mail.163.com (mail-m973.mail.163.com [123.126.97.3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 17D3BBA4F0;
        Fri, 22 Jul 2022 21:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=uXlb1
        r3BbJdtgryVnq7yMNYfh6mt8p4E1um7vBRzrRs=; b=jrVHDzAIIIvcEoC6nuvpW
        4jmC5YBYAG4erNe21gAUefQ2zG9mcO5scJz6oqgUc0Kx9SXlj/1opoDJg8KLelcX
        4ERMHuZk9HObyYWKTAmM3wepaB/ypsCQGsePLtkDIOFCeatPQx+HnfND/4iXbp4w
        Ko7y4mrxujgKcQn5hj7WBU=
Received: from localhost.localdomain (unknown [123.58.221.99])
        by smtp3 (Coremail) with SMTP id G9xpCgBnBZfeedtiEC0yQw--.2963S2;
        Sat, 23 Jul 2022 12:32:32 +0800 (CST)
From:   williamsukatube@163.com
To:     bence98@sch.bme.hu, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     William Dean <williamsukatube@gmail.com>,
        Hacash Robot <hacashRobot@santino.com>
Subject: [PATCH] i2c: cp2615: check the return value of kzalloc()
Date:   Sat, 23 Jul 2022 12:32:29 +0800
Message-Id: <20220723043229.2953386-1-williamsukatube@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: G9xpCgBnBZfeedtiEC0yQw--.2963S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WF48Kr1xXr47uF47Gry7trb_yoW8Ww13pF
        1fCF4DCr4Uta42gr4DZry8XFySgw1rGF9rJrW7tasxZryxZr95Jw1jgr1rZFWrAFWUKr12
        qayDt3WxuF1kur7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07bwT5LUUUUU=
X-Originating-IP: [123.58.221.99]
X-CM-SenderInfo: xzlozx5dpv3yxdwxuvi6rwjhhfrp/1tbiNwBHg1WBo2wCAQAAsr
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: William Dean <williamsukatube@gmail.com>

kzalloc() is a memory allocation function which can return NULL when
some internal memory errors happen. So it is better to check the
return value of it to prevent potential wrong memory access or
memory leak.

Fixes: 4a7695429eade ("i2c: cp2615: add i2c driver for Silicon Labs' CP2615 Digital Audio Bridge")
Reported-by: Hacash Robot <hacashRobot@santino.com>
Signed-off-by: William Dean <williamsukatube@gmail.com>
---
 drivers/i2c/busses/i2c-cp2615.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cp2615.c b/drivers/i2c/busses/i2c-cp2615.c
index 3ded28632e4c..7c9403346615 100644
--- a/drivers/i2c/busses/i2c-cp2615.c
+++ b/drivers/i2c/busses/i2c-cp2615.c
@@ -171,11 +171,17 @@ cp2615_i2c_recv(struct usb_interface *usbif, unsigned char tag, void *buf)
 /* Checks if the IOP is functional by querying the part's ID */
 static int cp2615_check_iop(struct usb_interface *usbif)
 {
-	struct cp2615_iop_msg *msg = kzalloc(sizeof(*msg), GFP_KERNEL);
-	struct cp2615_iop_accessory_info *info = (struct cp2615_iop_accessory_info *)&msg->data;
+	struct cp2615_iop_msg *msg;
+	struct cp2615_iop_accessory_info *info;
 	struct usb_device *usbdev = interface_to_usbdev(usbif);
-	int res = cp2615_init_iop_msg(msg, iop_GetAccessoryInfo, NULL, 0);
+	int res;
+
+	msg = kzalloc(sizeof(*msg), GFP_KERNEL);
+	if (!msg)
+		return -ENOMEM;
 
+	info = (struct cp2615_iop_accessory_info *)&msg->data;
+	res = cp2615_init_iop_msg(msg, iop_GetAccessoryInfo, NULL, 0);
 	if (res)
 		goto out;
 
-- 
2.25.1

