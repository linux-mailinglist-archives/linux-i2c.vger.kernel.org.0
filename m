Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 564BD67A120
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Jan 2023 19:27:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233200AbjAXS1t (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Jan 2023 13:27:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233001AbjAXS1t (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 Jan 2023 13:27:49 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D6964C6D0;
        Tue, 24 Jan 2023 10:27:41 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 834D98A9;
        Tue, 24 Jan 2023 19:27:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674584857;
        bh=MVPp59hcadDK6KZJCMp6xZ0UkO8aG6IWUvoiKZV6kOY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OIk5ZURkThH9GPWvS+HQAYsX+FaAfanb/JbSdPHnJSxcWcJ3TzdRlA8PAMn5pD0HG
         QQ/e25+PFZEOsPN8vho5DHxAUIev3+bQtbk0dv4jBCctoIzpeh+pOJ169UWzMR9vpO
         f8MUCLtc+dQhQj7StHvpAmbRvMNHVHZjtIOZWAdg=
Date:   Tue, 24 Jan 2023 20:27:33 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Shawn Tu <shawnx.tu@intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mike Pagano <mpagano@gentoo.org>,
        Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>,
        Satish Nagireddy <satish.nagireddy@getcruise.com>
Subject: Re: [PATCH v8 5/7] media: i2c: add DS90UB960 driver
Message-ID: <Y9AjFcsQQZqZBhAb@pendragon.ideasonboard.com>
References: <20230120153417.1156207-1-tomi.valkeinen@ideasonboard.com>
 <20230120153417.1156207-6-tomi.valkeinen@ideasonboard.com>
 <Y88EhodG7b+oSvtE@pendragon.ideasonboard.com>
 <beaebec6-4ec5-8041-5f70-a974ae417a78@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <beaebec6-4ec5-8041-5f70-a974ae417a78@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Tomi,

On Tue, Jan 24, 2023 at 04:48:22PM +0200, Tomi Valkeinen wrote:
> On 24/01/2023 00:04, Laurent Pinchart wrote:
> > On Fri, Jan 20, 2023 at 05:34:15PM +0200, Tomi Valkeinen wrote:
> >> Add driver for TI DS90UB960 FPD-Link III Deserializer.
> >>
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> >> ---
> >>   MAINTAINERS                   |    8 +
> >>   drivers/media/i2c/Kconfig     |   21 +
> >>   drivers/media/i2c/Makefile    |    1 +
> >>   drivers/media/i2c/ds90ub960.c | 4278 +++++++++++++++++++++++++++++++++
> > 
> > Oh my... You're trying to kill reviewers, aren't you ? :-)
> 
> No, just trying to tire them out...

Just stop, that doesn't work, as shown by the time at which I sent the
review ;-)

> >>   include/media/i2c/ds90ub9xx.h |   16 +
> >>   5 files changed, 4324 insertions(+)
> >>   create mode 100644 drivers/media/i2c/ds90ub960.c
> >>   create mode 100644 include/media/i2c/ds90ub9xx.h

[snip]

> >> diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
> >> new file mode 100644
> >> index 000000000000..eb391f0259b3
> >> --- /dev/null
> >> +++ b/drivers/media/i2c/ds90ub960.c
> >> @@ -0,0 +1,4278 @@

[snip]

> >> +struct ub960_data {
> >> +	const struct ub960_hw_data	*hw_data;
> >> +	struct i2c_client	*client; /* for shared local registers */
> >> +	struct regmap		*regmap;
> >> +
> >> +	/* lock for register access */
> >> +	struct mutex		reg_lock;
> >> +
> >> +	struct clk		*refclk;
> >> +
> >> +	struct regulator	*vddio;
> >> +
> >> +	struct gpio_desc	*pd_gpio;
> >> +	struct delayed_work	poll_work;
> >> +	struct i2c_atr		*atr;
> >> +	struct ub960_rxport	*rxports[UB960_MAX_RX_NPORTS];
> >> +	struct ub960_txport	*txports[UB960_MAX_TX_NPORTS];
> > 
> > How about turning these two into arrays of structures to avoid dynamic
> > allocations ? That will simplify the driver, and while it may consume a
> > bit extra memory for uv960_data, you'll save extra dynamic allocations.
> > Up to you.
> 
> Not all of these are allocated, a NULL in a port means that port is not 
> in use. We could add a field in the rxport and txport for that, of 
> course. It's also a good sanity check to see that we're not trying to 
> access ports that are not in use (as that would crash).
> 
> So, I'd rather keep it like this.

Fine with me.

> >> +
> >> +	struct v4l2_subdev	sd;
> >> +	struct media_pad	pads[UB960_MAX_NPORTS];
> >> +
> >> +	struct v4l2_ctrl_handler   ctrl_handler;
> >> +	struct v4l2_async_notifier notifier;
> >> +
> >> +	u32 tx_data_rate;		/* Nominal data rate (Gb/s) */
> >> +	s64 tx_link_freq[1];
> >> +
> >> +	struct atr_alias_table	atr_alias_table;
> > 
> > I'd have written
> > 
> > 	struct {
> > 		struct i2c_atr *atr;
> > 
> > 		/* Protects fields in this struct */
> > 		struct mutex lock;
> > 		size_t num_aliases;
> > 		struct atr_alias_table_entry *aliases;
> > 	} atr;
> > 
> > to shorten lines. Up to you.
> 
> Looks good to me.
> 
> >> +
> >> +	u8 current_read_rxport;
> >> +	u8 current_write_rxport_mask;
> >> +
> >> +	u8 current_read_csiport;
> >> +	u8 current_write_csiport_mask;
> >> +
> >> +	u8 current_indirect_target;
> > 
> > I'll continue :-)
> > 
> > 	struct {
> > 		u8 read_rxport;
> > 		u8 write_rxport_mask;
> > 
> > 		u8 read_csiport;
> > 		u8 write_csiport_mask;
> > 
> > 		u8 indirect_target;
> > 	} regs;
> > 
> > and it looks like (based on the code below) that you could simplify it
> > as
> > 
> > 	struct {
> > 		u8 rxport;
> > 		u8 csiport;
> > 		u8 indirect_target;
> > 	} regs;
> 
> Yes, you're right.
> 
> >> +
> >> +	bool streaming;
> >> +
> >> +	u8 stored_fwd_ctl;
> >> +
> >> +	u64 stream_enable_mask[UB960_MAX_NPORTS];
> >> +
> >> +	/* These are common to all ports */
> >> +	struct {
> >> +		bool manual;
> >> +
> >> +		s8 min;
> >> +		s8 max;
> >> +	} strobe;
> >> +};

[snip]

> >> +static inline bool ub960_pad_is_source(struct ub960_data *priv, u32 pad)
> >> +{
> >> +	return pad >= priv->hw_data->num_rxports &&
> >> +	       pad < (priv->hw_data->num_rxports + priv->hw_data->num_txports);
> > 
> > Can the second condition occur ?
> 
> It's an invalid pad if it happens. This is used only in a few places. 
> Probably the v4l2 framework ensures that only valid pads are passed in 
> the calls? If so, I could drop the second condition.

The V4L2 subdev operation wrappers should already ensure that, yes.

> >> +}

[snip]

