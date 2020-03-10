Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10F6C18084C
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Mar 2020 20:42:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727272AbgCJTl7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Mar 2020 15:41:59 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:38397 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726604AbgCJTl6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 Mar 2020 15:41:58 -0400
Received: by mail-pg1-f196.google.com with SMTP id x7so6768819pgh.5
        for <linux-i2c@vger.kernel.org>; Tue, 10 Mar 2020 12:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qsAj2oEClkaTLi4EUL/pEiq1pFyUUCB2KOkTiCcWrMI=;
        b=TlrBvmiHbtSlu1Hjs18OeYpjWZ1zrB7okL5oCaYB80XwQ4lOUJqAoDsj9plYbdkOJv
         cnKnkoc0yUeLU0KTxvgnGf1VX365QNcl4wGdtwvBNsP0NJAlODOxZq4PD94TGZDR9STY
         TC+BxON/e64iSCWN8yy83J6PtkzsLbf+lCMNcM0Fd/1QlsB5uqPQ0ncxazN8Q9hyAZn0
         wS9/nPjF7Ib8vA9c7NMen8ynFsMnNv9mNCedPE+a+Y2bM+jQPZ5eaV6Wf8qMmtTwakQU
         f8yHGMm0S4Q8k5ym53NGCP9RDnbPoIWB0nV3FwVjjr9Ls97pqyJKuCBXsWT1/CFXrl2L
         BlyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qsAj2oEClkaTLi4EUL/pEiq1pFyUUCB2KOkTiCcWrMI=;
        b=HRCk50jmJaaCguq0wYEPV2CktkqBHPJCBEfhbAMOslcJYshMq0trpBEVInQR7oEVv8
         iYwsHayLITYNBJ8F6YWzqsxdSnUIA6Dc8t+ncEcyscng7GrBK7y4ByN5TsOiitv5nIwo
         nP2YPQv8BKeYmz7nslGG9vc5u5Jwe31RCpBlXzeGpDM9fHvrOMiFBxmC3b2BGvWrv/GF
         +zj0BDkIDlr3Pg+iU5mWZbzTYOc/vhyfk8D4sjVIXSbLZdjZdILuhyJ+WuRzcuU7/1Fn
         CA1ByrugchPev7L+aewj0V3Rd5Sek+FfF1vOvWWx3oRvljpGGDb494O+q+cIahZXjkWa
         gTnw==
X-Gm-Message-State: ANhLgQ0PXyuJWHsMH6O69Dm7ne1UrlUVpVqqclLHhi/b9TPxeNvN5Vtv
        VXun5CL2r/otDwIXVsXVS5wYxA==
X-Google-Smtp-Source: ADFU+vvkoZSxbOTDTwZa31Qwg7I5P57vc+BLyjS0Z6dpw69tGObYJH4jz1oKTtg21E58KjZrxJN/jQ==
X-Received: by 2002:a62:6d01:: with SMTP id i1mr22231787pfc.94.1583869317333;
        Tue, 10 Mar 2020 12:41:57 -0700 (PDT)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id x190sm49454544pfb.96.2020.03.10.12.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 12:41:56 -0700 (PDT)
Date:   Tue, 10 Mar 2020 12:41:54 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Alok Chauhan <alokc@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH v2 2/3] i2c: qcom-geni: Grow a dev pointer to simplify
 code
Message-ID: <20200310194154.GN264362@yoga>
References: <20200310154358.39367-1-swboyd@chromium.org>
 <20200310154358.39367-3-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200310154358.39367-3-swboyd@chromium.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue 10 Mar 08:43 PDT 2020, Stephen Boyd wrote:

