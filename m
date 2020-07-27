Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4AA822EA80
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Jul 2020 12:55:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728368AbgG0Kzm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Jul 2020 06:55:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728366AbgG0Kzm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Jul 2020 06:55:42 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A975EC0619D2
        for <linux-i2c@vger.kernel.org>; Mon, 27 Jul 2020 03:55:41 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id d2so3121980lfj.1
        for <linux-i2c@vger.kernel.org>; Mon, 27 Jul 2020 03:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=7/SExKZecnjZqSi2qz4VmAE6GbnnRQ1sm5QQOY2gXc4=;
        b=az11H7s0oXw1xGc2jeT/u0i2EcL1R6CHoIpEqux+FocKZQ5ZIouJS/dYLYW6THxsKg
         u89Qw0ahnHzjrv5B322VaB5FkbIyFuMFeAHlZusuBOg4EBNAwtoGLo7bqqPHLIgMLNfv
         yurAI4Yk5ZMgO6YQi0mMCmRbxT6XJn1S3Ql3vwQAQNsprtLjpFp16k4o/syDMoepsb+P
         vcl/j7nH9KZ97cF9xZEq0S/B/O0vqL1hklAJZ1TgOGBlZ28eJXmFUlsaTACT8Nd+jVVp
         GE+1BdzX5nsJe5k6tO6lWqabWe2z64EmPyj6TfXFlXxNAvoprqhoMAgcjAqfDE3cxnRX
         ARUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=7/SExKZecnjZqSi2qz4VmAE6GbnnRQ1sm5QQOY2gXc4=;
        b=Cn/5NUrr/rt+hb6rQED95o1rR/bQTeoMBP3AFJwWxvcCcrb7FPijxfTAnnQuUIgIly
         3RJ8pAeVDD1M6pP5xPwJiNWkieta3MajRbQqbE2BXntrNmbMdP8GmiaSKDi5+F20vizv
         x5EdIQxX3FwnEsxbvPkqXCuWpqBd6WtL9c12BAeJV4hzenr63uhsOyAmMz3o1mMtXDYQ
         yD5RhphiB5t34J5sF16S86nAfFfEW4EZkmxZqimXHOiGOFNfVy9RlaMMEnkOQL81GFui
         82u98jXJxElhNXJ3VWoz0ZJTUC/U+MSrlU8xegQ+AD5cZxudnAeLelF5kGurNn7G1bB7
         FpDw==
X-Gm-Message-State: AOAM530VgvkgXBx7vkM/HNEB9GMufSCSI2Z9nEHG6u8IsGRbWih747/l
        N0YmYLQm+7FrFNRDxghOSsVqcQ==
X-Google-Smtp-Source: ABdhPJxYujLFWt3n5OHiAcDThuGETPy6Jp0HzBjxS+aFJCeOhwT1PJUJtGTOaf1P3fHqe3HnzvEvWg==
X-Received: by 2002:a19:ef0d:: with SMTP id n13mr11442871lfh.102.1595847340139;
        Mon, 27 Jul 2020 03:55:40 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id m142sm563157lfa.47.2020.07.27.03.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 03:55:39 -0700 (PDT)
Date:   Mon, 27 Jul 2020 12:55:38 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Ray Jui <ray.jui@broadcom.com>,
        Scott Branden <scott.branden@broadcom.com>,
        Dhananjay Phadke <dphadke@linux.microsoft.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
Subject: Re: [PATCH] i2c: rcar: avoid race when unregistering slave
Message-ID: <20200727105538.GI2729799@oden.dyn.berto.se>
References: <20200726161606.15315-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200726161606.15315-1-wsa+renesas@sang-engineering.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

Thanks for your patch.

On 2020-07-26 18:16:06 +0200, Wolfram Sang wrote:
> Due to the lockless design of the driver, it is theoretically possible
> to access a NULL pointer, if a slave interrupt was running while we were
> unregistering the slave. To make this rock solid, disable the interrupt
> for a short time while we are clearing the interrupt_enable register.
> This patch is purely based on code inspection. The OOPS is super-hard to
> trigger because clearing SAR (the address) makes interrupts even more
> unlikely to happen as well. While here, reinit SCR to SDBS because this
> bit should always be set according to documentation. There is no effect,
> though, because the interface is disabled.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> 
> Some people on CC here which encountered the same issue with the
> bcm-iproc driver. Does something like this work for you, too?
> 
>  drivers/i2c/busses/i2c-rcar.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
> index 8dd35522d95a..0f73f0681a6e 100644
> --- a/drivers/i2c/busses/i2c-rcar.c
> +++ b/drivers/i2c/busses/i2c-rcar.c
> @@ -871,12 +871,14 @@ static int rcar_unreg_slave(struct i2c_client *slave)
>  
>  	WARN_ON(!priv->slave);
>  
> -	/* disable irqs and ensure none is running before clearing ptr */
> +	/* ensure no irq is running before clearing ptr */
> +	disable_irq(priv->irq);
>  	rcar_i2c_write(priv, ICSIER, 0);
> -	rcar_i2c_write(priv, ICSCR, 0);
> +	rcar_i2c_write(priv, ICSSR, 0);
> +	enable_irq(priv->irq);
> +	rcar_i2c_write(priv, ICSCR, SDBS);
>  	rcar_i2c_write(priv, ICSAR, 0); /* Gen2: must be 0 if not using slave */
>  
> -	synchronize_irq(priv->irq);
>  	priv->slave = NULL;
>  
>  	pm_runtime_put(rcar_i2c_priv_to_dev(priv));
> -- 
> 2.20.1
> 

-- 
Regards,
Niklas Söderlund