> >> +static const struct ub960_format_info ub960_formats[] = {
> >> +	{ .code = MEDIA_BUS_FMT_YUYV8_1X16, .bpp = 16, .datatype = 0x1e, },
> > 
> > Include include/media/mipi-csi2.h and use the macros for the data type.
> 
> Ok.
> 
> >> +	{ .code = MEDIA_BUS_FMT_UYVY8_1X16, .bpp = 16, .datatype = 0x1e, },
> >> +	{ .code = MEDIA_BUS_FMT_VYUY8_1X16, .bpp = 16, .datatype = 0x1e, },
> >> +	{ .code = MEDIA_BUS_FMT_YVYU8_1X16, .bpp = 16, .datatype = 0x1e, },
> >> +
> >> +	/* Legacy */
> >> +	{ .code = MEDIA_BUS_FMT_YUYV8_2X8, .bpp = 16, .datatype = 0x1e, },
> >> +	{ .code = MEDIA_BUS_FMT_UYVY8_2X8, .bpp = 16, .datatype = 0x1e, },
> >> +	{ .code = MEDIA_BUS_FMT_VYUY8_2X8, .bpp = 16, .datatype = 0x1e, },
> >> +	{ .code = MEDIA_BUS_FMT_YVYU8_2X8, .bpp = 16, .datatype = 0x1e, },
> > 
> > I'd prefer dropping this and requiring drivers to use the 1X16 media bus
> > types. This is a new driver, we don't have to care about backward
> > compatibility.
> 
> I have, as I use it with other old drivers (CAL) =). I can look at that, 
> maybe I'll be able to fix it. But if I recall right, it wasn't very trivial.

If you could have a look that would be nice, we can then revisit this.

> >> +
> >> +	/* RAW */
> >> +	{ .code = MEDIA_BUS_FMT_SBGGR12_1X12, .bpp = 12, .datatype = 0x2c, },
> >> +	{ .code = MEDIA_BUS_FMT_SRGGB12_1X12, .bpp = 12, .datatype = 0x2c, },
> > 
> > Can you add the GBRG and GRBG media bus codes too ?
> 
> Ok.
> 
> >> +};

[snip]

> >> +/*
> >> + * Wait for the RX ports to lock, have no errors and have stable strobe position
> >> + * and EQ level.
> >> + */
> >> +static int ub960_rxport_wait_locks(struct ub960_data *priv,
> >> +				   unsigned long port_mask,
> >> +				   unsigned int *lock_mask)
> >> +{
> >> +	struct device *dev = &priv->client->dev;
> >> +	unsigned long timeout;
> >> +	unsigned int link_ok_mask;
> >> +	unsigned int missing;
> >> +	unsigned int loops;
> >> +	u8 nport;
> >> +	int ret;
> >> +
> >> +	if (port_mask == 0)
> >> +		return 0;
> >> +
> >> +	if (port_mask >= BIT(priv->hw_data->num_rxports))
> >> +		return -EINVAL;
> > 
> > The port_mask argument is hardcoded to GENMASK(3, 0) in the caller, does
> > that mean some things could be simplified ?
> 
> I have off-the-series patches that use this to wait for a single (or a 
> set of ports).
> 
> >> +
> >> +	timeout = jiffies + msecs_to_jiffies(1000);
> >> +	loops = 0;
> >> +	link_ok_mask = 0;
> >> +
> >> +	while (time_before(jiffies, timeout)) {
> >> +		missing = 0;
> > 
> > Do you have to restart from scratch in every iteration, or could you
> > only test the links that haven't been tested ?
> 
> Probably, but it would make the code a bit more complex, and this also 
> lets us see if a lock happens to drop. ub960_rxport_link_ok() does read 
> a bunch of registers via i2c, so I guess one could argue it creates an 
> overhead. But is that relevant?

I was thinking of the overhead, yes. I don't mind much.

> >> +
> >> +		for_each_set_bit(nport, &port_mask,
> >> +				 priv->hw_data->num_rxports) {
> >> +			struct ub960_rxport *rxport = priv->rxports[nport];
> >> +			bool ok;
> >> +
> >> +			if (!rxport)
> >> +				continue;
> >> +
> >> +			ret = ub960_rxport_link_ok(priv, nport, &ok);
> >> +			if (ret)
> >> +				return ret;
> >> +
> >> +			if (!ok || !(link_ok_mask & BIT(nport)))
> >> +				missing++;
> > 
> > Why the second part of the condition ? Do you want to test every link at
> > least twice ? A comment to explain this would be nice.
> 
> Yes, we want to see that a link has been ok for two loops. E.g. the 
> adaptive EQ might get a lock only temporarily, and then the lock drops 
> and AEQ continues looking.

Please add a comment to document that.

> >> +
> >> +			if (ok)
> >> +				link_ok_mask |= BIT(nport);
> >> +			else
> >> +				link_ok_mask &= ~BIT(nport);
> >> +		}
> >> +
> >> +		loops++;
> >> +
> >> +		if (missing == 0)
> >> +			break;
> >> +
> >> +		msleep(50);
> >> +	}
> >> +
> >> +	if (lock_mask)
> >> +		*lock_mask = link_ok_mask;
> >> +
> >> +	dev_dbg(dev, "Wait locks done in %u loops\n", loops);
> > 
> > Shouldn't you return an error in case of a timeout ?
> 
> This returns an error if something goes wrong. It's not an error that we 
> don't get the locks.
> 
> However, when we call this at probe time, we should check that the ports 
> actually locked. I'll add that.
> 
> >> +	for_each_set_bit(nport, &port_mask, priv->hw_data->num_rxports) {
> >> +		struct ub960_rxport *rxport = priv->rxports[nport];
> >> +		s8 strobe_pos, eq_level;
> >> +		u8 v1, v2;
> >> +
> >> +		if (!rxport)
> >> +			continue;
> >> +
> >> +		if (!(link_ok_mask & BIT(nport))) {
> >> +			dev_dbg(dev, "\trx%u: not locked\n", nport);
> >> +			continue;
> >> +		}
> >> +
> >> +		ub960_rxport_read(priv, nport, UB960_RR_RX_FREQ_HIGH, &v1);
> >> +		ub960_rxport_read(priv, nport, UB960_RR_RX_FREQ_LOW, &v2);
> >> +
> >> +		ret = ub960_rxport_get_strobe_pos(priv, nport, &strobe_pos);
> >> +		if (ret)
> >> +			return ret;
> >> +
> >> +		ret = ub960_rxport_get_eq_level(priv, nport, &eq_level);
> >> +		if (ret)
> >> +			return ret;
> >> +
> >> +		dev_dbg(dev, "\trx%u: locked, SP: %d, EQ: %u, freq %u Hz\n",
> >> +			nport, strobe_pos, eq_level,
> >> +			v1 * 1000000 + v2 * 1000000 / 256);
> >> +	}
> >> +
> >> +	return 0;
> >> +}

[snip]

