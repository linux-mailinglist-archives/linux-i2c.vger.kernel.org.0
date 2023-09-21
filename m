Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88D7B7AA2F8
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Sep 2023 23:45:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232680AbjIUVpM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 Sep 2023 17:45:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229730AbjIUVo6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 21 Sep 2023 17:44:58 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 103BC49F7;
        Thu, 21 Sep 2023 14:22:29 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE9DFC433C7;
        Thu, 21 Sep 2023 21:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695331348;
        bh=2sDazNEv47m0wG4jFCM6EJLQTQHyU4bEeUi/sRFwWPQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SAwdWtZWznxlHJ/7maelWwB9vj13QV19V09kv85Nr8jASUGsojjFrnhL7ouGg0/kD
         UBQCADoEi0EoBanE2wK1tXRDPYXdq3GCKsJJ2+eM+c6yi0KxlvF6c48e2QPuwS9FhU
         eP4yEXi5jPxO4AVFYgk5l4AX8lvceyMNjZNaJA/Wi70HZl4Q6/WpsctkUmhUumpOgp
         T3xNAACnvcLBb8VcCX8fpCud9KX7Ni+2tRMSuzZpZ6G1fB9ZjwhSLCcLTBKi849jvn
         5KxHqGHRHgBfzUVGHuYjfTFGQNPun5w/R5LcypjZS12Pr5TL0hjbkR1jjd5OK2bSHz
         bTMl++Nv9EmcA==
Date:   Thu, 21 Sep 2023 23:22:23 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] i2c: rcar: reset controller is mandatory for Gen3+
Message-ID: <20230921212223.f5vwltckcbi27hh6@zenone.zhora.eu>
References: <20230921125351.3954-1-wsa+renesas@sang-engineering.com>
 <20230921125351.3954-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230921125351.3954-2-wsa+renesas@sang-engineering.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

[...]

>  		irqhandler = rcar_i2c_gen2_irq;
>  	}
>  
> -	if (priv->devtype == I2C_RCAR_GEN3) {
> -		priv->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
> -		if (!IS_ERR(priv->rstc)) {
> -			ret = reset_control_status(priv->rstc);
> -			if (ret < 0)
> -				priv->rstc = ERR_PTR(-ENOTSUPP);
> -		}
> -	}
> -
>  	/* Stay always active when multi-master to keep arbitration working */
>  	if (of_property_read_bool(dev->of_node, "multi-master"))
>  		priv->flags |= ID_P_PM_BLOCKED;
> @@ -1112,6 +1101,16 @@ static int rcar_i2c_probe(struct platform_device *pdev)
>  	if (of_property_read_bool(dev->of_node, "smbus"))
>  		priv->flags |= ID_P_HOST_NOTIFY;
>  
> +	if (priv->devtype == I2C_RCAR_GEN3) {
> +		priv->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
> +		if (IS_ERR(priv->rstc))
> +			goto out_pm_put;
> +
> +		ret = reset_control_status(priv->rstc);
> +		if (ret < 0)
> +			goto out_pm_put;
> +	}
> +

you moved this block to avoid the pm_runtime_put(dev);

Looks good!

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Andi
