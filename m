Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B54273F51A
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Jun 2023 09:12:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229922AbjF0HMv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 27 Jun 2023 03:12:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbjF0HMu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 27 Jun 2023 03:12:50 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EE451BE7
        for <linux-i2c@vger.kernel.org>; Tue, 27 Jun 2023 00:12:45 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3fa96fd7a01so22404465e9.1
        for <linux-i2c@vger.kernel.org>; Tue, 27 Jun 2023 00:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687849964; x=1690441964;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ggLDGiLASKXjzv41vxcGuD0v2D3Md+XuVsA8ytWFhq0=;
        b=dD4ZR8xlf80OKvytf3PyeqgCLIP4CC6nIl+F8NYd6+cYEP0lEu/52Z6/BbBpzFzQ7m
         kY79A8AAUUBHKPrTwJEhmZudI6xu/p9bD3xdm+15HsaR2cTMJb5r/F2pHv/dTx7kzlR4
         zMHTz/bOflFXKVJm8OFQyuNY/5c50dM4wZhj7FG2mLHEno+033CgjqA8hTiNHnN1DO64
         zfri5fOXOpUFe8O0cBSU8yU1iG32UVPh5HkZc4vB0w7kWUAwwQ+gNKWvIZm0Vz0DuMId
         sWLg5fvMxzRUrvq8jS+dHVivz/ZpZTgBKNrNtkVtTxzM3abYlLkHziG4433gMo9x9q1w
         dGiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687849964; x=1690441964;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ggLDGiLASKXjzv41vxcGuD0v2D3Md+XuVsA8ytWFhq0=;
        b=UXm9w3sscKFclN3h8UvBeVrcm55eZXiRN8PwMmEC70tsQokHFuOZK5kjiUIEcIWOVh
         vzPrzOUO/a9DiPAE01ZKsJvamqiPQruTXm+wXuZjWFOXApKAUHP9JjNqVJKlSGw5ZbdK
         PEzdaE6Dvj74xzUcaLDZozm3ZJdSiTfOGPMzhjqAn/1//fYaKGyMhJZCAt40mfbaeV25
         12nOA+XplndvS2LD/iHCfHwq0RvyRNNSIlBYwfNbwq4ObtswUEmLmjoFACQccdcsyJJ7
         83kqRDgUw9zyoaJzvl4cNwZMIUbTuBIMaQwO9yxMqzRLfwwN/qhTtxGpuQytX9XyoxAN
         QwYw==
X-Gm-Message-State: AC+VfDzDuT0nNTZff9aKnILpVdXWi/iBoFR7uVqSQ6brHvb+xw4aOo2y
        L/JFSm8o7br4VWzb+iBX1YxFcw==
X-Google-Smtp-Source: ACHHUZ4xx+0rg/Ks+yJHZbTzNzYTWyjpHzcQcOs1x9M64X7tq8jGOULoEd3lGMvz94HJaCLUkFZMUA==
X-Received: by 2002:a05:600c:2247:b0:3fb:a266:3a34 with SMTP id a7-20020a05600c224700b003fba2663a34mr897038wmm.12.1687849963890;
        Tue, 27 Jun 2023 00:12:43 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q9-20020a056000136900b0030f9c3219aasm9464956wrz.47.2023.06.27.00.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 00:12:42 -0700 (PDT)
Date:   Tue, 27 Jun 2023 10:12:36 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] i2c: sun6i-p2wi: Fix an error message in probe()
Message-ID: <98afbc28-3366-459e-bd01-f77cf1a67fe9@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The "ret" variable is uninitialized.  It was the "p2wi->rstc" variable
that was intended.  We can also use the %pe string format to print the
error code name instead of just the number.

Fixes: 75ff8a340a81 ("i2c: sun6i-p2wi: Use devm_clk_get_enabled()")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/i2c/busses/i2c-sun6i-p2wi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-sun6i-p2wi.c b/drivers/i2c/busses/i2c-sun6i-p2wi.c
index ad8270cdbd3e..fa6020dced59 100644
--- a/drivers/i2c/busses/i2c-sun6i-p2wi.c
+++ b/drivers/i2c/busses/i2c-sun6i-p2wi.c
@@ -250,7 +250,8 @@ static int p2wi_probe(struct platform_device *pdev)
 
 	p2wi->rstc = devm_reset_control_get_exclusive(dev, NULL);
 	if (IS_ERR(p2wi->rstc)) {
-		dev_err(dev, "failed to retrieve reset controller: %d\n", ret);
+		dev_err(dev, "failed to retrieve reset controller: %pe\n",
+			p2wi->rstc);
 		return PTR_ERR(p2wi->rstc);
 	}
 
-- 
2.39.2

