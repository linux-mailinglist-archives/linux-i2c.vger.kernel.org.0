Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99C95247BD7
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Aug 2020 03:34:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726290AbgHRBeS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 Aug 2020 21:34:18 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:58130 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726135AbgHRBeR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 17 Aug 2020 21:34:17 -0400
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
        (envelope-from <andrew@lunn.ch>)
        id 1k7qVu-009pKf-Fc; Tue, 18 Aug 2020 03:34:10 +0200
Date:   Tue, 18 Aug 2020 03:34:10 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Mohammed Billoo <mab@mab-labs.com>
Cc:     peter@korsgaard.com, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: ocores: Allow endian-specific grlib accessors
Message-ID: <20200818013410.GG2294711@lunn.ch>
References: <20200814210154.14402-1-mab@mab-labs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200814210154.14402-1-mab@mab-labs.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Aug 14, 2020 at 05:01:54PM -0400, Mohammed Billoo wrote:
> Due to inconsistent/broken HW, SW may need to set the appropriate
> endianess of the grlib accessors (instead of defaulting to big endian).

I think you have this wrong.

> -static u8 oc_getreg_grlib(struct ocores_i2c *i2c, int reg)
> +static u8 oc_getreg_grlib_be(struct ocores_i2c *i2c, int reg)
>  {
>  	u32 rd;
>  	int rreg = reg;
> @@ -506,7 +507,21 @@ static u8 oc_getreg_grlib(struct ocores_i2c *i2c, int reg)
>  		return (u8)rd;
>  }

So the existing code is big endian.


> -static void oc_setreg_grlib(struct ocores_i2c *i2c, int reg, u8 value)
> +static u8 oc_getreg_grlib_le(struct ocores_i2c *i2c, int reg)
> +{
> +	u32 rd;
> +	int rreg = reg;
> +
> +	if (reg != OCI2C_PRELOW)
> +		rreg--;
> +	rd = ioread32(i2c->base + (rreg << i2c->reg_shift));
> +	if (reg == OCI2C_PREHIGH)
> +		return (u8)(rd >> 8);
> +	else
> +		return (u8)rd;
> +}

You are adding little endian accesses.

> @@ -592,8 +626,17 @@ static int ocores_i2c_of_probe(struct platform_device *pdev,
>  	match = of_match_node(ocores_i2c_match, pdev->dev.of_node);
>  	if (match && (long)match->data == TYPE_GRLIB) {
>  		dev_dbg(&pdev->dev, "GRLIB variant of i2c-ocores\n");
> -		i2c->setreg = oc_setreg_grlib;
> -		i2c->getreg = oc_getreg_grlib;
> +		/*
> +		 * This is a workaround for inconsistent/broken HW,
> +		 * where SW has to set the appropriate endianess
> +		 */
> +		if (of_device_is_big_endian(pdev->dev.of_node)) {
> +			i2c->setreg = oc_setreg_grlib_be;
> +			i2c->getreg = oc_getreg_grlib_be;
> +		} else {
> +			i2c->setreg = oc_setreg_grlib_le;
> +			i2c->getreg = oc_getreg_grlib_le;
> +		}

Existing device tree blobs won't indicate an endianess. They assume
big endian is the default. But you are changing that, they now need to
indicate they are big endian. And they won't, so you will break them.

For you specific platform, you need to indicate in device tree it
needs little endian, by adding a property.

Please also document the property you add in i2c-ocores.txt.

      Andrew