> Some lines are long here. Use a struct dev pointer to shorten lines and
> simplify code. The clk_get() call can fail because of EPROBE_DEFER
> problems too, so just remove the error print message because it isn't
> useful. Finally, platform_get_irq() already prints an error so just
> remove that error message.
> 
> Cc: Alok Chauhan <alokc@codeaurora.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/i2c/busses/i2c-qcom-geni.c | 57 ++++++++++++++----------------
>  1 file changed, 26 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 4efca130035a..2f5fb2e83f95 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -502,45 +502,40 @@ static int geni_i2c_probe(struct platform_device *pdev)
>  	struct resource *res;
>  	u32 proto, tx_depth;
>  	int ret;
> +	struct device *dev = &pdev->dev;
>  
> -	gi2c = devm_kzalloc(&pdev->dev, sizeof(*gi2c), GFP_KERNEL);
> +	gi2c = devm_kzalloc(dev, sizeof(*gi2c), GFP_KERNEL);
>  	if (!gi2c)
>  		return -ENOMEM;
>  
> -	gi2c->se.dev = &pdev->dev;
> -	gi2c->se.wrapper = dev_get_drvdata(pdev->dev.parent);
> +	gi2c->se.dev = dev;
> +	gi2c->se.wrapper = dev_get_drvdata(dev->parent);
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	gi2c->se.base = devm_ioremap_resource(&pdev->dev, res);
> +	gi2c->se.base = devm_ioremap_resource(dev, res);
>  	if (IS_ERR(gi2c->se.base))
>  		return PTR_ERR(gi2c->se.base);
>  
> -	gi2c->se.clk = devm_clk_get(&pdev->dev, "se");
> -	if (IS_ERR(gi2c->se.clk) && !has_acpi_companion(&pdev->dev)) {
> -		ret = PTR_ERR(gi2c->se.clk);
> -		dev_err(&pdev->dev, "Err getting SE Core clk %d\n", ret);

Afaict this line would still be useful, although it might need the usual
probe deferral exception(?)

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> -		return ret;
> -	}
> +	gi2c->se.clk = devm_clk_get(dev, "se");
> +	if (IS_ERR(gi2c->se.clk) && !has_acpi_companion(dev))
> +		return PTR_ERR(gi2c->se.clk);
>  
> -	ret = device_property_read_u32(&pdev->dev, "clock-frequency",
> -							&gi2c->clk_freq_out);
> +	ret = device_property_read_u32(dev, "clock-frequency",
> +				       &gi2c->clk_freq_out);
>  	if (ret) {
> -		dev_info(&pdev->dev,
> -			"Bus frequency not specified, default to 100kHz.\n");
> +		dev_info(dev, "Bus frequency not specified, default to 100kHz.\n");
>  		gi2c->clk_freq_out = KHZ(100);
>  	}
>  
> -	if (has_acpi_companion(&pdev->dev))
> -		ACPI_COMPANION_SET(&gi2c->adap.dev, ACPI_COMPANION(&pdev->dev));
> +	if (has_acpi_companion(dev))
> +		ACPI_COMPANION_SET(&gi2c->adap.dev, ACPI_COMPANION(dev));
>  
>  	gi2c->irq = platform_get_irq(pdev, 0);
> -	if (gi2c->irq < 0) {
> -		dev_err(&pdev->dev, "IRQ error for i2c-geni\n");
> +	if (gi2c->irq < 0)
>  		return gi2c->irq;
> -	}
>  
>  	ret = geni_i2c_clk_map_idx(gi2c);
>  	if (ret) {
> -		dev_err(&pdev->dev, "Invalid clk frequency %d Hz: %d\n",
> +		dev_err(dev, "Invalid clk frequency %d Hz: %d\n",
>  			gi2c->clk_freq_out, ret);
>  		return ret;
>  	}
> @@ -549,29 +544,29 @@ static int geni_i2c_probe(struct platform_device *pdev)
>  	init_completion(&gi2c->done);
>  	spin_lock_init(&gi2c->lock);
>  	platform_set_drvdata(pdev, gi2c);
> -	ret = devm_request_irq(&pdev->dev, gi2c->irq, geni_i2c_irq, 0,
> -			       dev_name(&pdev->dev), gi2c);
> +	ret = devm_request_irq(dev, gi2c->irq, geni_i2c_irq, 0,
> +			       dev_name(dev), gi2c);
>  	if (ret) {
> -		dev_err(&pdev->dev, "Request_irq failed:%d: err:%d\n",
> +		dev_err(dev, "Request_irq failed:%d: err:%d\n",
>  			gi2c->irq, ret);
>  		return ret;
>  	}
>  	/* Disable the interrupt so that the system can enter low-power mode */
>  	disable_irq(gi2c->irq);
>  	i2c_set_adapdata(&gi2c->adap, gi2c);
> -	gi2c->adap.dev.parent = &pdev->dev;
> -	gi2c->adap.dev.of_node = pdev->dev.of_node;
> +	gi2c->adap.dev.parent = dev;
> +	gi2c->adap.dev.of_node = dev->of_node;
>  	strlcpy(gi2c->adap.name, "Geni-I2C", sizeof(gi2c->adap.name));
>  
>  	ret = geni_se_resources_on(&gi2c->se);
>  	if (ret) {
> -		dev_err(&pdev->dev, "Error turning on resources %d\n", ret);
> +		dev_err(dev, "Error turning on resources %d\n", ret);
>  		return ret;
>  	}
>  	proto = geni_se_read_proto(&gi2c->se);
>  	tx_depth = geni_se_get_tx_fifo_depth(&gi2c->se);
>  	if (proto != GENI_SE_I2C) {
> -		dev_err(&pdev->dev, "Invalid proto %d\n", proto);
> +		dev_err(dev, "Invalid proto %d\n", proto);
>  		geni_se_resources_off(&gi2c->se);
>  		return -ENXIO;
>  	}
> @@ -581,11 +576,11 @@ static int geni_i2c_probe(struct platform_device *pdev)
>  							true, true, true);
>  	ret = geni_se_resources_off(&gi2c->se);
>  	if (ret) {
> -		dev_err(&pdev->dev, "Error turning off resources %d\n", ret);
> +		dev_err(dev, "Error turning off resources %d\n", ret);
>  		return ret;
>  	}
>  
> -	dev_dbg(&pdev->dev, "i2c fifo/se-dma mode. fifo depth:%d\n", tx_depth);
> +	dev_dbg(dev, "i2c fifo/se-dma mode. fifo depth:%d\n", tx_depth);
>  
>  	gi2c->suspended = 1;
>  	pm_runtime_set_suspended(gi2c->se.dev);
> @@ -595,12 +590,12 @@ static int geni_i2c_probe(struct platform_device *pdev)
>  
>  	ret = i2c_add_adapter(&gi2c->adap);
>  	if (ret) {
> -		dev_err(&pdev->dev, "Error adding i2c adapter %d\n", ret);
> +		dev_err(dev, "Error adding i2c adapter %d\n", ret);
>  		pm_runtime_disable(gi2c->se.dev);
>  		return ret;
>  	}
>  
> -	dev_dbg(&pdev->dev, "Geni-I2C adaptor successfully added\n");
> +	dev_dbg(dev, "Geni-I2C adaptor successfully added\n");
>  
>  	return 0;
>  }
> -- 
> Sent by a computer, using git, on the internet
> 
