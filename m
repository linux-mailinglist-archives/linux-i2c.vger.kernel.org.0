Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E998266B04C
	for <lists+linux-i2c@lfdr.de>; Sun, 15 Jan 2023 11:18:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230462AbjAOKSq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 15 Jan 2023 05:18:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230145AbjAOKSa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 15 Jan 2023 05:18:30 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2794CDE3;
        Sun, 15 Jan 2023 02:18:29 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id k8so10365544wrc.9;
        Sun, 15 Jan 2023 02:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/D0U6ZSa9ufXqRencjxkQFzJOdEXcs/cpW2jU/kZH/M=;
        b=K9pasKsSYWaBapGarM+zzgGQVplz5o57CJb32ZxlQ14rAfHqBMOGMYSVFnHsx7qJ9G
         VXRpCU0JQqDhgNsOWFInXfYDxCrZc+FcBOCUqbQ6WmqmrdTyjNHh/tCx13x89CZR6EAE
         IGuhsdjtoLjWxubUnetxlEI1071gXYO2zqwhyhofHnHDKXpIiedt9xi5t5jztD+Z/ZU8
         Q0BBcMrGrEAK9LnEqEKd2B+AAJfNjOQ3s7gvmnUoL2sOVkFvGYLYPCNggVdGrk7TXpLu
         VOjtLJP03FWAtC1lTm3mlBibXHdS7GDOXvJuS+CqumZWGTFudkRvMmqMPIENZGd6THHV
         rXQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/D0U6ZSa9ufXqRencjxkQFzJOdEXcs/cpW2jU/kZH/M=;
        b=NQy97VrQR8yabPuPMQ7cnmdD0Hy4bB2baOUeFFX11BFm4TutbDjSK7XvjH+e+7xOBd
         Mk9OjhCyGIi5P8PgrTfFOg31j5KbO89GfEgh7EAO20YYdfz/bUzyEzIKWlILCr0VcaPL
         PdhsLcAjl/pwV1sMfv/IdgSblefN3EohOlDwvgm/kpmEmrN7KQM9+TENZnMlAqZz1JfO
         MCpld3rbx+2MbX3o9Uu8Q+xha3SPqY7G4kWOjGMH6oXmqHKd+NpW9wAe2CMbfyrP1bZp
         dP52sXCFo9fIr3C+fI5T9gKd4MwUz65PhIzRCgFjxi9B25BxctSsJyjHq5pYlnL7k8fl
         rCxQ==
X-Gm-Message-State: AFqh2kqUeQZ8F/g+4wt3wUEu68wov5InN54Z5GzozVrAn1wQPkXTCR+C
        yFy4Pb5I6VtZJ325q1w1TUYlKFjt9uk=
X-Google-Smtp-Source: AMrXdXv48t+zyOW+TLe3yWdXReBPlpJ/rytYi71Z/PeQUGAPaIFkFLeYZzO7pVES7BjHKIz5LCALiw==
X-Received: by 2002:a5d:4b0f:0:b0:2bd:c4ea:3b59 with SMTP id v15-20020a5d4b0f000000b002bdc4ea3b59mr10674279wrq.0.1673777908265;
        Sun, 15 Jan 2023 02:18:28 -0800 (PST)
Received: from ?IPV6:2a01:c22:6e61:8c00:154f:326e:8d45:8ce7? (dynamic-2a01-0c22-6e61-8c00-154f-326e-8d45-8ce7.c22.pool.telefonica.de. [2a01:c22:6e61:8c00:154f:326e:8d45:8ce7])
        by smtp.googlemail.com with ESMTPSA id l4-20020a05600012c400b002bbb2d43f65sm20419613wrx.14.2023.01.15.02.18.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Jan 2023 02:18:27 -0800 (PST)
Message-ID: <b70a9deb-5dc2-fbde-20f1-06b2a80c2697@gmail.com>
Date:   Sun, 15 Jan 2023 11:15:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: [PATCH v3 2/3] i2c: algo: bit: allow getsda to be NULL
Content-Language: en-US
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <3a5545f3-f858-2c80-8bd4-2e0d401a1dc0@gmail.com>
In-Reply-To: <3a5545f3-f858-2c80-8bd4-2e0d401a1dc0@gmail.com>
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
---
 drivers/i2c/algos/i2c-algo-bit.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/algos/i2c-algo-bit.c b/drivers/i2c/algos/i2c-algo-bit.c
index fc90293af..a1b822723 100644
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
 
@@ -232,6 +233,10 @@ static int test_bus(struct i2c_adapter *i2c_adap)
 	const char *name = i2c_adap->name;
 	int scl, sda, ret;
 
+	/* Testing not possible if both pins are write-only. */
+	if (adap->getscl == NULL && adap->getsda == NULL)
+		return 0;
+
 	if (adap->pre_xfer) {
 		ret = adap->pre_xfer(i2c_adap);
 		if (ret < 0)
@@ -420,6 +425,10 @@ static int readbytes(struct i2c_adapter *i2c_adap, struct i2c_msg *msg)
 	unsigned char *temp = msg->buf;
 	int count = msg->len;
 	const unsigned flags = msg->flags;
+	struct i2c_algo_bit_data *adap = i2c_adap->algo_data;
+
+	if (!adap->getsda)
+		return -EOPNOTSUPP;
 
 	while (count > 0) {
 		inval = i2c_inb(i2c_adap);
@@ -670,8 +679,11 @@ static int __i2c_bit_add_bus(struct i2c_adapter *adap,
 	if (ret < 0)
 		return ret;
 
-	/* Complain if SCL can't be read */
+	if (bit_adap->getsda == NULL)
+		dev_warn(&adap->dev, "Not I2C compliant: can't read SDA\n");
+
 	if (bit_adap->getscl == NULL) {
+		/* Complain if SCL can't be read */
 		dev_warn(&adap->dev, "Not I2C compliant: can't read SCL\n");
 		dev_warn(&adap->dev, "Bus may be unreliable\n");
 	}
-- 
2.39.0


