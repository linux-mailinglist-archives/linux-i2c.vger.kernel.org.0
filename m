Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6BE5502E15
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Apr 2022 19:00:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356039AbiDORCe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 15 Apr 2022 13:02:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356070AbiDORCc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 15 Apr 2022 13:02:32 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ADB0488B7
        for <linux-i2c@vger.kernel.org>; Fri, 15 Apr 2022 10:00:02 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id k23so16289561ejd.3
        for <linux-i2c@vger.kernel.org>; Fri, 15 Apr 2022 10:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=Z+tEIRxzosvV7SqajQEjAFtBxIP1vn138zIQHL73Ujc=;
        b=mWPqpudcZlNdomSwHm0BR4boe4TTvsGJvFMYKR+vawj3QOt4V3CZM78Qkptup5JRNZ
         ZKs+YWAxtgrTqyctdiOzM16TEG7ozgyOEJ5iFU3Mzo0nmkb1ljbCpW6YoZqlwm8vEylF
         BCs7j2YeI1EgBRojsnBb1FLMv7cq8KiOqusbbh8sReooDCg9/iEOA1JKsXuxg4ZLZJuO
         apD71ItiJShC3jQMIdROYidX8cFVLbi2IDoPSyQ70wxTsggbiFO2+68Jb97rPqhyzQBJ
         xYMk4uB3xoemi4QHkTFZok+Zc5lTN2fW67Pq7VuYiktl1Ig2VquUUipegR34/lbvyNsh
         9HIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=Z+tEIRxzosvV7SqajQEjAFtBxIP1vn138zIQHL73Ujc=;
        b=cDI1dyPilUp+neZu1/EevnT2Vk3GZHI/5asyHxdRwrcUQOetFub9KGps9fnFNMiydJ
         XjfGbnWY8Utdrvxc+kzamckJlTwUXnOK6lY0Q89m7/6K3EqkRKGTClhnga6FCO9PsYVm
         SjsipCNs+bjk6PJ3t3gWpih9YHkd17fgJddrDf0VqJ/ttvegxV2clGxnQcEbIksjeMGi
         m0zVvl3mIES6hEa7Q5TVM7J2BXzwP4Z2iLqwZSM7m/zFDgh1t0LrM+SMuGsNStkf863h
         87rqG5Ccc4nsQD3PD76T81YgAU7UOqUR5oFDnsjCGDirQ6DC2ZcVtcRMiBKOUKrEi/Wd
         3Mgg==
X-Gm-Message-State: AOAM532Na+HfdGZ1q26uwxRF6kgcl+7x0VyAzyFKOKMeD86VzosugTx9
        7+58nAA4bDxhHPzwhP0DPlsDk4n7jB0=
X-Google-Smtp-Source: ABdhPJx8DYj7GT1XHD70dnx/q0ztGvpn6qErie4APCETiygXgBFoSdcigmFi/gp3xP8p6z7vOoYnug==
X-Received: by 2002:a17:907:1b25:b0:6da:8206:fc56 with SMTP id mp37-20020a1709071b2500b006da8206fc56mr46100ejc.81.1650042000655;
        Fri, 15 Apr 2022 10:00:00 -0700 (PDT)
Received: from ?IPV6:2a01:c22:6faa:ed00:b906:e23f:946b:b9f7? (dynamic-2a01-0c22-6faa-ed00-b906-e23f-946b-b9f7.c22.pool.telefonica.de. [2a01:c22:6faa:ed00:b906:e23f:946b:b9f7])
        by smtp.googlemail.com with ESMTPSA id gq5-20020a170906e24500b006e87644f2f7sm1832442ejb.38.2022.04.15.09.59.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Apr 2022 10:00:00 -0700 (PDT)
Message-ID: <5e5774c2-26a2-dd4b-29ca-e1eca32ef889@gmail.com>
Date:   Fri, 15 Apr 2022 18:55:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: [PATCH 3/8] i2c: i801: make FEATURE_BLOCK_PROC dependent on
 FEATURE_BLOCK_BUFFER
Content-Language: en-US
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Jean Delvare <jdelvare@suse.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <4125f9ce-ce5f-fbcf-7d6f-9bc586ac43e0@gmail.com>
In-Reply-To: <4125f9ce-ce5f-fbcf-7d6f-9bc586ac43e0@gmail.com>
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

According to the datasheet the block process call requires block
buffer mode. The user may disable block buffer mode by module
parameter disable_features, in such a case we have to clear
FEATURE_BLOCK_PROC.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index eccdc7035..1d8182901 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1675,6 +1675,9 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	}
 	priv->features &= ~disable_features;
 
+	if (!(priv->features & FEATURE_BLOCK_BUFFER))
+		priv->features &= ~FEATURE_BLOCK_PROC;
+
 	err = pcim_enable_device(dev);
 	if (err) {
 		dev_err(&dev->dev, "Failed to enable SMBus PCI device (%d)\n",
-- 
2.35.3


