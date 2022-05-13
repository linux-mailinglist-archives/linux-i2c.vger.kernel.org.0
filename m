Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BE9D5266DB
	for <lists+linux-i2c@lfdr.de>; Fri, 13 May 2022 18:15:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381792AbiEMQPk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 May 2022 12:15:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358844AbiEMQPk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 13 May 2022 12:15:40 -0400
Received: from smtp.smtpout.orange.fr (smtp01.smtpout.orange.fr [80.12.242.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9DC6193C9
        for <linux-i2c@vger.kernel.org>; Fri, 13 May 2022 09:15:37 -0700 (PDT)
Received: from [192.168.1.18] ([86.243.180.246])
        by smtp.orange.fr with ESMTPA
        id pXwwnXNx8WQHjpXwwnRPHc; Fri, 13 May 2022 18:15:34 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Fri, 13 May 2022 18:15:34 +0200
X-ME-IP: 86.243.180.246
Message-ID: <0fa271ed-e61e-4415-a78f-b2dee74b2f98@wanadoo.fr>
Date:   Fri, 13 May 2022 18:15:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH -next 1/2] i2c: mt7621: fix missing
 clk_disable_unprepare() on error in mtk_i2c_probe()
Content-Language: fr
To:     Yang Yingliang <yangyingliang@huawei.com>,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Cc:     matthias.bgg@gmail.com, sr@denx.de, wsa@the-dreams.de
References: <20220513100819.2711845-1-yangyingliang@huawei.com>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20220513100819.2711845-1-yangyingliang@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Le 13/05/2022 à 12:08, Yang Yingliang a écrit :
> Fix the missing clk_disable_unprepare() before return
> from mtk_i2c_probe() in the error handling case.
> 
> Fixes: d04913ec5f89 ("i2c: mt7621: Add MediaTek MT7621/7628/7688 I2C driver")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>   drivers/i2c/busses/i2c-mt7621.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
> index 45fe4a7fe0c0..f117c3d9ca19 100644
> --- a/drivers/i2c/busses/i2c-mt7621.c
> +++ b/drivers/i2c/busses/i2c-mt7621.c
> @@ -304,7 +304,8 @@ static int mtk_i2c_probe(struct platform_device *pdev)
>   
>   	if (i2c->bus_freq == 0) {
>   		dev_warn(i2c->dev, "clock-frequency 0 not supported\n");
> -		return -EINVAL;
> +		ret = -EINVAL;
> +		goto err_disable_clk;
>   	}
>   
>   	adap = &i2c->adap;
> @@ -322,10 +323,13 @@ static int mtk_i2c_probe(struct platform_device *pdev)
>   
>   	ret = i2c_add_adapter(adap);
>   	if (ret < 0)
> -		return ret;
> +		goto err_disable_clk;
>   
>   	dev_info(&pdev->dev, "clock %u kHz\n", i2c->bus_freq / 1000);

Hi,

should'nt we have a:
	return 0;
here?

otherwise we will call clk_disable_unprepare() even on the normal path.

CJ

>   
> +err_disable_clk:
> +	clk_disable_unprepare(i2c->clk);
> +
>   	return ret;
>   }
>   

