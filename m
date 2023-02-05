Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F04EC68B297
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Feb 2023 00:02:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbjBEXCV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 5 Feb 2023 18:02:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjBEXCU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 5 Feb 2023 18:02:20 -0500
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DC6A17CF1;
        Sun,  5 Feb 2023 15:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de;
        s=default2002; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
        Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References;
        bh=HpRW5fbbfds9iupeL+Btbofn6Mvx/oRWZTT/CaVz2es=; b=Muv4S/Ufv0aaOhuhi8+fJnbJsv
        i2lEjWpIa9IDB6tKEOVbK2QMFWqAFuuOoMAYhqHCyhmlR7787ANLR49Jrb/R1lhIx4hP/VhixJjLh
        /6PJor/+QuHt/aIE/zOrWYmel4POlTv0kbk+78n7krDFKurlnHztdO2yq1LABhfbJOUdfJnF6Q3fg
        Y28d0EROq+tayQt83niEd6jiGv8jmPU0zoziL2z9aD2HWcfiJV1cMM5MWR+B5TzeeII39ikOu1hND
        dNx5DUCKhtw/D/3cLZgJ9XYuqRLjxIo5nsQzKUnC3UakUBfq2aVNbPDd6UgODGnNZvv2d7juLbpCP
        UTEfvrCA==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
        by www381.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <lars@metafoo.de>)
        id 1pOo1Y-000A5L-LS; Mon, 06 Feb 2023 00:02:16 +0100
Received: from [2604:5500:c0e5:eb00:da5e:d3ff:feff:933b] (helo=lars-desktop.lan)
        by sslproxy05.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <lars@metafoo.de>)
        id 1pOo1Y-000WgB-2y; Mon, 06 Feb 2023 00:02:16 +0100
From:   Lars-Peter Clausen <lars@metafoo.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Michal Simek <michal.simek@amd.com>,
        Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        Lars-Peter Clausen <lars@metafoo.de>
Subject: [PATCH 1/2] i2c: cadence: Allow to specify the FIFO depth and maximum transfer length
Date:   Sun,  5 Feb 2023 15:02:07 -0800
Message-Id: <20230205230208.58355-1-lars@metafoo.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.103.7/26803/Sun Feb  5 09:39:28 2023)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The FIFO depth and maximum transfer length are Synthesis configuration
parameters of the Cadence I2C IP. Different SoCs will use different values
for these parameters.

Currently the driver has the FIFO depth hardcoded to 16 and the maximum
transfer length to 255. Trying to use the driver with an IP instance that
uses smaller values for these will work for short transfers. But longer
transfers will fail.

The maximum transfer length can easily be detected at runtime since the
unused MSBs of the transfer length register are hardwired to 0. Writing
0xff and then reading back the value will give the maximum transfer length.

This is unfortunately not possible for the FIFO depth. To handle this
introduce a new devicetree property that allows to describe the FIFO depth
of the I2C controller.

These changes have been tested with
1) The Xilinx MPSoC for which this driver was originally written which has
   the previous hardcoded settings of 16 and 255.
2) Another instance of the Cadence I2C IP with FIFO depth of 8 and maximum
   transfer length of 16.

Without these changes the latter would fail for I2C transfers longer than
8. With the updated driver both work fine even for longer transfers.

Note that the IP core and driver support chaining multiple transfers into a
single longer transfer using the HOLD bit. So the maximum transfer size is
not the limit for the length of the I2C transfer, but the limit for how
much data can be transferred without having to reprogram the control
registers.

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
---
 drivers/i2c/busses/i2c-cadence.c | 77 ++++++++++++++++++++++++--------
 1 file changed, 58 insertions(+), 19 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
index b5d22e7282c2..25c0a8bacdd6 100644
--- a/drivers/i2c/busses/i2c-cadence.c
+++ b/drivers/i2c/busses/i2c-cadence.c
@@ -114,10 +114,10 @@
 /* timeout for pm runtime autosuspend */
 #define CNDS_I2C_PM_TIMEOUT		1000	/* ms */
 
-#define CDNS_I2C_FIFO_DEPTH		16
+#define CDNS_I2C_FIFO_DEPTH_DEFAULT	16
 #define CDNS_I2C_MAX_TRANSFER_SIZE	255
 /* Transfer size in multiples of data interrupt depth */
-#define CDNS_I2C_TRANSFER_SIZE	(CDNS_I2C_MAX_TRANSFER_SIZE - 3)
+#define CDNS_I2C_TRANSFER_SIZE(max)	((max) - 3)
 
 #define DRIVER_NAME		"cdns-i2c"
 
