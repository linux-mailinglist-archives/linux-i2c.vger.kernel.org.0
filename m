Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A7FE412947
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Sep 2021 01:13:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239188AbhITXOh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Sep 2021 19:14:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239352AbhITXMh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 Sep 2021 19:12:37 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F367C0386EC
        for <linux-i2c@vger.kernel.org>; Mon, 20 Sep 2021 10:43:15 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id g41so38330709lfv.1
        for <linux-i2c@vger.kernel.org>; Mon, 20 Sep 2021 10:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=GtuM9YagTHYKrWOhQ1gtwvGsnMjdXnCVKchvfBhnO1w=;
        b=pXQMrZbKgXgWQCDjeJXucFyF1RJmt9Uju0cGcst8oZD0aQBk4ZGbnhnLMwUjG4VrKn
         dZJ2qPL3PFp2Ok/pe7kewEq7esYMy0c0VBXPPE8YMdBMQzJj/0QPHoUDU5l8dwEATmDS
         52B1Heq4UeUdQ57NVIcjejtYbv+Wy7/7EzaWjGGVMx2m/hLmoHHZPG3CoMVTNPPzME3Z
         W+NaqGeThWtpZBuauLRRtBoRSLRZ45Z6mydSgB4UdXDRHQ9JYv0yjHQ2AxSpDnG3Eab5
         BF4vGlfnvGWiugOrpDmbjqk9V50/JYLwhTPa80jfTXjgP4InNs1+gyW6SKQL0v4W8Het
         xqzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=GtuM9YagTHYKrWOhQ1gtwvGsnMjdXnCVKchvfBhnO1w=;
        b=mT8QJvCTZgZWRBIseKyiO+HIu6nAkyWgPLEH5iL2KsIap5g9Wei2wALr2BUQOFbnvw
         2Y+JUgJl3dWJr5l7TeydVpInVvhaa/E9k4cTCfYdlGHCVDK+pC7e1Pr5L5/OqX4IlqA5
         CsTHun5Y5Un/GOXJ/TGSYdKMuGvSez+D6su5lM3NCLeqZ/PgWbEDJLULIEn+OP7T60fh
         VUjhjXM1CgyAU9cRJOhVqeahc4agUK+7JWi7Iq/iSVTEk+58Vf259z4oXeN73aVlygkq
         tHU2p/t4EeNd8J+jUxP/zRMzudiy9YZbhWofYVbbwLik1eJmxTN7TcG+J6/DLR9nRznq
         J3fQ==
X-Gm-Message-State: AOAM533pdOG7V9hR6Fv7Be2ewjwIfeE2ZJIwzR+v097LK4uxxvWcQOC/
        JRbsNmu5+Mw4SVDq1pLwaCJqg4njx2upyQ==
X-Google-Smtp-Source: ABdhPJxn2v1tWHsX+uNuNz2lFdWzXVtq+qfYut8WPdiAdAwNYedW8x+ShjGSvZrTGAlTYLUwH5ox3w==
X-Received: by 2002:a05:651c:1103:: with SMTP id d3mr23610783ljo.445.1632159793268;
        Mon, 20 Sep 2021 10:43:13 -0700 (PDT)
Received: from localhost (h-46-59-88-219.A463.priv.bahnhof.se. [46.59.88.219])
        by smtp.gmail.com with ESMTPSA id b20sm1313543lfc.75.2021.09.20.10.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 10:43:12 -0700 (PDT)
Date:   Mon, 20 Sep 2021 19:43:11 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Ryo Kataoka <ryo.kataoka.wt@renesas.com>
Subject: Re: [PATCH] i2c: rcar: enable interrupts before starting transfer
Message-ID: <YUjIL5ac5wcI7gtd@oden.dyn.berto.se>
References: <20210915134827.13043-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210915134827.13043-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

Thanks for your patch.

On 2021-09-15 15:48:27 +0200, Wolfram Sang wrote:
> We want to enable the interrupts _before_ starting the transfer because
> it is good programming style and also the proposed order in the R-Car
> manual. There is no difference in practice because it doesn't matter in
> which order both conditions appear if we wait for both to happen.
> 
> Signed-off-by: Ryo Kataoka <ryo.kataoka.wt@renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/i2c/busses/i2c-rcar.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
> index bff9913c37b8..fc13511f4562 100644
> --- a/drivers/i2c/busses/i2c-rcar.c
> +++ b/drivers/i2c/busses/i2c-rcar.c
> @@ -339,6 +339,9 @@ static void rcar_i2c_prepare_msg(struct rcar_i2c_priv *priv)
>  		priv->flags |= ID_LAST_MSG;
>  
>  	rcar_i2c_write(priv, ICMAR, i2c_8bit_addr_from_msg(priv->msg));
> +	if (!priv->atomic_xfer)
> +		rcar_i2c_write(priv, ICMIER, read ? RCAR_IRQ_RECV : RCAR_IRQ_SEND);
> +
>  	/*
>  	 * We don't have a test case but the HW engineers say that the write order
>  	 * of ICMSR and ICMCR depends on whether we issue START or REP_START. Since
> @@ -354,9 +357,6 @@ static void rcar_i2c_prepare_msg(struct rcar_i2c_priv *priv)
>  			rcar_i2c_write(priv, ICMCR, RCAR_BUS_PHASE_START);
>  		rcar_i2c_write(priv, ICMSR, 0);
>  	}
> -
> -	if (!priv->atomic_xfer)
> -		rcar_i2c_write(priv, ICMIER, read ? RCAR_IRQ_RECV : RCAR_IRQ_SEND);
>  }
>  
>  static void rcar_i2c_next_msg(struct rcar_i2c_priv *priv)
> -- 
> 2.30.2
> 

-- 
Regards,
Niklas Söderlund
