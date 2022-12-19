Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 156066511B5
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Dec 2022 19:23:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231821AbiLSSXA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Dec 2022 13:23:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231305AbiLSSW7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Dec 2022 13:22:59 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 149E412759
        for <linux-i2c@vger.kernel.org>; Mon, 19 Dec 2022 10:22:58 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id n20so23719655ejh.0
        for <linux-i2c@vger.kernel.org>; Mon, 19 Dec 2022 10:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eI1YfqyG5mIVwPKtGL78y4jWQQ3prftvFp9hWN3KBnM=;
        b=k/pCpuVCDO0brV+dXfKRhqHssUXvBICycJABEIxx/Wp7i73ST3HXoNa7VB24Ohdwfv
         mqsqELbBc1YcuOBoeHgh1viCi8m7T0tKYXh6H5SE2qt17U/4Et1Uh2piC98SxuNzokb6
         uwirAeFTtb6QPavYFAbgT/iZhR20G/B/fum4j7WVPEG8fMO0OUEQwUqEdg+Edb/+BfhH
         t57tcwYQNbMjLAlCxutj8vouFbdJI9Y5K6tEWr2hVqAbIvQGRdWN2HTY4I2mG/yp5+rH
         3kIx6XPWuuatYfUDgZHa9uSdDIKNEArBXmAxjw7sf7mIbjtVosiEreVTBoh+x0MX0cUa
         7ocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eI1YfqyG5mIVwPKtGL78y4jWQQ3prftvFp9hWN3KBnM=;
        b=roemf+IyCKmLWAtJeMWMiT7A755GqV1l3yQIy1DyN2NGrMph06AVmvtTbq/DqrzBGV
         wMDTGyZTSOta2ZIduQGvxz6L8vpWO0RTm1pzXwc9F9X6yMhAIWYv16V7H9IgUpbOF7Pn
         EmkNYSj5LE6zy/HiTR/MWtYWOV1DJ7tJ1kr2NuG32us5kaEwRpBeB8we5wTg131BVlCh
         6cZA4uVskTWf9wx6d/tQ/ipDDwKh/dlZP2DGqbe/eMfDkPZrvON2OL4aJQ6HugdtJBS+
         TnH1TEdz2Y7AiMZSJjxaXWO2dwsG1gckT4zEcGOGpNyQYMdDPzKqegVcUL2v0JVHFbFN
         UevA==
X-Gm-Message-State: ANoB5pnchc2wC7lmco5yIkMuU1mXPNCVzM5yuA6dgT1pRqcZVPZfADnn
        sloCifO9Ty/lWrrC+Wl3cUKypjFGdNs=
X-Google-Smtp-Source: AA0mqf4pJ+CmE5wvWv3ff2AUv51a4OZ9TdsukJ3esgPgB4i3dxsFceae1L+52Duu+cw/fEwRE24ajQ==
X-Received: by 2002:a17:906:298c:b0:7c1:9eb:845b with SMTP id x12-20020a170906298c00b007c109eb845bmr35480746eje.16.1671474176662;
        Mon, 19 Dec 2022 10:22:56 -0800 (PST)
Received: from ?IPV6:2a01:c23:c0aa:f200:2422:8cf4:48af:d322? (dynamic-2a01-0c23-c0aa-f200-2422-8cf4-48af-d322.c23.pool.telefonica.de. [2a01:c23:c0aa:f200:2422:8cf4:48af:d322])
        by smtp.googlemail.com with ESMTPSA id kx16-20020a170907775000b007e57d6e3724sm4367190ejc.116.2022.12.19.10.22.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Dec 2022 10:22:56 -0800 (PST)
Message-ID: <2f09691a-c0f5-4aa1-8338-1066c0a6c63d@gmail.com>
Date:   Mon, 19 Dec 2022 19:14:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: [PATCH v2 02/10] i2c: i801: make FEATURE_HOST_NOTIFY dependent on
 FEATURE_IRQ
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

Host notification uses an interrupt, therefore it makes sense only if
interrupts are enabled. Make this dependency explicit by removing
FEATURE_HOST_NOTIFY if FEATURE_IRQ isn't set.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- add a commit message part as comment to the code
- make changed code cleaner
---
 drivers/i2c/busses/i2c-i801.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index da773c563..45c2ebe40 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1705,11 +1705,6 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 		outb_p(inb_p(SMBAUXCTL(priv)) &
 		       ~(SMBAUXCTL_CRC | SMBAUXCTL_E32B), SMBAUXCTL(priv));
 
-	/* Remember original Interrupt and Host Notify settings */
-	priv->original_hstcnt = inb_p(SMBHSTCNT(priv)) & ~SMBHSTCNT_KILL;
-	if (priv->features & FEATURE_HOST_NOTIFY)
-		priv->original_slvcmd = inb_p(SMBSLVCMD(priv));
-
 	/* Default timeout in interrupt mode: 200 ms */
 	priv->adapter.timeout = HZ / 5;
 
@@ -1739,6 +1734,15 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	dev_info(&dev->dev, "SMBus using %s\n",
 		 priv->features & FEATURE_IRQ ? "PCI interrupt" : "polling");
 
+	/* Host notification uses an interrupt */
+	if (!(priv->features & FEATURE_IRQ))
+		priv->features &= ~FEATURE_HOST_NOTIFY;
+
+	/* Remember original Interrupt and Host Notify settings */
+	priv->original_hstcnt = inb_p(SMBHSTCNT(priv)) & ~SMBHSTCNT_KILL;
+	if (priv->features & FEATURE_HOST_NOTIFY)
+		priv->original_slvcmd = inb_p(SMBSLVCMD(priv));
+
 	i801_add_tco(priv);
 
 	snprintf(priv->adapter.name, sizeof(priv->adapter.name),
-- 
2.39.0


