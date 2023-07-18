Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B48887579AD
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jul 2023 12:54:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229706AbjGRKyp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Jul 2023 06:54:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229749AbjGRKyp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 18 Jul 2023 06:54:45 -0400
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A4C0CF;
        Tue, 18 Jul 2023 03:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
        s=default2211; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
        Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References;
        bh=RYXitp7vsqnGs0swR9AWSytUDA+Ixomy3yyK0MsJ4R8=; b=DjuhIdS1hAZtaWI1Z5eg/w2Wsj
        aqQcM1JMsCuik1oI1GuyQeAfxehHvLtgBh82Kmj1kBQlTO1vIEgrzO8IBw+2LC1stqgTLTWUDNc2o
        UDcC8Y7QEFmdol8pGHliYin+8fpeM75ibgsKQ2raqDDKGNN34cLiIwBPOZjDXqfV//P4zBtEcGBrS
        iqIHYyrj2Oav5VkCXRs4hNkkcMo3II1Gs+FIxgrEFs3fDJ933/e+esqw86vFNytA6OJVr4ETs63gL
        bIJuMhFLUjajxAwTy/lvIjQ1XxVv4s+mHsmjgii/J5+nAPKLrUwNqVQIwYrO2YzXaWXPReWsMggUd
        fy4Mk50A==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
        by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <sean@geanix.com>)
        id 1qLiLm-0002Jj-Nh; Tue, 18 Jul 2023 12:54:38 +0200
Received: from [185.17.218.86] (helo=zen..)
        by sslproxy02.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <sean@geanix.com>)
        id 1qLiLm-000Tgg-5k; Tue, 18 Jul 2023 12:54:38 +0200
From:   Sean Nyekjaer <sean@geanix.com>
To:     Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc:     Sean Nyekjaer <sean@geanix.com>, linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] i2c: stm32f7: Add atomic_xfer method to driver
Date:   Tue, 18 Jul 2023 12:54:35 +0200
Message-Id: <20230718105435.2641207-1-sean@geanix.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.8/26973/Tue Jul 18 09:28:30 2023)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H5,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add an atomic_xfer method to the driver so that it behaves correctly
when controlling a PMIC that is responsible for device shutdown.

