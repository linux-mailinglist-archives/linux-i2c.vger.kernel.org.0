Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C319717AEC
	for <lists+linux-i2c@lfdr.de>; Wed, 31 May 2023 11:00:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235264AbjEaJAT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 31 May 2023 05:00:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235333AbjEaI7y (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 31 May 2023 04:59:54 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C7D7186;
        Wed, 31 May 2023 01:59:45 -0700 (PDT)
Received: from pendragon.ideasonboard.com (om126205251136.34.openmobile.ne.jp [126.205.251.136])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7C9127FC;
        Wed, 31 May 2023 10:59:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685523562;
        bh=xZ6k3aIn2asxiNWMpdKml8un7Vsqb0yQ+oU5w96eDrg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=u7dLxQ5OoYuWOyxz6XRiaogwkKO5oZa1YND2rrfPRFdJR5zV90asEVwyrrU1+8YNt
         8CqdzAb4KxR/88IymW0ljkdyjL6Hfy89u1WIpjq9hrU4Gwstowenvr9bxAuR5uyWgV
         +VlvNh14zoS5DHlm76uyWORJgF4Yt89JSc6v7fDs=
Date:   Wed, 31 May 2023 11:59:41 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, Wolfram Sang <wsa@kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Corey Minyard <cminyard@mvista.com>,
        Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
        Jiasheng Jiang <jiasheng@iscas.ac.cn>,
        Antonio Borneo <antonio.borneo@foss.st.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
Message-ID: <20230531085941.GA27043@pendragon.ideasonboard.com>
References: <20230522101849.297499-1-biju.das.jz@bp.renesas.com>
 <20230522101849.297499-2-biju.das.jz@bp.renesas.com>
 <20230529080552.GJ25984@pendragon.ideasonboard.com>
 <OS0PR01MB592283E55078298EEA30C6B9864A9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <OS0PR01MB592283E55078298EEA30C6B9864A9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Biju,

On Mon, May 29, 2023 at 09:00:43AM +0000, Biju Das wrote:
> > Subject: Re: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
> > On Mon, May 22, 2023 at 11:18:39AM +0100, Biju Das wrote:
> > > Renesas PMIC RAA215300 exposes two separate i2c devices, one for the
> > > main device and another for rtc device.
> > >
> > > Enhance i2c_new_ancillary_device() to instantiate a real device.
> > 
> > Doesn't it already instantiate a real device ?
> 
> No, as per the code it instantiates dummy device[1]
> [1] https://elixir.bootlin.com/linux/latest/source/drivers/i2c/i2c-core-base.c#L1156

And that function calls i2c_new_client_device(), which allocates a
struct i2c_client that embeds a struct device, and registers that device
with the kernel device core. How is that different, in terms of
instantiating a "real device", from what this patch does ?

> > > (eg: Instantiate rtc device from PMIC driver)
> > >
> > > Added helper function __i2c_new_dummy_device to share the code between
> > > i2c_new_dummy_device and i2c_new_ancillary_device().
> > >
> > > Also added helper function __i2c_new_client_device() to pass parent
> > > dev parameter, so that the ancillary device can assign its parent
> > > during creation.
> > >
> > > Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > > v4->v5:
> > >  * Replaced parameter dev->parent in __i2c_new_client_device() and
> > >    __i2c_new_dummy_device().
> > >  * Improved error message in __i2c_new_dummy_device() by printing device name.
> > >  * Updated comment for ancillary's device parent
> > >  * Dropped aux_device_name check in i2c_new_ancillary_device().
> > > v3->v4:
> > >  * Dropped Rb tag from Geert as there are new changes.
> > >  * Introduced __i2c_new_dummy_device() to share the code between
> > >    i2c_new_dummy_device and i2c_new_ancillary_device().
> > >  * Introduced __i2c_new_client_device() to pass parent dev
> > >    parameter, so that the ancillary device can assign its parent during
> > >    creation.
> > > v3:
> > >  * New patch
> > >
> > > Ref:
> > >
> > > ---
> > >  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c |  6 +-
> > >  drivers/i2c/i2c-core-base.c                  | 92 +++++++++++++------
> > -
> > >  drivers/media/i2c/adv748x/adv748x-core.c     |  2 +-
> > >  drivers/media/i2c/adv7604.c                  |  3 +-
> > >  include/linux/i2c.h                          |  3 +-
> > >  5 files changed, 69 insertions(+), 37 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > > b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > > index ddceafa7b637..86306b010a0a 100644
> > > --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > > +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > > @@ -1072,7 +1072,7 @@ static int adv7511_init_cec_regmap(struct adv7511 *adv)
> > >  	int ret;
> > >
> > >  	adv->i2c_cec = i2c_new_ancillary_device(adv->i2c_main, "cec",
> > > -						ADV7511_CEC_I2C_ADDR_DEFAULT);
> > > +				    ADV7511_CEC_I2C_ADDR_DEFAULT, NULL);
> > >  	if (IS_ERR(adv->i2c_cec))
> > >  		return PTR_ERR(adv->i2c_cec);
> > >
> > > @@ -1261,7 +1261,7 @@ static int adv7511_probe(struct i2c_client *i2c)
> > >  	adv7511_packet_disable(adv7511, 0xffff);
> > >
> > >  	adv7511->i2c_edid = i2c_new_ancillary_device(i2c, "edid",
> > > -					ADV7511_EDID_I2C_ADDR_DEFAULT);
> > > +					ADV7511_EDID_I2C_ADDR_DEFAULT, NULL);
> > >  	if (IS_ERR(adv7511->i2c_edid)) {
> > >  		ret = PTR_ERR(adv7511->i2c_edid);
> > >  		goto uninit_regulators;
> > > @@ -1271,7 +1271,7 @@ static int adv7511_probe(struct i2c_client *i2c)
> > >  		     adv7511->i2c_edid->addr << 1);
> > >
> > >  	adv7511->i2c_packet = i2c_new_ancillary_device(i2c, "packet",
> > > -					ADV7511_PACKET_I2C_ADDR_DEFAULT);
> > > +					ADV7511_PACKET_I2C_ADDR_DEFAULT, NULL);
> > >  	if (IS_ERR(adv7511->i2c_packet)) {
> > >  		ret = PTR_ERR(adv7511->i2c_packet);
> > >  		goto err_i2c_unregister_edid;
> > > diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> > > index ae3af738b03f..3442aa80290f 100644
> > > --- a/drivers/i2c/i2c-core-base.cvvccc
> > > +++ b/drivers/i2c/i2c-core-base.cckvlrgnulkj
> > > @@ -893,24 +893,10 @@ int i2c_dev_irq_from_resources(const struct resource *resources,
> > >  	return 0;
> > >  }
> > >
> > > -/**
> > > - * i2c_new_client_device - instantiate an i2c device
> > > - * @adap: the adapter managing the device
> > > - * @info: describes one I2C device; bus_num is ignored
> > > - * Context: can sleep
> > > - *
> > > - * Create an i2c device. Binding is handled through driver model
> > > - * probe()/remove() methods.  A driver may be bound to this device when we
> > > - * return from this function, or any later moment (e.g. maybe hotplugging will
> > > - * load the driver module).  This call is not appropriate for use by mainboard
> > > - * initialization logic, which usually runs during an arch_initcall() long
> > > - * before any i2c_adapter could exist.
> > > - *
> > > - * This returns the new i2c client, which may be saved for later use with
> > > - * i2c_unregister_device(); or an ERR_PTR to describe the error.
> > > - */
> > > -struct i2c_client *
> > > -i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *info)
> > > +static struct i2c_client *
> > > +__i2c_new_client_device(struct i2c_adapter *adap,
> > > +			struct i2c_board_info const *info,
> > > +			struct device *parent)
> > >  {
> > >  	struct i2c_client	*client;
> > >  	int			status;
> > > @@ -944,7 +930,7 @@ i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *inf
> > >  	if (status)
> > >  		goto out_err;
> > >
> > > -	client->dev.parent = &client->adapter->dev;
> > > +	client->dev.parent = parent ? parent : &client->adapter->dev;
> > >  	client->dev.bus = &i2c_bus_type;
> > >  	client->dev.type = &i2c_client_type;
> > >  	client->dev.of_node = of_node_get(info->of_node);
> > > @@ -984,6 +970,28 @@ i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *inf
> > >  	kfree(client);
> > >  	return ERR_PTR(status);
> > >  }
> > > +
> > > +/**
> > > + * i2c_new_client_device - instantiate an i2c device
> > > + * @adap: the adapter managing the device
> > > + * @info: describes one I2C device; bus_num is ignored
> > > + * Context: can sleep
> > > + *
> > > + * Create an i2c device. Binding is handled through driver model
> > > + * probe()/remove() methods.  A driver may be bound to this device when we
> > > + * return from this function, or any later moment (e.g. maybe hotplugging will
> > > + * load the driver module).  This call is not appropriate for use by mainboard
> > > + * initialization logic, which usually runs during an arch_initcall() long
> > > + * before any i2c_adapter could exist.
> > > + *
> > > + * This returns the new i2c client, which may be saved for later use with
> > > + * i2c_unregister_device(); or an ERR_PTR to describe the error.
> > > + */
> > > +struct i2c_client *
> > > +i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info
> > > +const *info) {
> > > +	return __i2c_new_client_device(adap, info, NULL); }
> > >  EXPORT_SYMBOL_GPL(i2c_new_client_device);
> > >
> > >  /**
> > > @@ -1054,6 +1062,26 @@ static struct i2c_driver dummy_driver = {
> > >  	.id_table	= dummy_id,
> > >  };
> > >
> > > +static struct i2c_client *__i2c_new_dummy_device(struct i2c_adapter *adapter,
> > > +						 u16 address, const char *name,
> > > +						 struct device *parent)
> > > +{
> > > +	struct i2c_board_info info = {
> > > +		I2C_BOARD_INFO("dummy", address),
> > > +	};
> > > +
> > > +	if (name) {
> > > +		ssize_t ret = strscpy(info.type, name, sizeof(info.type));
> > > +
> > > +		if (ret < 0)
> > > +			return ERR_PTR(dev_err_probe(&adapter->dev, ret,
> > > +						     "Invalid device name: %s\n",
> > > +						     name));
> > > +	}
> > > +
> > > +	return __i2c_new_client_device(adapter, &info, parent); }
> > > +
> > >  /**
> > >   * i2c_new_dummy_device - return a new i2c device bound to a dummy driver
> > >   * @adapter: the adapter managing the device
> > > @@ -1074,11 +1102,7 @@ static struct i2c_driver dummy_driver = {
> > >   */
> > >  struct i2c_client *i2c_new_dummy_device(struct i2c_adapter *adapter,
> > > u16 address)  {
> > > -	struct i2c_board_info info = {
> > > -		I2C_BOARD_INFO("dummy", address),
> > > -	};
> > > -
> > > -	return i2c_new_client_device(adapter, &info);
> > > +	return __i2c_new_dummy_device(adapter, address, NULL, NULL);
> > >  }
> > >  EXPORT_SYMBOL_GPL(i2c_new_dummy_device);
> > >
> > > @@ -1122,15 +1146,19 @@ EXPORT_SYMBOL_GPL(devm_i2c_new_dummy_device);
> > >   * @client: Handle to the primary client
> > >   * @name: Handle to specify which secondary address to get
> > >   * @default_addr: Used as a fallback if no secondary address was specified
> > > + * @aux_device_name: Ancillary device name
> > >   * Context: can sleep
> > >   *
> > >   * I2C clients can be composed of multiple I2C slaves bound together in a single
> > >   * component. The I2C client driver then binds to the master I2C slave and needs
> > > - * to create I2C dummy clients to communicate with all the other slaves.
> > > + * to create I2C ancillary clients to communicate with all the other slaves.
> > >   *
> > > - * This function creates and returns an I2C dummy client whose I2C address is
> > > - * retrieved from the platform firmware based on the given slave name. If no
> > > - * address is specified by the firmware default_addr is used.
> > > + * This function creates and returns an I2C ancillary client whose I2C address
> > > + * is retrieved from the platform firmware based on the given slave name. if
> > > + * aux_device_name is specified by the firmware,
> > 
> > Unless I'm missing something, aux_device_name isn't specified by the
> > firmware, it's a function parameter.
> 
> It is specified in the platform firmware(device tree firmware).

