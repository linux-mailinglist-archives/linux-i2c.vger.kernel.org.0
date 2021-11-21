Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F21CD4585BA
	for <lists+linux-i2c@lfdr.de>; Sun, 21 Nov 2021 19:01:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238318AbhKUSEF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 21 Nov 2021 13:04:05 -0500
Received: from gloria.sntech.de ([185.11.138.130]:37666 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238020AbhKUSEE (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 21 Nov 2021 13:04:04 -0500
Received: from ip5f5a6e92.dynamic.kabel-deutschland.de ([95.90.110.146] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1mor96-0007x2-7a; Sun, 21 Nov 2021 19:00:56 +0100
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     linux-i2c@vger.kernel.org, John Keeping <john@metanate.com>
Cc:     John Keeping <john@metanate.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: rk3x: enable clock before getting rate
Date:   Sun, 21 Nov 2021 19:00:55 +0100
Message-ID: <1738891.e3IbIVKTtj@diego>
In-Reply-To: <20211004131539.1253195-1-john@metanate.com>
References: <20211004131539.1253195-1-john@metanate.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Am Montag, 4. Oktober 2021, 15:15:39 CET schrieb John Keeping:
> clk_get_rate() is documented as requiring the clock to be enabled.
> Ensure that the bus clock is enabled before calling clk_get_rate() in
> rk3x_i2c_probe() to satisfy this requirement.
> 
> Signed-off-by: John Keeping <john@metanate.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

Do you maybe want to repost and include the actual i2c-maintainers
in the recipient list?


Heiko

> ---
>  drivers/i2c/busses/i2c-rk3x.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-rk3x.c b/drivers/i2c/busses/i2c-rk3x.c
> index 819ab4ee517e..332755fab2a1 100644
> --- a/drivers/i2c/busses/i2c-rk3x.c
> +++ b/drivers/i2c/busses/i2c-rk3x.c
> @@ -1338,8 +1338,15 @@ static int rk3x_i2c_probe(struct platform_device *pdev)
>  		goto err_pclk;
>  	}
>  
> +	ret = clk_enable(i2c->clk);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "Can't enable bus clk: %d\n", ret);
> +		goto err_clk_notifier;
> +	}
> +
>  	clk_rate = clk_get_rate(i2c->clk);
>  	rk3x_i2c_adapt_div(i2c, clk_rate);
> +	clk_disable(i2c->clk);
>  
>  	ret = i2c_add_adapter(&i2c->adap);
>  	if (ret < 0)
> 




