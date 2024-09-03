Return-Path: <linux-i2c+bounces-6038-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F2996A1C8
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 17:13:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A5F91F25485
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 15:13:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85AB818592B;
	Tue,  3 Sep 2024 15:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="omWlnZO3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393E613DB92;
	Tue,  3 Sep 2024 15:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725376405; cv=none; b=L8BQ28l2WgqojuF08S6g/ELjt0gxUWTnChFmsE6mJUjrYgYkeBHlY+c71OK0mqQOZAnybCmwJL/CWeCgfcEWoRXPftmcshZQ42dhpT9mJeM84Kufz1dHcmwtYNb/P7vzxs3p1tqbTsPBMKgFD4T6e7Cs4jpn3Q1Uv+csKdp1Kb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725376405; c=relaxed/simple;
	bh=mqSG8zmYkLbysxx98xITPffGwNgDwNQDDeyLT76Ts00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W7s6pMyquJTPrlSKLC7dAf6dMEwc2TEinSKdb95xJWIWf7WX5f7vVctvZ+wLRw3x1wY75GqlkazKFx9hcPl7UasaiSLTXyL//Pc4VdXDgE2WGDdlkml6RtuhuXvRbKtHzTFwRvIiV/j18SADWIm/O8lMud2PAg4FPXGdP/g/i4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=omWlnZO3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31914C4CEC4;
	Tue,  3 Sep 2024 15:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725376404;
	bh=mqSG8zmYkLbysxx98xITPffGwNgDwNQDDeyLT76Ts00=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=omWlnZO38v/uzvDFb7eGgU1lN0MaIhjFVkxx2TTKBUa5tV62bj2kd7/YzKn65tk9I
	 XpbPwxy/aks95eUWT+fjT+2XB0PaeALE/J39M+rZ04HdoMn+6H5AS4IA/ZVxK5gDdH
	 ykdarH/HyzA6G+oKC33xdzNe+HFElh2lgJU6xu/UwAd4N44HA5/ljCTMuwxm7aN9BG
	 HOCOcZVg8zKF4Iw7VkeRCDQ5kwfD5FpXpdU+gnonn0yUKSfPWg0EwHxhi7W8MrSkut
	 dGMxfkf7505s0XX2gWP5qyH1YXbzqx3W0aSHI2i/WEE6QAdym4t8HNnB8BSpZmVU3k
	 aNlhpRRpN8QYg==
Date: Tue, 3 Sep 2024 17:13:21 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Farouk Bouabid <farouk.bouabid@cherry.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Peter Rosin <peda@axentia.se>, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Heiko Stuebner <heiko@sntech.de>, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v7 2/8] i2c: muxes: add support for tsd,mule-i2c
 multiplexer
Message-ID: <fvk5u2j7wu7pjrlpbbnggp3vhopotctu2vr3fh77kl2icrvnyt@tukh2ytkiwdz>
References: <20240902-dev-mule-i2c-mux-v7-0-bf7b8f5385ed@cherry.de>
 <20240902-dev-mule-i2c-mux-v7-2-bf7b8f5385ed@cherry.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240902-dev-mule-i2c-mux-v7-2-bf7b8f5385ed@cherry.de>

Hi Farouk,

Before jumping into the review, who is going to take this and the
previous patch?

Peter shall I take it?

Now to the review :-)

On Mon, Sep 02, 2024 at 06:38:15PM GMT, Farouk Bouabid wrote:
> Theobroma Systems Mule is an MCU that emulates a set of I2C devices,
> among which an amc6821 and devices that are reachable through an I2C-mux.
> The devices on the mux can be selected by writing the appropriate device
> number to an I2C config register (amc6821 reg 0xff).
> 
> This driver is expected to be probed as a platform device with amc6821
> as its parent i2c device.
> 
> Add support for the mule-i2c-mux platform driver. The amc6821 driver

Along the driver I expressed some concern about the prefixes.

You should avoid prefixes such as mux_* or MUX_* because they
don't belong to your driver. You should always use your driver's
name:

 1. mule_*
 2. mule_mux_*
 3. mule_i2c_mux_*

You have used the 3rd, I'd rather prefer the 1st. Because when
you are in i2c/muxex/ it's implied that you are an i2c mux
device. But it's a matter of personal taste.

Other than this, there is still, one major error down below.

> support for the mux will be added in a later commit.
> 
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>

...

> +#include <linux/i2c-mux.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>
> +
> +#define MUX_CONFIG_REG  0xff
> +#define MUX_DEFAULT_DEV 0x0

Please define these as MULE_I2C_MUX_*

> +
> +struct mule_i2c_reg_mux {
> +	struct regmap *regmap;
> +};
> +
> +static int mux_select(struct i2c_mux_core *muxc, u32 dev)
> +{
> +	struct mule_i2c_reg_mux *mux = muxc->priv;
> +
> +	return regmap_write(mux->regmap, MUX_CONFIG_REG, dev);
> +}
> +
> +static int mux_deselect(struct i2c_mux_core *muxc, u32 dev)
> +{
> +	return mux_select(muxc, MUX_DEFAULT_DEV);
> +}
> +
> +static void mux_remove(void *data)

Please call these mule_i2c_mux_*(), the mux_ prefix doesn't
belong to this driver.

> +{
> +	struct i2c_mux_core *muxc = data;
> +
> +	i2c_mux_del_adapters(muxc);
> +
> +	mux_deselect(muxc, MUX_DEFAULT_DEV);
> +}

...

> +	/* Create device adapters */
> +	for_each_child_of_node(mux_dev->of_node, dev) {
> +		u32 reg;
> +
> +		ret = of_property_read_u32(dev, "reg", &reg);
> +		if (ret)
> +			return dev_err_probe(mux_dev, ret,
> +					     "No reg property found for %s\n",
> +					     of_node_full_name(dev));
> +
> +		if (old_fw && reg != 0) {
> +			dev_warn(mux_dev,
> +				 "Mux is not supported, please update Mule FW\n");
> +			continue;
> +		}
> +
> +		ret = mux_select(muxc, reg);
> +		if (ret) {
> +			dev_warn(mux_dev,
> +				 "Device %d not supported, please update Mule FW\n", reg);
> +			continue;
> +		}
> +
> +		ret = i2c_mux_add_adapter(muxc, 0, reg);
> +		if (ret)
> +			return ret;

do we need to delete the adapters we added in previous cycles?

> +	}
> +
> +	mux_deselect(muxc, MUX_DEFAULT_DEV);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id mule_i2c_mux_of_match[] = {
> +	{.compatible = "tsd,mule-i2c-mux",},

if you are going to resend, can you leave one space after the
'{' and before the '}'

> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, mule_i2c_mux_of_match);
> +
> +static struct platform_driver mule_i2c_mux_driver = {
> +	.driver		= {

I don't see the need for this '\t' here, the alignment is too
far. It just looks bad. Your choice, though.

Thanks,
Andi

> +		.name	= "mule-i2c-mux",
> +		.of_match_table = mule_i2c_mux_of_match,
> +	},
> +	.probe		= mule_i2c_mux_probe,
> +};
> +
> +module_platform_driver(mule_i2c_mux_driver);
> +
> +MODULE_AUTHOR("Farouk Bouabid <farouk.bouabid@cherry.de>");
> +MODULE_DESCRIPTION("I2C mux driver for Theobroma Systems Mule");
> +MODULE_LICENSE("GPL");
> 
> -- 
> 2.34.1
> 