What I meant, in the context of the documentation here, is that the
address is retrieved from the platform firmware by the
i2c_new_ancillary_device() function, not passed as a parameter, while
the name is passed as a parameter. It's not relevant, for the
documentation of this function, where the caller gets the name from.

> > > the ancillary's device parent
> > > + * will be set to the primary device.
> > 
> > This doesn't seem to match the implementation. With this patch the
> > ancillary device's parent is always the primary device. Are you sure
> > this won't cause any regression ? 
> 
> There is no regression as existing users only instantiate dummy device.

Sorry, I don't follow you here. Existing callers of
i2c_new_ancillary_device() today get an i2c_client device whose parent
is the I2C adapter. With this patch they will get an i2c_client device
whose parent is the main i2c_client. That's a change in behaviour, which
could cause all sorts of issues.

> > And why do you need this ?
> 
> As per Krzysztof [2],
> 
> The DT schema allows multiple addresses for children. But we lack
> implementation of parent child relationship, As parent owns the resources.
> Child device needs to parse parent node to get some resource
> like clocks.
> 
> [2] https://lore.kernel.org/linux-renesas-soc/TYCPR01MB5933BFFD4EB556F5FB4EA82186729@TYCPR01MB5933.jpnprd01.prod.outlook.com/

The I2C ancillary clients are not meant to be handled by separate
drivers. You're supposed to have one device node in DT, which causes the
I2C core to instantiate a main i2c_client, and bind it to one driver.
That driver then uses i2c_new_ancillary_device() to create other
i2c_client instances for the secondary I2C addresses. Those i2c_client
instances are not bound to a separate driver, so there should be no code
that needs to look at the parent for resources.

