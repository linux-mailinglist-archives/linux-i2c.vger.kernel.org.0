Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D82C14AE5
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2019 15:29:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725853AbfEFN3d (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 May 2019 09:29:33 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:55766 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725852AbfEFN3d (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 6 May 2019 09:29:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=iqK/8epn5ls+IZG0UVMrU/nhCwJXFn7xBX1PC/hdTw8=; b=Xi4GnazFzWujEyL0+B6GoxfPXw
        yypf4DnisTvFQyII2YxI8Dq+6W1uRpKc+dxsYsBsa+Dpv2j+og2+nHKl5eyc96I8rPF6SecgNg+qv
        dnTngDKXOw4HfSo1EdOyX4oJ89lR64yLS2wQ4mZE13dQi9ckbzmSoJ8oR4rkGq2lWWRs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.89)
        (envelope-from <andrew@lunn.ch>)
        id 1hNdgK-00051K-MA; Mon, 06 May 2019 15:29:24 +0200
Date:   Mon, 6 May 2019 15:29:24 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Sagar Shrikant Kadam <sagar.kadam@sifive.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, palmer@sifive.com,
        paul.walmsley@sifive.com, peter@korsgaard.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 v1 3/3] i2c-ocores: sifive: add polling mode
 workaround for FU540-C000 SoC.
Message-ID: <20190506132924.GD15291@lunn.ch>
References: <1557147240-29551-1-git-send-email-sagar.kadam@sifive.com>
 <1557147240-29551-4-git-send-email-sagar.kadam@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1557147240-29551-4-git-send-email-sagar.kadam@sifive.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

>  /*
>   * 'process_lock' exists because ocores_process() and ocores_process_timeout()
> @@ -239,8 +240,13 @@ static irqreturn_t ocores_isr(int irq, void *dev_id)
>  	struct ocores_i2c *i2c = dev_id;
>  	u8 stat = oc_getreg(i2c, OCI2C_STATUS);
>  
> -	if (!(stat & OCI2C_STAT_IF))
> +	if (i2c->flags && SIFIVE_FLAG_POLL) {

Do you really want && here?

> +		if (stat & OCI2C_STAT_IF)
> +			if (!(stat & OCI2C_STAT_BUSY))
> +				return IRQ_NONE;
> +	} else if (!(stat & OCI2C_STAT_IF)) {
>  		return IRQ_NONE;
> +	}
>  
>  	ocores_process(i2c, stat);
>  
> @@ -356,6 +362,11 @@ static void ocores_process_polling(struct ocores_i2c *i2c)
>  		ret = ocores_isr(-1, i2c);
>  		if (ret == IRQ_NONE)
>  			break; /* all messages have been transferred */
> +		else {
> +			if (i2c->flags && SIFIVE_FLAG_POLL)

And here?

> +				if (i2c->state == STATE_DONE)
> +					break;
> +		}
>  	}
>  }
>  
> @@ -406,7 +417,7 @@ static int ocores_xfer(struct i2c_adapter *adap,
>  {
>  	struct ocores_i2c *i2c = i2c_get_adapdata(adap);
>  
> -	if (i2c->flags & OCORES_FLAG_POLL)
> +	if ((i2c->flags & OCORES_FLAG_POLL) || (i2c->flags & SIFIVE_FLAG_POLL))

You can combine this

if ((i2c->flags & (OCORES_FLAG_POLL | SIFIVE_FLAG_POLL))

>  		return ocores_xfer_polling(adap, msgs, num);
>  	return ocores_xfer_core(i2c, msgs, num, false);
>  }
> @@ -597,6 +608,7 @@ static int ocores_i2c_probe(struct platform_device *pdev)
>  {
>  	struct ocores_i2c *i2c;
>  	struct ocores_i2c_platform_data *pdata;
> +	const struct of_device_id *match;
>  	struct resource *res;
>  	int irq;
>  	int ret;
> @@ -678,13 +690,21 @@ static int ocores_i2c_probe(struct platform_device *pdev)
>  
>  	irq = platform_get_irq(pdev, 0);
>  	if (irq == -ENXIO) {
> -		i2c->flags |= OCORES_FLAG_POLL;
> +		/*
> +		 * Set a SIFIVE_FLAG_POLL to enable workaround for FU540
> +		 * in polling mode interface of i2c-ocore driver.
> +		 */
> +		match = of_match_node(ocores_i2c_match, pdev->dev.of_node);
> +		if (match && (long)match->data == TYPE_SIFIVE_REV0)
> +			i2c->flags |= SIFIVE_FLAG_POLL;
> +		else
> +			i2c->flags |= OCORES_FLAG_POLL;

Please take a look at the whole code, and consider if it is better to
set both SIFIVE_FLAG_POLL and OCORES_FLAG_POLL. Maybe rename
SIFIVE_FLAG_POLL to OCORES_FLAG_BROKEN_IRQ_BIT?

Thanks
	Andrew
