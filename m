Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2663F67AB11
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Jan 2023 08:40:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234937AbjAYHkH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 25 Jan 2023 02:40:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234581AbjAYHkG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 25 Jan 2023 02:40:06 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FEAF423A;
        Tue, 24 Jan 2023 23:40:04 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5CF1A6E0;
        Wed, 25 Jan 2023 08:40:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674632401;
        bh=XF/NbvEWwFK2w+WAz5RKTTa3kWnFEsr5SE7/GzgHF5U=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=SwcomfYuAwVrIRySLuFgYMfR2pchaJy6RqdTAq7CNpOlQQq4LN0exAZ+7vzjFQhc+
         ZwwfvLPx9joUXvExAcp7f+9I+rr+3koqlo7z6DtXpN3z4hcPpiK9/VXjDVmszzoGGo
         wNzuKMYo0/7bZOFBPZAYrml8KGlkKUGJVE5zLdYE=
Message-ID: <ead8904b-0e17-81e7-98a8-19e4abfdf281@ideasonboard.com>
Date:   Wed, 25 Jan 2023 09:39:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v8 5/7] media: i2c: add DS90UB960 driver
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
        =?UTF-8?Q?Krzysztof_Ha=c5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>,
        Satish Nagireddy <satish.nagireddy@getcruise.com>
References: <20230120153417.1156207-1-tomi.valkeinen@ideasonboard.com>
 <20230120153417.1156207-6-tomi.valkeinen@ideasonboard.com>
 <Y88EhodG7b+oSvtE@pendragon.ideasonboard.com>
 <beaebec6-4ec5-8041-5f70-a974ae417a78@ideasonboard.com>
 <Y9AjFcsQQZqZBhAb@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <Y9AjFcsQQZqZBhAb@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 24/01/2023 20:27, Laurent Pinchart wrote:

>>>> +	} else if (ret < 0) {
>>>> +		dev_err(dev, "rx%u: failed to read 'ti,cdr-mode': %d\n", nport,
>>>
>>> If you moved the "ti,cdr-mode" to an argument, printed with %s, the same
>>> format string would be used for the other properties below, and should
>>> thus be de-duplicated by the compiler.
>>
>> I'm not quite sure if this is a sensible optimization or not, but I did
>> it so that I introduce:
>>
>> const char *read_err_str = "rx%u: failed to read '%s': %d\n";
> 
> static
> 
>> and then use that in the function, which makes the lines much shorter
>> and, I think, a bit more readable.
> 
> If you use the same string literal multiple times, the compiler should
> de-duplicate it automatically, so you don't have to create a variable
> manually.

Yes, but I think this looked better, as it made the code look less 
cluttered, and the point is more obvious. Otherwise, looking at the 
code, seeing dev_dbg(dev, "Foo %s\n", "bar"); looks pretty weird.

>>>> +static void ub960_notify_unbind(struct v4l2_async_notifier *notifier,
>>>> +				struct v4l2_subdev *subdev,
>>>> +				struct v4l2_async_subdev *asd)
>>>> +{
>>>> +	struct ub960_rxport *rxport = to_ub960_asd(asd)->rxport;
>>>> +
>>>> +	rxport->source_sd = NULL;
>>>
>>> Does this serve any purpose ? If not, I'd drop the unbind handler.
>>
>> It makes sure we don't access the source subdev after it has been
>> unbound. I don't see much harm with this function, but can catch cleanup
>> errors.
> 
> Do you mean we'll crash on a NULL pointer dereference instead of
> accessing freed memory if this happens ? I suppose it's marginally
> better :-)

Generally speaking I think it's significantly better. Accessing freed 
memory might go unnoticed for a long time, and might not cause any 
errors or cause randomly some minor errors. Here we might not even be 
accessing freed memory, as the source sd is probably still there, so 
KASAN wouldn't catch it.

In this particular case it might not matter that much. The source_sd is 
only used when starting streaming, so the chances are quite small that 
we'd end up there after the unbind.

Still, I think it's a very good practice to NULL the pointers when 
they're no longer valid.

>>>> +}
> 
> [snip]
> 
>>>> +static int ub960_create_subdev(struct ub960_data *priv)
>>>> +{
>>>> +	struct device *dev = &priv->client->dev;
>>>> +	unsigned int i;
>>>> +	int ret;
>>>> +
>>>> +	v4l2_i2c_subdev_init(&priv->sd, priv->client, &ub960_subdev_ops);
>>>
>>> A blank line would be nice.
>>
>> Ok.
>>
>>>> +	v4l2_ctrl_handler_init(&priv->ctrl_handler, 1);
>>>
>>> You create two controls.
>>
>> Yep. Although I dropped TPG, so only one again.
>>
>>>> +	priv->sd.ctrl_handler = &priv->ctrl_handler;
>>>> +
>>>> +	v4l2_ctrl_new_std_menu_items(&priv->ctrl_handler, &ub960_ctrl_ops,
>>>> +				     V4L2_CID_TEST_PATTERN,
>>>> +				     ARRAY_SIZE(ub960_tpg_qmenu) - 1, 0, 0,
>>>> +				     ub960_tpg_qmenu);
>>>> +
>>>> +	v4l2_ctrl_new_int_menu(&priv->ctrl_handler, NULL, V4L2_CID_LINK_FREQ,
>>>> +			       ARRAY_SIZE(priv->tx_link_freq) - 1, 0,
>>>> +			       priv->tx_link_freq);
>>>> +
>>>> +	if (priv->ctrl_handler.error) {
>>>> +		ret = priv->ctrl_handler.error;
>>>> +		goto err_free_ctrl;
>>>> +	}
>>>> +
>>>> +	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
>>>> +			  V4L2_SUBDEV_FL_HAS_EVENTS | V4L2_SUBDEV_FL_STREAMS;
>>>> +	priv->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
>>>> +	priv->sd.entity.ops = &ub960_entity_ops;
>>>> +
>>>> +	for (i = 0; i < priv->hw_data->num_rxports + priv->hw_data->num_txports; i++) {
>>>> +		priv->pads[i].flags = ub960_pad_is_sink(priv, i) ?
>>>> +					      MEDIA_PAD_FL_SINK :
>>>> +					      MEDIA_PAD_FL_SOURCE;
>>>> +	}
>>>> +
>>>> +	ret = media_entity_pads_init(&priv->sd.entity,
>>>> +				     priv->hw_data->num_rxports +
>>>> +					     priv->hw_data->num_txports,
>>>
>>> :-(
>>
>> I don't have strong opinion on this, but don't you find it a bit
>> confusing if a single argument spans multiple lines but without any indent?
>>
>> With a quick look, this looks like a call with 4 arguments:
>>
>> ret = media_entity_pads_init(&priv->sd.entity,
>> 			     priv->hw_data->num_rxports +
>> 			     priv->hw_data->num_txports,
>> 			     priv->pads);
> 
> I suppose I'm used to it, so it appears more readable to me. It's also
> the style used through most of the kernel. There's of course always the
> option of storing the result of the computation in a local variable.

I'll be happy to indent like that if someone tells me how to configure 
clang-format to do that =). I didn't figure it out.

>>>> +				     priv->pads);
>>>> +	if (ret)
>>>> +		goto err_free_ctrl;
>>>> +
>>>> +	priv->sd.state_lock = priv->sd.ctrl_handler->lock;
>>>> +
>>>> +	ret = v4l2_subdev_init_finalize(&priv->sd);
>>>> +	if (ret)
>>>> +		goto err_entity_cleanup;
>>>> +
>>>> +	ret = ub960_v4l2_notifier_register(priv);
>>>> +	if (ret) {
>>>> +		dev_err(dev, "v4l2 subdev notifier register failed: %d\n", ret);
>>>> +		goto err_free_state;
>>>> +	}
>>>> +
>>>> +	ret = v4l2_async_register_subdev(&priv->sd);
>>>> +	if (ret) {
>>>> +		dev_err(dev, "v4l2_async_register_subdev error: %d\n", ret);
>>>> +		goto err_unreg_notif;
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +
>>>> +err_unreg_notif:
>>>> +	ub960_v4l2_notifier_unregister(priv);
>>>> +err_free_state:
>>>
>>> err_subdev_cleanup:
>>
>> Yep.
>>
>>>> +	v4l2_subdev_cleanup(&priv->sd);
>>>> +err_entity_cleanup:
>>>> +	media_entity_cleanup(&priv->sd.entity);
>>>> +err_free_ctrl:
>>>> +	v4l2_ctrl_handler_free(&priv->ctrl_handler);
>>>> +
>>>> +	return ret;
>>>> +}
> 
> [snip]
> 
>>>> +static int ub960_probe(struct i2c_client *client)
>>>> +{
>>>> +	struct device *dev = &client->dev;
>>>> +	struct ub960_data *priv;
>>>> +	int ret;
>>>> +
>>>> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>>>> +	if (!priv)
>>>> +		return -ENOMEM;
>>>> +
>>>> +	priv->client = client;
>>>> +
>>>> +	priv->hw_data = device_get_match_data(dev);
>>>> +
>>>> +	mutex_init(&priv->reg_lock);
>>>> +	mutex_init(&priv->atr_alias_table.lock);
>>>> +
>>>> +	INIT_DELAYED_WORK(&priv->poll_work, ub960_handler_work);
>>>> +
>>>> +	/*
>>>> +	 * Initialize these to invalid values so that the first reg writes will
>>>> +	 * configure the target.
>>>> +	 */
>>>> +	priv->current_indirect_target = 0xff;
>>>> +	priv->current_read_rxport = 0xff;
>>>> +	priv->current_write_rxport_mask = 0xff;
>>>> +	priv->current_read_csiport = 0xff;
>>>> +	priv->current_write_csiport_mask = 0xff;
>>>> +
>>>> +	ret = ub960_get_hw_resources(priv);
>>>> +	if (ret)
>>>> +		goto err_mutex_destroy;
>>>> +
>>>> +	ret = ub960_enable_core_hw(priv);
>>>> +	if (ret)
>>>> +		goto err_mutex_destroy;
>>>> +
>>>> +	/* release GPIO lock */
>>>> +	if (priv->hw_data->is_ub9702)
>>>> +		ub960_update_bits(priv, UB960_SR_RESET,
>>>> +				  UB960_SR_RESET_GPIO_LOCK_RELEASE,
>>>> +				  UB960_SR_RESET_GPIO_LOCK_RELEASE);
>>>
>>> Could this be moved to ub960_enable_core_hw() ?
>>
>> Yes.
>>
>>>> +
>>>> +	ret = ub960_parse_dt(priv);
>>>> +	if (ret)
>>>> +		goto err_disable_core_hw;
>>>> +
>>>> +	ret = ub960_init_tx_ports(priv);
>>>> +	if (ret)
>>>> +		goto err_free_ports;
>>>> +
>>>> +	ret = ub960_rxport_enable_vpocs(priv);
>>>> +	if (ret)
>>>> +		goto err_free_ports;
>>>> +
>>>> +	ret = ub960_init_rx_ports(priv);
>>>> +	if (ret)
>>>> +		goto err_disable_vpocs;
>>>> +
>>>> +	ub960_reset(priv, false);
>>>> +
>>>> +	ub960_rxport_wait_locks(priv, GENMASK(3, 0), NULL);
>>>> +
>>>> +	/*
>>>> +	 * Clear any errors caused by switching the RX port settings while
>>>> +	 * probing.
>>>> +	 */
>>>> +	ub960_clear_rx_errors(priv);
>>>> +
>>>> +	ret = ub960_init_atr(priv);
>>>> +	if (ret)
>>>> +		goto err_disable_vpocs;
>>>> +
>>>> +	ret = ub960_rxport_add_serializers(priv);
>>>> +	if (ret)
>>>> +		goto err_uninit_atr;
>>>> +
>>>> +	ret = ub960_create_subdev(priv);
>>>> +	if (ret)
>>>> +		goto err_free_sers;
>>>> +
>>>> +	if (client->irq)
>>>> +		dev_warn(dev, "irq support not implemented, using polling\n");
>>>
>>> That's not nice :-( Can it be fixed ? I'm OK if you do so on top.
>>
>> Fixed? You mean implemented? I don't have HW, so I'd rather leave it to
>> someone who has.
> 
> Yes, I meant implemented. The fact that we wake up the system every
> 500ms for I2C transfers isn't great, although I suppose in systems that
> use FPD-Link, that may not matter that much.

I agree, polling is annoying. But again, when there's a platform that 
uses IRQs, I think irq handling can be added (and tested) easily.

  Tomi

