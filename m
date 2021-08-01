Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C71E23DCBFB
	for <lists+linux-i2c@lfdr.de>; Sun,  1 Aug 2021 16:24:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231980AbhHAOY7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 1 Aug 2021 10:24:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231791AbhHAOY6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 1 Aug 2021 10:24:58 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FD0AC0613D5
        for <linux-i2c@vger.kernel.org>; Sun,  1 Aug 2021 07:24:50 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id o7-20020a05600c5107b0290257f956e02dso5739817wms.1
        for <linux-i2c@vger.kernel.org>; Sun, 01 Aug 2021 07:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=AHkEiGsbFVVH/3EdckVwq71RRMxDIQkRpfo4doW2ax0=;
        b=Krx8eIbsiDEi5jcStdZ+XlwPeJDUk8TO4+7zFcL08TChBR3SKZKhDCtkUAgRSrQi6M
         PZR98oT8BScPahTHveldQ4NV+KWWaEMdeTLkp0n4qDTVWA+bcWesND2kk34zytI+Bxst
         goVEY3NsPAcxat2nl9ZJQmDWm1heE+ziNPjnZHapJKXandsZKEIDJlzOb2CeICja71Zc
         F95Gfg9VSe0cHjHDL8PUdwmv0HLHQnkmxYV2dIBFeRC7Gf7mWMao5WjtD3p3/FTCBQMa
         KwYlsyZQRu4QxbmnnwhOYH7eV5RpbFuwqRXWJ88++0RhDNLFVgu+7OzmUol/e6A5EfrL
         XuvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AHkEiGsbFVVH/3EdckVwq71RRMxDIQkRpfo4doW2ax0=;
        b=n0pQfAhRAQmvp/p9lUDtAD1wYzjymj7MXQtBCWjh9UPpNhT3bQvK0Z/yKU2hnsyZ8Z
         tuqMTBvVwCzjMNfFoK0I+FeuDAYPQmLI94wWA/2WXQgTPBJ1Svb47cPr0wNs7PIc/Qbx
         o2OgeiltHLXLMEP1yqcL08RvE8gqt0/RErGPI07sW7NKU74G0LDF0VI/zVsZIsw92uFZ
         nIHJrLhUfe5y0gWOfshpXdrjzCttB/A/JXRyJ/Kr3QZk+7PHJ8MDwNS1yuiPOoO5zcTq
         TR2cxbu6b/8rObHk5ENHkRpsHDiYauYx0gkqESzNPTUvoNhDyxs2BEj+dr+FKrUQjSet
         RoSA==
X-Gm-Message-State: AOAM533VzURwr2oXD1lS+v4hy9drby6vdT9+xGFfw/r/x5MRyB4/6Igx
        Y2ha6oyQ4nEReQfUlCXIOrOOWiM/3I2CRA==
X-Google-Smtp-Source: ABdhPJxBFz4XSEl/hfUqxCeaj5h9CsnOdN0BXMuig3QKTKdbUnLsfH62K68B0CjPd3x7gASgXvFYhQ==
X-Received: by 2002:a1c:a187:: with SMTP id k129mr12486244wme.17.1627827888836;
        Sun, 01 Aug 2021 07:24:48 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f10:c200:9d9e:757:f317:c524? (p200300ea8f10c2009d9e0757f317c524.dip0.t-ipconnect.de. [2003:ea:8f10:c200:9d9e:757:f317:c524])
        by smtp.googlemail.com with ESMTPSA id v6sm8064653wru.50.2021.08.01.07.24.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Aug 2021 07:24:48 -0700 (PDT)
Subject: [PATCH 04/10] i2c: i801: Remove not needed debug message
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Jean Delvare <jdelvare@suse.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <7a1581de-7566-15da-d1af-08cbf8c5e46f@gmail.com>
Message-ID: <3bf865c2-2c1b-e419-2f8f-44295e495197@gmail.com>
Date:   Sun, 1 Aug 2021 16:19:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <7a1581de-7566-15da-d1af-08cbf8c5e46f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

If a user is interested in such details he can enable smbus tracing.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 504f02e1e..d971ee20c 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -558,10 +558,6 @@ static void i801_isr_byte_done(struct i801_priv *priv)
 					priv->len);
 				/* FIXME: Recover */
 				priv->len = I2C_SMBUS_BLOCK_MAX;
-			} else {
-				dev_dbg(&priv->pci_dev->dev,
-					"SMBus block read size is %d\n",
-					priv->len);
 			}
 			priv->data[-1] = priv->len;
 		}
-- 
2.32.0


