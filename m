Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9579F1E34D1
	for <lists+linux-i2c@lfdr.de>; Wed, 27 May 2020 03:39:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726007AbgE0BjR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 26 May 2020 21:39:17 -0400
Received: from mail.zju.edu.cn ([61.164.42.155]:53386 "EHLO zju.edu.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725801AbgE0BjQ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 26 May 2020 21:39:16 -0400
Received: from localhost.localdomain (unknown [222.205.60.151])
        by mail-app3 (Coremail) with SMTP id cC_KCgCXSECuxM1ejBQOAA--.22651S4;
        Wed, 27 May 2020 09:38:57 +0800 (CST)
From:   Dinghao Liu <dinghao.liu@zju.edu.cn>
To:     dinghao.liu@zju.edu.cn, kjlu@umn.edu
Cc:     Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] [v2] i2c: stm32f7: Fix runtime PM imbalance on error
Date:   Wed, 27 May 2020 09:38:53 +0800
Message-Id: <20200527013853.30252-1-dinghao.liu@zju.edu.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: cC_KCgCXSECuxM1ejBQOAA--.22651S4
X-Coremail-Antispam: 1UD129KBjvJXoWxGFW8AFyxJF4UWw15Ar4xWFg_yoW5Wr4xpr
        W5KayakFWUt3yvqFn3ArnIqF98W3yft34DZFyF93WS9Fs5X3WDtFy8JFyYvF48XrZ5A3WU
        A39FywsrC3Wrt3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvF1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
        w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
        IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW0oVCq3wA2z4x0Y4vEx4A2
        jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52
        x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWU
        GwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI4
        8JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_KwCF04k20xvY0x0EwIxGrwCF
        04k20xvE74AGY7Cv6cx26r4fKr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
        xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43
        MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I
        0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AK
        xVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvj
        fUOMKZDUUUU
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAg0MBlZdtOUT6wAHsg
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

pm_runtime_get_sync() increments the runtime PM usage counter even
the call returns an error code. Thus a pairing decrement is needed
on the error handling path to keep the counter balanced.

Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
---

Changelog:

v2: - Use pm_runtime_put_noidle() instead of
      pm_runtime_put_autosuspend(). Fix 5 more
      similar cases within this dirver.
---
 drivers/i2c/busses/i2c-stm32f7.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index 330ffed011e0..822fd1f5b5ae 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -1620,8 +1620,10 @@ static int stm32f7_i2c_xfer(struct i2c_adapter *i2c_adap,
 	f7_msg->smbus = false;
 
 	ret = pm_runtime_get_sync(i2c_dev->dev);
-	if (ret < 0)
+	if (ret < 0) {
+		pm_runtime_put_noidle(i2c_dev->dev);
 		return ret;
+	}
 
 	ret = stm32f7_i2c_wait_free_bus(i2c_dev);
 	if (ret)
@@ -1666,8 +1668,10 @@ static int stm32f7_i2c_smbus_xfer(struct i2c_adapter *adapter, u16 addr,
 	f7_msg->smbus = true;
 
 	ret = pm_runtime_get_sync(dev);
-	if (ret < 0)
+	if (ret < 0) {
+		pm_runtime_put_noidle(dev);
 		return ret;
+	}
 
 	ret = stm32f7_i2c_wait_free_bus(i2c_dev);
 	if (ret)
@@ -1767,8 +1771,10 @@ static int stm32f7_i2c_reg_slave(struct i2c_client *slave)
 		return ret;
 
 	ret = pm_runtime_get_sync(dev);
-	if (ret < 0)
+	if (ret < 0) {
+		pm_runtime_put_noidle(dev);
 		return ret;
+	}
 
 	if (!stm32f7_i2c_is_slave_registered(i2c_dev))
 		stm32f7_i2c_enable_wakeup(i2c_dev, true);
@@ -1837,8 +1843,10 @@ static int stm32f7_i2c_unreg_slave(struct i2c_client *slave)
 	WARN_ON(!i2c_dev->slave[id]);
 
 	ret = pm_runtime_get_sync(i2c_dev->dev);
-	if (ret < 0)
+	if (ret < 0) {
+		pm_runtime_put_noidle(i2c_dev->dev);
 		return ret;
+	}
 
 	if (id == 0) {
 		mask = STM32F7_I2C_OAR1_OA1EN;
@@ -2182,8 +2190,10 @@ static int stm32f7_i2c_regs_backup(struct stm32f7_i2c_dev *i2c_dev)
 	struct stm32f7_i2c_regs *backup_regs = &i2c_dev->backup_regs;
 
 	ret = pm_runtime_get_sync(i2c_dev->dev);
-	if (ret < 0)
+	if (ret < 0) {
+		pm_runtime_put_noidle(i2c_dev->dev);
 		return ret;
+	}
 
 	backup_regs->cr1 = readl_relaxed(i2c_dev->base + STM32F7_I2C_CR1);
 	backup_regs->cr2 = readl_relaxed(i2c_dev->base + STM32F7_I2C_CR2);
@@ -2204,8 +2214,10 @@ static int stm32f7_i2c_regs_restore(struct stm32f7_i2c_dev *i2c_dev)
 	struct stm32f7_i2c_regs *backup_regs = &i2c_dev->backup_regs;
 
 	ret = pm_runtime_get_sync(i2c_dev->dev);
-	if (ret < 0)
+	if (ret < 0) {
+		pm_runtime_put_noidle(i2c_dev->dev);
 		return ret;
+	}
 
 	cr1 = readl_relaxed(i2c_dev->base + STM32F7_I2C_CR1);
 	if (cr1 & STM32F7_I2C_CR1_PE)
-- 
2.17.1

