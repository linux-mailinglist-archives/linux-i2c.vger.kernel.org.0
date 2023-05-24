Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6236270FE8A
	for <lists+linux-i2c@lfdr.de>; Wed, 24 May 2023 21:29:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235702AbjEXT3g (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 May 2023 15:29:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbjEXT3f (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 24 May 2023 15:29:35 -0400
X-Greylist: delayed 450 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 24 May 2023 12:29:34 PDT
Received: from smtp.smtpout.orange.fr (smtp-27.smtpout.orange.fr [80.12.242.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9E758A4
        for <linux-i2c@vger.kernel.org>; Wed, 24 May 2023 12:29:34 -0700 (PDT)
Received: from [192.168.1.18] ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id 1u3ZqjgFD6SBs1u3ZqO29a; Wed, 24 May 2023 21:22:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
        s=t20230301; t=1684956121;
        bh=KtBT+/p9xVKfZAX03YFetjgjS9Yj6TbdtHzoGVVDnNc=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To;
        b=U3T+9+/bzvuKJZkdEtXplHrNUCt3U8B7B5FVVPHXaSPFIKXIxZFx0jVWh1hdNMkMV
         qj+rbDbiyfXCUdfrgaDWT3IoFiAuQKVt/M+cyIG2PXvlDNotSJ/XnzAD4ja4TYzdEe
         CHdI2vONfcl2GwloTsUQNOuZT28gZSSb9bIQQ/0ubBIzwClGowNmimV/n9p4W3H6I3
         g77sskh9b2pS1JlhNwuOKOkF6CJvqHNpdxRYOhtG5DV9PplfZK9cX401ZYt2691dkz
         FdBsbkqGTmnuNtS6xeNgoadoiwLDCxFQeUlKLxr5W6pNL0HkMGyBC0P06YMYtcmsy2
         dLEKu8tgJp5uw==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 24 May 2023 21:22:01 +0200
X-ME-IP: 86.243.2.178
Message-ID: <68c4b991-6af9-36e8-354c-7c3b232ba4c2@wanadoo.fr>
Date:   Wed, 24 May 2023 21:21:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3] i2c: ocores: use devm_ managed clks
To:     Wang Zhang <silver_code@hust.edu.cn>,
        Peter Korsgaard <peter@korsgaard.com>,
        Andrew Lunn <andrew@lunn.ch>
Cc:     hust-os-kernel-patches@googlegroups.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dan Carpenter <dan.carpenter@linaro.org>
References: <5572a733.abc0.18846f13b0b.Coremail.m202171703@hust.edu.cn>
 <20230524154318.2259-1-silver_code@hust.edu.cn>
Content-Language: fr
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20230524154318.2259-1-silver_code@hust.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Le 24/05/2023 à 17:43, Wang Zhang a écrit :
> While it is not entirely clear why the original author implemented this
> behavior, there may have been certain circumstances or issues that were not
> apparent to us. It's possible that they were trying to work around a bug by
> employing an unconventional solution.Using `devm_clk_get_enabled()` rather
> than devm_clk_get() can automatically track the usage of clocks and free
> them when they are no longer needed or an error occurs.
> 
> fixing it by changing `ocores_i2c_of_probe` to use
> `devm_clk_get_optional_enabled()` rather than `devm_clk_get()`, changing
> `goto err_clk' to direct return and removing `err_clk`.
> 
> Signed-off-by: Wang Zhang <silver_code@hust.edu.cn>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> ---
> v2->v3: use `devm_clk_get_optional_enabled()` to manage clks
> v1->v2: change `ocores_i2c_of_probe` to use `devm_clk_get_enabled()`
> ---
>   drivers/i2c/busses/i2c-ocores.c | 57 +++++++++++++--------------------
>   1 file changed, 22 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-ocores.c b/drivers/i2c/busses/i2c-ocores.c
> index 2e575856c5cd..316d72cde3b9 100644
> --- a/drivers/i2c/busses/i2c-ocores.c
> +++ b/drivers/i2c/busses/i2c-ocores.c
> @@ -552,16 +552,14 @@ static int ocores_i2c_of_probe(struct platform_device *pdev,
>   							&clock_frequency);
>   	i2c->bus_clock_khz = 100;
>   
> -	i2c->clk = devm_clk_get(&pdev->dev, NULL);
> +	i2c->clk = devm_clk_get_optional_enabled(&pdev->dev, NULL);
>   
> -	if (!IS_ERR(i2c->clk)) {
> -		int ret = clk_prepare_enable(i2c->clk);
> -
> -		if (ret) {
> -			dev_err(&pdev->dev,
> -				"clk_prepare_enable failed: %d\n", ret);
> -			return ret;
> -		}
> +	if (IS_ERR(i2c->clk)) {
> +		dev_err(&pdev->dev,
> +			"devm_clk_get_optional_enabled failed\n");

Maybe dev_err_probe() would be nice here. This would log the error code, 
and filter -EPROBE_DEFER, should it happen.

> +		return PTR_ERR(i2c->clk);
> +	}
> +	if (i2c->clk) {
>   		i2c->ip_clock_khz = clk_get_rate(i2c->clk) / 1000;
>   		if (clock_frequency_present)
>   			i2c->bus_clock_khz = clock_frequency / 1000;
> @@ -573,7 +571,6 @@ static int ocores_i2c_of_probe(struct platform_device *pdev,
>   			if (!clock_frequency_present) {
>   				dev_err(&pdev->dev,
>   					"Missing required parameter 'opencores,ip-clock-frequency'\n");
> -				clk_disable_unprepare(i2c->clk);
>   				return -ENODEV;
>   			}
>   			i2c->ip_clock_khz = clock_frequency / 1000;
> @@ -678,8 +675,7 @@ static int ocores_i2c_probe(struct platform_device *pdev)
>   		default:
>   			dev_err(&pdev->dev, "Unsupported I/O width (%d)\n",
>   				i2c->reg_io_width);
> -			ret = -EINVAL;
> -			goto err_clk;
> +			return -EINVAL;
>   		}
>   	}
>   
> @@ -710,13 +706,13 @@ static int ocores_i2c_probe(struct platform_device *pdev)
>   						   pdev->name, i2c);
>   		if (ret) {
>   			dev_err(&pdev->dev, "Cannot claim IRQ\n");
> -			goto err_clk;
> +			return ret;
>   		}
>   	}
>   
>   	ret = ocores_init(&pdev->dev, i2c);
>   	if (ret)
> -		goto err_clk;
> +		return ret;
>   
>   	/* hook up driver to tree */
>   	platform_set_drvdata(pdev, i2c);
> @@ -728,7 +724,7 @@ static int ocores_i2c_probe(struct platform_device *pdev)
>   	/* add i2c adapter to i2c tree */
>   	ret = i2c_add_adapter(&i2c->adap);
>   	if (ret)
> -		goto err_clk;
> +		return ret;
>   
>   	/* add in known devices to the bus */
>   	if (pdata) {
> @@ -737,10 +733,6 @@ static int ocores_i2c_probe(struct platform_device *pdev)
>   	}
>   
>   	return 0;
> -
> -err_clk:
> -	clk_disable_unprepare(i2c->clk);
> -	return ret;
>   }
>   
>   static int ocores_i2c_remove(struct platform_device *pdev)
> @@ -755,9 +747,6 @@ static int ocores_i2c_remove(struct platform_device *pdev)
>   	/* remove adapter & data */
>   	i2c_del_adapter(&i2c->adap);
>   
> -	if (!IS_ERR(i2c->clk))
> -		clk_disable_unprepare(i2c->clk);
> -
>   	return 0;
>   }
>   
> @@ -771,8 +760,7 @@ static int ocores_i2c_suspend(struct device *dev)
>   	ctrl &= ~(OCI2C_CTRL_EN | OCI2C_CTRL_IEN);
>   	oc_setreg(i2c, OCI2C_CONTROL, ctrl);
>   
> -	if (!IS_ERR(i2c->clk))
> -		clk_disable_unprepare(i2c->clk);
> +	clk_disable_unprepare(i2c->clk);
>   	return 0;
>   }
>   
> @@ -780,19 +768,18 @@ static int ocores_i2c_resume(struct device *dev)
>   {
>   	struct ocores_i2c *i2c = dev_get_drvdata(dev);
>   
> -	if (!IS_ERR(i2c->clk)) {
> -		unsigned long rate;
> -		int ret = clk_prepare_enable(i2c->clk);
> +	unsigned long rate;
> +	int ret = clk_prepare_enable(i2c->clk);
>   
> -		if (ret) {
> -			dev_err(dev,
> -				"clk_prepare_enable failed: %d\n", ret);
> -			return ret;
> -		}
> -		rate = clk_get_rate(i2c->clk) / 1000;
> -		if (rate)
> -			i2c->ip_clock_khz = rate;
> +	if (ret) {
> +		dev_err(dev,
> +			"clk_prepare_enable failed: %d\n", ret);
> +		return ret;
>   	}
> +	rate = clk_get_rate(i2c->clk) / 1000;

Now (because of the devm_clk_get_optional_enabled()), i2c->clk can be 
NULL, so this would deference a NULL pointer.

CJ


> +	if (rate)
> +		i2c->ip_clock_khz = rate;
> +
>   	return ocores_init(dev, i2c);
>   }
>   