> >> +static int ub960_rxport_add_serializer(struct ub960_data *priv, u8 nport)
> >> +{
> >> +	struct ub960_rxport *rxport = priv->rxports[nport];
> >> +	struct device *dev = &priv->client->dev;
> >> +	struct ds90ub9xx_platform_data *ser_pdata = &rxport->ser_platform_data;
> >> +	struct i2c_board_info ser_info = {
> >> +		.of_node = to_of_node(rxport->remote_fwnode),
> >> +		.fwnode = rxport->remote_fwnode,
> >> +		.platform_data = ser_pdata,
> >> +	};
> >> +
> >> +	ser_pdata->port = nport;
> >> +	ser_pdata->atr = priv->atr;
> >> +	if (priv->hw_data->is_ub9702)
> >> +		ser_pdata->bc_rate = ub960_calc_bc_clk_rate_ub9702(priv, rxport);
> >> +	else
> >> +		ser_pdata->bc_rate = ub960_calc_bc_clk_rate_ub960(priv, rxport);
> >> +
> >> +	/*
> >> +	 * Adding the serializer under rxport->adap would be cleaner, but it
> >> +	 * would need tweaks to bypass the alias table. Adding to the
> >> +	 * upstream adapter is way simpler.
> >> +	 */
> > 
> > Are you sure it will not cause any issue in the future ? The device
> > topology is visible to userspace, so it can't be changed later.
> 
> Well, there's no rxport->adap any more, and the serializer shouldn't be 
> under the rxport->adap even if we still had the old code, so I'll just 
> remove the comment.
> 
> Possibly we might add a new comment, though. What should the serializer 
> be under? It is currently an i2c device, under the same i2c bus as the 
> deserializer. Which is nice, as the deserializer HW automatically 
> forwards the i2c transactions to the serializer, so all the i2c tools 
> work out of th ebox.
> 
> But it's not really i2c device, but an fpdlink device. Changing this 
> would mean creating an fpdlink-bus, I believe, and then I guess we would 
> need some custom way to read/write the registers of the serializer...
> 
> Or we could create i2c-adapters for the fpdlinks, kind of 1-to-1 virtual 
> i2c bus, one for each serializer. Then the serializers would be under 
> the deserializer, although the bus wouldn't really be right. Then we 
> would somehow need to forward the transactions sent to the virtual 
> adapter to the actual i2c adapter, and back (somewhat like the atr, but 
> no need for translation).
> 
> I can't say I'm very familiar with linux bus design, so if you or anyone 
> has any good ideas here, I'd appreciate =).
> 
> >> +	ser_info.addr = rxport->ser_alias;
> >> +	rxport->ser_client =
> >> +		i2c_new_client_device(priv->client->adapter, &ser_info);
> >> +	if (!rxport->ser_client) {
> >> +		dev_err(dev, "rx%u: cannot add %s i2c device", nport,
> >> +			ser_info.type);
> >> +		return -EIO;
> >> +	}
> >> +
> >> +	dev_dbg(dev, "rx%u: remote serializer at alias 0x%02x (%u-%04x)\n",
> >> +		nport, rxport->ser_client->addr,
> >> +		rxport->ser_client->adapter->nr, rxport->ser_client->addr);
> >> +
> >> +	return 0;
> >> +}

[snip]

> >> +static void ub960_rxport_handle_events(struct ub960_data *priv, u8 nport)
> >> +{
> >> +	struct device *dev = &priv->client->dev;
> >> +	u8 rx_port_sts1;
> >> +	u8 rx_port_sts2;
> >> +	u8 csi_rx_sts;
> >> +	u8 bcc_sts;
> >> +	int ret = 0;
> >> +
> >> +	/* Read interrupts (also clears most of them) */
> >> +	if (!ret)
> >> +		ret = ub960_rxport_read(priv, nport, UB960_RR_RX_PORT_STS1,
> >> +					&rx_port_sts1);
> >> +	if (!ret)
> >> +		ret = ub960_rxport_read(priv, nport, UB960_RR_RX_PORT_STS2,
> >> +					&rx_port_sts2);
> >> +	if (!ret)
> >> +		ret = ub960_rxport_read(priv, nport, UB960_RR_CSI_RX_STS,
> >> +					&csi_rx_sts);
> >> +	if (!ret)
> >> +		ret = ub960_rxport_read(priv, nport, UB960_RR_BCC_STATUS,
> >> +					&bcc_sts);
> >> +
> >> +	if (ret)
> >> +		return;
> >> +
> >> +	if (rx_port_sts1 & UB960_RR_RX_PORT_STS1_PARITY_ERROR) {
> >> +		u8 v1, v2;
> >> +
> >> +		ub960_rxport_read(priv, nport, UB960_RR_RX_PAR_ERR_HI, &v1);
> >> +		ub960_rxport_read(priv, nport, UB960_RR_RX_PAR_ERR_LO, &v2);
> > 
> > 16-bit register access would be nice. This can be done on top. Please
> > record all future tasks in a todo list btw :-)
> 
> Ok.
> 
> >> +		dev_err(dev, "rx%u parity errors: %u\n", nport, (v1 << 8) | v2);
> > 
> > Do any of these errors need to be rate-limited ?
> 
> We only support polling, so they won't spam too much. I don't know if we 
> even want this kind of printing. It has been useful during development, 
> for sure, but possibly in a production device many of these don't 
> warrant a print, but rather some other means for the userspace to fetch 
> e.g. the number of parity errors.
> 
> It's a bit difficult to say, as I don't have a product for these.
> 
> These prints could be easily hidden behind a module/compilation 
> parameter if needed.

Counters accessible through debugfs could be nice. Something to think
about for later I suppose.

> >> +	}
> >> +
> >> +	if (rx_port_sts1 & UB960_RR_RX_PORT_STS1_BCC_CRC_ERROR)
> >> +		dev_err(dev, "rx%u BCC CRC error\n", nport);
> >> +
> >> +	if (rx_port_sts1 & UB960_RR_RX_PORT_STS1_BCC_SEQ_ERROR)
> >> +		dev_err(dev, "rx%u BCC SEQ error\n", nport);
> >> +
> >> +	if (rx_port_sts2 & UB960_RR_RX_PORT_STS2_LINE_LEN_UNSTABLE)
> >> +		dev_err(dev, "rx%u line length unstable\n", nport);
> >> +
> >> +	if (rx_port_sts2 & UB960_RR_RX_PORT_STS2_FPD3_ENCODE_ERROR)
> >> +		dev_err(dev, "rx%u FPD3 encode error\n", nport);
> >> +
> >> +	if (rx_port_sts2 & UB960_RR_RX_PORT_STS2_BUFFER_ERROR)
> >> +		dev_err(dev, "rx%u buffer error\n", nport);
> >> +
> >> +	if (csi_rx_sts)
> >> +		dev_err(dev, "rx%u CSI error: %#02x\n", nport, csi_rx_sts);
> >> +
> >> +	if (csi_rx_sts & UB960_RR_CSI_RX_STS_ECC1_ERR)
> >> +		dev_err(dev, "rx%u CSI ECC1 error\n", nport);
> >> +
> >> +	if (csi_rx_sts & UB960_RR_CSI_RX_STS_ECC2_ERR)
> >> +		dev_err(dev, "rx%u CSI ECC2 error\n", nport);
> >> +
> >> +	if (csi_rx_sts & UB960_RR_CSI_RX_STS_CKSUM_ERR)
> >> +		dev_err(dev, "rx%u CSI checksum error\n", nport);
> >> +
> >> +	if (csi_rx_sts & UB960_RR_CSI_RX_STS_LENGTH_ERR)
> >> +		dev_err(dev, "rx%u CSI length error\n", nport);
> >> +
> >> +	if (bcc_sts)
> >> +		dev_err(dev, "rx%u BCC error: %#02x\n", nport, bcc_sts);
> >> +
> >> +	if (bcc_sts & UB960_RR_BCC_STATUS_RESP_ERR)
> >> +		dev_err(dev, "rx%u BCC response error", nport);
> >> +
> >> +	if (bcc_sts & UB960_RR_BCC_STATUS_SLAVE_TO)
> >> +		dev_err(dev, "rx%u BCC slave timeout", nport);
> >> +
> >> +	if (bcc_sts & UB960_RR_BCC_STATUS_SLAVE_ERR)
> >> +		dev_err(dev, "rx%u BCC slave error", nport);
> >> +
> >> +	if (bcc_sts & UB960_RR_BCC_STATUS_MASTER_TO)
> >> +		dev_err(dev, "rx%u BCC master timeout", nport);
> >> +
> >> +	if (bcc_sts & UB960_RR_BCC_STATUS_MASTER_ERR)
> >> +		dev_err(dev, "rx%u BCC master error", nport);
> >> +
> >> +	if (bcc_sts & UB960_RR_BCC_STATUS_SEQ_ERROR)
> >> +		dev_err(dev, "rx%u BCC sequence error", nport);
> >> +
> >> +	if (rx_port_sts2 & UB960_RR_RX_PORT_STS2_LINE_LEN_CHG) {
> >> +		u8 v1, v2;
> >> +
> >> +		ub960_rxport_read(priv, nport, UB960_RR_LINE_LEN_1, &v1);
> >> +		ub960_rxport_read(priv, nport, UB960_RR_LINE_LEN_0, &v2);
> >> +		dev_dbg(dev, "rx%u line len changed: %u\n", nport,
> >> +			(v1 << 8) | v2);
> >> +	}
> >> +
> >> +	if (rx_port_sts2 & UB960_RR_RX_PORT_STS2_LINE_CNT_CHG) {
> >> +		u8 v1, v2;
> >> +
> >> +		ub960_rxport_read(priv, nport, UB960_RR_LINE_COUNT_HI, &v1);
> >> +		ub960_rxport_read(priv, nport, UB960_RR_LINE_COUNT_LO, &v2);
> >> +		dev_dbg(dev, "rx%u line count changed: %u\n", nport,
> >> +			(v1 << 8) | v2);
> >> +	}
> >> +
> >> +	if (rx_port_sts1 & UB960_RR_RX_PORT_STS1_LOCK_STS_CHG) {
> >> +		dev_dbg(dev, "rx%u: %s, %s, %s, %s\n", nport,
> >> +			(rx_port_sts1 & UB960_RR_RX_PORT_STS1_LOCK_STS) ?
> >> +				"locked" :
> >> +				"unlocked",
> >> +			(rx_port_sts1 & UB960_RR_RX_PORT_STS1_PORT_PASS) ?
> >> +				"passed" :
> >> +				"not passed",
> >> +			(rx_port_sts2 & UB960_RR_RX_PORT_STS2_CABLE_FAULT) ?
> >> +				"no clock" :
> >> +				"clock ok",
> >> +			(rx_port_sts2 & UB960_RR_RX_PORT_STS2_FREQ_STABLE) ?
> >> +				"stable freq" :
> >> +				"unstable freq");
> >> +	}
> >> +}

