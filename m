Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47C1012B391
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2019 10:40:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726197AbfL0Jk3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 27 Dec 2019 04:40:29 -0500
Received: from smtp21.cstnet.cn ([159.226.251.21]:42584 "EHLO cstnet.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725904AbfL0Jk3 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 27 Dec 2019 04:40:29 -0500
X-Greylist: delayed 345 seconds by postgrey-1.27 at vger.kernel.org; Fri, 27 Dec 2019 04:40:28 EST
Received: from localhost.localdomain (unknown [159.226.5.100])
        by APP-01 (Coremail) with SMTP id qwCowAB3fLgr0AVewOdMCg--.31S3;
        Fri, 27 Dec 2019 17:34:35 +0800 (CST)
From:   Xu Wang <vulab@iscas.ac.cn>
To:     wsa@the-dreams.de
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] i2c: Fix a potential use after free
Date:   Fri, 27 Dec 2019 09:34:32 +0000
Message-Id: <1577439272-10362-1-git-send-email-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.7.4
X-CM-TRANSID: qwCowAB3fLgr0AVewOdMCg--.31S3
X-Coremail-Antispam: 1UD129KBjvdXoWrZr4kWF15Cr4UuryfGr43trb_yoWxZwbEka
        4UA3ZrWr95Crs8ur15AFW5ZryrKFZYq39Y9w10qrZ3Aa4Ygr17WFWUZ3y3Ww4Ygr1DW3W3
        W3WqgrWxX3sxZjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUb28YjsxI4VWDJwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
        6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
        8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0
        cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4
        A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
        w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMc
        vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY02Avz4vE14v_GFWl42xK82IY
        c2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s
        026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF
        0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0x
        vE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E
        87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07joD73UUUUU=
X-Originating-IP: [159.226.5.100]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgURA10TefpTAQAAsO
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Free the adap structure only after we are done using it.
This patch just moves the put_device() down a bit to avoid the
use after free.

Signed-off-by: Xu Wang <vulab@iscas.ac.cn>
---
 drivers/i2c/i2c-core-base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 9f8dcd3..160d43e 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -2301,8 +2301,8 @@ void i2c_put_adapter(struct i2c_adapter *adap)
 	if (!adap)
 		return;
 
-	put_device(&adap->dev);
 	module_put(adap->owner);
+	put_device(&adap->dev);
 }
 EXPORT_SYMBOL(i2c_put_adapter);
 
-- 
2.7.4

