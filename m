Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B9543E30DD
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Aug 2021 23:19:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232112AbhHFVT1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Aug 2021 17:19:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237662AbhHFVT1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 6 Aug 2021 17:19:27 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B864AC0613CF
        for <linux-i2c@vger.kernel.org>; Fri,  6 Aug 2021 14:19:10 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id x17so6393626wmc.5
        for <linux-i2c@vger.kernel.org>; Fri, 06 Aug 2021 14:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=DU2QkWJ98ackxuk8aBAFbOVCGLkLMXUqmGiUagB0d48=;
        b=Kv6vIqmclaEv+91Bw7t3wTq+88PxqQNser56SaBfSW4wvyFuUGTf/23Gkxpvjq7Dsd
         cMM0bRGPTC5K58FFXctIgy2z8Xnp0njF8ayVWokBOWtimsdw0ViCzh0D4s3SukwF5qi+
         Z8p41FAH5cOMNRsNmOq87o4YraYxz5/jAiPoMVIK/QRUinVzdJo4LmIao8g6V+TYzh3s
         nokIErJh4lWh9j0dPDj6g0jwnwmy/GD5k6seu5oqG/+ve4Y0BHMheTckrnAVET9+HeWf
         yO/m1V647bsb6gfcgAv7GMUBsK9yd6BZvQyfi2EmsVWMmvumeQLH4Qt1G1lKxMoitYAK
         vFtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DU2QkWJ98ackxuk8aBAFbOVCGLkLMXUqmGiUagB0d48=;
        b=MamiH73W+CgjyhQ0onECoyEFTZ0I4NlGsGLQL6zRBqj7Oruw5yVfiZmZenUJI5mZ9h
         yCOPfE3Pm9XNGD+DS4QB6XT7rMh0or6DCthq+0Tc6yBOoRBxYd2MXYcfuOagM0s8LP00
         KdhVkjkeII/D0yRwOplFdq81lNYjBFOSzfsPtHZ9daDphGLA1bA+zQIZlavjg3LwXQff
         EF0AfnoS862x1D1wIIYqtp1x/hpF5ND0In6DONMd6AY20MpyB5CMUGy5P3UuAXm8dufr
         YBXEDxdXyLvgSVnIJb2mHPhbtV81Y2+fgeihtsvohO5F/5tSykuPWKqn9RuCSR93qffc
         zNQQ==
X-Gm-Message-State: AOAM532V8qF1ytMguIAZ07qVUlNJjbV/QjlzOlrh36HHgGQsitVyObo+
        N8+IqWlZY3x/bBOeQfKMZFra97wk41gLAA==
X-Google-Smtp-Source: ABdhPJyWQe8LhkRAc9ktVeke1wX4AQ2c/mE5n7vFnw/b1JQtdmATNVlQLPpb/Nd1gKxJWJDyLm/imw==
X-Received: by 2002:a1c:23d2:: with SMTP id j201mr4505166wmj.4.1628284749224;
        Fri, 06 Aug 2021 14:19:09 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f10:c200:cc6d:4891:c067:bf7b? (p200300ea8f10c200cc6d4891c067bf7b.dip0.t-ipconnect.de. [2003:ea:8f10:c200:cc6d:4891:c067:bf7b])
        by smtp.googlemail.com with ESMTPSA id o11sm5847233wrp.88.2021.08.06.14.19.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Aug 2021 14:19:08 -0700 (PDT)
Subject: [PATCH v2 3/9] i2c: i801: Remove not needed debug message
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Jean Delvare <jdelvare@suse.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <e46ac7c1-1bb0-2caf-58e6-2fcaa89d30ae@gmail.com>
Message-ID: <a9fc0601-bff9-7a0b-92d1-68489b1476d2@gmail.com>
Date:   Fri, 6 Aug 2021 23:14:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <e46ac7c1-1bb0-2caf-58e6-2fcaa89d30ae@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

If a user is interested in such details he can enable smbus tracing.

Reviewed-by: Jean Delvare <jdelvare@suse.de>
Tested-by: Jean Delvare <jdelvare@suse.de>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 12e0c2ac3..89ae78ef1 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -559,10 +559,6 @@ static void i801_isr_byte_done(struct i801_priv *priv)
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