The atomic_xfer method added is similar to the one from the i2c-mv64xxx
driver. When running an atomic_xfer a bool flag in the driver data is
set, the interrupt is not unmasked on transfer start, and the IRQ
handler is manually invoked while waiting for pending transfers to
complete.

Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---
Changes since v1:
 - Removed dma in atomic

 drivers/i2c/busses/i2c-stm32f7.c | 111 ++++++++++++++++++++++---------
 1 file changed, 78 insertions(+), 33 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index e897d9101434..d944b8f85d1c 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -357,6 +357,7 @@ struct stm32f7_i2c_dev {
 	u32 dnf_dt;
 	u32 dnf;
 	struct stm32f7_i2c_alert *alert;
+	bool atomic;
 };
 
 /*
@@ -905,38 +906,43 @@ static void stm32f7_i2c_xfer_msg(struct stm32f7_i2c_dev *i2c_dev,
 		cr2 |= STM32F7_I2C_CR2_NBYTES(f7_msg->count);
 	}
 
-	/* Enable NACK, STOP, error and transfer complete interrupts */
-	cr1 |= STM32F7_I2C_CR1_ERRIE | STM32F7_I2C_CR1_TCIE |
-		STM32F7_I2C_CR1_STOPIE | STM32F7_I2C_CR1_NACKIE;
-
-	/* Clear DMA req and TX/RX interrupt */
-	cr1 &= ~(STM32F7_I2C_CR1_RXIE | STM32F7_I2C_CR1_TXIE |
-			STM32F7_I2C_CR1_RXDMAEN | STM32F7_I2C_CR1_TXDMAEN);
-
-	/* Configure DMA or enable RX/TX interrupt */
-	i2c_dev->use_dma = false;
-	if (i2c_dev->dma && f7_msg->count >= STM32F7_I2C_DMA_LEN_MIN) {
-		ret = stm32_i2c_prep_dma_xfer(i2c_dev->dev, i2c_dev->dma,
-					      msg->flags & I2C_M_RD,
-					      f7_msg->count, f7_msg->buf,
-					      stm32f7_i2c_dma_callback,
-					      i2c_dev);
-		if (!ret)
-			i2c_dev->use_dma = true;
-		else
-			dev_warn(i2c_dev->dev, "can't use DMA\n");
-	}
+	if (!i2c_dev->atomic) {
+		/* Enable NACK, STOP, error and transfer complete interrupts */
+		cr1 |= STM32F7_I2C_CR1_ERRIE | STM32F7_I2C_CR1_TCIE |
+			STM32F7_I2C_CR1_STOPIE | STM32F7_I2C_CR1_NACKIE;
+
+		/* Clear DMA req and TX/RX interrupt */
+		cr1 &= ~(STM32F7_I2C_CR1_RXIE | STM32F7_I2C_CR1_TXIE |
+				STM32F7_I2C_CR1_RXDMAEN | STM32F7_I2C_CR1_TXDMAEN);
+
+		/* Configure DMA or enable RX/TX interrupt */
+		i2c_dev->use_dma = false;
+		if (i2c_dev->dma && f7_msg->count >= STM32F7_I2C_DMA_LEN_MIN) {
+			ret = stm32_i2c_prep_dma_xfer(i2c_dev->dev, i2c_dev->dma,
+					msg->flags & I2C_M_RD,
+					f7_msg->count, f7_msg->buf,
+					stm32f7_i2c_dma_callback,
+					i2c_dev);
+			if (!ret)
+				i2c_dev->use_dma = true;
+			else
+				dev_warn(i2c_dev->dev, "can't use DMA\n");
+		}
 
-	if (!i2c_dev->use_dma) {
-		if (msg->flags & I2C_M_RD)
-			cr1 |= STM32F7_I2C_CR1_RXIE;
-		else
-			cr1 |= STM32F7_I2C_CR1_TXIE;
+		if (!i2c_dev->use_dma) {
+			if (msg->flags & I2C_M_RD)
+				cr1 |= STM32F7_I2C_CR1_RXIE;
+			else
+				cr1 |= STM32F7_I2C_CR1_TXIE;
+		} else {
+			if (msg->flags & I2C_M_RD)
+				cr1 |= STM32F7_I2C_CR1_RXDMAEN;
+			else
+				cr1 |= STM32F7_I2C_CR1_TXDMAEN;
+		}
 	} else {
-		if (msg->flags & I2C_M_RD)
-			cr1 |= STM32F7_I2C_CR1_RXDMAEN;
-		else
-			cr1 |= STM32F7_I2C_CR1_TXDMAEN;
+		/* Disable all interrupts */
+		cr1 &= ~STM32F7_I2C_ALL_IRQ_MASK;
 	}
 
 	/* Configure Start/Repeated Start */
@@ -1670,7 +1676,22 @@ static irqreturn_t stm32f7_i2c_isr_error(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static int stm32f7_i2c_xfer(struct i2c_adapter *i2c_adap,
+static int stm32f7_i2c_wait_polling(struct stm32f7_i2c_dev *i2c_dev)
+{
+	ktime_t timeout = ktime_add_ms(ktime_get(), i2c_dev->adap.timeout);
+
+	while (ktime_compare(ktime_get(), timeout) < 0) {
+		udelay(5);
+		stm32f7_i2c_isr_event(0, i2c_dev);
+
+		if (try_wait_for_completion(&i2c_dev->complete))
+			return 1;
+	}
+
+	return 0;
+}
+
+static int stm32f7_i2c_xfer_core(struct i2c_adapter *i2c_adap,
 			    struct i2c_msg msgs[], int num)
 {
 	struct stm32f7_i2c_dev *i2c_dev = i2c_get_adapdata(i2c_adap);
@@ -1694,8 +1715,13 @@ static int stm32f7_i2c_xfer(struct i2c_adapter *i2c_adap,
 
 	stm32f7_i2c_xfer_msg(i2c_dev, msgs);
 
-	time_left = wait_for_completion_timeout(&i2c_dev->complete,
-						i2c_dev->adap.timeout);
+	if (!i2c_dev->atomic) {
+		time_left = wait_for_completion_timeout(&i2c_dev->complete,
+							i2c_dev->adap.timeout);
+	} else {
+		time_left = stm32f7_i2c_wait_polling(i2c_dev);
+	}
+
 	ret = f7_msg->result;
 	if (ret) {
 		if (i2c_dev->use_dma)
@@ -1727,6 +1753,24 @@ static int stm32f7_i2c_xfer(struct i2c_adapter *i2c_adap,
 	return (ret < 0) ? ret : num;
 }
 
+static int stm32f7_i2c_xfer(struct i2c_adapter *i2c_adap,
+			    struct i2c_msg msgs[], int num)
+{
+	struct stm32f7_i2c_dev *i2c_dev = i2c_get_adapdata(i2c_adap);
+
+	i2c_dev->atomic = 0;
+	return stm32f7_i2c_xfer_core(i2c_adap, msgs, num);
+}
+
+static int stm32f7_i2c_xfer_atomic(struct i2c_adapter *i2c_adap,
+			    struct i2c_msg msgs[], int num)
+{
+	struct stm32f7_i2c_dev *i2c_dev = i2c_get_adapdata(i2c_adap);
+
+	i2c_dev->atomic = 1;
+	return stm32f7_i2c_xfer_core(i2c_adap, msgs, num);
+}
+
 static int stm32f7_i2c_smbus_xfer(struct i2c_adapter *adapter, u16 addr,
 				  unsigned short flags, char read_write,
 				  u8 command, int size,
@@ -2095,6 +2139,7 @@ static u32 stm32f7_i2c_func(struct i2c_adapter *adap)
 
 static const struct i2c_algorithm stm32f7_i2c_algo = {
 	.master_xfer = stm32f7_i2c_xfer,
+	.master_xfer_atomic = stm32f7_i2c_xfer_atomic,
 	.smbus_xfer = stm32f7_i2c_smbus_xfer,
 	.functionality = stm32f7_i2c_func,
 	.reg_slave = stm32f7_i2c_reg_slave,
-- 
2.40.0

