Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F08B4E881C
	for <lists+linux-i2c@lfdr.de>; Sun, 27 Mar 2022 16:37:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235107AbiC0OjM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 27 Mar 2022 10:39:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233861AbiC0OjL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 27 Mar 2022 10:39:11 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D3B23631B;
        Sun, 27 Mar 2022 07:37:32 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 713492EC;
        Sun, 27 Mar 2022 16:37:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1648391849;
        bh=6D/7BUVFp1eJLxLMCvmq7jMfzyBPlUvmvpm+3BKfCd0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=K2s38dXbKdC2kdGfTwoFJGN97WIFS4vBIvM6k2ZPZvaeecitBIwr4dq5AGuOBFk0l
         aBNwTwPskTdmdYfOXclpcQm35VMwX7RfAXdvIJJxnRfuDfLC/aNIQ1DvvuG/mNyj5Z
         XJWkjhrKkfjAGfkpf+JBSaDMBt/4TOUh5824Pt8o=
Date:   Sun, 27 Mar 2022 17:37:27 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jonathan Cameron <jic23@kernel.org>
Cc:     linux-iio@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>,
        Sean Nyekjaer <sean@geanix.com>,
        Jose Cazarin <joseespiriki@gmail.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2] iio: dac: dac5571: Fix chip id detection for OF
 devices
Message-ID: <YkB2p+GAP55qMja8@pendragon.ideasonboard.com>
References: <20220324234340.32402-1-laurent.pinchart@ideasonboard.com>
 <20220327153438.1d4128e5@jic23-huawei>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220327153438.1d4128e5@jic23-huawei>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Jonathan,

On Sun, Mar 27, 2022 at 03:34:38PM +0100, Jonathan Cameron wrote:
> On Fri, 25 Mar 2022 01:43:40 +0200 Laurent Pinchart wrote:
> 
> > From: Jose Cazarin <joseespiriki@gmail.com>
> > 
> > When matching an OF device, the match mechanism tries all components of
> > the compatible property. This can result with a device matched with a
> > compatible string that isn't the first in the compatible list. For
> > instance, with a compatible property set to
> > 
> >     compatible = "ti,dac081c081", "ti,dac5571";
> > 
> > the driver will match the second compatible string, as the first one
> > isn't listed in the of_device_id table. The device will however be named
> > "dac081c081" by the I2C core.
> > 
> > This causes an issue when identifying the chip. The probe function
> > receives a i2c_device_id that comes from the module's I2C device ID
> > table. There is no entry in that table for "dac081c081", which results
> > in a NULL pointer passed to the probe function.
> > 
> > To fix this, add chip_id information in the data field of the OF device
> > ID table, and retrieve it with of_device_get_match_data() for OF
> > devices.
> 
> You forgot to update the patch description for the change to device_get_match_data()
> 
> One other thing inline.

Thank you for the comments. I agree with both. Would you like me to send
a v3, or is this something you'd be happy fixing when applying the patch
to your tree ?

> > Signed-off-by: Jose Cazarin <joseespiriki@gmail.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> > Changes since v1:
> > 
> > - Use device_get_match_data()
> > ---
> >  drivers/iio/dac/ti-dac5571.c | 28 ++++++++++++++++++----------
> >  1 file changed, 18 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/iio/dac/ti-dac5571.c b/drivers/iio/dac/ti-dac5571.c
> > index 4a3b8d875518..4f50e31dffb0 100644
> > --- a/drivers/iio/dac/ti-dac5571.c
> > +++ b/drivers/iio/dac/ti-dac5571.c
> > @@ -19,6 +19,7 @@
> >  #include <linux/i2c.h>
> >  #include <linux/module.h>
> >  #include <linux/mod_devicetable.h>
> > +#include <linux/property.h>
> >  #include <linux/regulator/consumer.h>
> >  
> >  enum chip_id {
> > @@ -311,6 +312,7 @@ static int dac5571_probe(struct i2c_client *client,
> >  	const struct dac5571_spec *spec;
> >  	struct dac5571_data *data;
> >  	struct iio_dev *indio_dev;
> > +	enum chip_id chip_id;
> >  	int ret, i;
> >  
> >  	indio_dev = devm_iio_device_alloc(dev, sizeof(*data));
> > @@ -326,7 +328,13 @@ static int dac5571_probe(struct i2c_client *client,
> >  	indio_dev->modes = INDIO_DIRECT_MODE;
> >  	indio_dev->channels = dac5571_channels;
> >  
> > -	spec = &dac5571_spec[id->driver_data];
> > +	if (dev->of_node)
> 
> 	if (dev_fwnode(dev))
> 
> > +		chip_id = (uintptr_t)device_get_match_data(dev);
> > +	else
> > +		chip_id = id->driver_data;
> > +
> > +	spec = &dac5571_spec[chip_id];
> > +
> >  	indio_dev->num_channels = spec->num_channels;
> >  	data->spec = spec;
> >  
> > @@ -385,15 +393,15 @@ static int dac5571_remove(struct i2c_client *i2c)
> >  }
> >  
> >  static const struct of_device_id dac5571_of_id[] = {
> > -	{.compatible = "ti,dac5571"},
> > -	{.compatible = "ti,dac6571"},
> > -	{.compatible = "ti,dac7571"},
> > -	{.compatible = "ti,dac5574"},
> > -	{.compatible = "ti,dac6574"},
> > -	{.compatible = "ti,dac7574"},
> > -	{.compatible = "ti,dac5573"},
> > -	{.compatible = "ti,dac6573"},
> > -	{.compatible = "ti,dac7573"},
> > +	{.compatible = "ti,dac5571", .data = (void *)single_8bit},
> > +	{.compatible = "ti,dac6571", .data = (void *)single_10bit},
> > +	{.compatible = "ti,dac7571", .data = (void *)single_12bit},
> > +	{.compatible = "ti,dac5574", .data = (void *)quad_8bit},
> > +	{.compatible = "ti,dac6574", .data = (void *)quad_10bit},
> > +	{.compatible = "ti,dac7574", .data = (void *)quad_12bit},
> > +	{.compatible = "ti,dac5573", .data = (void *)quad_8bit},
> > +	{.compatible = "ti,dac6573", .data = (void *)quad_10bit},
> > +	{.compatible = "ti,dac7573", .data = (void *)quad_12bit},
> >  	{}
> >  };
> >  MODULE_DEVICE_TABLE(of, dac5571_of_id);
> 

-- 
Regards,

Laurent Pinchart
