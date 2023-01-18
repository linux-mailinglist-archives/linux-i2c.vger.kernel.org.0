Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08409672AEF
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Jan 2023 22:55:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229620AbjARVzy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 Jan 2023 16:55:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229883AbjARVzo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 18 Jan 2023 16:55:44 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FFF7654DA;
        Wed, 18 Jan 2023 13:55:43 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id mp20so785928ejc.7;
        Wed, 18 Jan 2023 13:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1jWUcSxNgYzoZDSCAYfnIccXHRmHbJtKyjM0QyMRP9U=;
        b=a6DpNQy/Nue9NvVoK9sWIoGFZHS601a0NvJtTiWJCBw0V0eEOkvxxCjW9Uy8pxf2ma
         AP8Wl99VMGiLIMy8uGp37awcG/JzzQKALMQwv0K6G3KgrDWK+JdG2E4IkBgHqgCFQj98
         CkYync2Nc7N1XAomaDfea46SZE4ojEGpt99WfUEyTpQnBI4rmhiKECW6R6BXgEl0tZbd
         Tf+eCYjaKP+n5yj8NTp0K3bgydczY64k5vRF6slpAEeTeyksSKGhtv+UbQEEYab9gXPW
         OB+hLGXmBoBuMkN0uKj2pqFJmHKxvgdM6Bv70TLH7DlljBD0PebThPK0BaICabvGPriU
         Yj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1jWUcSxNgYzoZDSCAYfnIccXHRmHbJtKyjM0QyMRP9U=;
        b=q6XLGsckhHDVtaSgQJrppbbj2QlKbrXkIRie0uFs9bTRhlb04ZAUEvPlRC97Wywxuf
         RV93xbpDmyK1RceF1c+xbsOWBOMJYHFKge+XABD3gnvxNX7516s1KaQB2OEKrtz/3JOl
         c/ngfd+gr6ZYUjnk1eAOK3ed+1GfKX1LL6vBcxkOjZN1qSX6hYeHSGm887yp++s0Le4g
         K82rBKOvm5DmgK32485+ELgaIEd9JhG81qxO9dbe2C8q2Mjy3jEDJmLzs2GTY93SiBOD
         AmyxpDEy2iUNEnCyUXHT+Naa0iGzqFKCkOxqi34bxsd1ngp4azUBnRj7bXchvJALvzK7
         o+vw==
X-Gm-Message-State: AFqh2kqG8sgw+pMd5NTUU3dueCl8ZH0dYnicyr+Zw3YAnt8G3DW5MuNu
        YYZBlMjNV9QBm3AobCpWzcA=
X-Google-Smtp-Source: AMrXdXuBInZTTUba2Gd8fQSU6zasqD+20MrIr2ZTzauJ/mkSsj0La6ClGk0DvRyOHHRQ/qLxIEyk0A==
X-Received: by 2002:a17:906:5da8:b0:7b2:c227:126d with SMTP id n8-20020a1709065da800b007b2c227126dmr5350704ejv.20.1674078941956;
        Wed, 18 Jan 2023 13:55:41 -0800 (PST)
Received: from ?IPV6:2a02:3100:94be:5400:80c7:5ea4:ed2f:1a59? (dynamic-2a02-3100-94be-5400-80c7-5ea4-ed2f-1a59.310.pool.telefonica.de. [2a02:3100:94be:5400:80c7:5ea4:ed2f:1a59])
        by smtp.googlemail.com with ESMTPSA id b1-20020a1709063ca100b007af0f0d2249sm15252848ejh.52.2023.01.18.13.55.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 13:55:41 -0800 (PST)
Message-ID: <83ab7926-2db3-ef60-8356-53bc517a22a8@gmail.com>
Date:   Wed, 18 Jan 2023 22:54:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: [PATCH v5 2/3] i2c: algo: bit: allow getsda to be NULL
Content-Language: en-US
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>, Peter Rosin <peda@axentia.se>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <6f4b54d9-ab6d-a4d4-5142-27c89e03c6d2@gmail.com>
In-Reply-To: <6f4b54d9-ab6d-a4d4-5142-27c89e03c6d2@gmail.com>
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