[snip]

> >> +static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
> >> +					       struct v4l2_subdev_state *state)
> >> +{
> >> +	const struct v4l2_subdev_krouting *routing = &state->routing;
> >> +	u8 fwd_ctl;
> >> +	struct {
> >> +		u32 num_streams;
> >> +		u8 pixel_dt;
> >> +		u8 meta_dt;
> >> +		u32 meta_lines;
> >> +		u32 tx_port;
> >> +	} rx_data[UB960_MAX_RX_NPORTS] = { };
> >> +	u8 vc_map[UB960_MAX_RX_NPORTS] = { };
> >> +
> >> +	ub960_get_vc_maps(priv, state, vc_map);
> >> +
> >> +	for (unsigned int i = 0; i < routing->num_routes; ++i) {
> >> +		struct v4l2_subdev_route *route = &routing->routes[i];
> > 
> > for_each_active_route()
> 
> Ok.
> 
> >> +		struct ub960_rxport *rxport;
> >> +		struct ub960_txport *txport;
> >> +		struct v4l2_mbus_framefmt *fmt;
> >> +		const struct ub960_format_info *ub960_fmt;
> >> +		unsigned int nport;
> >> +
> >> +		nport = ub960_pad_to_port(priv, route->sink_pad);
> >> +
> >> +		rxport = priv->rxports[nport];
> >> +		if (!rxport)
> >> +			return -EINVAL;
> >> +
> >> +		txport = priv->txports[ub960_pad_to_port(priv, route->source_pad)];
> >> +		if (!txport)
> >> +			return -EINVAL;
> >> +
> >> +		rx_data[nport].tx_port = ub960_pad_to_port(priv, route->source_pad);
> >> +
> >> +		rx_data[nport].num_streams++;
> >> +
> >> +		/* For the rest, we are only interested in parallel busses */
> >> +		if (rxport->rx_mode == RXPORT_MODE_CSI2_SYNC ||
> >> +		    rxport->rx_mode == RXPORT_MODE_CSI2_ASYNC)
> >> +			continue;
> >> +
> >> +		if (rx_data[nport].num_streams > 2)
> >> +			return -EPIPE;
> >> +
> >> +		fmt = v4l2_subdev_state_get_stream_format(state,
> >> +							  route->sink_pad,
> >> +							  route->sink_stream);
> >> +		if (!fmt)
> >> +			return -EPIPE;
> >> +
> >> +		ub960_fmt = ub960_find_format(fmt->code);
> >> +		if (!ub960_fmt)
> >> +			return -EPIPE;
> >> +
> >> +		if (ub960_fmt->meta) {
> >> +			if (fmt->height > 3) {
> >> +				dev_err(&priv->client->dev,
> >> +					"rx%u: unsupported metadata height %u\n",
> >> +					nport, fmt->height);
> >> +				return -EPIPE;
> >> +			}
> >> +
> >> +			rx_data[nport].meta_dt = ub960_fmt->datatype;
> >> +			rx_data[nport].meta_lines = fmt->height;
> >> +		} else {
> >> +			rx_data[nport].pixel_dt = ub960_fmt->datatype;
> >> +		}
> >> +	}
> >> +
> >> +	/* Configure RX ports */
> >> +
> >> +	fwd_ctl = 0;
> >> +
> >> +	for (unsigned int nport = 0; nport < priv->hw_data->num_rxports; ++nport) {
> >> +		struct ub960_rxport *rxport = priv->rxports[nport];
> >> +		u8 vc = vc_map[nport];
> >> +
> >> +		if (rx_data[nport].num_streams == 0)
> >> +			continue;
> >> +
> >> +		switch (rxport->rx_mode) {
> >> +		case RXPORT_MODE_RAW10:
> >> +			ub960_rxport_write(priv, nport, UB960_RR_RAW10_ID,
> >> +				rx_data[nport].pixel_dt | (vc << UB960_RR_RAW10_ID_VC_SHIFT));
> >> +
> >> +			ub960_rxport_write(priv, rxport->nport,
> >> +				UB960_RR_RAW_EMBED_DTYPE,
> >> +				(rx_data[nport].meta_lines << UB960_RR_RAW_EMBED_DTYPE_LINES_SHIFT) |
> >> +					rx_data[nport].meta_dt);
> >> +
> >> +			break;
> >> +
> >> +		case RXPORT_MODE_RAW12_HF:
> >> +		case RXPORT_MODE_RAW12_LF:
> >> +			/* Not implemented */
> >> +			break;
> >> +
> >> +		case RXPORT_MODE_CSI2_SYNC:
> >> +		case RXPORT_MODE_CSI2_ASYNC:
> >> +			if (!priv->hw_data->is_ub9702) {
> >> +				/* Map all VCs from this port to the same VC */
> > 
> > Does this mean that a camera that sends data over multiple virtual
> > channels will see all its VCs merged into one ? That doesn't sound good.
> 
> Yes. I don't know how to implement a configurable mapping. The driver 
> could always manage the mapping itself, I think, but that might not work 
> if the receiver expects certain VCs (say, on an FPGA platform).

An interesting question indeed. Let's discuss it with Sakari at some
point.

> > You don't have to fix it to get this patch merged, but I think it should
> > be flagged as a fatal error.
> 
> Yes, I can add code to validate that the source subdevices only provide 
> streams using a single VC.
> 
> >> +				ub960_rxport_write(priv, nport, UB960_RR_CSI_VC_MAP,
> >> +						   (vc << UB960_RR_CSI_VC_MAP_SHIFT(3)) |
> >> +						   (vc << UB960_RR_CSI_VC_MAP_SHIFT(2)) |
> >> +						   (vc << UB960_RR_CSI_VC_MAP_SHIFT(1)) |
> >> +						   (vc << UB960_RR_CSI_VC_MAP_SHIFT(0)));
> >> +			} else {
> >> +				unsigned int i;
> >> +
> >> +				/* Map all VCs from this port to VC(nport) */
> >> +				for (i = 0; i < 8; ++i)
> >> +					ub960_rxport_write(priv, nport,
> >> +							   UB960_RR_VC_ID_MAP(i),
> >> +							   nport);
> >> +			}
> >> +
> >> +			break;
> >> +		}
> >> +
> >> +		/* Forwarding */
> >> +
> >> +		fwd_ctl |= BIT(4 + nport); /* forward disable */
> >> +
> >> +		if (rx_data[nport].tx_port == 1)
> >> +			fwd_ctl |= BIT(nport); /* forward to TX1 */
> >> +		else
> >> +			fwd_ctl &= ~BIT(nport); /* forward to TX0 */
> >> +	}
> >> +
> >> +	ub960_write(priv, UB960_SR_FWD_CTL1, fwd_ctl);
> >> +
> >> +	return 0;
> >> +}

