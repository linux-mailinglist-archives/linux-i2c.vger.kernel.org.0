Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8EDE38D076
	for <lists+linux-i2c@lfdr.de>; Sat, 22 May 2021 00:02:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbhEUWEU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 May 2021 18:04:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbhEUWES (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 May 2021 18:04:18 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBDA9C061574
        for <linux-i2c@vger.kernel.org>; Fri, 21 May 2021 15:02:54 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id n17-20020a7bc5d10000b0290169edfadac9so8187134wmk.1
        for <linux-i2c@vger.kernel.org>; Fri, 21 May 2021 15:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=z7mOI9T7xdDddlorQQFHh+HStIUHJ9tRc97dY1lGYRI=;
        b=PZ11jPNts8yZ+2fkVM+mdDbffV6yTaPHv/Q0P3noJyo86FRJNoaQFoXjuDCNTJjNOE
         rq3ZUUWzwAk7Fwf92JOf4o6WVWjx2Z/YEB2m8hg+4pbNVOZ1eMLNue6qB+/D+B8yY53n
         Dsf9b2UYrIL6v/NRgUVLhCVwf+vsM4IkNz5hryqBoNTJRkHs23l3AjRZhl/JmX9vHOok
         K63r+1Hq46VPTvEif0NtUg83s1KySVwONYHSIpsJkcF2den2XiFx2cuLIpoe+gyY9p1T
         WqVYTf8WJAslCmQTt5+58J2UafA2vpgNwyS6DCYUkSkWzdEfDt3ouacWydhzE69ywazn
         dgnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=z7mOI9T7xdDddlorQQFHh+HStIUHJ9tRc97dY1lGYRI=;
        b=iWwyrunlyqZAW0HFWoNStTRyS4Pe+g9kfsmqFrEQI7GYIhBWwkQ3an5JxCMu4rBv7k
         iMgqRIT3bvFRYMOLlZxhgcGnhNZs2uoWo6GmejFey8vRk73Iyjl9DP7fq7GBd+SPGtvb
         2ueuIwLGAwYcZjp9l6in2KOfHba4kNZO2cB5OBKNNzTd0Ep9s4rCMq4R8JNGr1D7Whzs
         cIO9ZmnC1spv9GsXJptQVeMr7kZ412F/wvi+sMLe7Ht5YqvRLUbeQB5xKoJ22+1/4HXt
         poh9HNbBsDn3ZplcVonBPfJcdIm5eS2qXlmarlRIMRWYD06Z3xBvOGayZAdF+cRJUEHW
         HoRw==
X-Gm-Message-State: AOAM530XqJD71/MBVurM5Jzke1t1q8prY/TH8LvS4bfYr7xew66fpsEg
        aD1dth/YF8/j4la3dWnxL3IoU4AY2Ng=
X-Google-Smtp-Source: ABdhPJxMY2pP6IE+4YmCG6cFfYhCDoVtrqhT06JXnej6z7D4Opbu+IOI+pttdv5xxUmcbYABLmHuRQ==
X-Received: by 2002:a1c:398a:: with SMTP id g132mr6790398wma.108.1621634573295;
        Fri, 21 May 2021 15:02:53 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f38:4600:84e0:e04f:ac50:5090? (p200300ea8f38460084e0e04fac505090.dip0.t-ipconnect.de. [2003:ea:8f38:4600:84e0:e04f:ac50:5090])
        by smtp.googlemail.com with ESMTPSA id 11sm759159wmo.24.2021.05.21.15.02.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 May 2021 15:02:52 -0700 (PDT)
Subject: [PATCH 1/2] i2c: i801: Remove unneeded warning after
 wait_event_timeout timeout
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Jean Delvare <jdelvare@suse.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <561b74ab-b020-b0c7-c1ad-b7c3326245e3@gmail.com>
Message-ID: <103951a0-4233-bbaf-2192-ac140469b07e@gmail.com>
Date:   Sat, 22 May 2021 00:00:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <561b74ab-b020-b0c7-c1ad-b7c3326245e3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

When passing -ETIMEDOUT to i801_check_post() it will emit a timeout
error message. I don't see much benefit in an additional warning
stating more or less the same.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 99d446763..bfea94d02 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -509,11 +509,9 @@ static int i801_transaction(struct i801_priv *priv, int xact)
 		result = wait_event_timeout(priv->waitq,
 					    (status = priv->status),
 					    adap->timeout);
-		if (!result) {
+		if (!result)
 			status = -ETIMEDOUT;
-			dev_warn(&priv->pci_dev->dev,
-				 "Timeout waiting for interrupt!\n");
-		}
+
 		priv->status = 0;
 		return i801_check_post(priv, status);
 	}
@@ -732,11 +730,9 @@ static int i801_block_transaction_byte_by_byte(struct i801_priv *priv,
 		result = wait_event_timeout(priv->waitq,
 					    (status = priv->status),
 					    adap->timeout);
-		if (!result) {
+		if (!result)
 			status = -ETIMEDOUT;
-			dev_warn(&priv->pci_dev->dev,
-				 "Timeout waiting for interrupt!\n");
-		}
+
 		priv->status = 0;
 		return i801_check_post(priv, status);
 	}
-- 
2.31.1


