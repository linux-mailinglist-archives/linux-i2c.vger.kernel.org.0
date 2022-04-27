Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 384E25122AC
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Apr 2022 21:27:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229934AbiD0TaR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 Apr 2022 15:30:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234429AbiD0T3F (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 27 Apr 2022 15:29:05 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EC654ECFB;
        Wed, 27 Apr 2022 12:25:19 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id r11-20020a05600c35cb00b0039409c1111bso839729wmq.3;
        Wed, 27 Apr 2022 12:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=A4+ktht6E+aZpM5+3dwvgdmbjTzQMA5x6Q4uDTO6/dw=;
        b=Ts7hF3rKgmukVAejVVk7L8VPHbHIuc9A6DqCKdgKSc3Fwo+88AVI6hNwpeBCD2Sgdi
         /1J7ky+vQco4b6ZD7dd3iXpo2C6c1yVfq4Y6ZV7ykvw9ygYEFY4WYRm3959cUuyF6NCs
         Xsw4M8gEH7abLMQeTTvPGhnRDhtQBrS6xBoi+pEag50n6zCsSS5Pe35vYC7MtwO4E5an
         jKFBHhYwFDGboDztwk3tltvA2kAfb5Ls7859dVlyxwR70gmvnUjNUrOi6JcMh4C784zH
         owProFItXxeV9qec2Fo+zs08D9h/IkDU+vgVsCoMDMksjNkyrcVz83Xsd+G/HWoG0itj
         qALw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=A4+ktht6E+aZpM5+3dwvgdmbjTzQMA5x6Q4uDTO6/dw=;
        b=NFwU1Jf9pOTVDZ3hSfYel5FScqJsylC1129D5qQT5goD8bWLMcvO+84BqFuQV+WUK3
         aB6G4J9uK+yAj3xbz2fp2RY4/3Z1LnufSwhs8AQUEgtLLBYcir+JnCgi0oo/zkZ6V3G5
         psB7tOj+deDkW1yMrfXfu0nsEbCjyHZRVudRhDUnaS3D35vMr3GQR1fXJ8eoo7UwbanC
         bkVnx0iRIYDablqe2yiWrUKrhx+Prb5Y82mAAHOlpEpjMi4bL7SQ4RPF7h6Yq1UsFbbg
         UQDd6jeot5T1KUncOQlKfSGok/0RN1Nncrrg9d0SvfukEbRHn4LJpDkYxVLqKw2XcpQo
         CaOA==
X-Gm-Message-State: AOAM5300AglvII22gu7IInrnFz2uvP8uLCnXxl3xs0ljGV6vJujDsI8v
        upmmsrKzbMOAaQ7037zQHhc=
X-Google-Smtp-Source: ABdhPJzwlOsDaCrxLchO9nzKgl3u/idPkB0oV8Ywq2FDcHml+QiL0sX8p/2zJvX4OnlQ1n0UH3SP/Q==
X-Received: by 2002:a05:600c:1e86:b0:391:62c4:fb72 with SMTP id be6-20020a05600c1e8600b0039162c4fb72mr36001695wmb.119.1651087517384;
        Wed, 27 Apr 2022 12:25:17 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c002:fc00:393a:1fdf:a518:6420? (dynamic-2a01-0c23-c002-fc00-393a-1fdf-a518-6420.c23.pool.telefonica.de. [2a01:c23:c002:fc00:393a:1fdf:a518:6420])
        by smtp.googlemail.com with ESMTPSA id y6-20020a056000168600b0020a96d2cf8fsm17103951wrd.60.2022.04.27.12.25.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Apr 2022 12:25:17 -0700 (PDT)
Message-ID: <2adcd797-f3cc-c8c7-c18c-d3726b2db4c0@gmail.com>
Date:   Wed, 27 Apr 2022 21:24:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: [PATCH v2 2/3] i2c: algo: bit: allow getsda to be NULL
Content-Language: en-US
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <3e6c934e-5298-42c5-c346-31b1acaa06ba@gmail.com>
In-Reply-To: <3e6c934e-5298-42c5-c346-31b1acaa06ba@gmail.com>
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
 drivers/i2c/algos/i2c-algo-bit.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/algos/i2c-algo-bit.c b/drivers/i2c/algos/i2c-algo-bit.c
index fc90293af..ab5a73e90 100644
--- a/drivers/i2c/algos/i2c-algo-bit.c
+++ b/drivers/i2c/algos/i2c-algo-bit.c
@@ -184,8 +184,9 @@ static int i2c_outb(struct i2c_adapter *i2c_adap, unsigned char c)
 
 	/* read ack: SDA should be pulled down by slave, or it may
 	 * NAK (usually to report problems with the data we wrote).
+	 * Report ACK if SDA is write-only.
 	 */
-	ack = !getsda(adap);    /* ack: sda is pulled low -> success */
+	ack = !adap->getsda || !getsda(adap);    /* ack: sda is pulled low -> success */
 	bit_dbg(2, &i2c_adap->dev, "i2c_outb: 0x%02x %s\n", (int)c,
 		ack ? "A" : "NA");
 
@@ -203,6 +204,9 @@ static int i2c_inb(struct i2c_adapter *i2c_adap)
 	unsigned char indata = 0;
 	struct i2c_algo_bit_data *adap = i2c_adap->algo_data;
 
+	if (!adap->getsda)
+		return -EOPNOTSUPP;
+
 	/* assert: scl is low */
 	sdahi(adap);
 	for (i = 0; i < 8; i++) {
@@ -232,6 +236,10 @@ static int test_bus(struct i2c_adapter *i2c_adap)
 	const char *name = i2c_adap->name;
 	int scl, sda, ret;
 
+	/* Testing not possible if both pins are write-only. */
+	if (adap->getscl == NULL && adap->getsda == NULL)
+		return 0;
+
 	if (adap->pre_xfer) {
 		ret = adap->pre_xfer(i2c_adap);
 		if (ret < 0)
@@ -670,8 +678,10 @@ static int __i2c_bit_add_bus(struct i2c_adapter *adap,
 	if (ret < 0)
 		return ret;
 
-	/* Complain if SCL can't be read */
-	if (bit_adap->getscl == NULL) {
+	if (bit_adap->getscl == NULL && bit_adap->getsda == NULL)
+		dev_info(&adap->dev, "I2C-like interface, SDA and SCL are write-only\n");
+	else if (bit_adap->getscl == NULL) {
+		/* Complain if SCL can't be read */
 		dev_warn(&adap->dev, "Not I2C compliant: can't read SCL\n");
 		dev_warn(&adap->dev, "Bus may be unreliable\n");
 	}
-- 
2.35.3