[snip]

> >> +
> >> +static void ub960_update_streaming_status(struct ub960_data *priv)
> >> +{
> >> +	unsigned int i;
> >> +
> >> +	for (i = 0; i < UB960_MAX_NPORTS; ++i) {
> >> +		if (priv->stream_enable_mask[i])
> >> +			break;
> >> +	}
> >> +
> >> +	priv->streaming = i < UB960_MAX_NPORTS;
> > 
> > priv->streaming is a boolean, is this really what you intended ?
> 
> What do you mean? "i < UB960_MAX_NPORTS" is boolean too.

I had misread it as

	priv->streaming = i << UB960_MAX_NPORTS;

sorry.

> >> +}
> >> +
> >> +static int ub960_enable_streams(struct v4l2_subdev *sd,
> >> +				struct v4l2_subdev_state *state, u32 source_pad,
> >> +				u64 source_streams_mask)
> >> +{
> >> +	struct ub960_data *priv = sd_to_ub960(sd);
> >> +	struct device *dev = &priv->client->dev;
> >> +	const struct v4l2_subdev_krouting *routing;
> >> +	unsigned int source_stream;
> >> +	int ret;
> >> +	u64 sink_streams[UB960_MAX_RX_NPORTS] = { };
> >> +	unsigned int nport;
> >> +	unsigned int failed_port;
> >> +
> >> +	dev_dbg(dev, "Enable streams %u:%#llx\n", source_pad,
> >> +		source_streams_mask);
> > 
> > I'd move this to v4l2_subdev_enable_streams() if you want to keep it.
> 
> Hmm... I'll have to think about this. At the moment my debugging is 
> easy, I use "dyndbg=+p" when I load the ub960 module, and I get a 
> relatively short debug log of the important events happening wrt. ub960. 
> Scattering the debug prints into other modules will make that more 
> difficult.

But at the same time, duplicating this kind of (useful) message in all
drivers isn't great.

> >> +
> >> +	if (priv->stream_enable_mask[source_pad] & source_streams_mask) {
> >> +		dev_err(dev,
> >> +			"cannot enable already enabled streams on pad %u mask %#llx\n",
> >> +			source_pad, source_streams_mask);
> >> +		return -EBUSY;
> >> +	}
> > 
> > Isn't this caught by v4l2_subdev_enable_streams() already ?
> 
> Yes, I'll drop this.
> 
> >> +
> >> +	routing = &state->routing;
> >> +
> >> +	if (!priv->streaming) {
> >> +		dev_dbg(dev, "Prepare for streaming\n");
> >> +		ret = ub960_configure_ports_for_streaming(priv, state);
> >> +		if (ret)
> >> +			return ret;
> >> +	}
> >> +
> >> +	/* Enable TX port if not yet enabled */
> >> +	if (!priv->stream_enable_mask[source_pad]) {
> >> +		ret = ub960_enable_tx_port(priv,
> >> +					   ub960_pad_to_port(priv, source_pad));
> >> +		if (ret)
> >> +			return ret;
> >> +	}
> >> +
> >> +	priv->stream_enable_mask[source_pad] |= source_streams_mask;
> >> +
> >> +	/* Collect sink streams per pad which we need to enable */
> >> +	for (source_stream = 0; source_stream < sizeof(source_streams_mask) * 8;
> >> +	     ++source_stream) {
> >> +		struct v4l2_subdev_route *route;
> >> +
> >> +		if (!(source_streams_mask & BIT_ULL(source_stream)))
> >> +			continue;
> > 
> > I would have sworn some kind of for_each_bit_set() macro existed.
> 
> I used that earlier. I changed it due to Sakari's comments:
> 
> >>> Does this work as expected? The second argument is expected to be unsigned
> >>> long (or an array of two of them) whereas you have a u64.
> >>
> >> Where do you see that? I thought find_next_bit (used by for_each_set_bit) is
> >> given a start address and arbitrarily large bit-size number.
> > 
> > sink_streams_mask is a u64 while for_each_set_bit() expects an array of
> > unsigned longs. Endianness matters.
> 
> I couldn't quite figure out how they work, as there's no clear 
> documentation and the calls quickly scatter to arch specific and asm 
> code. So I just open wrote it, to be on the safe side.

Makes sense. It doesn't matter anyway as it goes away with the simpler
proposal below :-)

> >> +
> >> +		for_each_active_route(routing, route) {
> > 
> > Use &state->routing here and drop the local routing variable.
> 
> Ok.
> 
> >> +			if (!(route->source_pad == source_pad) ||
> >> +			    !(route->source_stream == source_stream))
> >> +				continue;
> >> +
> >> +			nport = ub960_pad_to_port(priv, route->sink_pad);
> >> +
> >> +			sink_streams[nport] |= BIT_ULL(route->sink_stream);
> >> +		}
> >> +	}
> > 
> > I think it would be more efficient to swap the loops:
> > 
> > 	/* Collect sink streams per pad which we need to enable */
> > 	for_each_active_route(&state->routing, route) {
> > 		if (route->source_pad != source_pad ||
> > 		    !(source_streams_mask & BIT_ULL(route->source_stream)))
> > 			continue;
> > 
> > 		nport = ub960_pad_to_port(priv, route->sink_pad);
> > 
> > 		sink_streams[nport] |= BIT_ULL(route->sink_stream);
> > 	}
> > 
> > Same below.
> 
> Yes, that is simpler.
> 
> >> +
> >> +	for (nport = 0; nport < priv->hw_data->num_rxports; ++nport) {
> >> +		if (!sink_streams[nport])
> >> +			continue;
> >> +
> >> +		/* Enable the RX port if not yet enabled */
> >> +		if (!priv->stream_enable_mask[nport]) {
> >> +			ret = ub960_enable_rx_port(priv, nport);
> >> +			if (ret) {
> >> +				failed_port = nport;
> >> +				goto err;
> >> +			}
> >> +		}
> >> +
> >> +		priv->stream_enable_mask[nport] |= sink_streams[nport];
> >> +
> >> +		dev_dbg(dev, "Enable RX port %u streams %#llx\n", nport,
> >> +			sink_streams[nport]);
> >> +
> >> +		ret = v4l2_subdev_enable_streams(
> >> +			priv->rxports[nport]->source_sd,
> >> +			priv->rxports[nport]->source_sd_pad,
> >> +			sink_streams[nport]);
> >> +		if (ret) {
> >> +			priv->stream_enable_mask[nport] &= ~sink_streams[nport];
> >> +
> >> +			if (!priv->stream_enable_mask[nport])
> >> +				ub960_disable_rx_port(priv, nport);
> >> +
> >> +			failed_port = nport;
> >> +			goto err;
> >> +		}
> >> +	}
> >> +
> >> +	priv->streaming = true;
> >> +
> >> +	return 0;
> >> +
> >> +err:
> >> +	for (nport = 0; nport < failed_port; ++nport) {
> >> +		if (!sink_streams[nport])
> >> +			continue;
> >> +
> >> +		dev_dbg(dev, "Disable RX port %u streams %#llx\n", nport,
> >> +			sink_streams[nport]);
> >> +
> >> +		ret = v4l2_subdev_disable_streams(
> >> +			priv->rxports[nport]->source_sd,
> >> +			priv->rxports[nport]->source_sd_pad,
> >> +			sink_streams[nport]);
> >> +		if (ret)
> >> +			dev_err(dev, "Failed to disable streams: %d\n", ret);
> >> +
> >> +		priv->stream_enable_mask[nport] &= ~sink_streams[nport];
> >> +
> >> +		/* Disable RX port if no active streams */
> >> +		if (!priv->stream_enable_mask[nport])
> >> +			ub960_disable_rx_port(priv, nport);
> >> +	}
> >> +
> >> +	priv->stream_enable_mask[source_pad] &= ~source_streams_mask;
> >> +
> >> +	if (!priv->stream_enable_mask[source_pad])
> >> +		ub960_disable_tx_port(priv,
> >> +				      ub960_pad_to_port(priv, source_pad));
> >> +
> >> +	ub960_update_streaming_status(priv);
> >> +
> >> +	return ret;
> >> +}