> > > If no address is specified by the firmware
> > > + * default_addr is used. If no aux_device_name is specified by the
> > > + firmware, it
> > 
> > Same here regarding firmware.
> > 
> > > + * will create an I2C dummy client.
> > >   *
> > >   * On DT-based platforms the address is retrieved from the "reg" property entry
> > >   * cell whose "reg-names" value matches the slave name.
> > > @@ -1139,8 +1167,9 @@ EXPORT_SYMBOL_GPL(devm_i2c_new_dummy_device);
> > >   * i2c_unregister_device(); or an ERR_PTR to describe the error.
> > >   */
> > >  struct i2c_client *i2c_new_ancillary_device(struct i2c_client *client,
> > > -						const char *name,
> > > -						u16 default_addr)
> > > +					    const char *name,
> > > +					    u16 default_addr,
> > > +					    const char *aux_device_name)
> > >  {
> > >  	struct device_node *np = client->dev.of_node;
> > >  	u32 addr = default_addr;
> > > @@ -1153,7 +1182,8 @@ struct i2c_client *i2c_new_ancillary_device(struct i2c_client *client,
> > >  	}
> > >
> > >  	dev_dbg(&client->adapter->dev, "Address for %s : 0x%x\n", name, addr);
> > > -	return i2c_new_dummy_device(client->adapter, addr);
> > > +	return __i2c_new_dummy_device(client->adapter, addr, aux_device_name,
> > > +				      &client->dev);
> > >  }
> > >  EXPORT_SYMBOL_GPL(i2c_new_ancillary_device);
> > >
> > > diff --git a/drivers/media/i2c/adv748x/adv748x-core.c
> > > b/drivers/media/i2c/adv748x/adv748x-core.c
> > > index 4498d78a2357..5bdf7b0c6bf3 100644
> > > --- a/drivers/media/i2c/adv748x/adv748x-core.c
> > > +++ b/drivers/media/i2c/adv748x/adv748x-core.c
> > > @@ -186,7 +186,7 @@ static int adv748x_initialise_clients(struct
> > adv748x_state *state)
> > >  		state->i2c_clients[i] = i2c_new_ancillary_device(
> > >  				state->client,
> > >  				adv748x_default_addresses[i].name,
> > > -				adv748x_default_addresses[i].default_addr);
> > > +				adv748x_default_addresses[i].default_addr,
> > NULL);
> > >
> > >  		if (IS_ERR(state->i2c_clients[i])) {
> > >  			adv_err(state, "failed to create i2c client %u\n", i);
> > diff --git
> > > a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c index
> > > 3d0898c4175e..63fa44c9d27c 100644
> > > --- a/drivers/media/i2c/adv7604.c
> > > +++ b/drivers/media/i2c/adv7604.c
> > > @@ -2935,7 +2935,8 @@ static struct i2c_client
> > *adv76xx_dummy_client(struct v4l2_subdev *sd,
> > >  	else
> > >  		new_client = i2c_new_ancillary_device(client,
> > >  				adv76xx_default_addresses[page].name,
> > > -				adv76xx_default_addresses[page].default_addr);
> > > +				adv76xx_default_addresses[page].default_addr,
> > > +				NULL);
> > >
> > >  	if (!IS_ERR(new_client))
> > >  		io_write(sd, io_reg, new_client->addr << 1); diff --git
> > > a/include/linux/i2c.h b/include/linux/i2c.h index
> > > 13a1ce38cb0c..0ce344724209 100644
> > > --- a/include/linux/i2c.h
> > > +++ b/include/linux/i2c.h
> > > @@ -489,7 +489,8 @@ devm_i2c_new_dummy_device(struct device *dev,
> > > struct i2c_adapter *adap, u16 addr  struct i2c_client *
> > > i2c_new_ancillary_device(struct i2c_client *client,
> > >  			 const char *name,
> > > -			 u16 default_addr);
> > > +			 u16 default_addr,
> > > +			 const char *aux_device_name);
> > >
> > >  void i2c_unregister_device(struct i2c_client *client);
> > >

-- 
Regards,

Laurent Pinchart
