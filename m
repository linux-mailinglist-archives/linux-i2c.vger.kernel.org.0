Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72F013D482B
	for <lists+linux-i2c@lfdr.de>; Sat, 24 Jul 2021 16:42:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229602AbhGXOBk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 24 Jul 2021 10:01:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:60272 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229545AbhGXOBk (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 24 Jul 2021 10:01:40 -0400
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net [81.101.6.87])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EF7D060E97;
        Sat, 24 Jul 2021 14:42:08 +0000 (UTC)
Date:   Sat, 24 Jul 2021 15:44:41 +0100
From:   Jonathan Cameron <jic23@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-iio@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh+dt@kernel.org>,
        Sean Nyekjaer <sean@geanix.com>, devicetree@vger.kernel.org,
        Jose Cazarin <joseespiriki@gmail.com>,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH v1.1 2/2] iio: dac: dac5571: Fix chip id detection for
 OF devices
Message-ID: <20210724154441.1d49c713@jic23-huawei>
In-Reply-To: <20210724000654.23168-1-laurent.pinchart@ideasonboard.com>
References: <20210723183114.26017-3-laurent.pinchart@ideasonboard.com>
        <20210724000654.23168-1-laurent.pinchart@ideasonboard.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, 24 Jul 2021 03:06:54 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> From: Jose Cazarin <joseespiriki@gmail.com>
> 
> When matching an OF device, the match mechanism tries all components of
> the compatible property. This can result with a device matched with a
> compatible string that isn't the first in the compatible list. For
> instance, with a compatible property set to
> 
>     compatible = "ti,dac081c081", "ti,dac5571";
> 
> the driver will match the second compatible string, as the first one
> isn't listed in the of_device_id table. The device will however be named
> "dac081c081" by the I2C core.
> 
> This causes an issue when identifying the chip. The probe function
> receives a i2c_device_id that comes from the module's I2C device ID
> table. There is no entry in that table for "dac081c081", which results
> in a NULL pointer passed to the probe function.
> 
> To fix this, add chip_id information in the data field of the OF device
> ID table, and retrieve it with of_device_get_match_data() for OF
> devices.
> 
> Signed-off-by: Jose Cazarin <joseespiriki@gmail.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Side note I failed to put in the review email.

I definitely prefer a whole new series even when a change is just to
a single patch like this.  Much easier to track and eventually pick
up as one unit.

Thanks,

Jonathan


> ---
> Changes since v1:
> 
> - Include linux/of_device.h
> ---
>  drivers/iio/dac/ti-dac5571.c | 28 ++++++++++++++++++----------
>  1 file changed, 18 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/iio/dac/ti-dac5571.c b/drivers/iio/dac/ti-dac5571.c
> index 2a5ba1b08a1d..8ceb1b42b14e 100644
> --- a/drivers/iio/dac/ti-dac5571.c
> +++ b/drivers/iio/dac/ti-dac5571.c
> @@ -19,6 +19,7 @@
>  #include <linux/i2c.h>
>  #include <linux/module.h>
>  #include <linux/mod_devicetable.h>
> +#include <linux/of_device.h>
>  #include <linux/regulator/consumer.h>
>  
>  enum chip_id {
> @@ -311,6 +312,7 @@ static int dac5571_probe(struct i2c_client *client,
>  	const struct dac5571_spec *spec;
>  	struct dac5571_data *data;
>  	struct iio_dev *indio_dev;
> +	enum chip_id chip_id;
>  	int ret, i;
>  
>  	indio_dev = devm_iio_device_alloc(dev, sizeof(*data));
> @@ -326,7 +328,13 @@ static int dac5571_probe(struct i2c_client *client,
>  	indio_dev->modes = INDIO_DIRECT_MODE;
>  	indio_dev->channels = dac5571_channels;
>  
> -	spec = &dac5571_spec[id->driver_data];
> +	if (dev->of_node)
> +		chip_id = (uintptr_t)of_device_get_match_data(dev);
> +	else
> +		chip_id = id->driver_data;
> +
> +	spec = &dac5571_spec[chip_id];
> +
>  	indio_dev->num_channels = spec->num_channels;
>  	data->spec = spec;
>  
> @@ -384,15 +392,15 @@ static int dac5571_remove(struct i2c_client *i2c)
>  }
>  
>  static const struct of_device_id dac5571_of_id[] = {
> -	{.compatible = "ti,dac5571"},
> -	{.compatible = "ti,dac6571"},
> -	{.compatible = "ti,dac7571"},
> -	{.compatible = "ti,dac5574"},
> -	{.compatible = "ti,dac6574"},
> -	{.compatible = "ti,dac7574"},
> -	{.compatible = "ti,dac5573"},
> -	{.compatible = "ti,dac6573"},
> -	{.compatible = "ti,dac7573"},
> +	{.compatible = "ti,dac5571", .data = (void *)single_8bit},
> +	{.compatible = "ti,dac6571", .data = (void *)single_10bit},
> +	{.compatible = "ti,dac7571", .data = (void *)single_12bit},
> +	{.compatible = "ti,dac5574", .data = (void *)quad_8bit},
> +	{.compatible = "ti,dac6574", .data = (void *)quad_10bit},
> +	{.compatible = "ti,dac7574", .data = (void *)quad_12bit},
> +	{.compatible = "ti,dac5573", .data = (void *)quad_8bit},
> +	{.compatible = "ti,dac6573", .data = (void *)quad_10bit},
> +	{.compatible = "ti,dac7573", .data = (void *)quad_12bit},
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, dac5571_of_id);

