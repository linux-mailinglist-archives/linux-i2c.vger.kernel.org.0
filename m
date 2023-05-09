Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 248716FC825
	for <lists+linux-i2c@lfdr.de>; Tue,  9 May 2023 15:42:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235591AbjEINmI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 May 2023 09:42:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229998AbjEINmH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 May 2023 09:42:07 -0400
X-Greylist: delayed 1147 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 09 May 2023 06:42:05 PDT
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32345E6B;
        Tue,  9 May 2023 06:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
        s=default2211; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
        Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References;
        bh=Mc9JORN232SL1HsWqoXgmrDyPRbH9NMhJpNdhG1Rw7Q=; b=A3YWMGFqkSxkz1bI1aoQOIU0SV
        aUV0ZZWQEEFNEEE7GExtydHFyrODmAMFsIz2/cLYUM5m4Xy2nSxQvfPNNH78qNcKJp/IkKwlc5elk
        7KhccITNWDA9h01I78wlQFxWACe+OTPhn/8Id812NDmhhTFl6gbaUthuT2mqbUYu2fTaQz8/4hOUe
        uz4z6gIm5E+fT63WmCHI+oIU4ZMqdTBecaruo/Pyn5s4kfUMkDo1tWAl1Fol1c4mevGSGPKkI/2l/
        XhHs9ZWzTm8sDXkIp6XCZ6tiC3TjpFPlV3bkmGe3+5OC+61UPCUYYhvab97SJS7TudVUzzCoX+Zpc
        W/z/QqLw==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
        by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <sean@geanix.com>)
        id 1pwNIs-000HBc-Uw; Tue, 09 May 2023 15:22:54 +0200
Received: from [185.17.218.86] (helo=zen..)
        by sslproxy02.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <sean@geanix.com>)
        id 1pwNIs-000RSx-IN; Tue, 09 May 2023 15:22:54 +0200
From:   Sean Nyekjaer <sean@geanix.com>
To:     Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc:     Sean Nyekjaer <sean@geanix.com>, linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: stm32f7: Add atomic_xfer method to driver
Date:   Tue,  9 May 2023 15:21:59 +0200
Message-Id: <20230509132159.4160984-1-sean@geanix.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.8/26901/Tue May  9 09:24:37 2023)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
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
Tested on a STM32MP1 with:
https://lore.kernel.org/all/20230428112847.2146348-2-sean@geanix.com/

Is it okay to keep the DMA transfer in atomic?

I'm annoyed by the return 1 in stm32f7_i2c_wait_polling() is there any
good idea to fix that?

 drivers/i2c/busses/i2c-stm32f7.c | 73 ++++++++++++++++++++++++++------
 1 file changed, 60 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index d1c59d83a65b..b63e8a7eb1aa 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -357,6 +357,7 @@ struct stm32f7_i2c_dev {
 	u32 dnf_dt;
 	u32 dnf;
 	struct stm32f7_i2c_alert *alert;
+	bool atomic;
 };
 
 /*
@@ -905,13 +906,18 @@ static void stm32f7_i2c_xfer_msg(struct stm32f7_i2c_dev *i2c_dev,
 		cr2 |= STM32F7_I2C_CR2_NBYTES(f7_msg->count);
 	}
 
-	/* Enable NACK, STOP, error and transfer complete interrupts */
-	cr1 |= STM32F7_I2C_CR1_ERRIE | STM32F7_I2C_CR1_TCIE |
-		STM32F7_I2C_CR1_STOPIE | STM32F7_I2C_CR1_NACKIE;
+	if (!i2c_dev->atomic) {
+		/* Enable NACK, STOP, error and transfer complete interrupts */
+		cr1 |= STM32F7_I2C_CR1_ERRIE | STM32F7_I2C_CR1_TCIE |
+			STM32F7_I2C_CR1_STOPIE | STM32F7_I2C_CR1_NACKIE;
 
-	/* Clear DMA req and TX/RX interrupt */
-	cr1 &= ~(STM32F7_I2C_CR1_RXIE | STM32F7_I2C_CR1_TXIE |
-			STM32F7_I2C_CR1_RXDMAEN | STM32F7_I2C_CR1_TXDMAEN);
+		/* Clear DMA req and TX/RX interrupt */
+		cr1 &= ~(STM32F7_I2C_CR1_RXIE | STM32F7_I2C_CR1_TXIE |
+				STM32F7_I2C_CR1_RXDMAEN | STM32F7_I2C_CR1_TXDMAEN);
+	} else {
+		/* Disable interrupts */
+		cr1 &= ~STM32F7_I2C_ALL_IRQ_MASK;
+	}
 
 	/* Configure DMA or enable RX/TX interrupt */
 	i2c_dev->use_dma = false;
@@ -928,10 +934,12 @@ static void stm32f7_i2c_xfer_msg(struct stm32f7_i2c_dev *i2c_dev,
 	}
 
 	if (!i2c_dev->use_dma) {
-		if (msg->flags & I2C_M_RD)
-			cr1 |= STM32F7_I2C_CR1_RXIE;
-		else
-			cr1 |= STM32F7_I2C_CR1_TXIE;
+		if (!i2c_dev->atomic) {
+			if (msg->flags & I2C_M_RD)
+				cr1 |= STM32F7_I2C_CR1_RXIE;
+			else
+				cr1 |= STM32F7_I2C_CR1_TXIE;
+		}
 	} else {
 		if (msg->flags & I2C_M_RD)
 			cr1 |= STM32F7_I2C_CR1_RXDMAEN;
@@ -1670,7 +1678,22 @@ static irqreturn_t stm32f7_i2c_isr_error(int irq, void *data)
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
@@ -1694,8 +1717,13 @@ static int stm32f7_i2c_xfer(struct i2c_adapter *i2c_adap,
 
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
@@ -1727,6 +1755,24 @@ static int stm32f7_i2c_xfer(struct i2c_adapter *i2c_adap,
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
@@ -2095,6 +2141,7 @@ static u32 stm32f7_i2c_func(struct i2c_adapter *adap)
 
 static const struct i2c_algorithm stm32f7_i2c_algo = {
 	.master_xfer = stm32f7_i2c_xfer,
+	.master_xfer_atomic = stm32f7_i2c_xfer_atomic,
 	.smbus_xfer = stm32f7_i2c_smbus_xfer,
 	.functionality = stm32f7_i2c_func,
 	.reg_slave = stm32f7_i2c_reg_slave,
-- 
2.40.0

