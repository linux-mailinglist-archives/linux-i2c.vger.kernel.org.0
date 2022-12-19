Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2976F6511B6
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Dec 2022 19:23:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231305AbiLSSXB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Dec 2022 13:23:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229624AbiLSSW7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Dec 2022 13:22:59 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1942614D
        for <linux-i2c@vger.kernel.org>; Mon, 19 Dec 2022 10:22:58 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id z92so14166305ede.1
        for <linux-i2c@vger.kernel.org>; Mon, 19 Dec 2022 10:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SRkiotbrUUp0sb70imF1w8M08b21bs17EMmpEaHpu4k=;
        b=dP/FImugsXEMHFV1SN3U+JbaiAwtmbQsobic1sTDOF7JuxRblf5SHzYTXEfxYzYVQQ
         vUdZf1QtgAiEoHZnQBGTRF6q1ByPl+OecrvxAgafjO9tODhRJcKrTxtElLwEmfz56tft
         Pt1/7TPTZTDK0oLFbOGh0LI1WUu/8FtwVJEeltdq9QmMXtukE+xqs8OBI7l6ao+I4eUK
         Yc88/nwJMbfhOV7tsJoQzWXKnLGya0dTgE9Q/ftvsjJrEO2WNk3r7JAM7PdKR4CQPXK4
         P0ZVsnu1DZQ+PaJgUF5R3tcNGzcmdLae3e+pfr2ZjCO/FJY/qht6k4vfoNtqbH4UvjQl
         V+Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SRkiotbrUUp0sb70imF1w8M08b21bs17EMmpEaHpu4k=;
        b=w/0yRfIejnQ6gRZSUczp4iW86yM0A4VCCM8RWxYZiOpufAdItCWWtQD+D0V/t6oexD
         BQ0ok45Fy8KA5D82974zI/FevULER72JNPQK2DELrX0MsaYm4h2FJgNQxJNZoULDU8wD
         qB3NSJ9CeDartkp+KgfdOypwWUCBR6AoKDFTXIfBhyTRhOtjsxVAfbVsQcW8Q01v88uf
         9Qe8CPhvSzWkZ2RwhxLgWOYEezlf/dvIkmHEvK0zAy15I01yMIJ0m88XUkyVop3pNHpg
         CDH5XYNc8RQ3c5YnwAvWBftPBZPWZpPeX5KLIth8MOyVJih+bGg0QbB9aZ68myh8esqr
         Jakw==
X-Gm-Message-State: ANoB5pltqPjNLWicqFE1Uu5g4lz83DI9+UjkCAGmir4Rfg/iWQ8pLMuI
        jjJwHoP18pkRVUMoAFD0FDHNH7HDNvs=
X-Google-Smtp-Source: AA0mqf64L3J71+qWIKF0k+DO4RmVusnpHPaEyHlQ4ziKtceuIubAzohPhutVd349mEo+/wZZ5wKbww==
X-Received: by 2002:a05:6402:f24:b0:46d:ca42:2e59 with SMTP id i36-20020a0564020f2400b0046dca422e59mr43019080eda.11.1671474177407;
        Mon, 19 Dec 2022 10:22:57 -0800 (PST)
Received: from ?IPV6:2a01:c23:c0aa:f200:2422:8cf4:48af:d322? (dynamic-2a01-0c23-c0aa-f200-2422-8cf4-48af-d322.c23.pool.telefonica.de. [2a01:c23:c0aa:f200:2422:8cf4:48af:d322])
        by smtp.googlemail.com with ESMTPSA id u10-20020a056402110a00b0046aa78ecd8asm4653991edv.3.2022.12.19.10.22.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Dec 2022 10:22:57 -0800 (PST)
Message-ID: <50f333a1-2f62-4a2d-5527-7a17eb49ec68@gmail.com>
Date:   Mon, 19 Dec 2022 19:15:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: [PATCH v2 03/10] i2c: i801: make FEATURE_BLOCK_PROC dependent on
 FEATURE_BLOCK_BUFFER
Content-Language: en-US
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Jean Delvare <jdelvare@suse.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <8db86d89-d083-2a65-76a1-6db34f433604@gmail.com>
In-Reply-To: <8db86d89-d083-2a65-76a1-6db34f433604@gmail.com>
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

According to the datasheet the block process call requires block
buffer mode. The user may disable block buffer mode by module
parameter disable_features, in such a case we have to clear
FEATURE_BLOCK_PROC.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- add a commit message part as comment to the code
---
 drivers/i2c/busses/i2c-i801.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 45c2ebe40..2e9c5856a 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1658,6 +1658,10 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	}
 	priv->features &= ~disable_features;
 
+	/* The block process call uses block buffer mode */
+	if (!(priv->features & FEATURE_BLOCK_BUFFER))
+		priv->features &= ~FEATURE_BLOCK_PROC;
+
 	err = pcim_enable_device(dev);
 	if (err) {
 		dev_err(&dev->dev, "Failed to enable SMBus PCI device (%d)\n",
-- 
2.39.0


