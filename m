Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B306A403D4E
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Sep 2021 18:07:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347270AbhIHQIh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Sep 2021 12:08:37 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:55927 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347220AbhIHQIf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Sep 2021 12:08:35 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id D002860004;
        Wed,  8 Sep 2021 16:07:23 +0000 (UTC)
Date:   Wed, 8 Sep 2021 18:08:09 +0200
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
Message-ID: <20210908160809.srmi3ysgvuq5mx4k@uno.localdomain>
References: <20210822184927.94673-3-jacopo@jmondi.org>
 <20210823073639.13688-1-jacopo@jmondi.org>
 <20210829175413.7ce30bfa@jic23-huawei>
 <20210830162051.rjqlhwvtguaivt3p@uno.localdomain>
 <20210830181117.6808f085@jic23-huawei>
 <20210831074011.d6f5rsix2mgxqba5@uno.localdomain>
 <20210905110429.34763e30@jic23-huawei>
 <5e9dce02-2884-d91e-78ef-da2f32258ea3@axentia.se>
 <20210908110019.kocdmytczyykcqfh@uno.localdomain>
 <6f43a6d4-93ef-4cb0-27fe-cb70c1f43a9c@axentia.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6f43a6d4-93ef-4cb0-27fe-cb70c1f43a9c@axentia.se>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Peter,

On Wed, Sep 08, 2021 at 05:29:02PM +0200, Peter Rosin wrote:
> On 2021-09-08 13:00, Jacopo Mondi wrote:
> > Hi Peter,
> >    thanks for your detailed answer
> >
> > On Mon, Sep 06, 2021 at 01:03:52AM +0200, Peter Rosin wrote:
> >> The way I read this is that interactions with other I2C devices that squeeze
> >> in are not a fundamental problem. Not unless there are so many of these 3rd
> >> party xfers that the device times out again. If my assessment is correct,
> >> then I would suggest handling this in the driver by somehow making sure that
> >> it doesn't clobber its own pairs of wakeup+work interactions. But see below.
> >
> > So, I tested by sending a double wakeup signal, to verify if the chip
> > goes back to sleep after -any- kind of transaction after the first
> > wakeup. It seems it does from what I see.
> >
> > I also tested by inserting a spurious i2c transaction to a
> > non-existing address between the wakeup and the actual transaction,
> > but I cannot say if that proves anything as I'm not sure if messages
> > directed to non-registered addresses are actually put on the bus.
> >
> > Anyway, quoting the chip manual:
> >
> > ------------------------------------------------------------------------------
> > Senseair Sunrise spend most of its time in deep sleep mode to minimize
> > power consumption, this have the effect that it is necessary to wake
> > up the sensor before it is possible to communicate with it.  Sensor
> > will wake up on a falling edge on SDA, it is recommended to send
> > sensors address to wake it up. When sensors address is used to wake up
> > the sensor the sensor will not acknowledge this byte.
> >
> > Communication sequence:
> > 1) Wake up sensor by sending sensor address (START, sensor address, STOP).
> >    Sensor will not ACK this byte.
> >
> > 2) Normal I2C read/write operations. I2C communication must be started
> >    within 15ms after the wake-up byte, each byte sent to or from the
> >    sensor sets the timeout to 15 ms. After a complete read or write
> >    sequence sensor will enter sleep mode immediately.
> > ------------------------------------------------------------------------------
> >
> > I think you're correct assuming the only way 3rd parties could
> > interfere with the wakeup session is by issuing so many transactions
> > that the bus is not available to the device for such a long time
> > (15msec) that the wakeup session expires.
> >
> > Other messages, not directed to the chip, doesn't seem to interfere.
> >
> > So locking in the driver should be good enough I think.
>
> I think so too. Even if 15ms is kind of short... I mean, locking the
> I2C segment can certainly exclude (some) 3rd party xfers on the bus and
> that may help, but there is so much else that could potentially cause
> a 15ms stall, especially on smallish single-cpu devices.
>
> >>
> >> Because there really is no way to protect against those extra I2C accesses.
> >> With a parent-locked mux you can (ignoring arbitrators, where another
> >> system may possibly take over the bus if too much time is spent between
> >> two xfers that were supposed to be adjacent). But if there's a mux-locked
> >> mux in the path it's simply not possible to lock out all other xfers on
> >> the root adapter.
> >>
> >> With a parent-locked I2C tree, "locking the segment" is equivalent to
> >> locking everything all the way to the root adapter. But the whole point
> >> of mux-locked muxes is that they can't operate if you do that. Mux-locked
> >> muxes are allowed to depend on other (ignorant) drivers using other parts
> >> of the I2C tree while the segment is locked. If you lock the root adapter
> >> when there is a mux-locked mux involved, you simply kill that property
> >> and sign up for a deadlock. Which also means that you cannot prevent 3rd
> >> party xfers to other parts of the I2C tree.
> >>
> >> However, if you worry about 3rd party xfers causing the wakeup to timeout
> >> again and that only handling it in the driver as suggested above is
> >> insufficient, then it's an option to lock the segment. For parent-locked I2C
> >> trees, this should prevent (most) 3rd party actions and minimize the delay.
> >> In the odd case that there are mux-locked muxes involved, there will simply
> >> be a higher risk of failure, but there is little to do about that.
> >
> > It doesn't feel to me this is required, but I let Jonathan and Andy
> > which have discussed this with me in the past express an opinion as
> > well.
> >
> > In case I need to go for this solution am I correct assuming I should
> > lock the bus for the whole wakeup-work session and override the
> > regmap_bus operations to perform unlocked access to the i2c bus?
> >
> > In my mind this could be realized as
> >
> > int wakeup()
> > {
> >
> >         /* Unlocked wakup ping */
> >         __i2c_smbus_xfer()
> > }
> >
> > int regmap_bus_read()
> > {
> >         i2c_lock_bus();
> >
> >         wakeup();
> >         /* Unlocked i2c read transaction */
> >         __i2c_transfer();
> >
> >         i2c_unlock_bus();
> > }
> >
> >
> > struct regmap_bus regmap_bus = {
> >         .read = regmap_bus_read,
> >         ...
> > }
> >
> > int probe()
> > {
> >
> >         regmap_init(..., regmap_bus, ..).
> > }
>
> Yep, that looks like the right direction from here as well, should you take
> that path.

