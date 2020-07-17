Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 877FA2243F1
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Jul 2020 21:13:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728332AbgGQTL5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Jul 2020 15:11:57 -0400
Received: from gloria.sntech.de ([185.11.138.130]:58900 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727978AbgGQTL5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 17 Jul 2020 15:11:57 -0400
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1jwVlw-0008Ng-WB; Fri, 17 Jul 2020 21:11:53 +0200
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     Dejin Zheng <zhengdejin5@gmail.com>
Cc:     corbet@lwn.net, gregkh@linuxfoundation.org, rafael@kernel.org,
        f.fainelli@gmail.com, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Michal Simek <michal.simek@xilinx.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 2/2] i2c: busses: convert to devm_platform_request_irq()
Date:   Fri, 17 Jul 2020 21:11:52 +0200
Message-ID: <3228833.Xz71LAOI96@diego>
In-Reply-To: <20200717161158.11516-1-zhengdejin5@gmail.com>
References: <20200717161158.11516-1-zhengdejin5@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Am Freitag, 17. Juli 2020, 18:11:58 CEST schrieb Dejin Zheng:
> Use devm_platform_request_irq() to simplify code, and it contains
> platform_get_irq() and devm_request_irq().
> 
> Cc: Michal Simek <michal.simek@xilinx.com>
> Cc: Wolfram Sang <wsa@the-dreams.de>
> Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Acked-by: Michal Simek <michal.simek@xilinx.com>


Rockchip part (i2c-rk3x):
Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> diff --git a/drivers/i2c/busses/i2c-rk3x.c b/drivers/i2c/busses/i2c-rk3x.c
> index 8e3cc85d1921..1f0ac69c5774 100644
> --- a/drivers/i2c/busses/i2c-rk3x.c
> +++ b/drivers/i2c/busses/i2c-rk3x.c
> @@ -1227,7 +1227,6 @@ static int rk3x_i2c_probe(struct platform_device *pdev)
>  	int ret = 0;
>  	int bus_nr;
>  	u32 value;
> -	int irq;
>  	unsigned long clk_rate;
>  
>  	i2c = devm_kzalloc(&pdev->dev, sizeof(struct rk3x_i2c), GFP_KERNEL);
> @@ -1289,17 +1288,10 @@ static int rk3x_i2c_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> -	/* IRQ setup */
> -	irq = platform_get_irq(pdev, 0);
> -	if (irq < 0)
> -		return irq;
> -
> -	ret = devm_request_irq(&pdev->dev, irq, rk3x_i2c_irq,
> -			       0, dev_name(&pdev->dev), i2c);
> -	if (ret < 0) {
> -		dev_err(&pdev->dev, "cannot request IRQ\n");
> +	ret = devm_platform_request_irq(pdev, 0, NULL, rk3x_i2c_irq,
> +					0, dev_name(&pdev->dev), i2c);
> +	if (ret < 0)
>  		return ret;
> -	}
>  
>  	platform_set_drvdata(pdev, i2c);
>  




