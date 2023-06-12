Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3159072BB34
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jun 2023 10:51:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230295AbjFLIvv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Jun 2023 04:51:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229867AbjFLIvt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Jun 2023 04:51:49 -0400
X-Greylist: delayed 490 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 12 Jun 2023 01:51:48 PDT
Received: from mout-u-107.mailbox.org (mout-u-107.mailbox.org [80.241.59.207])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 224CC11B
        for <linux-i2c@vger.kernel.org>; Mon, 12 Jun 2023 01:51:47 -0700 (PDT)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-u-107.mailbox.org (Postfix) with ESMTPS id 4QflZp5tzVz9sTt;
        Mon, 12 Jun 2023 10:43:30 +0200 (CEST)
Message-ID: <1fdfa659-b10b-9c60-878f-3d9e515da4c5@denx.de>
Date:   Mon, 12 Jun 2023 10:43:29 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 08/15] i2c: busses: mt7621: Use devm_clk_get_enabled()
Content-Language: en-US
To:     Andi Shyti <andi.shyti@kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
References: <20230611225702.891856-1-andi.shyti@kernel.org>
 <20230611225702.891856-9-andi.shyti@kernel.org>
From:   Stefan Roese <sr@denx.de>
In-Reply-To: <20230611225702.891856-9-andi.shyti@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4QflZp5tzVz9sTt
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NEUTRAL,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 6/12/23 00:56, Andi Shyti wrote:
> Replace the pair of functions, devm_clk_get() and
> clk_prepare_enable(), with a single function
> devm_clk_get_enabled().
> 
> Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
> Cc: Stefan Roese <sr@denx.de>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Stefan Roese <sr@denx.de>

Thanks,
Stefan

> ---
>   drivers/i2c/busses/i2c-mt7621.c | 20 ++++----------------
>   1 file changed, 4 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
> index f9c294e2bd3c5..104bb194e9906 100644
> --- a/drivers/i2c/busses/i2c-mt7621.c
> +++ b/drivers/i2c/busses/i2c-mt7621.c
> @@ -282,16 +282,11 @@ static int mtk_i2c_probe(struct platform_device *pdev)
>   	if (IS_ERR(i2c->base))
>   		return PTR_ERR(i2c->base);
>   
> -	i2c->clk = devm_clk_get(&pdev->dev, NULL);
> +	i2c->clk = devm_clk_get_enabled(&pdev->dev, NULL);
>   	if (IS_ERR(i2c->clk)) {
> -		dev_err(&pdev->dev, "no clock defined\n");
> +		dev_err(&pdev->dev, "Failed to enable clock\n");
>   		return PTR_ERR(i2c->clk);
>   	}
> -	ret = clk_prepare_enable(i2c->clk);
> -	if (ret) {
> -		dev_err(&pdev->dev, "Unable to enable clock\n");
> -		return ret;
> -	}
>   
>   	i2c->dev = &pdev->dev;
>   
> @@ -301,8 +296,7 @@ static int mtk_i2c_probe(struct platform_device *pdev)
>   
>   	if (i2c->bus_freq == 0) {
>   		dev_warn(i2c->dev, "clock-frequency 0 not supported\n");
> -		ret = -EINVAL;
> -		goto err_disable_clk;
> +		return -EINVAL;
>   	}
>   
>   	adap = &i2c->adap;
> @@ -320,23 +314,17 @@ static int mtk_i2c_probe(struct platform_device *pdev)
>   
>   	ret = i2c_add_adapter(adap);
>   	if (ret < 0)
> -		goto err_disable_clk;
> +		return ret;
>   
>   	dev_info(&pdev->dev, "clock %u kHz\n", i2c->bus_freq / 1000);
>   
>   	return 0;
> -
> -err_disable_clk:
> -	clk_disable_unprepare(i2c->clk);
> -
> -	return ret;
>   }
>   
>   static void mtk_i2c_remove(struct platform_device *pdev)
>   {
>   	struct mtk_i2c *i2c = platform_get_drvdata(pdev);
>   
> -	clk_disable_unprepare(i2c->clk);
>   	i2c_del_adapter(&i2c->adap);
>   }
>   

Viele Grüße,
Stefan Roese

-- 
DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-51 Fax: (+49)-8142-66989-80 Email: sr@denx.de
