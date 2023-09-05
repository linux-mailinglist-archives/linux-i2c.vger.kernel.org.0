Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A9E07930FB
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Sep 2023 23:37:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244251AbjIEVhT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Sep 2023 17:37:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232877AbjIEVhS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Sep 2023 17:37:18 -0400
X-Greylist: delayed 591 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 05 Sep 2023 14:37:15 PDT
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1711F133;
        Tue,  5 Sep 2023 14:37:15 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBAA9C433C7;
        Tue,  5 Sep 2023 21:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693949834;
        bh=1tW/2YmVkVDqbE9TScoPDDYvN/EtPZ3iDJNQoYXntFk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rB1yc9fjSlhx1N807FdykNMbNdeJR6JH1pqqabkB1XrRZorOa0DC80wxLQRF+SBol
         JBgqszR6mgnozoT0yiOBD39CPCCNFctGwNKc8SaXCky/fjbL9FqMDPxuqWcI+ylUwC
         2JF0JqiZtpO2DcbeqkkkEB6wyrmgHcqSzbn85NTrKaTo3mX4fVUFWkycYrMcDPgzZw
         6G5IR22g0/0vG+rj7JEf2zeYsHEJ15OQsbpfy/3LWSWuPqXwP6NjMA1QEKauKCknJ6
         oyWxbBb7lNe6D0HCIJA3jJafukqb2toqV2woo8X+AScpfRNBihPftHJqCx3F7ntPQX
         1jftW0YOT9eKg==
Date:   Tue, 5 Sep 2023 23:37:10 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] i2c: rcar: add FastMode+ support
Message-ID: <20230905213710.3dv5h6zvwu4tpnby@zenone.zhora.eu>
References: <20230904135852.12146-1-wsa+renesas@sang-engineering.com>
 <20230904135852.12146-4-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230904135852.12146-4-wsa+renesas@sang-engineering.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

[...]

> @@ -217,7 +228,17 @@ static void rcar_i2c_init(struct rcar_i2c_priv *priv)
>  	rcar_i2c_write(priv, ICMCR, MDBS);
>  	rcar_i2c_write(priv, ICMSR, 0);
>  	/* start clock */
> -	rcar_i2c_write(priv, ICCCR, priv->icccr);
> +	if (priv->flags & ID_P_FMPLUS) {
> +		rcar_i2c_write(priv, ICCCR, 0);
> +		rcar_i2c_write(priv, ICMPR, priv->clock_val);
> +		rcar_i2c_write(priv, ICHPR, 3 * priv->clock_val);
> +		rcar_i2c_write(priv, ICLPR, 3 * priv->clock_val);
> +		rcar_i2c_write(priv, ICCCR2, FMPE | CDFD | HLSE | SME);
> +	} else {
> +		rcar_i2c_write(priv, ICCCR, priv->clock_val);
> +		if (priv->devtype >= I2C_RCAR_GEN3)
> +			rcar_i2c_write(priv, ICCCR2, 0);

is this last bit part of the FM+ enabling or is it part of the
GEN4 support?

> +	}

[...]

> +	if (priv->flags & ID_P_FMPLUS) {
> +		/*
> +		 * SMD should be smaller than SCLD and SCHD, we arbitrarily set
> +		 * the ratio 1:3. SCHD:SCLD ratio is 1:1, thus:
> +		 * SCL	= clkp / (8 + SMD * 2 + SCLD + SCHD + F[(ticf + tr + intd) * clkp])
> +		 * SCL	= clkp / (8 + SMD * 2 + SMD * 3 + SMD * 3 + F[...])
> +		 * SCL	= clkp / (8 + SMD * 8 + F[...])
> +		 */
> +		smd = DIV_ROUND_UP(ick / t.bus_freq_hz - 8 - round, 8);
> +		scl = ick / (8 + 8 * smd + round);
>  
> -	if (scgd == 0x40) {
> -		dev_err(dev, "it is impossible to calculate best SCL\n");
> -		return -EIO;
> -	}
> +		if (smd > 0xff) {
> +			dev_err(dev, "it is impossible to calculate best SCL\n");
> +			return -EINVAL;
> +		}
>  
> -	dev_dbg(dev, "clk %d/%d(%lu), round %u, CDF:0x%x, SCGD: 0x%x\n",
> -		scl, t.bus_freq_hz, rate, round, cdf, scgd);
> +		dev_dbg(dev, "clk %d/%d(%lu), round %u, SMD:0x%x, SCHD: 0x%x\n",
> +			scl, t.bus_freq_hz, rate, round, smd, 3 * smd);

I trust the formula application is right here... I can't say much :)
I don't see anything odd here.

>  
> -	/* keep icccr value */
> -	priv->icccr = scgd << cdf_width | cdf;
> +		priv->clock_val = smd;
> +	} else {
> +		/*
> +		 * SCL	= ick / (20 + SCGD * 8 + F[(ticf + tr + intd) * ick])
> +		 *
> +		 * Calculation result (= SCL) should be less than
> +		 * bus_speed for hardware safety
> +		 *
> +		 * We could use something along the lines of
> +		 *	div = ick / (bus_speed + 1) + 1;
> +		 *	scgd = (div - 20 - round + 7) / 8;
> +		 *	scl = ick / (20 + (scgd * 8) + round);
> +		 * (not fully verified) but that would get pretty involved
> +		 */
> +		for (scgd = 0; scgd < 0x40; scgd++) {
> +			scl = ick / (20 + (scgd * 8) + round);
> +			if (scl <= t.bus_freq_hz)
> +				break;
> +		}
> +
> +		if (scgd == 0x40) {

would be nice to give a meaning to this 0x40 constant... either
having it in a define or a comment, at least.

Andi

> +			dev_err(dev, "it is impossible to calculate best SCL\n");
> +			return -EINVAL;
> +		}
