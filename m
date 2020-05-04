Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 569DB1C39A0
	for <lists+linux-i2c@lfdr.de>; Mon,  4 May 2020 14:42:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727906AbgEDMm6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 4 May 2020 08:42:58 -0400
Received: from mga02.intel.com ([134.134.136.20]:61499 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727103AbgEDMm6 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 4 May 2020 08:42:58 -0400
IronPort-SDR: UEOS+CMm56Yg/50P4f3Vq1bMlZQzt7ljnJRNl/nSOjyVW6jWfCnDGiVfQ8hJgOU52Dqo5XEiED
 og4+Tq1Kz99A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2020 05:42:57 -0700
IronPort-SDR: GZ5CLlJqOXi5gp7wS+11Ftok3l7QEB8bkkbjg3l7se4ElhXZSXh++4QMLGzklhBtp32cu/PIvn
 OvjiMVJc5Dfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,352,1583222400"; 
   d="scan'208";a="338307544"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001.jf.intel.com with ESMTP; 04 May 2020 05:42:54 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jVaQy-004cHK-N9; Mon, 04 May 2020 15:42:56 +0300
Date:   Mon, 4 May 2020 15:42:56 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Aishwarya Ramakrishnan <aishwaryarj100@gmail.com>
Cc:     Thor Thayer <thor.thayer@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Baruch Siach <baruch@tkos.co.il>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] i2c: drivers: Remove superfluous error message
Message-ID: <20200504124256.GF185537@smile.fi.intel.com>
References: <20200503120847.13528-1-aishwaryarj100@gmail.com>
 <20200504114408.9128-1-aishwaryarj100@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200504114408.9128-1-aishwaryarj100@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, May 04, 2020 at 05:14:06PM +0530, Aishwarya Ramakrishnan wrote:
> The function platform_get_irq can log an error by itself.
> This omit a redundant message for exception handling in the
> calling function.

FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>


> Suggested by Coccinelle.

Compile tested only, right?

> 
> Signed-off-by: Aishwarya Ramakrishnan <aishwaryarj100@gmail.com>
> ---
>  drivers/i2c/busses/i2c-altera.c   | 4 +---
>  drivers/i2c/busses/i2c-cht-wc.c   | 4 +---
>  drivers/i2c/busses/i2c-img-scb.c  | 4 +---
>  drivers/i2c/busses/i2c-lpc2k.c    | 4 +---
>  drivers/i2c/busses/i2c-uniphier.c | 4 +---
>  5 files changed, 5 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-altera.c b/drivers/i2c/busses/i2c-altera.c
> index f5c00f903df3..af6985f0ae63 100644
> --- a/drivers/i2c/busses/i2c-altera.c
> +++ b/drivers/i2c/busses/i2c-altera.c
> @@ -395,10 +395,8 @@ static int altr_i2c_probe(struct platform_device *pdev)
>  		return PTR_ERR(idev->base);
>  
>  	irq = platform_get_irq(pdev, 0);
> -	if (irq < 0) {
> -		dev_err(&pdev->dev, "missing interrupt resource\n");
> +	if (irq < 0)
>  		return irq;
> -	}
>  
>  	idev->i2c_clk = devm_clk_get(&pdev->dev, NULL);
>  	if (IS_ERR(idev->i2c_clk)) {
> diff --git a/drivers/i2c/busses/i2c-cht-wc.c b/drivers/i2c/busses/i2c-cht-wc.c
> index 35e55feda763..343ae5754e6e 100644
> --- a/drivers/i2c/busses/i2c-cht-wc.c
> +++ b/drivers/i2c/busses/i2c-cht-wc.c
> @@ -314,10 +314,8 @@ static int cht_wc_i2c_adap_i2c_probe(struct platform_device *pdev)
>  	int ret, reg, irq;
>  
>  	irq = platform_get_irq(pdev, 0);
> -	if (irq < 0) {
> -		dev_err(&pdev->dev, "Error missing irq resource\n");
> +	if (irq < 0)
>  		return -EINVAL;
> -	}
>  
>  	adap = devm_kzalloc(&pdev->dev, sizeof(*adap), GFP_KERNEL);
>  	if (!adap)
> diff --git a/drivers/i2c/busses/i2c-img-scb.c b/drivers/i2c/busses/i2c-img-scb.c
> index 422097a31c95..2f6de763816a 100644
> --- a/drivers/i2c/busses/i2c-img-scb.c
> +++ b/drivers/i2c/busses/i2c-img-scb.c
> @@ -1344,10 +1344,8 @@ static int img_i2c_probe(struct platform_device *pdev)
>  		return PTR_ERR(i2c->base);
>  
>  	irq = platform_get_irq(pdev, 0);
> -	if (irq < 0) {
> -		dev_err(&pdev->dev, "can't get irq number\n");
> +	if (irq < 0)
>  		return irq;
> -	}
>  
>  	i2c->sys_clk = devm_clk_get(&pdev->dev, "sys");
>  	if (IS_ERR(i2c->sys_clk)) {
> diff --git a/drivers/i2c/busses/i2c-lpc2k.c b/drivers/i2c/busses/i2c-lpc2k.c
> index 13b0c12e2dba..43dc9b7043e4 100644
> --- a/drivers/i2c/busses/i2c-lpc2k.c
> +++ b/drivers/i2c/busses/i2c-lpc2k.c
> @@ -362,10 +362,8 @@ static int i2c_lpc2k_probe(struct platform_device *pdev)
>  		return PTR_ERR(i2c->base);
>  
>  	i2c->irq = platform_get_irq(pdev, 0);
> -	if (i2c->irq < 0) {
> -		dev_err(&pdev->dev, "can't get interrupt resource\n");
> +	if (i2c->irq < 0)
>  		return i2c->irq;
> -	}
>  
>  	init_waitqueue_head(&i2c->wait);
>  
> diff --git a/drivers/i2c/busses/i2c-uniphier.c b/drivers/i2c/busses/i2c-uniphier.c
> index 668b1fa2b0ef..ee00a44bf4c7 100644
> --- a/drivers/i2c/busses/i2c-uniphier.c
> +++ b/drivers/i2c/busses/i2c-uniphier.c
> @@ -324,10 +324,8 @@ static int uniphier_i2c_probe(struct platform_device *pdev)
>  		return PTR_ERR(priv->membase);
>  
>  	irq = platform_get_irq(pdev, 0);
> -	if (irq < 0) {
> -		dev_err(dev, "failed to get IRQ number\n");
> +	if (irq < 0)
>  		return irq;
> -	}
>  
>  	if (of_property_read_u32(dev->of_node, "clock-frequency", &bus_speed))
>  		bus_speed = I2C_MAX_STANDARD_MODE_FREQ;
> -- 
> 2.17.1
> 

-- 
With Best Regards,
Andy Shevchenko


