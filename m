Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC3264E8884
	for <lists+linux-i2c@lfdr.de>; Sun, 27 Mar 2022 17:52:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234949AbiC0PyP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 27 Mar 2022 11:54:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233371AbiC0PyO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 27 Mar 2022 11:54:14 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 850B435A93;
        Sun, 27 Mar 2022 08:52:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 34DF8B80C6A;
        Sun, 27 Mar 2022 15:52:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F16AFC340EC;
        Sun, 27 Mar 2022 15:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648396353;
        bh=kXGh55aS23cHz+yE8HxIC6y65JvpEBf965T3Ob2h4jE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=SU7keGJ+TmP/oW+j6OP6c6BiuAeKXIYURVdhRP20m9oMD4S4S8nyguuThvRuKst5F
         3k12gYFpi+3F3wGZ6t9+s/HsbHpfYudjdEGLkXp5LK6FMfHHmr+kWTAEDZEuPsaoRs
         oKyqqeuirmCKLSMFwamOaASFKaMRRY1GZO9MuE5JKPPCuoYDgONg4Tk3eaVZDDEU1q
         ttxFYO64eX0hhgVtC1Q806S79B+UPFbHHdPdgdkouVStT8R7B3IsWe288uQ74PaT1q
         eR9dX0FuE5iS1XyIpo5z8jfAHT9YTLy47KH3iK267CWe1RTinOa1qHXIun6uwBI8cz
         4y9NodqkzawfQ==
Date:   Sun, 27 Mar 2022 17:00:05 +0100
From:   Jonathan Cameron <jic23@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-iio@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>,
        Sean Nyekjaer <sean@geanix.com>,
        Jose Cazarin <joseespiriki@gmail.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2] iio: dac: dac5571: Fix chip id detection for OF
 devices
Message-ID: <20220327170005.4d09eef9@jic23-huawei>
In-Reply-To: <20220327165901.7556df2c@jic23-huawei>
References: <20220324234340.32402-1-laurent.pinchart@ideasonboard.com>
        <20220327153438.1d4128e5@jic23-huawei>
        <YkB2p+GAP55qMja8@pendragon.ideasonboard.com>
        <20220327165901.7556df2c@jic23-huawei>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, 27 Mar 2022 16:59:01 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

> On Sun, 27 Mar 2022 17:37:27 +0300
> Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
> 
> > Hi Jonathan,
> > 
> > On Sun, Mar 27, 2022 at 03:34:38PM +0100, Jonathan Cameron wrote:  
> > > On Fri, 25 Mar 2022 01:43:40 +0200 Laurent Pinchart wrote:
> > >     
> > > > From: Jose Cazarin <joseespiriki@gmail.com>
> > > > 
> > > > When matching an OF device, the match mechanism tries all components of
> > > > the compatible property. This can result with a device matched with a
> > > > compatible string that isn't the first in the compatible list. For
> > > > instance, with a compatible property set to
> > > > 
> > > >     compatible = "ti,dac081c081", "ti,dac5571";
> > > > 
> > > > the driver will match the second compatible string, as the first one
> > > > isn't listed in the of_device_id table. The device will however be named
> > > > "dac081c081" by the I2C core.
> > > > 
> > > > This causes an issue when identifying the chip. The probe function
> > > > receives a i2c_device_id that comes from the module's I2C device ID
> > > > table. There is no entry in that table for "dac081c081", which results
> > > > in a NULL pointer passed to the probe function.
> > > > 
> > > > To fix this, add chip_id information in the data field of the OF device
> > > > ID table, and retrieve it with of_device_get_match_data() for OF
> > > > devices.    
> > > 
> > > You forgot to update the patch description for the change to device_get_match_data()
> > > 
> > > One other thing inline.    
> > 
> > Thank you for the comments. I agree with both. Would you like me to send
> > a v3, or is this something you'd be happy fixing when applying the patch
> > to your tree ?  
> 
> I've applied it how with those changes.  However, it's on my fixes-togreg branch
now. 

I can't type on Sundays :)

Jonathan

