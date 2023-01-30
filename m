Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6CA7681CA4
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Jan 2023 22:24:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229742AbjA3VYV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Jan 2023 16:24:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230238AbjA3VYV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 30 Jan 2023 16:24:21 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F365A32E5A
        for <linux-i2c@vger.kernel.org>; Mon, 30 Jan 2023 13:24:19 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id m14so11992348wrg.13
        for <linux-i2c@vger.kernel.org>; Mon, 30 Jan 2023 13:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zl5iGEcz9aZDt6Lh/wp7RRqGX1an8DgFS9AaZhOg4w0=;
        b=kOIYy9LKVaBORkHm1h0+yPuY/72dBULlSAL6LmQyZs089RTMnd48F0r98ab7NrVVL7
         xyiE+EgV3IvqQN1eOJeXyPWSyOmUDD5cNr0d88YXccEUBjG2VBOIM1ekcin31dol0qJ7
         KswauNP7/gVamvnidFIsCdtzh0wmprbVh0kIK8nm6LWnhhd5yW1/mls1FRA7uHCtMmk9
         EIoDke36PbX4uj1C4KjRJ9ed1u8bbUYlAyb8Mry8KV3uXioDqb910wB09L3PBWWqki7Q
         DMr5kBisjSv35fcRA5x44EmA8F4S3dgzWv7r/JianfY2NcnGFF205D/oY3Dnfl9Wp5WX
         dfSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zl5iGEcz9aZDt6Lh/wp7RRqGX1an8DgFS9AaZhOg4w0=;
        b=R6EAGl/IKidGWOtf80zU88njlh12ZskJr99AQEmO1Vk7yrDKIpNXq4VRP/G9EGC4+Y
         tHsPs3iwdG6rWOZmROsdl1vEmt9UVowpiO5kMOe4ToFSPysilhdXNx9Kw68W1XCEhfmV
         UI858zjwRvLO4oRWXH8Yq20vf15IKdc18CHHLEudBANJI/tnoPJh4mxjvxDVmFveabkL
         sfWJ4Veqs31Nqwp8wOBozt0geGXrq72f3zVpyrNj4OMG1uMcdou1d1Z4di70OWMJhnXv
         50udjzESC85BUvWVLHWHvauRCWFNgyTJfY0ojZXymGy9zbD7MvakoLWpYYII3Gob4krt
         olVg==
X-Gm-Message-State: AO0yUKVvxrQsrLfO1eZ6MI3ddweIJBo6XK8l8YRHzyQl2bn2eOJd5s6k
        VSuuS4cDMmG+hP8vjPKaCeOzPD7UfFc=
X-Google-Smtp-Source: AK7set/a/Gh84ge5rqGV2/oWF8rJy+rM4WT5GnO+2VSo3jx6Mke/PUKKrx5uuSw+/uSUijzsLCjphw==
X-Received: by 2002:a05:6000:11ce:b0:2bf:bd69:234b with SMTP id i14-20020a05600011ce00b002bfbd69234bmr15622098wrx.32.1675113858447;
        Mon, 30 Jan 2023 13:24:18 -0800 (PST)
Received: from ?IPV6:2a01:c23:c074:7400:d941:3cb5:fa86:8ec8? (dynamic-2a01-0c23-c074-7400-d941-3cb5-fa86-8ec8.c23.pool.telefonica.de. [2a01:c23:c074:7400:d941:3cb5:fa86:8ec8])
        by smtp.googlemail.com with ESMTPSA id j5-20020adff005000000b002bddd75a83fsm12607573wro.8.2023.01.30.13.24.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jan 2023 13:24:18 -0800 (PST)
Message-ID: <7cf0ba9d-ffdf-bb8b-6011-5bc77ebdcec2@gmail.com>
Date:   Mon, 30 Jan 2023 22:24:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: [PATCH 2/2] i2c: core: extend use case for dflt addr in
 i2c_new_ancillary_device
Content-Language: en-US
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <600080c4-a19f-7ab6-394f-c742179da00f@gmail.com>
In-Reply-To: <600080c4-a19f-7ab6-394f-c742179da00f@gmail.com>
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

Interpret default_addr 0 in a way that the caller doesn't want a default.
Note: i2c_new_dummy_device() would fail anyway, but it would leave an ugly
error message complaining about invalid address 0.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/i2c-core-base.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 315ecd960..6ff245ef1 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1146,7 +1146,8 @@ static u32 i2c_prepare_ancillary_device(struct i2c_client *client,
  * and create the associated device
  * @client: Handle to the primary client
  * @name: Handle to specify which secondary address to get
- * @default_addr: Used as a fallback if no secondary address was specified
+ * @default_addr: Used as a fallback if no secondary address was specified.
+ *                Don't try to fall back if default_addr is zero.
  * Context: can sleep
  *
  * I2C clients can be composed of multiple I2C slaves bound together in a single
@@ -1169,6 +1170,9 @@ struct i2c_client *i2c_new_ancillary_device(struct i2c_client *client,
 {
 	u32 addr = i2c_prepare_ancillary_device(client, name, default_addr);
 
+	if (!addr && !default_addr)
+		return ERR_PTR(-ENOENT);
+
 	return i2c_new_dummy_device(client->adapter, addr);
 }
 EXPORT_SYMBOL_GPL(i2c_new_ancillary_device);
@@ -1179,6 +1183,9 @@ struct i2c_client *devm_i2c_new_ancillary_device(struct i2c_client *client,
 {
 	u32 addr = i2c_prepare_ancillary_device(client, name, default_addr);
 
+	if (!addr && !default_addr)
+		return ERR_PTR(-ENOENT);
+
 	return devm_i2c_new_dummy_device(&client->dev, client->adapter, addr);
 }
 EXPORT_SYMBOL_GPL(devm_i2c_new_ancillary_device);
-- 
2.39.1


