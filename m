Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A888B400EEE
	for <lists+linux-i2c@lfdr.de>; Sun,  5 Sep 2021 12:01:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236579AbhIEKCN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 5 Sep 2021 06:02:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:46248 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233169AbhIEKCN (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 5 Sep 2021 06:02:13 -0400
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net [81.101.6.87])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4C860601FA;
        Sun,  5 Sep 2021 10:01:07 +0000 (UTC)
Date:   Sun, 5 Sep 2021 11:04:29 +0100
From:   Jonathan Cameron <jic23@kernel.org>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Lars-Peter Clausen <lars@metafoo.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Matt Ranostay <matt.ranostay@konsulko.com>,
        Magnus Damm <magnus.damm@gmail.com>, linux-iio@vger.kernel.org,
        linux-i2c@vger.kernel.org, Peter Rosin <peda@axentia.se>,
        Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH v3.1 2/3] iio: chemical: Add Senseair Sunrise 006-0-007
 driver
Message-ID: <20210905110429.34763e30@jic23-huawei>
In-Reply-To: <20210831074011.d6f5rsix2mgxqba5@uno.localdomain>
References: <20210822184927.94673-3-jacopo@jmondi.org>
        <20210823073639.13688-1-jacopo@jmondi.org>
        <20210829175413.7ce30bfa@jic23-huawei>
        <20210830162051.rjqlhwvtguaivt3p@uno.localdomain>
        <20210830181117.6808f085@jic23-huawei>
        <20210831074011.d6f5rsix2mgxqba5@uno.localdomain>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 31 Aug 2021 09:40:11 +0200
Jacopo Mondi <jacopo@jmondi.org> wrote:

> Hi Jonathan,
>    two more clarification requests, sorry to bother :)
No problem.  First one: No idea +CC wolfram and i2c list.
> 
> On Mon, Aug 30, 2021 at 06:11:17PM +0100, Jonathan Cameron wrote:
> > On Mon, 30 Aug 2021 18:20:51 +0200  
> > > > > +static int sunrise_write_word(struct sunrise_dev *sunrise, u8 reg, u16 data)
> > > > > +{
> > > > > +	__be16 be_data = cpu_to_be16(data);
> > > > > +	int ret;
> > > > > +
> > > > > +	sunrise_wakeup(sunrise);  
> > > >
> > > > Hmm. Technically there isn't anything stopping another user of the i2c bus sneaking in
> > > > between the wakeup and the following command.  That would make the device going back
> > > > to sleep a lot more likely.  I can't off the top of my head remember if regmap lets
> > > > you lock the bus.  If not, you'll have to use the underlying i2c bus locking functions.
> > > > https://elixir.bootlin.com/linux/latest/source/drivers/iio/temperature/mlx90614.c#L432
> > > > gives an example.  
> > >
> > > Right, there might be another call stealing the wakeup session!
> > >
> > > I should lock the underlying i2c bus, probably not root adapter like
> > > mlx90614 does but only the segment.  
> >
> > Ideally only segment as you say as could be some muxes involved.  
> 
> If not that i2c_smbus_xfer() which is called by my wakeup and by the
> regmap_smbus_* calls tries to lock the segment as well, so we deadlock :)
> 
> And actually, locking the underlying i2c segment seems even too
> strict, what we have to guarantee is that no other read/write function
> call from this driver interrupts a [wakeup-trasactions] sequence.
> 
> Wouldn't it be better if I handle that with a dedicated mutex ?

I'm not sure what best route is. +CC Wolfram, Peter and linux-i2c.

Short story here is we have a device which autonomously goes to sleep.
Datasheet suggests waking it up with a failed xfer followed by what we
actually want to do (sufficiently quickly).

Obviously we can't actually guarantee that will ever happen but it's a lot
more likely to succeed if we briefly stop anything else using he i2c bus.

How should we handle this?




> 
> >  
> > >  
> > > >
> > > > Perhaps worth a look is the regmap-sccb implementation which has a dance that looks
> > > > a tiny bit like what you have to do here (be it for a different reason).
> > > > It might be nice to do something similar here and have a custom regmap bus which
> > > > has the necessary wakeups in the relevant places.
> > > >
> > > > Note I haven't thought it through in depth, so it might not work!  
> > >
> > > the dance is similar if not regmap-sccb tranfers a byte instead of
> > > sending only the R/W bit (notice the usage of I2C_SMBUS_QUICK here and
> > > I2C_SMBUS_BYTE in regmap-sccb). Practically speaking it makes no
> > > difference as the sensor nacks the first message, so the underlying
> > > bus implementation bails out, but that's a bit of work-by-accident
> > > thing, isn't it ?
> > >
> > > If fine with you, I would stick to this implementation and hold the
> > > segment locked between the wakup and the actual messages.  
> >
> > That's fine.  I was just thinking you could hid the magic in a custom regmap then
> > the rest of the driver would not have to be aware of it.  Slightly neater than
> > wrapping regmap functions with this extra call in the wrapper.
> >  
> 
> [snip]
> 
> > > > > +		}
> > > > > +
> > > > > +	case IIO_CHAN_INFO_SCALE:
> > > > > +		/* Chip temperature scale = 1/100 */  
> > > >
> > > > IIO temperatures are measured in milli degrees.  1lsb = 1/100*1000 degrees centigrade seems very accurate
> > > > for a device like this!  I'm guessing this should be 10.  
> > >
> > > Ah yes, I thought it had to be given in the chip's native format,
> > > which is 1/100 degree.
> > >
> > > I guess I should then multiply by 10 the temperature raw read and
> > > return IIO_VAL_INT here.  
> >
> > You could do that, but can cause a mess if buffered support comes along later as
> > it is then not a whole number of bits for putting in the buffer.
> >  
> 
> Care to clarify ? What shouldn't I do here ? Multiply by 10 the raw
> value (which I think is wrong as pointed out in a later reply) or
> return IIO_VAL_INT ? Sorry I didn't get the connection with the number
> of bits to put in the buffer :)

So.  If you stick to output of _raw and _scale in the buffer the data
would be whatever you read from the register.  That is typically a whole number of bits.
If you were to multiply by 10 you end up something that may be say 12 or 13 bits depending
on the value.  That's a bit ugly. We can handle it of course, but I'd rather not if it's
as simple as not doing the *10 in kernel for the sysfs path.

So not critical but things end up more elegant / standard if we don't do the *10 and
instead make that a problem for userspace.

Jonathan


> 
> Thanks
>    j

