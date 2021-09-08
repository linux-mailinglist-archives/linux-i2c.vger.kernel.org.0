Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90AD0403876
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Sep 2021 12:59:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235516AbhIHLAn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Sep 2021 07:00:43 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:60551 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233694AbhIHLAn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Sep 2021 07:00:43 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 37A6D40002;
        Wed,  8 Sep 2021 10:59:32 +0000 (UTC)
Date:   Wed, 8 Sep 2021 13:00:19 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Peter Rosin <peda@axentia.se>
Cc:     Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Matt Ranostay <matt.ranostay@konsulko.com>,
        Magnus Damm <magnus.damm@gmail.com>, linux-iio@vger.kernel.org,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH v3.1 2/3] iio: chemical: Add Senseair Sunrise 006-0-007
 driver
Message-ID: <20210908110019.kocdmytczyykcqfh@uno.localdomain>
References: <20210822184927.94673-3-jacopo@jmondi.org>
 <20210823073639.13688-1-jacopo@jmondi.org>
 <20210829175413.7ce30bfa@jic23-huawei>
 <20210830162051.rjqlhwvtguaivt3p@uno.localdomain>
 <20210830181117.6808f085@jic23-huawei>
 <20210831074011.d6f5rsix2mgxqba5@uno.localdomain>
 <20210905110429.34763e30@jic23-huawei>
 <5e9dce02-2884-d91e-78ef-da2f32258ea3@axentia.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5e9dce02-2884-d91e-78ef-da2f32258ea3@axentia.se>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Peter,
   thanks for your detailed answer

On Mon, Sep 06, 2021 at 01:03:52AM +0200, Peter Rosin wrote:
> On 2021-09-05 12:04, Jonathan Cameron wrote:
> > On Tue, 31 Aug 2021 09:40:11 +0200
> > Jacopo Mondi <jacopo@jmondi.org> wrote:
> >
> >> Hi Jonathan,
> >>    two more clarification requests, sorry to bother :)
> > No problem.  First one: No idea +CC wolfram and i2c list.
> >>
> >> On Mon, Aug 30, 2021 at 06:11:17PM +0100, Jonathan Cameron wrote:
> >>> On Mon, 30 Aug 2021 18:20:51 +0200
> >>>>>> +static int sunrise_write_word(struct sunrise_dev *sunrise, u8 reg, u16 data)
> >>>>>> +{
> >>>>>> +	__be16 be_data = cpu_to_be16(data);
> >>>>>> +	int ret;
> >>>>>> +
> >>>>>> +	sunrise_wakeup(sunrise);
> >>>>>
> >>>>> Hmm. Technically there isn't anything stopping another user of the i2c bus sneaking in
> >>>>> between the wakeup and the following command.  That would make the device going back
> >>>>> to sleep a lot more likely.  I can't off the top of my head remember if regmap lets
> >>>>> you lock the bus.  If not, you'll have to use the underlying i2c bus locking functions.
> >>>>> https://elixir.bootlin.com/linux/latest/source/drivers/iio/temperature/mlx90614.c#L432
> >>>>> gives an example.
> >>>>
> >>>> Right, there might be another call stealing the wakeup session!
> >>>>
> >>>> I should lock the underlying i2c bus, probably not root adapter like
> >>>> mlx90614 does but only the segment.
> >>>
> >>> Ideally only segment as you say as could be some muxes involved.
> >>
> >> If not that i2c_smbus_xfer() which is called by my wakeup and by the
> >> regmap_smbus_* calls tries to lock the segment as well, so we deadlock :)
> >>
> >> And actually, locking the underlying i2c segment seems even too
> >> strict, what we have to guarantee is that no other read/write function
> >> call from this driver interrupts a [wakeup-trasactions] sequence.
> >>
> >> Wouldn't it be better if I handle that with a dedicated mutex ?
> >
> > I'm not sure what best route is. +CC Wolfram, Peter and linux-i2c.
> >
> > Short story here is we have a device which autonomously goes to sleep.
> > Datasheet suggests waking it up with a failed xfer followed by what we
> > actually want to do (sufficiently quickly).
> >
> > Obviously we can't actually guarantee that will ever happen but it's a lot
> > more likely to succeed if we briefly stop anything else using he i2c bus.
> >
> > How should we handle this?
>
> The way I read this is that interactions with other I2C devices that squeeze
> in are not a fundamental problem. Not unless there are so many of these 3rd
> party xfers that the device times out again. If my assessment is correct,
> then I would suggest handling this in the driver by somehow making sure that
> it doesn't clobber its own pairs of wakeup+work interactions. But see below.

