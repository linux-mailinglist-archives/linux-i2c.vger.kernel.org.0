Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93A436C99C1
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Mar 2023 04:53:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232011AbjC0CxB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 26 Mar 2023 22:53:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231659AbjC0CxA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 26 Mar 2023 22:53:00 -0400
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com [IPv6:2607:f8b0:4864:20::c2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05D294682;
        Sun, 26 Mar 2023 19:52:59 -0700 (PDT)
Received: by mail-oo1-xc2e.google.com with SMTP id v14-20020a4ae6ce000000b0053b91ae6552so1117780oot.8;
        Sun, 26 Mar 2023 19:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679885578;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Bwxc+9Wm9XzKT3wRxyc/yPN0nekHNduBtYwd30w4es=;
        b=Ri2bV1FoPdgTw8eh91inBnZJ+Qu05D62pZaR49BYSn4lGQZdHyxBDBpsYq82C2/KPM
         8WYVkWpAifvRsKZGBQDFJIpNP/YWF1t9Dmlg2M7iNoBkM5F2xmhPunNECZSJ5jAitliU
         R3QUSopKVqTCMQSg2DOiuk0C3/B8O6J7GTU0TnJGJQ9uTbLhWQ/zrPmNm9uxWFvJj5FO
         Nh0TrOq/p67efHEAy3gwv5QTY6zGSG3keGsvcDBtmfCNbWyrgSws18VwQI8qdhZZwfNc
         KvCcdnaTgdI5y5OgeX3osQfoSV+OYV2iO4iCUsmQDgSlqMAcTRIAmMgOuwlztr38X9fc
         OV6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679885578;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9Bwxc+9Wm9XzKT3wRxyc/yPN0nekHNduBtYwd30w4es=;
        b=tNEqyjRySKR1Ky2jXhWorJT2zKkaB+FhrMXLRQFAviUHUlAp3Um4u7hu6TOGefcMAO
         WSvhdd/pKY+Rky31397unU+3x6kP8fguHvlB/3mgG3KtSiC/0N/ozy1+KTen4ABg0Kga
         TXBki17kO1iqabUuVFPs2fmcxjfxAoIkuxSAnDfoJ9hjRFRK5/VF757KY0VQs25RKqx5
         aTEEihKtH5iUvx7uaHknQ1jN6WtniBf7j4XinjsioPPdTr+xcDF4Vl4YMfqYVX4wjCAE
         z94GqHYgSDIBTl6bAnnbZa3Jjkqqey4LosrgDv0F0UNaJsJUYPgb5jr97Ej7Jq26nkLU
         bsLA==
X-Gm-Message-State: AO0yUKUuqcG3kE5aLqfpQ+hf2NzDmmXARiTSv7Z/iqzK8v4BRhjsUYu2
        W6tv+y+cb7CHKIBFOGtYBpU=
X-Google-Smtp-Source: AK7set/o369pQb1Fc6jFOL0nEK9V5MY2Ai6irQxBSn4gfxgxy+ywh0kdL4g7fxXrtddj+x6XtQYojQ==
X-Received: by 2002:a4a:410f:0:b0:53b:4b21:2345 with SMTP id x15-20020a4a410f000000b0053b4b212345mr4762320ooa.2.1679885578198;
        Sun, 26 Mar 2023 19:52:58 -0700 (PDT)
Received: from ?IPV6:2600:1700:2442:6db0:988b:7dda:764e:c744? ([2600:1700:2442:6db0:988b:7dda:764e:c744])
        by smtp.gmail.com with ESMTPSA id o15-20020a05680803cf00b003875e29808esm4217121oie.0.2023.03.26.19.52.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Mar 2023 19:52:57 -0700 (PDT)
Message-ID: <25c6664b-6e9f-17d5-957c-054d99787a1a@gmail.com>
Date:   Sun, 26 Mar 2023 21:52:56 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2] treewide: Fix instantiation of devices in DT overlays
Content-Language: en-US
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Saravana Kannan <saravanak@google.com>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Wolfram Sang <wsa@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <240155f20aae47e9f7461e2b7416120ba6238886.1679650087.git.geert+renesas@glider.be>
From:   Frank Rowand <frowand.list@gmail.com>
In-Reply-To: <240155f20aae47e9f7461e2b7416120ba6238886.1679650087.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 3/24/23 04:30, Geert Uytterhoeven wrote:
> When loading a DT overlay that creates a device, the device is not
> instantiated, unless the DT overlay is unloaded and reloaded again.
> 
> Saravana explains:
>   Basically for all overlays (I hope the function is only used for
>   overlays) we assume all nodes are NOT devices until they actually
>   get added as a device.
> 
> Based on a patch by Saravana Kannan, which covered only platform and spi
> devices.

