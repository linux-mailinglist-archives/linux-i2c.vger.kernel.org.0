Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12E33670B78
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Jan 2023 23:13:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229569AbjAQWM6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Jan 2023 17:12:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230350AbjAQWKw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Jan 2023 17:10:52 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC2784B1B6;
        Tue, 17 Jan 2023 12:39:50 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id u19so78180797ejm.8;
        Tue, 17 Jan 2023 12:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1jWUcSxNgYzoZDSCAYfnIccXHRmHbJtKyjM0QyMRP9U=;
        b=cmWejUjRN78Hc1oYip3/revnANFe8KoTwGTXt5b87g1qtbHe0Ew2G7Thi0+DsnT7kM
         q9hfrhxA7OfWf+Y4YKQLL4vniHELm7uLI7jVXVn7L6sE+m5zk9GcpYNTMrXgdfURDgWR
         snAdIu306IpTu6vdoe28SN/aQaUCjXVd/CvDiTzyeW6+eovSqnZzbTHsORXDW4aHgZEM
         Rybc6SWi2PrEbgm2ij5FbtMklQ4uRcZQlaYOfJrK6Y3ahI+8QK0ppN5rpG+H0P8DBZ0t
         AoQuywLGt+ClgoV8BFvgwMGj+hM1z8GAgOhKiAeTG62ixWPGaYDsNCmbfXz99iEEWrS8
         B3WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1jWUcSxNgYzoZDSCAYfnIccXHRmHbJtKyjM0QyMRP9U=;
        b=wzsuCPzj3B2tMKPAgkuqT4etaCWnkw95KK46R5z2g1q73EvpGf9rU4tZG1D4cx6u2p
         YdD3PYDb1fQn8AAkM16Z1rv4bIvSBkQE1E1Lh9S7g7Doj0vwrwp54lunFjUH5FGOz10t
         669kMUWRyXiflShUvFoGh+JQF19sLKlPNyx9ZVQbsBxaWfQmJCvKUUcI23fvEXf0DEc+
         nbr9nvVZucX5jYY7/vzVsBW7qTWejc0KHlKttUTtZ2ukeF9jNRF7FGTb9roujUlH1HDA
         NFoXUY9sqDrwjC4PirMWO+T/TuUYTIyX8DJIqFKwpx5rbGtOS5Mgw3hVQS7+f3oTqI4l
         FX+g==
X-Gm-Message-State: AFqh2krBeTNahET8EwktlxBES4vOCKllhPPiHPW89pwfE+ImTShK0fz+
        JY9rpAd7BNVw+1AbRdncBqQ=
X-Google-Smtp-Source: AMrXdXvXnmupeid1hX9K32Vjn3e5H7XHYHz4m3aBfv7jkLUkJHne0mV2y4C6gu6BbRChkDS8WKhGNA==
X-Received: by 2002:a17:906:2b57:b0:86d:3c59:73f8 with SMTP id b23-20020a1709062b5700b0086d3c5973f8mr4443396ejg.34.1673987989188;
        Tue, 17 Jan 2023 12:39:49 -0800 (PST)
Received: from ?IPV6:2a01:c22:7346:8100:11fa:3b53:e36a:9e73? (dynamic-2a01-0c22-7346-8100-11fa-3b53-e36a-9e73.c22.pool.telefonica.de. [2a01:c22:7346:8100:11fa:3b53:e36a:9e73])
        by smtp.googlemail.com with ESMTPSA id n4-20020a170906164400b007c11e5ac250sm13868677ejd.91.2023.01.17.12.39.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 12:39:48 -0800 (PST)
Message-ID: <ff8363e2-b962-883e-b436-e182b2a9edac@gmail.com>
Date:   Tue, 17 Jan 2023 21:38:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: [PATCH v4 2/3] i2c: algo: bit: allow getsda to be NULL
Content-Language: en-US
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>, Peter Rosin <peda@axentia.se>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <57666b4f-4c12-7feb-caf1-5bd38908bfc7@gmail.com>
In-Reply-To: <57666b4f-4c12-7feb-caf1-5bd38908bfc7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This is in preparation of supporting write-only SDA in i2c-gpio.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v3:
- check for adap->getsda in readbytes()
- align warning message level for info on missing getscl/getsda
v4:
- handle SDA and SCL independently
- properly handle case that SDA is NULL but SCL not
---
 drivers/i2c/algos/i2c-algo-bit.c | 77 +++++++++++++++-----------------
 1 file changed, 35 insertions(+), 42 deletions(-)

diff --git a/drivers/i2c/algos/i2c-algo-bit.c b/drivers/i2c/algos/i2c-algo-bit.c
index fc90293af..eddf25b90 100644
--- a/drivers/i2c/algos/i2c-algo-bit.c
+++ b/drivers/i2c/algos/i2c-algo-bit.c
@@ -184,8 +184,9 @@ static int i2c_outb(struct i2c_adapter *i2c_adap, unsigned char c)
 
 	/* read ack: SDA should be pulled down by slave, or it may
 	 * NAK (usually to report problems with the data we wrote).
+	 * Always report ACK if SDA is write-only.
 	 */