[snip]

> >> +static int ub960_set_fmt(struct v4l2_subdev *sd,
> >> +			 struct v4l2_subdev_state *state,
> >> +			 struct v4l2_subdev_format *format)
> >> +{
> >> +	struct ub960_data *priv = sd_to_ub960(sd);
> >> +	struct v4l2_mbus_framefmt *fmt;
> >> +
> >> +	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE && priv->streaming)
> >> +		return -EBUSY;
> >> +
> >> +	/* No transcoding, source and sink formats must match. */
> >> +	if (ub960_pad_is_source(priv, format->pad))
> >> +		return v4l2_subdev_get_fmt(sd, state, format);
> >> +
> >> +	/* TODO: implement fmt validation */
> > 
> > Looks like something that should be done sooner than later :-)
> 
> First you ask for a TODO list. Then when I have TODO items, that's not 
> good either!

:-)

> >> +
> >> +	fmt = v4l2_subdev_state_get_stream_format(state, format->pad,
> >> +						  format->stream);
> >> +	if (!fmt)
> >> +		return -EINVAL;
> >> +
> >> +	*fmt = format->format;
> >> +
> >> +	fmt = v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
> >> +							   format->stream);
> >> +	if (!fmt)
> >> +		return -EINVAL;
> >> +
> >> +	*fmt = format->format;
> >> +
> >> +	return 0;
> >> +}

[snip]

