Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2283686CBB
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Aug 2019 23:51:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390151AbfHHVvn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Aug 2019 17:51:43 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:34773 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732427AbfHHVvm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Aug 2019 17:51:42 -0400
Received: by mail-lf1-f66.google.com with SMTP id b29so60722315lfq.1
        for <linux-i2c@vger.kernel.org>; Thu, 08 Aug 2019 14:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=P0rrH2BWMKW5O9VTFHxzuVcjyweSvJszS1HVAGYuYnM=;
        b=Rp8bwTseZrBM2NBOVj3dUOO4HK8QtM9QWfnntfdPqFDDiNTSgpFomAeO1FghEBr4Hc
         9mGPFvOpM0EivBGeWAC093oFRIXKvB4dOg0891mdVWcq5uCpL8Ihr8jR8S2vwBFezKaN
         IWQW7/nidS2Z5N1bPegGEOBu2psBGFDW+taeP/VVv7yznrcdxT633He3tTylP8DihRIh
         DXK4Wl0ya71tRSLLtHAkumFINDnWyKi0kpnEeCk6zRfGdkZud0uJ8fyonUa1C4IoilEn
         6M5oyk6KDNDO0rY1PwDrg3NNcv7uMhkZDMwsTis5046RqrnjEdAz7doJOrcj8jC87EWa
         ohZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=P0rrH2BWMKW5O9VTFHxzuVcjyweSvJszS1HVAGYuYnM=;
        b=Ps6O8ngY/g5NXND9ziOfMxqIV03hjiJLR9Uay2sWI2jLELkOcji+WW9nusqV1W8uQU
         OrkkYs40ltgXGGxg6xUNs/bMvM152HL6xRRvVrKlEUH71nswSlRpmOhhZ/CtZBTffH4o
         ZkVn8pQuLbfswDOf32DeckDncVgw7sj0I7DO2Z7KGRzA0Fc6fesyRdseutycY+SvFDBk
         XluoLE7+gFjIFQIMd6GDIXtyhmJ0KOCdqQ7Zd7aXVtRYK0zMPIhwN3yrcq85kKQE9yVn
         i5PSPW37F5CjHAscANrpW/D+9lEOTrwyDiSD2Fcx6am9HuxGbAJSOJlCmvJUDwofp4lH
         9rOQ==
X-Gm-Message-State: APjAAAXfT7WonzucjzJvW8p+P0lzt9/EkeF8V8pjR4eshUFUwtNFTpMy
        28F37UBWg1dN2220ZCBm6HxwJg==
X-Google-Smtp-Source: APXvYqyQQoDxTPFK93mVfzUb3NdTLirspZGjUqe2G4hpuQc7DkPsiGPpBRP4YCrt59gluUesvUb3jQ==
X-Received: by 2002:a19:be03:: with SMTP id o3mr10549132lff.88.1565301100609;
        Thu, 08 Aug 2019 14:51:40 -0700 (PDT)
Received: from localhost (customer-145-14-112-32.stosn.net. [145.14.112.32])
        by smtp.gmail.com with ESMTPSA id m25sm17096782lfc.83.2019.08.08.14.51.39
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 08 Aug 2019 14:51:39 -0700 (PDT)
Date:   Thu, 8 Aug 2019 23:51:39 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Krzysztof Adamski <krzysztof.adamski@nokia.com>
Subject: Re: [PATCH RFT] i2c: emev2: avoid race when unregistering slave
 client
Message-ID: <20190808215139.GA2952@bigcity.dyn.berto.se>
References: <20190808195417.13482-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190808195417.13482-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On 2019-08-08 21:54:17 +0200, Wolfram Sang wrote:
> After we disabled interrupts, there might still be an active one
> running. Sync before clearing the pointer to the slave device.
> 
> Fixes: c31d0a00021d ("i2c: emev2: add slave support")
> Reported-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Not tested on hardware yet. If someone has the board set up, testing if
> standard I2C communication works would be nice. That would mean irq
> setup did not regress. The actual race is more complicated to trigger.
> If noone has the board, I will fetch it from my repository. It is packed
> away currently.

I do have the hardware but similar situation as you, packed away in its 
box. But the box is also packed in a larger box as I'm preparing for the 
move. I'm not sure in what box I put the box in, and I'm not super keen 
to look thru all of them before I unpack them on the other end.

> 
>  drivers/i2c/busses/i2c-emev2.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-emev2.c b/drivers/i2c/busses/i2c-emev2.c
> index 35b302d983e0..959d4912ec0d 100644
> --- a/drivers/i2c/busses/i2c-emev2.c
> +++ b/drivers/i2c/busses/i2c-emev2.c
> @@ -69,6 +69,7 @@ struct em_i2c_device {
>  	struct completion msg_done;
>  	struct clk *sclk;
>  	struct i2c_client *slave;
> +	int irq;
>  };
>  
>  static inline void em_clear_set_bit(struct em_i2c_device *priv, u8 clear, u8 set, u8 reg)
> @@ -339,6 +340,12 @@ static int em_i2c_unreg_slave(struct i2c_client *slave)
>  
>  	writeb(0, priv->base + I2C_OFS_SVA0);
>  
> +	/*
> +	 * Wait for interrupt to finish. New slave irqs cannot happen because we
> +	 * cleared the slave address and, thus, only extension codes will be
> +	 * detected which do not use the slave ptr.
> +	 */
> +	synchronize_irq(priv->irq);
>  	priv->slave = NULL;
>  
>  	return 0;
> @@ -355,7 +362,7 @@ static int em_i2c_probe(struct platform_device *pdev)
>  {
>  	struct em_i2c_device *priv;
>  	struct resource *r;
> -	int irq, ret;
> +	int ret;
>  
>  	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
>  	if (!priv)
> @@ -390,8 +397,8 @@ static int em_i2c_probe(struct platform_device *pdev)
>  
>  	em_i2c_reset(&priv->adap);
>  
> -	irq = platform_get_irq(pdev, 0);
> -	ret = devm_request_irq(&pdev->dev, irq, em_i2c_irq_handler, 0,
> +	priv->irq = platform_get_irq(pdev, 0);
> +	ret = devm_request_irq(&pdev->dev, priv->irq, em_i2c_irq_handler, 0,
>  				"em_i2c", priv);
>  	if (ret)
>  		goto err_clk;
> @@ -401,7 +408,8 @@ static int em_i2c_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_clk;
>  
> -	dev_info(&pdev->dev, "Added i2c controller %d, irq %d\n", priv->adap.nr, irq);
> +	dev_info(&pdev->dev, "Added i2c controller %d, irq %d\n", priv->adap.nr,
> +		 priv->irq);
>  
>  	return 0;
>  
> -- 
> 2.20.1
> 

-- 
Regards,
Niklas Söderlund