So, I tested by sending a double wakeup signal, to verify if the chip
goes back to sleep after -any- kind of transaction after the first
wakeup. It seems it does from what I see.

I also tested by inserting a spurious i2c transaction to a
non-existing address between the wakeup and the actual transaction,
but I cannot say if that proves anything as I'm not sure if messages
directed to non-registered addresses are actually put on the bus.

Anyway, quoting the chip manual:

------------------------------------------------------------------------------
Senseair Sunrise spend most of its time in deep sleep mode to minimize
power consumption, this have the effect that it is necessary to wake
up the sensor before it is possible to communicate with it.  Sensor
will wake up on a falling edge on SDA, it is recommended to send
sensors address to wake it up. When sensors address is used to wake up
the sensor the sensor will not acknowledge this byte.

Communication sequence:
1) Wake up sensor by sending sensor address (START, sensor address, STOP).
   Sensor will not ACK this byte.

2) Normal I2C read/write operations. I2C communication must be started
   within 15ms after the wake-up byte, each byte sent to or from the
   sensor sets the timeout to 15 ms. After a complete read or write
   sequence sensor will enter sleep mode immediately.
------------------------------------------------------------------------------

I think you're correct assuming the only way 3rd parties could
interfere with the wakeup session is by issuing so many transactions
that the bus is not available to the device for such a long time
(15msec) that the wakeup session expires.

Other messages, not directed to the chip, doesn't seem to interfere.

So locking in the driver should be good enough I think.

>
> Because there really is no way to protect against those extra I2C accesses.
> With a parent-locked mux you can (ignoring arbitrators, where another
> system may possibly take over the bus if too much time is spent between
> two xfers that were supposed to be adjacent). But if there's a mux-locked
> mux in the path it's simply not possible to lock out all other xfers on
> the root adapter.
>
> With a parent-locked I2C tree, "locking the segment" is equivalent to
> locking everything all the way to the root adapter. But the whole point
> of mux-locked muxes is that they can't operate if you do that. Mux-locked
> muxes are allowed to depend on other (ignorant) drivers using other parts
> of the I2C tree while the segment is locked. If you lock the root adapter
> when there is a mux-locked mux involved, you simply kill that property
> and sign up for a deadlock. Which also means that you cannot prevent 3rd
> party xfers to other parts of the I2C tree.
>
> However, if you worry about 3rd party xfers causing the wakeup to timeout
> again and that only handling it in the driver as suggested above is
> insufficient, then it's an option to lock the segment. For parent-locked I2C
> trees, this should prevent (most) 3rd party actions and minimize the delay.
> In the odd case that there are mux-locked muxes involved, there will simply
> be a higher risk of failure, but there is little to do about that.

It doesn't feel to me this is required, but I let Jonathan and Andy
which have discussed this with me in the past express an opinion as
well.

In case I need to go for this solution am I correct assuming I should
lock the bus for the whole wakeup-work session and override the
regmap_bus operations to perform unlocked access to the i2c bus?

In my mind this could be realized as

int wakeup()
{

        /* Unlocked wakup ping */
        __i2c_smbus_xfer()
}

int regmap_bus_read()
{
        i2c_lock_bus();

        wakeup();
        /* Unlocked i2c read transaction */
        __i2c_transfer();

        i2c_unlock_bus();
}


struct regmap_bus regmap_bus = {
        .read = regmap_bus_read,
        ...
}

int probe()
{

        regmap_init(..., regmap_bus, ..).
}

But I somehow feel like I could have locking and wakeup handled by a mux's
select/deselect and have a simpler read function. However even if I
think I could have the driver register a mux even if there's actually
no muxed bus behind the chip, I'm missing how that would work if not
by exposing this in the DT bindings or by registering an
i2c_board_info, but this feels already too complicated to be worth it,
right ?

Thanks
   j

>
> See Documentation/i2c/i2c-topology.rst for some discussion on the details
> of mux-locked and parent-locked muxes.
>
> I hope I make at least some sense...
>
> Cheers,
> Peter