-	ack = !getsda(adap);    /* ack: sda is pulled low -> success */
+	ack = !adap->getsda || !getsda(adap);    /* ack: sda is pulled low -> success */
 	bit_dbg(2, &i2c_adap->dev, "i2c_outb: 0x%02x %s\n", (int)c,
 		ack ? "A" : "NA");
 
@@ -238,71 +239,55 @@ static int test_bus(struct i2c_adapter *i2c_adap)
 			return -ENODEV;
 	}
 
+	if (adap->getsda == NULL)
+		pr_info("%s: SDA is write-only, testing not possible\n", name);
 	if (adap->getscl == NULL)
-		pr_info("%s: Testing SDA only, SCL is not readable\n", name);
+		pr_info("%s: SCL is write-only, testing not possible\n", name);
 
-	sda = getsda(adap);
-	scl = (adap->getscl == NULL) ? 1 : getscl(adap);
+	sda = adap->getsda ? getsda(adap) : 1;
+	scl = adap->getscl ? getscl(adap) : 1;
 	if (!scl || !sda) {
-		printk(KERN_WARNING
-		       "%s: bus seems to be busy (scl=%d, sda=%d)\n",
-		       name, scl, sda);
+		pr_warn("%s: bus seems to be busy (scl=%d, sda=%d)\n", name, scl, sda);
 		goto bailout;
 	}
 
 	sdalo(adap);
-	sda = getsda(adap);
-	scl = (adap->getscl == NULL) ? 1 : getscl(adap);
-	if (sda) {
-		printk(KERN_WARNING "%s: SDA stuck high!\n", name);
+	if (adap->getsda && getsda(adap)) {
+		pr_warn("%s: SDA stuck high!\n", name);
 		goto bailout;
 	}
-	if (!scl) {
-		printk(KERN_WARNING
-		       "%s: SCL unexpected low while pulling SDA low!\n",
-		       name);
+	if (adap->getscl && !getscl(adap)) {
+		pr_warn("%s: SCL unexpected low while pulling SDA low!\n", name);
 		goto bailout;
 	}
 
 	sdahi(adap);
-	sda = getsda(adap);
-	scl = (adap->getscl == NULL) ? 1 : getscl(adap);
-	if (!sda) {
-		printk(KERN_WARNING "%s: SDA stuck low!\n", name);
+	if (adap->getsda && !getsda(adap)) {
+		pr_warn("%s: SDA stuck low!\n", name);
 		goto bailout;
 	}
-	if (!scl) {
-		printk(KERN_WARNING
-		       "%s: SCL unexpected low while pulling SDA high!\n",
-		       name);
+	if (adap->getscl && !getscl(adap)) {
+		pr_warn("%s: SCL unexpected low while pulling SDA high!\n", name);
 		goto bailout;
 	}
 
 	scllo(adap);
-	sda = getsda(adap);
-	scl = (adap->getscl == NULL) ? 0 : getscl(adap);
-	if (scl) {
-		printk(KERN_WARNING "%s: SCL stuck high!\n", name);
+	if (adap->getscl && getscl(adap)) {
+		pr_warn("%s: SCL stuck high!\n", name);
 		goto bailout;
 	}
-	if (!sda) {
-		printk(KERN_WARNING
-		       "%s: SDA unexpected low while pulling SCL low!\n",
-		       name);
+	if (adap->getsda && !getsda(adap)) {
+		pr_warn("%s: SDA unexpected low while pulling SCL low!\n", name);
 		goto bailout;
 	}
 
 	sclhi(adap);
-	sda = getsda(adap);
-	scl = (adap->getscl == NULL) ? 1 : getscl(adap);
-	if (!scl) {
-		printk(KERN_WARNING "%s: SCL stuck low!\n", name);
+	if (adap->getscl && !getscl(adap)) {
+		pr_warn("%s: SCL stuck low!\n", name);
 		goto bailout;
 	}
-	if (!sda) {
-		printk(KERN_WARNING
-		       "%s: SDA unexpected low while pulling SCL high!\n",
-		       name);
+	if (adap->getsda && !getsda(adap)) {
+		pr_warn("%s: SDA unexpected low while pulling SCL high!\n", name);
 		goto bailout;
 	}
 
@@ -420,6 +405,10 @@ static int readbytes(struct i2c_adapter *i2c_adap, struct i2c_msg *msg)
 	unsigned char *temp = msg->buf;
 	int count = msg->len;
 	const unsigned flags = msg->flags;
+	struct i2c_algo_bit_data *adap = i2c_adap->algo_data;
+
+	if (!adap->getsda)
+		return -EOPNOTSUPP;
 
 	while (count > 0) {
 		inval = i2c_inb(i2c_adap);
@@ -670,11 +659,15 @@ static int __i2c_bit_add_bus(struct i2c_adapter *adap,
 	if (ret < 0)
 		return ret;
 
-	/* Complain if SCL can't be read */
-	if (bit_adap->getscl == NULL) {
+	if (bit_adap->getsda == NULL)
+		dev_warn(&adap->dev, "Not I2C compliant: can't read SDA\n");
+
+	if (bit_adap->getscl == NULL)
 		dev_warn(&adap->dev, "Not I2C compliant: can't read SCL\n");
+
+	if (bit_adap->getsda == NULL || bit_adap->getscl == NULL)
 		dev_warn(&adap->dev, "Bus may be unreliable\n");
-	}
+
 	return 0;
 }
 
-- 
2.39.0