@@ -211,6 +211,8 @@ struct cdns_i2c {
 	enum cdns_i2c_mode dev_mode;
 	enum cdns_i2c_slave_state slave_state;
 #endif
+	unsigned int fifo_depth;
+	unsigned int transfer_size;
 };
 
 struct cdns_platform_data {
@@ -236,7 +238,7 @@ static void cdns_i2c_clear_bus_hold(struct cdns_i2c *id)
 static inline bool cdns_is_holdquirk(struct cdns_i2c *id, bool hold_wrkaround)
 {
 	return (hold_wrkaround &&
-		(id->curr_recv_count == CDNS_I2C_FIFO_DEPTH + 1));
+		(id->curr_recv_count == id->fifo_depth + 1));
 }
 
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
@@ -431,7 +433,7 @@ static irqreturn_t cdns_i2c_master_isr(void *ptr)
 				 * if RX data left is less than or equal to
 				 * FIFO DEPTH unless repeated start is selected
 				 */
-				if (id->recv_count <= CDNS_I2C_FIFO_DEPTH &&
+				if (id->recv_count <= id->fifo_depth &&
 				    !id->bus_hold_flag)
 					cdns_i2c_clear_bus_hold(id);
 
@@ -456,22 +458,22 @@ static irqreturn_t cdns_i2c_master_isr(void *ptr)
 		if (cdns_is_holdquirk(id, updatetx)) {
 			/* wait while fifo is full */
 			while (cdns_i2c_readreg(CDNS_I2C_XFER_SIZE_OFFSET) !=
-			       (id->curr_recv_count - CDNS_I2C_FIFO_DEPTH))
+			       (id->curr_recv_count - id->fifo_depth))
 				;
 
 			/*
 			 * Check number of bytes to be received against maximum
 			 * transfer size and update register accordingly.
 			 */
-			if (((int)(id->recv_count) - CDNS_I2C_FIFO_DEPTH) >
-			    CDNS_I2C_TRANSFER_SIZE) {
-				cdns_i2c_writereg(CDNS_I2C_TRANSFER_SIZE,
+			if (((int)(id->recv_count) - id->fifo_depth) >
+			    id->transfer_size) {
+				cdns_i2c_writereg(id->transfer_size,
 						  CDNS_I2C_XFER_SIZE_OFFSET);
-				id->curr_recv_count = CDNS_I2C_TRANSFER_SIZE +
-						      CDNS_I2C_FIFO_DEPTH;
+				id->curr_recv_count = id->transfer_size +
+						      id->fifo_depth;
 			} else {
 				cdns_i2c_writereg(id->recv_count -
-						  CDNS_I2C_FIFO_DEPTH,
+						  id->fifo_depth,
 						  CDNS_I2C_XFER_SIZE_OFFSET);
 				id->curr_recv_count = id->recv_count;
 			}
@@ -494,7 +496,7 @@ static irqreturn_t cdns_i2c_master_isr(void *ptr)
 		 * space available in FIFO and fill with that many bytes.
 		 */
 		if (id->send_count) {
-			avail_bytes = CDNS_I2C_FIFO_DEPTH -
+			avail_bytes = id->fifo_depth -
 			    cdns_i2c_readreg(CDNS_I2C_XFER_SIZE_OFFSET);
 			if (id->send_count > avail_bytes)
 				bytes_to_send = avail_bytes;
@@ -588,7 +590,7 @@ static void cdns_i2c_mrecv(struct cdns_i2c *id)
 	 * Check for the message size against FIFO depth and set the
 	 * 'hold bus' bit if it is greater than FIFO depth.
 	 */
-	if (id->recv_count > CDNS_I2C_FIFO_DEPTH)
+	if (id->recv_count > id->fifo_depth)
 		ctrl_reg |= CDNS_I2C_CR_HOLD;
 
 	cdns_i2c_writereg(ctrl_reg, CDNS_I2C_CR_OFFSET);
@@ -603,16 +605,16 @@ static void cdns_i2c_mrecv(struct cdns_i2c *id)
 	 * receive if it is less than transfer size and transfer size if
 	 * it is more. Enable the interrupts.
 	 */
-	if (id->recv_count > CDNS_I2C_TRANSFER_SIZE) {
-		cdns_i2c_writereg(CDNS_I2C_TRANSFER_SIZE,
+	if (id->recv_count > id->transfer_size) {
+		cdns_i2c_writereg(id->transfer_size,
 				  CDNS_I2C_XFER_SIZE_OFFSET);
-		id->curr_recv_count = CDNS_I2C_TRANSFER_SIZE;
+		id->curr_recv_count = id->transfer_size;
 	} else {
 		cdns_i2c_writereg(id->recv_count, CDNS_I2C_XFER_SIZE_OFFSET);
 	}
 
 	/* Determine hold_clear based on number of bytes to receive and hold flag */
-	if (!id->bus_hold_flag && id->recv_count <= CDNS_I2C_FIFO_DEPTH) {
+	if (!id->bus_hold_flag && id->recv_count <= id->fifo_depth) {
 		if (cdns_i2c_readreg(CDNS_I2C_CR_OFFSET) & CDNS_I2C_CR_HOLD) {
 			hold_clear = true;
 			if (id->quirks & CDNS_I2C_BROKEN_HOLD_BIT)
@@ -673,7 +675,7 @@ static void cdns_i2c_msend(struct cdns_i2c *id)
 	 * Check for the message size against FIFO depth and set the
 	 * 'hold bus' bit if it is greater than FIFO depth.
 	 */
-	if (id->send_count > CDNS_I2C_FIFO_DEPTH)
+	if (id->send_count > id->fifo_depth)
 		ctrl_reg |= CDNS_I2C_CR_HOLD;
 	cdns_i2c_writereg(ctrl_reg, CDNS_I2C_CR_OFFSET);
 
@@ -686,7 +688,7 @@ static void cdns_i2c_msend(struct cdns_i2c *id)
 	 * against the space available, and fill the FIFO accordingly.
 	 * Enable the interrupts.
 	 */
-	avail_bytes = CDNS_I2C_FIFO_DEPTH -
+	avail_bytes = id->fifo_depth -
 				cdns_i2c_readreg(CDNS_I2C_XFER_SIZE_OFFSET);
 
 	if (id->send_count > avail_bytes)
@@ -1226,6 +1228,36 @@ static const struct of_device_id cdns_i2c_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, cdns_i2c_of_match);
 
+/**
+ * cdns_i2c_detect_transfer_size - Detect the maximum transfer size supported
+ * @id:		Device private data structure
+ *
+ * Detect the maximum transfer size that is supported by this instance of the
+ * Cadence I2C controller.
+ */
+static void cdns_i2c_detect_transfer_size(struct cdns_i2c *id)
+{
+	u32 val;
+
+	/*
+	 * Writing to the transfer size register is only possible if these two bits
+	 * are set in the control register.
+	 */
+	cdns_i2c_writereg(CDNS_I2C_CR_MS | CDNS_I2C_CR_RW, CDNS_I2C_CR_OFFSET);
+	/*
+	 * The number of writable bits of the transfer size register can be between
+	 * 4 and 8. This is a controlled through a synthesis parameter of the IP
+	 * core and can vary from instance to instance. The unused MSBs always read
+	 * back as 0. Writing 0xff and then reading the value back will report the
+	 * maximum supported transfer size.
+	 */
+	cdns_i2c_writereg(CDNS_I2C_MAX_TRANSFER_SIZE, CDNS_I2C_XFER_SIZE_OFFSET);
+	val = cdns_i2c_readreg(CDNS_I2C_XFER_SIZE_OFFSET);
+	id->transfer_size = CDNS_I2C_TRANSFER_SIZE(val);
+	cdns_i2c_writereg(0, CDNS_I2C_XFER_SIZE_OFFSET);
+	cdns_i2c_writereg(0, CDNS_I2C_CR_OFFSET);
+}
+
 /**
  * cdns_i2c_probe - Platform registration call
  * @pdev:	Handle to the platform device structure
@@ -1242,6 +1274,7 @@ static int cdns_i2c_probe(struct platform_device *pdev)
 	struct cdns_i2c *id;
 	int ret, irq;
 	const struct of_device_id *match;
+	u32 val;
 
 	id = devm_kzalloc(&pdev->dev, sizeof(*id), GFP_KERNEL);
 	if (!id)
@@ -1317,6 +1350,12 @@ static int cdns_i2c_probe(struct platform_device *pdev)
 #endif
 	id->ctrl_reg = CDNS_I2C_CR_ACK_EN | CDNS_I2C_CR_NEA | CDNS_I2C_CR_MS;
 
+	val = CDNS_I2C_FIFO_DEPTH_DEFAULT;
+	of_property_read_u32(pdev->dev.of_node, "cdns,fifo-depth", &val);
+	id->fifo_depth = val;
+
+	cdns_i2c_detect_transfer_size(id);
+
 	ret = cdns_i2c_setclk(id->input_clk, id);
 	if (ret) {
 		dev_err(&pdev->dev, "invalid SCL clock: %u Hz\n", id->i2c_clk);
-- 
2.30.2

