Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80712223C33
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Jul 2020 15:19:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726232AbgGQNTK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Jul 2020 09:19:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726335AbgGQNTH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Jul 2020 09:19:07 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B009C08C5DF
        for <linux-i2c@vger.kernel.org>; Fri, 17 Jul 2020 06:19:07 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id e4so12599255ljn.4
        for <linux-i2c@vger.kernel.org>; Fri, 17 Jul 2020 06:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=npEG3Q8JCnzZnur7Cq6JNk21xogenaqhRA7YjsM9ezY=;
        b=WJr5l5M97ciW2c/gjJQoeEJGmETPzM7Qr5IRBgUn1YBScg98hUkSzHSeJTg3OUPsqN
         2Scj6G4YGWug3QNMtbZFC3QoKcWR/SfrE+ZlfdaUJN+16ebomabpyO890QKs0TfSwssg
         GlwRJGVRacdblC9JpOlqVPmVq4YaiPWGimGKkIvrIMvoClA502INAywjscaO+jMQtYNV
         FrdLzlPp8YBw4RfuDqDeOxlxXRKz4NzqUy+mC4V9pnVDfAFmeYBYR87xX8F1retQgweA
         OtrVCgFfRj6hzdkmswIkViUTlADJQfm9E7KSYC+qLFxp8Njn3jYAupxNP8CkZ765YQba
         sztw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=npEG3Q8JCnzZnur7Cq6JNk21xogenaqhRA7YjsM9ezY=;
        b=ndwVi8EMFtCTXYqXYySuoD53/d573CC27FI4NtoE4WZKjKf8y2vZ8dIguPlxPanvW3
         q/H7Xq/Y32OoPXlDdhpp/OXwL/+TdSSIFbg+YOQMHuclhKamtY4oMwLw2lFmlkU8YxQW
         rXh7B3c+pRcOyiZv08mNUikr3TgLKR6vRyHu34ZEeLxHon31faLT7nyBI/gU9jL83s6m
         VOZ0Bdf6LNIu1mfouGIDELqKzFjKtwHeuexCPc3kdwHhnMrN0uXrfHL7DiFom8GICk1V
         he7G0NhtgbdWzuMN/mJGDkrkw7r67bp70J0CiZDZDV4JgZEk2IbSLclseG3H6OEwuiIR
         ANLw==
X-Gm-Message-State: AOAM530GL1SdE7k19MW1ItceO4F1NL9wAfqE1dSbgBe4J2SoWjUKh0tK
        GjjLlE2M7YU3BP/PQXM7uANthw==
X-Google-Smtp-Source: ABdhPJxEMQOqJH/bssfF2AGyslt8NjbQrH6kwGSmbOflAyOcRsfWYlCaG5NnnWf5rAblr67M877IMw==
X-Received: by 2002:a05:651c:c5:: with SMTP id 5mr4934690ljr.9.1594991945447;
        Fri, 17 Jul 2020 06:19:05 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id y69sm1861534lfa.86.2020.07.17.06.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 06:19:04 -0700 (PDT)
Date:   Fri, 17 Jul 2020 15:19:04 +0200
From:   Niklas <niklas.soderlund@ragnatech.se>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Jens Axboe <axboe@kernel.dk>, Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Mark Brown <broonie@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        devicetree@vger.kernel.org, linux-ide@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-pci@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-renesas-soc@vger.kernel.org, linux-usb@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH 19/20] media: rcar-vin: Enable support for R8A774E1
Message-ID: <20200717131904.GC175137@oden.dyn.berto.se>
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-20-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1594919915-5225-20-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Lad,

Thanks for your work.

On 2020-07-16 18:18:34 +0100, Lad Prabhakar wrote:
> Add the SoC specific information for RZ/G2H (R8A774E1) SoC. Also add
> the routing information between CSI2 and VIN (which is similar to
> R-Car H3 except it lacks CSI41).
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>

