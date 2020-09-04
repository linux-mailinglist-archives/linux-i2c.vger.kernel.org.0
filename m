Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 221D625D133
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Sep 2020 08:21:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726445AbgIDGVx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Sep 2020 02:21:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725812AbgIDGVu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Sep 2020 02:21:50 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48C5BC061244
        for <linux-i2c@vger.kernel.org>; Thu,  3 Sep 2020 23:21:50 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id e11so6599188ljn.6
        for <linux-i2c@vger.kernel.org>; Thu, 03 Sep 2020 23:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=CYxJW0pF1s7HMB5ayGaO6wQ5F8XNxtCQnzPUxbzOs7o=;
        b=dqGZcytE4tSAACRbfMYlx5MEJZ0VMf/o6rVBFR+iGIuhR9fVjhMBCNG6MbfyKqAW19
         EVu8tyJSYjmKzpJQEdykpq300FjJke1WMHfrljHUsswJiYxFpMq3elGpr+j8ELluuEIy
         8WAVR/gpPWQ2H99u6R+VubSQ6w4KfcPqIS+EZbY6m3CKjgBRclU4U2wx5teNklQJJe0a
         PGj0oXc5QgwCCVoUHTCMHXsVJFWu4qnDcoZBQkcfQHQkcdkK3lJ9j8oU5Eo8I1+pR0Xl
         2bbj1etsUF20nPY+zgvCMJvf4sFbSokNq59b2gsew7RP3ZchMeEQvHPr3M5TByb6415U
         0uvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=CYxJW0pF1s7HMB5ayGaO6wQ5F8XNxtCQnzPUxbzOs7o=;
        b=MsfwpWpkNTEZB8CwbfvFMM3c7bwAlfoODH2kWbDEmyxcPj1ApuY44bJDXnpRTCfdUh
         9gPTWh77D37oStUMZ7KCQnbVJTm8cbFaIGR/vuYLV8CHIPt5LxQ+byt0zTvgjPgYpDVA
         s5lcAhFLiXdctxBuBCX19cA2Lt6cZm2i6d53hyD4IXAvYN/QqLunY32Ly8gEA4dsdWz0
         Iys5jb0xIl8F51X6Wn4Iqo6n5+Y4lJ+SAeJ+Y+jaGW7O5aoVZCAbxzC1mpX5Ua6UA5ka
         7H/PARHEI8mJzmjOFkBYNhHK+fTiGF+d683ATwwFzkRd1N6jI9N23lbO3gECxm0Xguqf
         SJzw==
X-Gm-Message-State: AOAM531dNQ4u5nQQFt5k9Mb08ReKR9cxdXo4s8O7sJ5l1sjepJ1progI
        V7I3duuR6uScGr/FNVx9ZgQOBA==
X-Google-Smtp-Source: ABdhPJx46NQTga8EfudNzzsfS5KRYyflh7DXL9qXZUsGJZUFW1v9dluV9C7NWsEuGBXSjlwlG6Zwag==
X-Received: by 2002:a2e:98cf:: with SMTP id s15mr3308391ljj.446.1599200508584;
        Thu, 03 Sep 2020 23:21:48 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id j12sm1099242lfj.5.2020.09.03.23.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2020 23:21:47 -0700 (PDT)
Date:   Fri, 4 Sep 2020 08:21:47 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] i2c: rcar: in slave mode, clear NACK earlier
Message-ID: <20200904062147.GG1498632@oden.dyn.berto.se>
References: <20200817121930.4474-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200817121930.4474-1-wsa+renesas@sang-engineering.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

Thanks for your work.

On 2020-08-17 14:19:30 +0200, Wolfram Sang wrote:
> Currently, a NACK in slave mode is set/cleared when SCL is held low by
> the IP core right before the bit is about to be pushed out. This is too
> late for clearing and then a NACK from the previous byte is still used
> for the current one. Now, let's clear the NACK right after we detected
> the STOP condition following the NACK.
> 
> Fixes: de20d1857dd6 ("i2c: rcar: add slave support")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/i2c/busses/i2c-rcar.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
> index 284dc3edb9a1..0f73f0681a6e 100644
> --- a/drivers/i2c/busses/i2c-rcar.c
> +++ b/drivers/i2c/busses/i2c-rcar.c
> @@ -594,6 +594,7 @@ static bool rcar_i2c_slave_irq(struct rcar_i2c_priv *priv)
>  	/* master sent stop */
>  	if (ssr_filtered & SSR) {
>  		i2c_slave_event(priv->slave, I2C_SLAVE_STOP, &value);
> +		rcar_i2c_write(priv, ICSCR, SIE | SDBS); /* clear our NACK */
>  		rcar_i2c_write(priv, ICSIER, SAR);
>  		rcar_i2c_write(priv, ICSSR, ~SSR & 0xff);
>  	}
> -- 
> 2.20.1
> 

-- 
Regards,
Niklas Söderlund