In facts, I have just implemented this version using unlocked
__i2c_smbus_ functions in the regmap read/write overloads:

static int sunrise_regmap_read(void *context, const void *reg_buf,
			       size_t reg_size, void *val_buf, size_t val_size)
{
	struct i2c_client *client = context;
	union i2c_smbus_data data;
	int ret;

	memset(&data, 0, sizeof(data));
	data.block[0] = val_size;

	/*
	 * Wake up sensor by sending sensor address: START, sensor address,
	 * STOP. Sensor will not ACK this byte.
	 *
	 * The chip enters a low power state after 15msec without
	 * communications or after a complete read/write sequence.
	 */
	__i2c_smbus_xfer(client->adapter, client->addr, I2C_M_IGNORE_NAK,
			 I2C_SMBUS_WRITE, 0, I2C_SMBUS_QUICK, NULL);

	ret = __i2c_smbus_xfer(client->adapter, client->addr, client->flags,
			       I2C_SMBUS_READ, ((u8 *)reg_buf)[0],
			       I2C_SMBUS_I2C_BLOCK_DATA, &data);
	if (ret < 0)
		return ret;

	memcpy(val_buf, &data.block[1], data.block[0]);

	return 0;
}

static int sunrise_regmap_write(void *context, const void *val_buf, size_t count)
{
	struct i2c_client *client = context;
	union i2c_smbus_data data;

	/* Discard reg address from values count. */
	if (count < 1)
		return -EINVAL;
	count--;

	memset(&data, 0, sizeof(data));
	data.block[0] = count;
	memcpy(&data.block[1], (u8 *)val_buf + 1, count);

	__i2c_smbus_xfer(client->adapter, client->addr, I2C_M_IGNORE_NAK,
			 I2C_SMBUS_WRITE, 0, I2C_SMBUS_QUICK, NULL);

	return __i2c_smbus_xfer(client->adapter, client->addr, client->flags,
				I2C_SMBUS_WRITE, ((u8 *)val_buf)[0],
				I2C_SMBUS_I2C_BLOCK_DATA, &data);
}


Those will be wrapped by a segment lock in the driver's read/write
functions.

>
> > But I somehow feel like I could have locking and wakeup handled by a mux's
> > select/deselect and have a simpler read function. However even if I
> > think I could have the driver register a mux even if there's actually
> > no muxed bus behind the chip, I'm missing how that would work if not
> > by exposing this in the DT bindings or by registering an
> > i2c_board_info, but this feels already too complicated to be worth it,
> > right ?
>
> This basically is exactly what is otherwise called an I2C gate. You have
> to do <something> to get I2C xfers safely past the gate, in this case
> wake the device up. So, that model isn't wrong.
>
> However, since the device wakes up on *any* action on SDA, would it not
> also work to make special I2C xfers, with a restart instead of a full
> stop-start after the "wakeup call". That is, if you can assume that the
> I2C adapter is flexible enough...
>
> I.e. something like this:
>
> static int
> sunrise_foo(struct sunrise_context *ctx)
> {
> 	unsigned char reg = 0x17;
> 	unsigned char buf[17];
> 	struct i2c_msg msg[3] = {
> 		{	/* wakeup */
> 			.addr = 0x68,
> 			.flags = I2C_M_RD | I2C_M_IGNORE_NAK,
> 			.len = 0,
> 		}, {	/* write register number */
> 			.addr = 0x68,
> 			.flags = 0,
> 			.len = 1,
> 			.buf = &reg,
> 		}, {	/* read register contents */
> 			.addr = 0x68,
> 			.flags = I2C_M_RD,
> 			.len = 17,
> 			.buf = buf,
> 		},
> 	};
> 	int ret;
>
> 	ret = i2c_transfer(ctx->adapter, msg, 3);

But this is interesting as well, as it seems the chip is flexible
enough to support repeated starts so this might works too.

Assuming this version works, which one is preferred in terms of
compatibility with the largest possible number of adapters (if it
makes any difference at all) ?

Documentation/i2c/smbus-protocol.rst seems to suggest smbus command
should be preferred:

If you write a driver for some I2C device, please try to use the SMBus
commands if at all possible (if the device uses only that subset of the
I2C protocol). This makes it possible to use the device driver on both
SMBus adapters and I2C adapters (the SMBus command set is automatically
translated to I2C on I2C adapters, but plain I2C commands can not be
handled at all on most pure SMBus adapters).

Thanks
   j

>
> 	...
>
> 	return ret;
> }
>
> Cheers,
> Peter
>
> > Thanks
> >    j
> >
> >>
> >> See Documentation/i2c/i2c-topology.rst for some discussion on the details
> >> of mux-locked and parent-locked muxes.
> >>
> >> I hope I make at least some sense...
> >>
> >> Cheers,
> >> Peter
