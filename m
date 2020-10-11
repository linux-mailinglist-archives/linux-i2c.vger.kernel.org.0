Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 693F128A7B1
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Oct 2020 16:09:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387974AbgJKOJ5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 11 Oct 2020 10:09:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387963AbgJKOJ5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 11 Oct 2020 10:09:57 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07719C0613D0
        for <linux-i2c@vger.kernel.org>; Sun, 11 Oct 2020 07:09:57 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id y14so11010999pfp.13
        for <linux-i2c@vger.kernel.org>; Sun, 11 Oct 2020 07:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2E9XTdrHAfZUqvjslXmJY0A7DhqJxtr460qjTU+91kY=;
        b=rNjTBjkwz+MbIKTFKdCIdDRH1DaFfybQie5gGjmzEgrOqp80k4jIFZUgsm8hcbA932
         v7U9yZ9lPF6rEyK1R4M8Wj0kuPCs1U9sbn8EYBjnpj4Jm9LbCC2pKAvkmCzZI1uigpdv
         A7etPkqlwyJr5JQTvU6Ji5pVqnxsYZD5Nbp7M1rVaPBY5dfgWUNtqX94nw/z+9JDuI4k
         XgoKMV0F8xSdPsmKkCxPL/RQqys2dqWCUYqgodTyAqfDN/Ka1nNyEAAsJ8WBasuWjXUe
         /Op8H3lupaUa7c/viBSsxSK6JDqTWdt8FYgzQlZC/r9MptfuURZzKdDiM1eLom4S9N7f
         ELEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2E9XTdrHAfZUqvjslXmJY0A7DhqJxtr460qjTU+91kY=;
        b=cH6JoBVC4HkAg9a6QXygUgV87SNawA76ZIKimLfUPLBWzRVH4tGapJc86mPeQw9uhF
         G+oxxaECEP4Wq2cqxH76lBrBKwN7yfJrxMA1/4JnIYxNDp4cSriQmrCUl72h99GG60iM
         nJYKt+2jfmydrxQRiuj5n2Ns1w1lrkeP/aVUf8I7oijPhFPaPV7iZ9+582K7QGsZBdk4
         qXE+quPnzgtlFSculUfbotOrCkubaDK7RgPOt/86czATk5I2xI7XwLYee1rkXEiYQKie
         3ii9igB7LYeLTg81PLuJgLKjaM7+C8uOp+fmPYMovLBq524CtqYxl6BTK+af3lA+TABp
         GZ0g==
X-Gm-Message-State: AOAM530Pmz3RLj7gDeMcj2lG6tMbC+99n/j8OALnNarcknaAH3OWeKCU
        YdxFZHX3G/sX3koxjV6dsjid
X-Google-Smtp-Source: ABdhPJyXI0tF8lDCqKYKUSLlQfExO7ycqASahIKocXscd1x1LxKbXNxhA3FyHuqn/MEzsmKx44yucQ==
X-Received: by 2002:a62:b417:0:b029:142:2501:35dc with SMTP id h23-20020a62b4170000b0290142250135dcmr19479541pfn.60.1602425396445;
        Sun, 11 Oct 2020 07:09:56 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:28d:c562:841e:ecfd:8468:c018])
        by smtp.gmail.com with ESMTPSA id gi20sm19355467pjb.28.2020.10.11.07.09.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 11 Oct 2020 07:09:55 -0700 (PDT)
Date:   Sun, 11 Oct 2020 19:39:48 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
Cc:     Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
        Wolfram Sang <wsa@kernel.org>, Peter Rosin <peda@axentia.se>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-actions@lists.infradead.org
Subject: Re: [PATCH 1/3] i2c: owl: Clear NACK and BUS error bits
Message-ID: <20201011140948.GC4971@Mani-XPS-13-9360>
References: <cover.1602190168.git.cristian.ciocaltea@gmail.com>
 <6ee573f2904c001ab07e30b386815257c05f6308.1602190168.git.cristian.ciocaltea@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ee573f2904c001ab07e30b386815257c05f6308.1602190168.git.cristian.ciocaltea@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Oct 09, 2020 at 12:44:39AM +0300, Cristian Ciocaltea wrote:
> When the NACK and BUS error bits are set by the hardware, the driver is
> responsible for clearing them by writing "1" into the corresponding
> status registers.
> 
> Hence perform the necessary operations in owl_i2c_interrupt().
> 
> Fixes: d211e62af466 ("i2c: Add Actions Semiconductor Owl family S900 I2C driver")
> Reported-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/i2c/busses/i2c-owl.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-owl.c b/drivers/i2c/busses/i2c-owl.c
> index 672f1f239bd6..a163b8f308c1 100644
> --- a/drivers/i2c/busses/i2c-owl.c
> +++ b/drivers/i2c/busses/i2c-owl.c
> @@ -176,6 +176,9 @@ static irqreturn_t owl_i2c_interrupt(int irq, void *_dev)
>  	fifostat = readl(i2c_dev->base + OWL_I2C_REG_FIFOSTAT);
>  	if (fifostat & OWL_I2C_FIFOSTAT_RNB) {
>  		i2c_dev->err = -ENXIO;
> +		/* Clear NACK error bit by writing "1" */
> +		owl_i2c_update_reg(i2c_dev->base + OWL_I2C_REG_FIFOSTAT,
> +				   OWL_I2C_FIFOSTAT_RNB, true);
>  		goto stop;
>  	}
>  
> @@ -183,6 +186,9 @@ static irqreturn_t owl_i2c_interrupt(int irq, void *_dev)
>  	stat = readl(i2c_dev->base + OWL_I2C_REG_STAT);
>  	if (stat & OWL_I2C_STAT_BEB) {
>  		i2c_dev->err = -EIO;
> +		/* Clear BUS error bit by writing "1" */
> +		owl_i2c_update_reg(i2c_dev->base + OWL_I2C_REG_STAT,
> +				   OWL_I2C_STAT_BEB, true);
>  		goto stop;
>  	}
>  
> -- 
> 2.28.0
> 
