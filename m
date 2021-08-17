Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4095C3EF443
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Aug 2021 22:52:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232695AbhHQUw4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Aug 2021 16:52:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230433AbhHQUwz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Aug 2021 16:52:55 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B392BC061764;
        Tue, 17 Aug 2021 13:52:21 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EFF7B2C5;
        Tue, 17 Aug 2021 22:52:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1629233538;
        bh=Mh6GvkHbI/y4ERR91za8dX6bujaEyUKIBWREoUqz32k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bBmkbg51g/KHyHz2nXr7zLqTXjvE8kAhWswpMeJgm+7mRhHBuIEvmYBsSuI4nVDaB
         Xze+sjGWtyuILHxnE6OjIYhXtk5IY9mSqdbRu/CrAUqIftCd7R9hSnZ01C14JcdC91
         Nr1EPmveULP5QjEy0AAuPb3n5dWcL8Qn+aGbwaLs=
Date:   Tue, 17 Aug 2021 23:52:10 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org,
        Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh+dt@kernel.org>,
        Sean Nyekjaer <sean@geanix.com>, devicetree@vger.kernel.org,
        Jose Cazarin <joseespiriki@gmail.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v1.1 2/2] iio: dac: dac5571: Fix chip id detection for OF
 devices
Message-ID: <YRwhej9Hz00qnvlQ@pendragon.ideasonboard.com>
References: <20210723183114.26017-3-laurent.pinchart@ideasonboard.com>
 <20210724000654.23168-1-laurent.pinchart@ideasonboard.com>
 <20210724154308.55afb03c@jic23-huawei>
 <YRwfpOuyVEstwsza@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YRwfpOuyVEstwsza@kunai>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On Tue, Aug 17, 2021 at 10:44:20PM +0200, Wolfram Sang wrote:
> 
> > > When matching an OF device, the match mechanism tries all components of
> > > the compatible property. This can result with a device matched with a
> > > compatible string that isn't the first in the compatible list. For
> > > instance, with a compatible property set to
> > > 
> > >     compatible = "ti,dac081c081", "ti,dac5571";
> > > 
> > > the driver will match the second compatible string, as the first one
> > > isn't listed in the of_device_id table. The device will however be named
> > > "dac081c081" by the I2C core.
> > > 
> > > This causes an issue when identifying the chip. The probe function
> > > receives a i2c_device_id that comes from the module's I2C device ID
> > > table. There is no entry in that table for "dac081c081", which results
> > > in a NULL pointer passed to the probe function.
> > > 
> > > To fix this, add chip_id information in the data field of the OF device
> > > ID table, and retrieve it with of_device_get_match_data() for OF
> > > devices.
> > > 
> > > Signed-off-by: Jose Cazarin <joseespiriki@gmail.com>
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > Interesting problem that I hadn't previously realised could happen.
> > 
> > One request though, can we use device_get_match_data() here rather than
> > the of specific version?  Include property.h as well for that.
> > 
> > That should allow the same issue with compatible to work correctly when
> > using PRP0001 based ACPI methods. 
> > https://elixir.bootlin.com/linux/v5.14-rc1/source/drivers/acpi/bus.c#L891
> > Will result in acpi_of_device_get_match_data() being called which will
> > match to the of_device_id table.
> 
> Couldn't you use the "new" probe_new() callback instead which will drop
> the i2c_device_id? Kieran was interested in such conversions IIRC.

It's a bit unrelated to this patch, but I can add another patch to the
series.

While I have your attention, there's a question for you in the cover
letter :-) Could you please have a look ?

-- 
Regards,

Laurent Pinchart