> >> +static int
> >> +ub960_parse_dt_rxport_link_properties(struct ub960_data *priv,
> >> +				      struct fwnode_handle *link_fwnode,
> >> +				      struct ub960_rxport *rxport)
> >> +{
> >> +	struct device *dev = &priv->client->dev;
> >> +	unsigned int nport = rxport->nport;
> >> +	u32 rx_mode;
> >> +	u32 cdr_mode;
> >> +	s32 strobe_pos;
> >> +	u32 eq_level;
> >> +	u32 ser_i2c_alias;
> >> +	int ret;
> >> +
> >> +	ret = fwnode_property_read_u32(link_fwnode, "ti,cdr-mode", &cdr_mode);
> >> +	if (ret == -EINVAL) {
> >> +		cdr_mode = RXPORT_CDR_FPD3;
> > 
> > You could also initialize the variable to RXPORT_CDR_FDP3, and only
> > check for
> > 
> > 	if (ret < 0 && ret != -EINVAL) {
> > 		...
> > 	}
> > 
> > Up to you. Similar refactorings can be done below, I think they would
> > make the code simpler.
> 
> A bit shorter, at least. I like it.
> 
> But what other similar places did you see?

There doesn't seem to be any indeed.

> >> +	} else if (ret < 0) {
> >> +		dev_err(dev, "rx%u: failed to read 'ti,cdr-mode': %d\n", nport,
> > 
> > If you moved the "ti,cdr-mode" to an argument, printed with %s, the same
> > format string would be used for the other properties below, and should
> > thus be de-duplicated by the compiler.
> 
> I'm not quite sure if this is a sensible optimization or not, but I did 
> it so that I introduce:
> 
> const char *read_err_str = "rx%u: failed to read '%s': %d\n";

static

> and then use that in the function, which makes the lines much shorter 
> and, I think, a bit more readable.

If you use the same string literal multiple times, the compiler should
de-duplicate it automatically, so you don't have to create a variable
manually.

> >> +			ret);
> >> +		return ret;
> >> +	}
> >> +
> >> +	if (cdr_mode > RXPORT_CDR_LAST) {
> >> +		dev_err(dev, "rx%u: bad 'ti,cdr-mode' %u\n", nport, cdr_mode);
> >> +		return -EINVAL;
> >> +	}
> >> +
> >> +	if (!priv->hw_data->is_fpdlink4 && cdr_mode == RXPORT_CDR_FPD4) {
> >> +		dev_err(dev, "rx%u: FPD-Link 4 CDR not supported\n", nport);
> >> +		return -EINVAL;
> >> +	}
> >> +
> >> +	rxport->cdr_mode = cdr_mode;
> >> +
> >> +	ret = fwnode_property_read_u32(link_fwnode, "ti,rx-mode", &rx_mode);
> >> +	if (ret < 0) {
> >> +		dev_err(dev, "rx%u: failed to read 'ti,rx-mode': %d\n", nport,
> >> +			ret);
> >> +		return ret;
> >> +	}
> >> +
> >> +	if (rx_mode > RXPORT_MODE_LAST) {
> >> +		dev_err(dev, "rx%u: bad 'ti,rx-mode' %u\n", nport, rx_mode);
> >> +		return -EINVAL;
> >> +	}
> >> +
> >> +	rxport->rx_mode = rx_mode;
> >> +
> >> +	/* EQ & Strobe related */
> >> +
> >> +	/* Defaults */
> >> +	rxport->eq.manual_eq = false;
> >> +	rxport->eq.aeq.eq_level_min = UB960_MIN_EQ_LEVEL;
> >> +	rxport->eq.aeq.eq_level_max = UB960_MAX_EQ_LEVEL;
> >> +
> >> +	ret = fwnode_property_read_u32(link_fwnode, "ti,strobe-pos",
> >> +				       &strobe_pos);
> >> +	if (ret) {
> >> +		if (ret != -EINVAL) {
> >> +			dev_err(dev,
> >> +				"rx%u: failed to read 'ti,strobe-pos': %d\n",
> >> +				nport, ret);
> >> +			return ret;
> >> +		}
> >> +	} else if (strobe_pos < UB960_MIN_MANUAL_STROBE_POS ||
> >> +		   strobe_pos > UB960_MAX_MANUAL_STROBE_POS) {
> >> +		dev_err(dev, "rx%u: illegal 'strobe-pos' value: %d\n", nport,
> >> +			strobe_pos);
> >> +	} else {
> >> +		/* NOTE: ignored unless global manual strobe pos is set */
> >> +		rxport->eq.strobe_pos = strobe_pos;
> >> +		if (!priv->strobe.manual)
> >> +			dev_warn(dev,
> >> +				 "rx%u: 'ti,strobe-pos' ignored as 'ti,manual-strobe' not set\n",
> >> +				 nport);
> >> +	}
> >> +
> >> +	ret = fwnode_property_read_u32(link_fwnode, "ti,eq-level", &eq_level);
> >> +	if (ret) {
> >> +		if (ret != -EINVAL) {
> >> +			dev_err(dev, "rx%u: failed to read 'ti,eq-level': %d\n",
> >> +				nport, ret);
> >> +			return ret;
> >> +		}
> >> +	} else if (eq_level > UB960_MAX_EQ_LEVEL) {
> >> +		dev_err(dev, "rx%u: illegal 'ti,eq-level' value: %d\n", nport,
> >> +			eq_level);
> >> +	} else {
> >> +		rxport->eq.manual_eq = true;
> >> +		rxport->eq.manual.eq_level = eq_level;
> >> +	}
> >> +
> >> +	ret = fwnode_property_read_u32(link_fwnode, "i2c-alias",
> >> +				       &ser_i2c_alias);
> >> +	if (ret) {
> >> +		dev_err(dev, "rx%u: failed to read 'i2c-alias': %d\n", nport,
> >> +			ret);
> >> +		return ret;
> >> +	}
> >> +	rxport->ser_alias = ser_i2c_alias;
> >> +
> >> +	rxport->remote_fwnode = fwnode_get_named_child_node(link_fwnode, "serializer");
> >> +	if (!rxport->remote_fwnode) {
> >> +		dev_err(dev, "rx%u: missing 'serializer' node\n", nport);
> >> +		return -EINVAL;
> >> +	}
> >> +
> >> +	return 0;
> >> +}

[snip]

> >> +static void ub960_notify_unbind(struct v4l2_async_notifier *notifier,
> >> +				struct v4l2_subdev *subdev,
> >> +				struct v4l2_async_subdev *asd)
> >> +{
> >> +	struct ub960_rxport *rxport = to_ub960_asd(asd)->rxport;
> >> +
> >> +	rxport->source_sd = NULL;
> > 
> > Does this serve any purpose ? If not, I'd drop the unbind handler.
> 
> It makes sure we don't access the source subdev after it has been 
> unbound. I don't see much harm with this function, but can catch cleanup 
> errors.

Do you mean we'll crash on a NULL pointer dereference instead of
accessing freed memory if this happens ? I suppose it's marginally
better :-)

> >> +}

[snip]

