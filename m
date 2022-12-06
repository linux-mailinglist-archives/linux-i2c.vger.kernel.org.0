Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7878564423A
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Dec 2022 12:36:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234949AbiLFLgu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Dec 2022 06:36:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234944AbiLFLgu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 6 Dec 2022 06:36:50 -0500
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FC13DEC0;
        Tue,  6 Dec 2022 03:36:49 -0800 (PST)
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mxhk.zte.com.cn (FangMail) with ESMTPS id 4NRJKV0M5zz4xVng;
        Tue,  6 Dec 2022 19:36:46 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.40.50])
        by mse-fl1.zte.com.cn with SMTP id 2B6BaaT5021898;
        Tue, 6 Dec 2022 19:36:36 +0800 (+08)
        (envelope-from ye.xingchen@zte.com.cn)
Received: from mapi (xaxapp01[null])
        by mapi (Zmail) with MAPI id mid31;
        Tue, 6 Dec 2022 19:36:40 +0800 (CST)
Date:   Tue, 6 Dec 2022 19:36:40 +0800 (CST)
X-Zmail-TransId: 2af9638f2948ffffffffe86a9144
X-Mailer: Zmail v1.0
Message-ID: <202212061936401320262@zte.com.cn>
Mime-Version: 1.0
From:   <ye.xingchen@zte.com.cn>
To:     <wsa+renesas@sang-engineering.com>
Cc:     <peda@axentia.se>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIXSBpMmM6IG11eDogQ29udmVydCB0byB1c2Ugc3lzZnNfZW1pdF9hdCgpIEFQSQ==?=
Content-Type: text/plain;
        charset="UTF-8"
X-MAIL: mse-fl1.zte.com.cn 2B6BaaT5021898
X-Fangmail-Gw-Spam-Type: 0
X-FangMail-Miltered: at cgslv5.04-192.168.250.138.novalocal with ID 638F294E.000 by FangMail milter!
X-FangMail-Envelope: 1670326606/4NRJKV0M5zz4xVng/638F294E.000/10.5.228.132/[10.5.228.132]/mse-fl1.zte.com.cn/<ye.xingchen@zte.com.cn>
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 638F294E.000/4NRJKV0M5zz4xVng
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: ye xingchen <ye.xingchen@zte.com.cn>

Follow the advice of the Documentation/filesystems/sysfs.rst and show()
should only use sysfs_emit() or sysfs_emit_at() when formatting the
value to be returned to user space.

Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
---
 drivers/i2c/muxes/i2c-demux-pinctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/muxes/i2c-demux-pinctrl.c b/drivers/i2c/muxes/i2c-demux-pinctrl.c
index f7a7405d4350..6dc23aedcaed 100644
--- a/drivers/i2c/muxes/i2c-demux-pinctrl.c
+++ b/drivers/i2c/muxes/i2c-demux-pinctrl.c
@@ -167,7 +167,7 @@ static ssize_t available_masters_show(struct device *dev,
 	int count = 0, i;

 	for (i = 0; i < priv->num_chan && count < PAGE_SIZE; i++)
-		count += scnprintf(buf + count, PAGE_SIZE - count, "%d:%pOF%c",
+		count += sysfs_emit_at(buf, count, "%d:%pOF%c",
 				   i, priv->chan[i].parent_np,
 				   i == priv->num_chan - 1 ? '\n' : ' ');

-- 
2.25.1