I have given this a quick look but want to look more deeply at overall
context.  (That Geert found imx-weim, i2c, and spi is a good sign.)

At the top of my list for Monday 3/27.

-Frank

> 
> Fixes: 4a032827daa89350 ("of: property: Simplify of_link_to_phandle()")
> Link: https://lore.kernel.org/r/CAGETcx_+rhHvaC_HJXGrr5_WAd2+k5f=rWYnkCZ6z5bGX-wj4w@mail.gmail.com
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Mark Brown <broonie@kernel.org>
> ---
> v2:
>   - Add Acked-by,
>   - Drop RFC.
> ---
>  drivers/bus/imx-weim.c    | 1 +
>  drivers/i2c/i2c-core-of.c | 1 +
>  drivers/of/dynamic.c      | 1 +
>  drivers/of/platform.c     | 1 +
>  drivers/spi/spi.c         | 1 +
>  5 files changed, 5 insertions(+)
> 
> diff --git a/drivers/bus/imx-weim.c b/drivers/bus/imx-weim.c
> index 36d42484142aede2..898e23a4231400fa 100644
> --- a/drivers/bus/imx-weim.c
> +++ b/drivers/bus/imx-weim.c
> @@ -329,6 +329,7 @@ static int of_weim_notify(struct notifier_block *nb, unsigned long action,
>  				 "Failed to setup timing for '%pOF'\n", rd->dn);
>  
>  		if (!of_node_check_flag(rd->dn, OF_POPULATED)) {
> +			rd->dn->fwnode.flags &= ~FWNODE_FLAG_NOT_DEVICE;
>  			if (!of_platform_device_create(rd->dn, NULL, &pdev->dev)) {
>  				dev_err(&pdev->dev,
>  					"Failed to create child device '%pOF'\n",
> diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
> index aa93467784c29c89..303f9003562eed3d 100644
> --- a/drivers/i2c/i2c-core-of.c
> +++ b/drivers/i2c/i2c-core-of.c
> @@ -178,6 +178,7 @@ static int of_i2c_notify(struct notifier_block *nb, unsigned long action,
>  			return NOTIFY_OK;
>  		}
>  
> +		rd->dn->fwnode.flags &= ~FWNODE_FLAG_NOT_DEVICE;
>  		client = of_i2c_register_device(adap, rd->dn);
>  		if (IS_ERR(client)) {
>  			dev_err(&adap->dev, "failed to create client for '%pOF'\n",
> diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
> index 07d93753b12f5f4d..e311d406b1705306 100644
> --- a/drivers/of/dynamic.c
> +++ b/drivers/of/dynamic.c
> @@ -226,6 +226,7 @@ static void __of_attach_node(struct device_node *np)
>  	np->sibling = np->parent->child;
>  	np->parent->child = np;
>  	of_node_clear_flag(np, OF_DETACHED);
> +	np->fwnode.flags |= FWNODE_FLAG_NOT_DEVICE;
>  }
>  
>  /**
> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index b2bd2e783445dd78..17c92cbfb62ee3ef 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -737,6 +737,7 @@ static int of_platform_notify(struct notifier_block *nb,
>  		if (of_node_check_flag(rd->dn, OF_POPULATED))
>  			return NOTIFY_OK;
>  
> +		rd->dn->fwnode.flags &= ~FWNODE_FLAG_NOT_DEVICE;
>  		/* pdev_parent may be NULL when no bus platform device */
>  		pdev_parent = of_find_device_by_node(rd->dn->parent);
>  		pdev = of_platform_device_create(rd->dn, NULL,
> diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
> index 8e8af148b1dc371e..66ac67580d2a473b 100644
> --- a/drivers/spi/spi.c
> +++ b/drivers/spi/spi.c
> @@ -4527,6 +4527,7 @@ static int of_spi_notify(struct notifier_block *nb, unsigned long action,
>  			return NOTIFY_OK;
>  		}
>  
> +		rd->dn->fwnode.flags &= ~FWNODE_FLAG_NOT_DEVICE;
>  		spi = of_register_spi_device(ctlr, rd->dn);
>  		put_device(&ctlr->dev);
>  