> >> +static int ub960_create_subdev(struct ub960_data *priv)
> >> +{
> >> +	struct device *dev = &priv->client->dev;
> >> +	unsigned int i;
> >> +	int ret;
> >> +
> >> +	v4l2_i2c_subdev_init(&priv->sd, priv->client, &ub960_subdev_ops);
> > 
> > A blank line would be nice.
> 
> Ok.
> 
> >> +	v4l2_ctrl_handler_init(&priv->ctrl_handler, 1);
> > 
> > You create two controls.
> 
> Yep. Although I dropped TPG, so only one again.
> 
> >> +	priv->sd.ctrl_handler = &priv->ctrl_handler;
> >> +
> >> +	v4l2_ctrl_new_std_menu_items(&priv->ctrl_handler, &ub960_ctrl_ops,
> >> +				     V4L2_CID_TEST_PATTERN,
> >> +				     ARRAY_SIZE(ub960_tpg_qmenu) - 1, 0, 0,
> >> +				     ub960_tpg_qmenu);
> >> +
> >> +	v4l2_ctrl_new_int_menu(&priv->ctrl_handler, NULL, V4L2_CID_LINK_FREQ,
> >> +			       ARRAY_SIZE(priv->tx_link_freq) - 1, 0,
> >> +			       priv->tx_link_freq);
> >> +
> >> +	if (priv->ctrl_handler.error) {
> >> +		ret = priv->ctrl_handler.error;
> >> +		goto err_free_ctrl;
> >> +	}
> >> +
> >> +	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
> >> +			  V4L2_SUBDEV_FL_HAS_EVENTS | V4L2_SUBDEV_FL_STREAMS;
> >> +	priv->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
> >> +	priv->sd.entity.ops = &ub960_entity_ops;
> >> +
> >> +	for (i = 0; i < priv->hw_data->num_rxports + priv->hw_data->num_txports; i++) {
> >> +		priv->pads[i].flags = ub960_pad_is_sink(priv, i) ?
> >> +					      MEDIA_PAD_FL_SINK :
> >> +					      MEDIA_PAD_FL_SOURCE;
> >> +	}
> >> +
> >> +	ret = media_entity_pads_init(&priv->sd.entity,
> >> +				     priv->hw_data->num_rxports +
> >> +					     priv->hw_data->num_txports,
> > 
> > :-(
> 
> I don't have strong opinion on this, but don't you find it a bit 
> confusing if a single argument spans multiple lines but without any indent?
> 
> With a quick look, this looks like a call with 4 arguments:
> 
> ret = media_entity_pads_init(&priv->sd.entity,
> 			     priv->hw_data->num_rxports +
> 			     priv->hw_data->num_txports,
> 			     priv->pads);

I suppose I'm used to it, so it appears more readable to me. It's also
the style used through most of the kernel. There's of course always the
option of storing the result of the computation in a local variable.

> >> +				     priv->pads);
> >> +	if (ret)
> >> +		goto err_free_ctrl;
> >> +
> >> +	priv->sd.state_lock = priv->sd.ctrl_handler->lock;
> >> +
> >> +	ret = v4l2_subdev_init_finalize(&priv->sd);
> >> +	if (ret)
> >> +		goto err_entity_cleanup;
> >> +
> >> +	ret = ub960_v4l2_notifier_register(priv);
> >> +	if (ret) {
> >> +		dev_err(dev, "v4l2 subdev notifier register failed: %d\n", ret);
> >> +		goto err_free_state;
> >> +	}
> >> +
> >> +	ret = v4l2_async_register_subdev(&priv->sd);
> >> +	if (ret) {
> >> +		dev_err(dev, "v4l2_async_register_subdev error: %d\n", ret);
> >> +		goto err_unreg_notif;
> >> +	}
> >> +
> >> +	return 0;
> >> +
> >> +err_unreg_notif:
> >> +	ub960_v4l2_notifier_unregister(priv);
> >> +err_free_state:
> > 
> > err_subdev_cleanup:
> 
> Yep.
> 
> >> +	v4l2_subdev_cleanup(&priv->sd);
> >> +err_entity_cleanup:
> >> +	media_entity_cleanup(&priv->sd.entity);
> >> +err_free_ctrl:
> >> +	v4l2_ctrl_handler_free(&priv->ctrl_handler);
> >> +
> >> +	return ret;
> >> +}

[snip]

> >> +static int ub960_probe(struct i2c_client *client)
> >> +{
> >> +	struct device *dev = &client->dev;
> >> +	struct ub960_data *priv;
> >> +	int ret;
> >> +
> >> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> >> +	if (!priv)
> >> +		return -ENOMEM;
> >> +
> >> +	priv->client = client;
> >> +
> >> +	priv->hw_data = device_get_match_data(dev);
> >> +
> >> +	mutex_init(&priv->reg_lock);
> >> +	mutex_init(&priv->atr_alias_table.lock);
> >> +
> >> +	INIT_DELAYED_WORK(&priv->poll_work, ub960_handler_work);
> >> +
> >> +	/*
> >> +	 * Initialize these to invalid values so that the first reg writes will
> >> +	 * configure the target.
> >> +	 */
> >> +	priv->current_indirect_target = 0xff;
> >> +	priv->current_read_rxport = 0xff;
> >> +	priv->current_write_rxport_mask = 0xff;
> >> +	priv->current_read_csiport = 0xff;
> >> +	priv->current_write_csiport_mask = 0xff;
> >> +
> >> +	ret = ub960_get_hw_resources(priv);
> >> +	if (ret)
> >> +		goto err_mutex_destroy;
> >> +
> >> +	ret = ub960_enable_core_hw(priv);
> >> +	if (ret)
> >> +		goto err_mutex_destroy;
> >> +
> >> +	/* release GPIO lock */
> >> +	if (priv->hw_data->is_ub9702)
> >> +		ub960_update_bits(priv, UB960_SR_RESET,
> >> +				  UB960_SR_RESET_GPIO_LOCK_RELEASE,
> >> +				  UB960_SR_RESET_GPIO_LOCK_RELEASE);
> > 
> > Could this be moved to ub960_enable_core_hw() ?
> 
> Yes.
> 
> >> +
> >> +	ret = ub960_parse_dt(priv);
> >> +	if (ret)
> >> +		goto err_disable_core_hw;
> >> +
> >> +	ret = ub960_init_tx_ports(priv);
> >> +	if (ret)
> >> +		goto err_free_ports;
> >> +
> >> +	ret = ub960_rxport_enable_vpocs(priv);
> >> +	if (ret)
> >> +		goto err_free_ports;
> >> +
> >> +	ret = ub960_init_rx_ports(priv);
> >> +	if (ret)
> >> +		goto err_disable_vpocs;
> >> +
> >> +	ub960_reset(priv, false);
> >> +
> >> +	ub960_rxport_wait_locks(priv, GENMASK(3, 0), NULL);
> >> +
> >> +	/*
> >> +	 * Clear any errors caused by switching the RX port settings while
> >> +	 * probing.
> >> +	 */
> >> +	ub960_clear_rx_errors(priv);
> >> +
> >> +	ret = ub960_init_atr(priv);
> >> +	if (ret)
> >> +		goto err_disable_vpocs;
> >> +
> >> +	ret = ub960_rxport_add_serializers(priv);
> >> +	if (ret)
> >> +		goto err_uninit_atr;
> >> +
> >> +	ret = ub960_create_subdev(priv);
> >> +	if (ret)
> >> +		goto err_free_sers;
> >> +
> >> +	if (client->irq)
> >> +		dev_warn(dev, "irq support not implemented, using polling\n");
> > 
> > That's not nice :-( Can it be fixed ? I'm OK if you do so on top.
> 
> Fixed? You mean implemented? I don't have HW, so I'd rather leave it to 
> someone who has.

Yes, I meant implemented. The fact that we wake up the system every
500ms for I2C transfers isn't great, although I suppose in systems that
use FPD-Link, that may not matter that much.

> >> +
> >> +	schedule_delayed_work(&priv->poll_work,
> >> +			      msecs_to_jiffies(UB960_POLL_TIME_MS));
> >> +
> >> +	return 0;
> >> +
> >> +err_free_sers:
> >> +	ub960_rxport_remove_serializers(priv);
> >> +err_uninit_atr:
> >> +	ub960_uninit_atr(priv);
> >> +err_disable_vpocs:
> >> +	ub960_rxport_disable_vpocs(priv);
> >> +err_free_ports:
> >> +	ub960_rxport_free_ports(priv);
> >> +	ub960_txport_free_ports(priv);
> >> +err_disable_core_hw:
> >> +	ub960_disable_core_hw(priv);
> >> +err_mutex_destroy:
> >> +	mutex_destroy(&priv->atr_alias_table.lock);
> >> +	mutex_destroy(&priv->reg_lock);
> >> +	return ret;
> >> +}

[snip]

> I hope I caught all the review comments. I have addressed many of them 
> already in my branch, and I have this todo. I'll implement at least some 
> of those before sending a new version:
> 
> - move MHZ()  to units.h
> - implement fmt validation

This one would be nice to implement already.

> - use the V4L2 endpoint parsing helper (for tx port and also for rx port)
> - "nport" -> "port_idx"? maybe not...

Up to you, not required.

> - ub960_pad_is_source(): can the second condition occur? not if v4l2 
>   makes sure we don't get bad pads.

That should be the case already.

> - error checking on i2c reads/writes
> - 16-bit register access
> - drop legacy bus formats. Check CAL.

This would be good too.

> - ub960_atr_attach_client(): cache per-port mask
> - New route validation flag. Something like 
>   V4L2_SUBDEV_ROUTING_NO_STREAM_MIX, but still allowing N:1 routing ? That 
>   would make sense, maybe as a rework for NO_STREAM_MIX.
> - check for removable debug prints

The rest can be done on top without any issue for me.

-- 
Regards,

Laurent Pinchart