> and I don't plan to push that out until after rc1 when I can rebase it on something
> 'stable'.
> 
> Thanks,
> 
> Jonathan
> 
> >   
> > > > Signed-off-by: Jose Cazarin <joseespiriki@gmail.com>
> > > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > ---
> > > > Changes since v1:
> > > > 
> > > > - Use device_get_match_data()
> > > > ---
> > > >  drivers/iio/dac/ti-dac5571.c | 28 ++++++++++++++++++----------
> > > >  1 file changed, 18 insertions(+), 10 deletions(-)
> > > > 
> > > > diff --git a/drivers/iio/dac/ti-dac5571.c b/drivers/iio/dac/ti-dac5571.c
> > > > index 4a3b8d875518..4f50e31dffb0 100644
> > > > --- a/drivers/iio/dac/ti-dac5571.c
> > > > +++ b/drivers/iio/dac/ti-dac5571.c
> > > > @@ -19,6 +19,7 @@
> > > >  #include <linux/i2c.h>
> > > >  #include <linux/module.h>
> > > >  #include <linux/mod_devicetable.h>
> > > > +#include <linux/property.h>
> > > >  #include <linux/regulator/consumer.h>
> > > >  
> > > >  enum chip_id {
> > > > @@ -311,6 +312,7 @@ static int dac5571_probe(struct i2c_client *client,
> > > >  	const struct dac5571_spec *spec;
> > > >  	struct dac5571_data *data;
> > > >  	struct iio_dev *indio_dev;
> > > > +	enum chip_id chip_id;
> > > >  	int ret, i;
> > > >  
> > > >  	indio_dev = devm_iio_device_alloc(dev, sizeof(*data));
> > > > @@ -326,7 +328,13 @@ static int dac5571_probe(struct i2c_client *client,
> > > >  	indio_dev->modes = INDIO_DIRECT_MODE;
> > > >  	indio_dev->channels = dac5571_channels;
> > > >  
> > > > -	spec = &dac5571_spec[id->driver_data];
> > > > +	if (dev->of_node)    
> > > 
> > > 	if (dev_fwnode(dev))
> > >     
> > > > +		chip_id = (uintptr_t)device_get_match_data(dev);
> > > > +	else
> > > > +		chip_id = id->driver_data;
> > > > +
> > > > +	spec = &dac5571_spec[chip_id];
> > > > +
> > > >  	indio_dev->num_channels = spec->num_channels;
> > > >  	data->spec = spec;
> > > >  
> > > > @@ -385,15 +393,15 @@ static int dac5571_remove(struct i2c_client *i2c)
> > > >  }
> > > >  
> > > >  static const struct of_device_id dac5571_of_id[] = {
> > > > -	{.compatible = "ti,dac5571"},
> > > > -	{.compatible = "ti,dac6571"},
> > > > -	{.compatible = "ti,dac7571"},
> > > > -	{.compatible = "ti,dac5574"},
> > > > -	{.compatible = "ti,dac6574"},
> > > > -	{.compatible = "ti,dac7574"},
> > > > -	{.compatible = "ti,dac5573"},
> > > > -	{.compatible = "ti,dac6573"},
> > > > -	{.compatible = "ti,dac7573"},
> > > > +	{.compatible = "ti,dac5571", .data = (void *)single_8bit},
> > > > +	{.compatible = "ti,dac6571", .data = (void *)single_10bit},
> > > > +	{.compatible = "ti,dac7571", .data = (void *)single_12bit},
> > > > +	{.compatible = "ti,dac5574", .data = (void *)quad_8bit},
> > > > +	{.compatible = "ti,dac6574", .data = (void *)quad_10bit},
> > > > +	{.compatible = "ti,dac7574", .data = (void *)quad_12bit},
> > > > +	{.compatible = "ti,dac5573", .data = (void *)quad_8bit},
> > > > +	{.compatible = "ti,dac6573", .data = (void *)quad_10bit},
> > > > +	{.compatible = "ti,dac7573", .data = (void *)quad_12bit},
> > > >  	{}
> > > >  };
> > > >  MODULE_DEVICE_TABLE(of, dac5571_of_id);    
> > >     
> >   
> 

