Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9F156E4DAD
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Apr 2023 17:51:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbjDQPvk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 Apr 2023 11:51:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230271AbjDQPvi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 17 Apr 2023 11:51:38 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81FF1BB91;
        Mon, 17 Apr 2023 08:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=CYyscmGBC4mYVGmDv6c0LLO+AyzNR42VKtZ/DKJovxo=; b=yttVPMnYT1cVdXkijO8VTM6Mmv
        yjCsLNc0U6UdgM9nsLaR/eo4+h6O+vOYeCHlRPYQvTBvejSELu/0BP6syoaONmSOixdJpY6VF7X2y
        6YBJanNDZ7dYy3cmgB+NYlhYjSbGzAmGXSGCRtPL1WtG7pWk0KmzSstllimkZ6K634VA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1poR7D-00AWHf-AO; Mon, 17 Apr 2023 17:50:03 +0200
Date:   Mon, 17 Apr 2023 17:50:03 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Wang Zhang <silver_code@hust.edu.cn>
Cc:     Peter Korsgaard <peter@korsgaard.com>,
        hust-os-kernel-patches@googlegroups.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: ocores: use devm_ managed clks
Message-ID: <fc8ed989-68e6-4fd4-a818-ae077bf5e6aa@lunn.ch>
References: <843fab4d-0fdd-4610-91ed-1d8e9accbd25@lunn.ch>
 <20230417140531.81853-1-silver_code@hust.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230417140531.81853-1-silver_code@hust.edu.cn>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

>  drivers/i2c/busses/i2c-ocores.c | 62 +++++++++++++--------------------
>  1 file changed, 24 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-ocores.c b/drivers/i2c/busses/i2c-ocores.c
> index a0af027db04c..1dcb1af1ad13 100644
> --- a/drivers/i2c/busses/i2c-ocores.c
> +++ b/drivers/i2c/busses/i2c-ocores.c
> @@ -549,28 +549,24 @@ static int ocores_i2c_of_probe(struct platform_device *pdev,
>  							&clock_frequency);
>  	i2c->bus_clock_khz = 100;
>  
> -	i2c->clk = devm_clk_get(&pdev->dev, NULL);
> +	i2c->clk = devm_clk_get_enabled(&pdev->dev, NULL);
>  
> -	if (!IS_ERR(i2c->clk)) {
> -		int ret = clk_prepare_enable(i2c->clk);
> -
> -		if (ret) {
> -			dev_err(&pdev->dev,
> -				"clk_prepare_enable failed: %d\n", ret);
> -			return ret;
> -		}
> -		i2c->ip_clock_khz = clk_get_rate(i2c->clk) / 1000;
> -		if (clock_frequency_present)
> -			i2c->bus_clock_khz = clock_frequency / 1000;
> +	if (IS_ERR(i2c->clk)) {
> +		dev_err(&pdev->dev,
> +			"devm_clk_get_enabled failed\n");
> +		return PTR_ERR(i2c->clk);

I think this is wrong. The old code would not return an error if
devm_clk_get() failed, e.g because the clock does not exist in
DT. i2c->bus_clock_khz would default to 100, and it keeps going.  Now,
it appears you have turned the missing clock into a fatal error.

devm_clk_get_optional_enabled() seems to do what you want.

	Andrew
