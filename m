Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2118B502B0B
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Apr 2022 15:37:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354077AbiDONkO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 15 Apr 2022 09:40:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354093AbiDONkG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 15 Apr 2022 09:40:06 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43199BB0B5;
        Fri, 15 Apr 2022 06:36:15 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id g18so15379925ejc.10;
        Fri, 15 Apr 2022 06:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=A4+ktht6E+aZpM5+3dwvgdmbjTzQMA5x6Q4uDTO6/dw=;
        b=KxEg9DTb7iIdGxmQkVo9U9yeKuk9RXZw5PHHTWvONV3+EsXrNviKmOLwuzdKCgNmKB
         8J0V1sA7b8EmcVEOpJQRtD2UokXGhRrUpgqJR0wvFzJLd/6nkB7REv0gbmr+ghGebyZc
         dWvopDgnFilTD7DFYZdcCmQBeniYNAtA5rLJnbrGQyFCa+TMmqsTJBI3G8uDTQhZhbTW
         55bSSVf65cR8PsAnfqYIEA/ATeV0t1JcW3+HQ9v4MD9a1V8hZ/WiOOsQTWg6QmOyVgZX
         rOL0aJhCHDYTpG5rcLQyuaNZex97qCB7M1YzRWlCyn9L9pmXW4FJ/0o0yUF6YItywQlZ
         orqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=A4+ktht6E+aZpM5+3dwvgdmbjTzQMA5x6Q4uDTO6/dw=;
        b=57MigH5LOzipnsjBdPg1bEeXr3IGOdg0PhrpPyOkODxYsMISJuVnGnms7Svo4tmd4y
         9hbdCi2kt1V6TkUHPdGcefB8KcElEHJBx9JTzsiMjAw5UlC3j49onoIP+hT/xBxri0Jx
         TeO0lGC4bDzfYfvJRbaGGiQ5AlTP99UWnZBf1gzTITtoxtR6Tat6hgNcBeW4sftm15wQ
         v5/ntLnoEyFCrEiLTe+nUssbCgk5h5VbbH35tZyYJYZX05pOQj4bEUzxeFM3tN6mL7mb
         OEKgmQyCxWkECqZLNOo9EF9z76AdddwLhDMk1gvPuKDbdXhuH6aabFp4Ul9+IYbVckqX
         sQhw==
X-Gm-Message-State: AOAM530HFyO79ZkAwhjUMQuZF071r1p9d9AdlqhfGoO5Wn96bYjLvvgW
        9F1QGy59wXOvnylOsTYodCNzbL30PRg=
X-Google-Smtp-Source: ABdhPJzMwGjucRNSX+j1ngzeaTs7uxauWEXkMF3RrVSWt9xgXcKBo9tH3Yo1o4HtX5e7ubW0huu6sw==
X-Received: by 2002:a17:907:168a:b0:6da:9177:9fdd with SMTP id hc10-20020a170907168a00b006da91779fddmr6321517ejc.757.1650029773734;
        Fri, 15 Apr 2022 06:36:13 -0700 (PDT)
Received: from ?IPV6:2a01:c22:6faa:ed00:b906:e23f:946b:b9f7? (dynamic-2a01-0c22-6faa-ed00-b906-e23f-946b-b9f7.c22.pool.telefonica.de. [2a01:c22:6faa:ed00:b906:e23f:946b:b9f7])
        by smtp.googlemail.com with ESMTPSA id f5-20020a17090624c500b006cee6661b6esm1728070ejb.10.2022.04.15.06.36.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Apr 2022 06:36:12 -0700 (PDT)
Message-ID: <15e6fe6d-1ec4-09c0-a804-fb2760d1d033@gmail.com>
Date:   Fri, 15 Apr 2022 15:33:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: [PATCH 2/3] i2c: algo: bit: allow getsda to be NULL
Content-Language: en-US
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <bc229e73-52aa-9f5d-c6fd-e84b64a589ba@gmail.com>
In-Reply-To: <bc229e73-52aa-9f5d-c6fd-e84b64a589ba@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
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


