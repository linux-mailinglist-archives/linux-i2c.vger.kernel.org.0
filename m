Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E605788BB1
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Aug 2023 16:29:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343768AbjHYO3Y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 25 Aug 2023 10:29:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343802AbjHYO3B (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 25 Aug 2023 10:29:01 -0400
Received: from mx4.sionneau.net (mx4.sionneau.net [51.15.250.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 631C419A1;
        Fri, 25 Aug 2023 07:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sionneau.net;
        s=selectormx4; t=1692973735;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0X4+Ji+39ABCKYrzjK0NFl18pVh6VMzrmuwBt1D+Tao=;
        b=bcQJeXYuPptdRZ3/8Ie7qGDMknotRQNn7qTY9in6TDJ/mA7xcdBkgvEr0FCshnVtEgVDLv
        QZohGNYKfX7p4IPu2VnmBKcIp6f9re+HCHSmGLVfNSlhyoMG/r2pe339bxBMv7roxnK9kl
        Rx5jkTpdFlAsi2TWb155K7Iy5Wxjeog=
Received: from [192.168.1.18] (91-171-21-26.subs.proxad.net [91.171.21.26])
        by mx4.sionneau.net (OpenSMTPD) with ESMTPSA id f6b5d399 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
        Fri, 25 Aug 2023 14:28:54 +0000 (UTC)
Message-ID: <a52e0b9c-3742-bfe1-5e17-05905e52c819@sionneau.net>
Date:   Fri, 25 Aug 2023 16:28:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] i2c: at91: Use dev_err_probe() instead of dev_err()
Content-Language: en-US
To:     Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20230825142415.37476-1-yann@sionneau.net>
From:   Yann Sionneau <yann@sionneau.net>
In-Reply-To: <20230825142415.37476-1-yann@sionneau.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLACK autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Commit msg is saying the opposite of what the change is doing, re-sending...

Le 25/08/2023 à 16:24, Yann Sionneau a écrit :
> Change return dev_err_probe() into
> if (IS_ERR(x)) { dev_err(...); return PTR_ERR(x); }
>
> Also, return the correct error instead of hardcoding -ENODEV
> This change has also the advantage of handling the -EPROBE_DEFER situation.
>
> Signed-off-by: Yann Sionneau <yann@sionneau.net>
> ---
>   drivers/i2c/busses/i2c-at91-core.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-at91-core.c b/drivers/i2c/busses/i2c-at91-core.c
> index 05ad3bc3578a..b7bc17b0e5f0 100644
> --- a/drivers/i2c/busses/i2c-at91-core.c
> +++ b/drivers/i2c/busses/i2c-at91-core.c
> @@ -227,10 +227,9 @@ static int at91_twi_probe(struct platform_device *pdev)
>   	platform_set_drvdata(pdev, dev);
>   
>   	dev->clk = devm_clk_get(dev->dev, NULL);
> -	if (IS_ERR(dev->clk)) {
> -		dev_err(dev->dev, "no clock defined\n");
> -		return -ENODEV;
> -	}
> +	if (IS_ERR(dev->clk))
> +		return dev_err_probe(dev->dev, PTR_ERR(dev->clk), "no clock defined\n");
> +
>   	clk_prepare_enable(dev->clk);
>   
>   	snprintf(dev->adapter.name, sizeof(dev->adapter.name), "AT91");
