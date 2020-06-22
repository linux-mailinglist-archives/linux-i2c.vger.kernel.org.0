Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C8D4202E38
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jun 2020 04:06:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731025AbgFVCGA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 21 Jun 2020 22:06:00 -0400
Received: from mail.zju.edu.cn ([61.164.42.155]:9664 "EHLO zju.edu.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731026AbgFVCF7 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 21 Jun 2020 22:05:59 -0400
Received: from localhost.localdomain (unknown [210.32.144.65])
        by mail-app3 (Coremail) with SMTP id cC_KCgDnEnjhEfBeyJcJAQ--.40864S4;
        Mon, 22 Jun 2020 10:05:25 +0800 (CST)
From:   Dinghao Liu <dinghao.liu@zju.edu.cn>
To:     dinghao.liu@zju.edu.cn, kjlu@umn.edu
Cc:     Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Patrice Chotard <patrice.chotard@st.com>,
        Scott Branden <scott.branden@broadcom.com>,
        Dejin Zheng <zhengdejin5@gmail.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: sprd: Fix runtime PM imbalance on error
Date:   Mon, 22 Jun 2020 10:05:18 +0800
Message-Id: <20200622020520.5334-1-dinghao.liu@zju.edu.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: cC_KCgDnEnjhEfBeyJcJAQ--.40864S4
X-Coremail-Antispam: 1UD129KBjvJXoWrKrWrZF17ur48GF48JF1xGrg_yoW8JrWrpr
        W0gF90kFW7XrZagF4DArsxXFy5W3yft3y5JFWjk3WfZFs8X3Wktr45JF1FqF48JrWkJF4f
        Jw4qya9xCFy0yF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUU9v1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
        w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
        IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJr0_GcWl84ACjcxK6I8E
        87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c
        8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_
        Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwI
        xGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc2xSY4AK
        67AK6r4UMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_GFWkJr1UJwCFx2IqxV
        CFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r10
        6r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxV
        WUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG
        6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JV
        W8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbpwZ7UUUUU==
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAgcQBlZdtOvMDgAIsN
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

pm_runtime_get_sync() increments the runtime PM usage counter even
the call returns an error code. Thus a corresponding decrement is
needed on the error handling path to keep the counter balanced.

Fix this by adding the missed function call.

Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
---
 drivers/i2c/busses/i2c-sprd.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sprd.c b/drivers/i2c/busses/i2c-sprd.c
index 19cda6742423..675f72a3fd60 100644
--- a/drivers/i2c/busses/i2c-sprd.c
+++ b/drivers/i2c/busses/i2c-sprd.c
@@ -285,8 +285,10 @@ static int sprd_i2c_master_xfer(struct i2c_adapter *i2c_adap,
 	int im, ret;
 
 	ret = pm_runtime_get_sync(i2c_dev->dev);
-	if (ret < 0)
+	if (ret < 0) {
+		pm_runtime_put_noidle(i2c_dev->dev);
 		return ret;
+	}
 
 	for (im = 0; im < num - 1; im++) {
 		ret = sprd_i2c_handle_msg(i2c_adap, &msgs[im], 0);
@@ -571,8 +573,10 @@ static int sprd_i2c_remove(struct platform_device *pdev)
 	int ret;
 
 	ret = pm_runtime_get_sync(i2c_dev->dev);
-	if (ret < 0)
+	if (ret < 0) {
+		pm_runtime_put_noidle(i2c_dev->dev);
 		return ret;
+	}
 
 	i2c_del_adapter(&i2c_dev->adap);
 	clk_disable_unprepare(i2c_dev->clk);
-- 
2.17.1

