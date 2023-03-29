Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46CF06CEEC8
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Mar 2023 18:08:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230451AbjC2QIQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Mar 2023 12:08:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229951AbjC2QIB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Mar 2023 12:08:01 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56F50658C;
        Wed, 29 Mar 2023 09:07:29 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id p204so19941770ybc.12;
        Wed, 29 Mar 2023 09:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680106012;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J0buJ+bz6nRSi4h6CRlltq38ZsNDLaTAQVOLOp+rT9g=;
        b=JyWGqb0rnM6Sjmr5Bl4106EruRjN4ZyrC4ulTrvxI++yyUReLhocOWspATt4I43CCk
         BRYT6OObG7ovMUKxW98BbgWnujPD4HfiHuN6giihag+OTBsYwORn9VrRIB7o9MQAjt2A
         i3IMvrTFcT/64rg8vRALYA4XWBdb7R25rE3CnvF1uLUH/gUfcp1uW/sCbxsLJ+3En4Bp
         D3hG4Blfoc7lc8Bm/FBx1EIGRt0MRsO5hs+28NHIokS4xB3CPof3Vp0SigHAuFKMc76R
         FtvK0HPYfC6os9KTos1h1DXwsb3IAq5R7ZqqLou9tdrySrKEMhWnTh/G7kK/tpeU/xyK
         Dfjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680106012;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J0buJ+bz6nRSi4h6CRlltq38ZsNDLaTAQVOLOp+rT9g=;
        b=04FlYSmym6HlAxt1kqo0ObkFpbj5zqtbQ+q9auIDPPJ9g9Uksa9y7VVI+UIEv40xN4
         Q+rrZ3rDSliiWnjWG2iue63L5WEjXcBQrHnQZBZkUuYS+za4qLqC5+oWhWAAOzz2qmIf
         y5Ekv77eGQkiYudK6lsjF26/d3vrQ+effm/1bHrgcLgmcwRYuBEV6BNffve/TZlSBbbv
         NweqfF3mJcIQKbfiABwloONmS0RzpEzJVJzerihfMRHyCa35Y58D1BzaCeflfwfeZPqf
         8qiBArkXSJwERAGGAZgeLQGmLCfjDBBnXnxUyxigXqn98lwkwQkB/1IOjZwBIJ43BAe1
         32FA==
X-Gm-Message-State: AAQBX9elk6Djyfcptq0dha0TiETt+1AWRFA8HyWuGll15iVJ7m+WmMis
        ux/1b5uloOlFALv732z0kY8=
X-Google-Smtp-Source: AKy350aB7U4fI6GzSH5WLeQTGvxrYIlnqRkcNF926bpP1fyvjSIzR/JytVOq1d4Psvk6hnLUvCJ6sA==
X-Received: by 2002:a05:6902:18d3:b0:b76:1f06:5e53 with SMTP id ck19-20020a05690218d300b00b761f065e53mr23550206ybb.42.1680106012248;
        Wed, 29 Mar 2023 09:06:52 -0700 (PDT)
Received: from ?IPV6:2600:1700:2442:6db0:d913:852b:d7c6:7253? ([2600:1700:2442:6db0:d913:852b:d7c6:7253])
        by smtp.gmail.com with ESMTPSA id 198-20020a250bcf000000b00b7767ca746asm3538614ybl.7.2023.03.29.09.06.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Mar 2023 09:06:51 -0700 (PDT)
Message-ID: <a2086a3f-e4c7-5bbf-a24c-522d6723a043@gmail.com>
Date:   Wed, 29 Mar 2023 11:06:50 -0500
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

Can you elaborate on why this is?  What the relevant code paths are?

> 
> Saravana explains:
>   Basically for all overlays (I hope the function is only used for
>   overlays) we assume all nodes are NOT devices until they actually
>   get added as a device.
> 
> Based on a patch by Saravana Kannan, which covered only platform and spi
> devices.


> 
> Fixes: 4a032827daa89350 ("of: property: Simplify of_link_to_phandle()")

From a quick scan of the fixed commit, I don't see how that commit caused the problem.
Can you give a quick clue?  (The clue does not need to be added to the commit message,
but please at least put it below the "---" if there are additional versions of this
patch.)

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