I do not have access to the datasheet so I can't verify the routing 
table so I trust it is correct.

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/platform/rcar-vin/rcar-core.c | 40 +++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
> index 7440c8965d27..4fb76d1df308 100644
> --- a/drivers/media/platform/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> @@ -944,6 +944,42 @@ static const struct rvin_info rcar_info_gen2 = {
>  	.max_height = 2048,
>  };
>  
> +static const struct rvin_group_route rcar_info_r8a774e1_routes[] = {
> +	{ .csi = RVIN_CSI40, .channel = 0, .vin = 0, .mask = BIT(0) | BIT(3) },
> +	{ .csi = RVIN_CSI20, .channel = 0, .vin = 0, .mask = BIT(1) | BIT(4) },
> +	{ .csi = RVIN_CSI40, .channel = 1, .vin = 0, .mask = BIT(2) },
> +	{ .csi = RVIN_CSI20, .channel = 0, .vin = 1, .mask = BIT(0) },
> +	{ .csi = RVIN_CSI40, .channel = 1, .vin = 1, .mask = BIT(1) | BIT(3) },
> +	{ .csi = RVIN_CSI40, .channel = 0, .vin = 1, .mask = BIT(2) },
> +	{ .csi = RVIN_CSI20, .channel = 1, .vin = 1, .mask = BIT(4) },
> +	{ .csi = RVIN_CSI20, .channel = 1, .vin = 2, .mask = BIT(0) },
> +	{ .csi = RVIN_CSI40, .channel = 0, .vin = 2, .mask = BIT(1) },
> +	{ .csi = RVIN_CSI20, .channel = 0, .vin = 2, .mask = BIT(2) },
> +	{ .csi = RVIN_CSI40, .channel = 2, .vin = 2, .mask = BIT(3) },
> +	{ .csi = RVIN_CSI20, .channel = 2, .vin = 2, .mask = BIT(4) },
> +	{ .csi = RVIN_CSI40, .channel = 1, .vin = 3, .mask = BIT(0) },
> +	{ .csi = RVIN_CSI20, .channel = 1, .vin = 3, .mask = BIT(1) | BIT(2) },
> +	{ .csi = RVIN_CSI40, .channel = 3, .vin = 3, .mask = BIT(3) },
> +	{ .csi = RVIN_CSI20, .channel = 3, .vin = 3, .mask = BIT(4) },
> +	{ .csi = RVIN_CSI20, .channel = 0, .vin = 4, .mask = BIT(1) | BIT(4) },
> +	{ .csi = RVIN_CSI20, .channel = 0, .vin = 5, .mask = BIT(0) },
> +	{ .csi = RVIN_CSI20, .channel = 1, .vin = 5, .mask = BIT(4) },
> +	{ .csi = RVIN_CSI20, .channel = 1, .vin = 6, .mask = BIT(0) },
> +	{ .csi = RVIN_CSI20, .channel = 0, .vin = 6, .mask = BIT(2) },
> +	{ .csi = RVIN_CSI20, .channel = 2, .vin = 6, .mask = BIT(4) },
> +	{ .csi = RVIN_CSI20, .channel = 1, .vin = 7, .mask = BIT(1) | BIT(2) },
> +	{ .csi = RVIN_CSI20, .channel = 3, .vin = 7, .mask = BIT(4) },
> +	{ /* Sentinel */ }
> +};
> +
> +static const struct rvin_info rcar_info_r8a774e1 = {
> +	.model = RCAR_GEN3,
> +	.use_mc = true,
> +	.max_width = 4096,
> +	.max_height = 4096,
> +	.routes = rcar_info_r8a774e1_routes,
> +};
> +
>  static const struct rvin_group_route rcar_info_r8a7795_routes[] = {
>  	{ .csi = RVIN_CSI40, .channel = 0, .vin = 0, .mask = BIT(0) | BIT(3) },
>  	{ .csi = RVIN_CSI20, .channel = 0, .vin = 0, .mask = BIT(1) | BIT(4) },
> @@ -1220,6 +1256,10 @@ static const struct of_device_id rvin_of_id_table[] = {
>  		.compatible = "renesas,vin-r8a774c0",
>  		.data = &rcar_info_r8a77990,
>  	},
> +	{
> +		.compatible = "renesas,vin-r8a774e1",
> +		.data = &rcar_info_r8a774e1,
> +	},
>  	{
>  		.compatible = "renesas,vin-r8a7778",
>  		.data = &rcar_info_m1,
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas Söderlund
