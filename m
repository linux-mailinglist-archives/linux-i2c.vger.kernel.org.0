Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B145F6BEBEA
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Mar 2023 15:56:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230280AbjCQO4V (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Mar 2023 10:56:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231314AbjCQO4U (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Mar 2023 10:56:20 -0400
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA12A3929B;
        Fri, 17 Mar 2023 07:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de;
        s=default2002; h=Content-Transfer-Encoding:MIME-Version:References:
        In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID;
        bh=thOwOhhTISY2GOERODQ65VI6o45/P5n3HEVXJvsNGMY=; b=kaCynrsNFBffSbKPTVWsYowYWz
        zCSGukZKoGtz1Nm9OnLfPkqbFATr33J5bM0/48DDf1EtS/HxZtV2A0mvpdDRREjInXa7AiNOs9twN
        H21ku1gSC/Pqrb8M1Rz81fCb9S0dEN1V1kj5t8zhjvCt9EVjM3TIALgo6ZkjDoGX9ViYxlT0iKwqz
        VjeEsMjtInDSPTEPAWxVC7/6Rnc41ZxlBV6Ko1DLgKSU6BaE95HgT1HATZnC39+wg/HrHRRJ2pLgc
        0kVied101LCspv6070MM+Tq6HFuobBhNVAavF6cQwex0vEkHpjfIHPtxCJ6qtWHP0+RJvu0YYFZgI
        DXwMuaGA==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
        by www381.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <lars@metafoo.de>)
        id 1pdBUZ-000LQc-M2; Fri, 17 Mar 2023 15:55:39 +0100
Received: from [2604:5500:c0e5:eb00:da5e:d3ff:feff:933b] (helo=lars-desktop.lan)
        by sslproxy06.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <lars@metafoo.de>)
        id 1pdBUZ-000E4A-3p; Fri, 17 Mar 2023 15:55:39 +0100
From:   Lars-Peter Clausen <lars@metafoo.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Michal Simek <michal.simek@amd.com>,
        Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        Lars-Peter Clausen <lars@metafoo.de>
Subject: [PATCH v2 2/3] i2c: cadence: Allow to specify the FIFO depth
Date:   Fri, 17 Mar 2023 07:54:40 -0700
Message-Id: <20230317145441.156880-2-lars@metafoo.de>
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

The FIFO depth is a synthesis configuration parameters of the Cadence I2C
IP. Different SoCs might use different values for these parameters.

Currently the driver has the FIFO depth hardcoded to 16. Trying to use the
driver with an IP instance that uses smaller values for these will work for
short transfers. But longer transfers will fail.

Introduce a new devicetree property that allows to describe the FIFO depth
of the I2C controller.

These changes have been tested with
1) The Xilinx MPSoC for which this driver was originally written which has
   the previous hardcoded settings of 16 and 255.
2) Another instance of the Cadence I2C IP with FIFO depth of 8 and maximum
   transfer length of 16.

Without these changes the latter would fail for I2C transfers longer than
8. With the updated driver both work fine even for longer transfers.

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
---
Changes since v1:
 * Split dynamic FIFO depth and transaction size support into two patches
 * Add kernel-doc for new struct members
 * Make `fifo_depth` struct field u32 so it can be directly used with
   `of_property_read_u32()` API
---
 drivers/i2c/busses/i2c-cadence.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
index 93c6d0822468..0834e1ac9d03 100644
--- a/drivers/i2c/busses/i2c-cadence.c
+++ b/drivers/i2c/busses/i2c-cadence.c
@@ -114,7 +114,7 @@
 /* timeout for pm runtime autosuspend */
 #define CNDS_I2C_PM_TIMEOUT		1000	/* ms */
 
-#define CDNS_I2C_FIFO_DEPTH		16
+#define CDNS_I2C_FIFO_DEPTH_DEFAULT	16
 #define CDNS_I2C_MAX_TRANSFER_SIZE	255
 /* Transfer size in multiples of data interrupt depth */
 #define CDNS_I2C_TRANSFER_SIZE	(CDNS_I2C_MAX_TRANSFER_SIZE - 3)
@@ -184,6 +184,7 @@ enum cdns_i2c_slave_state {
  * @slave:		Registered slave instance.
  * @dev_mode:		I2C operating role(master/slave).
  * @slave_state:	I2C Slave state(idle/read/write).
+ * @fifo_depth:		The depth of the transfer FIFO
  */
 struct cdns_i2c {
 	struct device		*dev;
@@ -211,6 +212,7 @@ struct cdns_i2c {
 	enum cdns_i2c_mode dev_mode;
 	enum cdns_i2c_slave_state slave_state;
 #endif
+	u32 fifo_depth;
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
+			if (((int)(id->recv_count) - id->fifo_depth) >
 			    CDNS_I2C_TRANSFER_SIZE) {
 				cdns_i2c_writereg(CDNS_I2C_TRANSFER_SIZE,
 						  CDNS_I2C_XFER_SIZE_OFFSET);
 				id->curr_recv_count = CDNS_I2C_TRANSFER_SIZE +
-						      CDNS_I2C_FIFO_DEPTH;
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
@@ -612,7 +614,7 @@ static void cdns_i2c_mrecv(struct cdns_i2c *id)
 	}
 
 	/* Determine hold_clear based on number of bytes to receive and hold flag */
-	if (!id->bus_hold_flag && id->recv_count <= CDNS_I2C_FIFO_DEPTH) {
+	if (!id->bus_hold_flag && id->recv_count <= id->fifo_depth) {
 		if (ctrl_reg & CDNS_I2C_CR_HOLD) {
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
@@ -1316,6 +1318,9 @@ static int cdns_i2c_probe(struct platform_device *pdev)
 #endif
 	id->ctrl_reg = CDNS_I2C_CR_ACK_EN | CDNS_I2C_CR_NEA | CDNS_I2C_CR_MS;
 
+	id->fifo_depth = CDNS_I2C_FIFO_DEPTH_DEFAULT;
+	of_property_read_u32(pdev->dev.of_node, "fifo-depth", &id->fifo_depth);
+
 	ret = cdns_i2c_setclk(id->input_clk, id);
 	if (ret) {
 		dev_err(&pdev->dev, "invalid SCL clock: %u Hz\n", id->i2c_clk);
-- 
2.30.2

