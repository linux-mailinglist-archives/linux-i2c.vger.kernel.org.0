Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 120616BEBEB
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Mar 2023 15:56:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231342AbjCQO4V (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Mar 2023 10:56:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230163AbjCQO4U (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Mar 2023 10:56:20 -0400
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80A5C3B84D;
        Fri, 17 Mar 2023 07:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de;
        s=default2002; h=Content-Transfer-Encoding:MIME-Version:References:
        In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID;
        bh=6N0EMxfzxe4uDtluP+hwJCKG9FrpKsiMG0Zvs4kNpXA=; b=Ub1w7M+Su8/xKoyRb5ZojTwZwj
        AvQI251btkSlf5/y7qQGNPcLiXNT4rAAX9rXeEKOi6a3s7ialLnA3A2aO+NsMrUHwGKrR+hKGfGrm
        WUC+PV5x4OLiI4F8iTTlswFx3Hq6UY4Ef6gW+LJ3RJpRpphCUH6b8mtGQZm4uLlqt3cd4t/7tXhNS
        mkqyc6iFudaKGXqxei5EwGt+Gjb+FjztCKShHJZ9PP5SqqmkMwJqx6O3fhXcktfA4ys2IjN9l3DIW
        lxe9sbWT/dWFOhb97p+3Bga43O4nyvtR96Kakp/ljevqaogn7OtmGNQqktijUQdC7aGP20odkfJO4
        Fz5O5qGw==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
        by www381.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <lars@metafoo.de>)
        id 1pdBUb-000LQr-KZ; Fri, 17 Mar 2023 15:55:41 +0100
Received: from [2604:5500:c0e5:eb00:da5e:d3ff:feff:933b] (helo=lars-desktop.lan)
        by sslproxy06.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <lars@metafoo.de>)
        id 1pdBUb-000E4A-0c; Fri, 17 Mar 2023 15:55:41 +0100
From:   Lars-Peter Clausen <lars@metafoo.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Michal Simek <michal.simek@amd.com>,
        Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        Lars-Peter Clausen <lars@metafoo.de>
Subject: [PATCH v2 3/3] i2c: cadence: Detect maximum transfer size
Date:   Fri, 17 Mar 2023 07:54:41 -0700
Message-Id: <20230317145441.156880-3-lars@metafoo.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230317145441.156880-1-lars@metafoo.de>
References: <20230317145441.156880-1-lars@metafoo.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.103.8/26846/Fri Mar 17 08:22:57 2023)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The maximum transfer length is a synthesis configuration parameters of the
Cadence I2C IP. Different SoCs might use different values for these
parameters.

Currently the driver has the maximum transfer length hardcoded to 255.
Trying to use the driver with an IP instance that uses smaller values for
these will work for short transfers. But longer transfers will fail.

The maximum transfer length can easily be detected at runtime since the
unused MSBs of the transfer length register are hardwired to 0. Writing
0xff and then reading back the value will give the maximum transfer length.

These changes have been tested with
  1) The Xilinx MPSoC for which this driver was originally written which
      has the previous hardcoded settings of 16 and 255.
  2) Another instance of the Cadence I2C IP with FIFO depth of 8 and
     maximum transfer length of 16.

Without these changes the latter would fail for I2C transfers longer than
16. With the updated driver both work fine even for longer transfers.

Note that the IP core and driver support chaining multiple transfers into a
single longer transfer using the HOLD bit. So the maximum transfer size is
not the limit for the length of the I2C transfer, but the limit for how
much data can be transferred without having to reprogram the control
registers.

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
---
Changes since v1:
 * Split dynamic FIFO depth and transaction size support into two patches
 * Add kernel-doc for new struct members
---
 drivers/i2c/busses/i2c-cadence.c | 49 +++++++++++++++++++++++++++-----
 1 file changed, 42 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
index 0834e1ac9d03..8f61a633c42c 100644
--- a/drivers/i2c/busses/i2c-cadence.c
+++ b/drivers/i2c/busses/i2c-cadence.c
@@ -117,7 +117,7 @@
 #define CDNS_I2C_FIFO_DEPTH_DEFAULT	16
 #define CDNS_I2C_MAX_TRANSFER_SIZE	255
 /* Transfer size in multiples of data interrupt depth */
-#define CDNS_I2C_TRANSFER_SIZE	(CDNS_I2C_MAX_TRANSFER_SIZE - 3)
+#define CDNS_I2C_TRANSFER_SIZE(max)	((max) - 3)
 
 #define DRIVER_NAME		"cdns-i2c"
 
@@ -185,6 +185,7 @@ enum cdns_i2c_slave_state {
  * @dev_mode:		I2C operating role(master/slave).
  * @slave_state:	I2C Slave state(idle/read/write).
  * @fifo_depth:		The depth of the transfer FIFO
+ * @transfer_size:	The maximum number of bytes in one transfer
  */
 struct cdns_i2c {
 	struct device		*dev;
@@ -213,6 +214,7 @@ struct cdns_i2c {
 	enum cdns_i2c_slave_state slave_state;
 #endif
 	u32 fifo_depth;
+	unsigned int transfer_size;
 };
 
 struct cdns_platform_data {
@@ -466,10 +468,10 @@ static irqreturn_t cdns_i2c_master_isr(void *ptr)
 			 * transfer size and update register accordingly.
 			 */
 			if (((int)(id->recv_count) - id->fifo_depth) >
-			    CDNS_I2C_TRANSFER_SIZE) {
-				cdns_i2c_writereg(CDNS_I2C_TRANSFER_SIZE,
+			    id->transfer_size) {
+				cdns_i2c_writereg(id->transfer_size,
 						  CDNS_I2C_XFER_SIZE_OFFSET);
-				id->curr_recv_count = CDNS_I2C_TRANSFER_SIZE +
+				id->curr_recv_count = id->transfer_size +
 						      id->fifo_depth;
 			} else {
 				cdns_i2c_writereg(id->recv_count -
@@ -605,10 +607,10 @@ static void cdns_i2c_mrecv(struct cdns_i2c *id)
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
@@ -1227,6 +1229,37 @@ static const struct of_device_id cdns_i2c_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, cdns_i2c_of_match);
 
+/**
+ * cdns_i2c_detect_transfer_size - Detect the maximum transfer size supported
+ * @id: Device private data structure
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
+
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
@@ -1321,6 +1354,8 @@ static int cdns_i2c_probe(struct platform_device *pdev)
 	id->fifo_depth = CDNS_I2C_FIFO_DEPTH_DEFAULT;
 	of_property_read_u32(pdev->dev.of_node, "fifo-depth", &id->fifo_depth);
 
+	cdns_i2c_detect_transfer_size(id);
+
 	ret = cdns_i2c_setclk(id->input_clk, id);
 	if (ret) {
 		dev_err(&pdev->dev, "invalid SCL clock: %u Hz\n", id->i2c_clk);
-- 
2.30.2

