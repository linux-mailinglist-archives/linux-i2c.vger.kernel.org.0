Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D73826C0AB3
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Mar 2023 07:35:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230013AbjCTGfB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Mar 2023 02:35:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229931AbjCTGeq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 Mar 2023 02:34:46 -0400
Received: from smtp.gentoo.org (mail.gentoo.org [IPv6:2001:470:ea4a:1:5054:ff:fec7:86e4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EA267296;
        Sun, 19 Mar 2023 23:34:42 -0700 (PDT)
Message-ID: <70323408-b823-1f1a-0202-434e6243b2af@gentoo.org>
Date:   Mon, 20 Mar 2023 07:34:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From:   zzam@gentoo.org
Subject: Re: [PATCH v10 1/8] i2c: add I2C Address Translator (ATR) support
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mike Pagano <mpagano@gentoo.org>,
        =?UTF-8?Q?Krzysztof_Ha=c5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>,
        Satish Nagireddy <satish.nagireddy@getcruise.com>,
        Luca Ceresoli <luca@lucaceresoli.net>
References: <20230222132907.594690-1-tomi.valkeinen@ideasonboard.com>
 <20230222132907.594690-2-tomi.valkeinen@ideasonboard.com>
Content-Language: en-GB
In-Reply-To: <20230222132907.594690-2-tomi.valkeinen@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Some inline comments below.

Regards
Matthias

Am 22.02.23 um 14:29 schrieb Tomi Valkeinen:
> From: Luca Ceresoli <luca@lucaceresoli.net>
> 
> An ATR is a device that looks similar to an i2c-mux: it has an I2C
> slave "upstream" port and N master "downstream" ports, and forwards
> transactions from upstream to the appropriate downstream port. But it
> is different in that the forwarded transaction has a different slave
> address. The address used on the upstream bus is called the "alias"
> and is (potentially) different from the physical slave address of the
> downstream chip.
> 
> Add a helper file (just like i2c-mux.c for a mux or switch) to allow
> implementing ATR features in a device driver. The helper takes care or
> adapter creation/destruction and translates addresses at each transaction.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>   Documentation/i2c/index.rst         |   1 +
>   Documentation/i2c/muxes/i2c-atr.rst |  97 +++++
>   MAINTAINERS                         |   8 +
>   drivers/i2c/Kconfig                 |   9 +
>   drivers/i2c/Makefile                |   1 +
>   drivers/i2c/i2c-atr.c               | 548 ++++++++++++++++++++++++++++
>   include/linux/i2c-atr.h             | 116 ++++++
>   7 files changed, 780 insertions(+)
>   create mode 100644 Documentation/i2c/muxes/i2c-atr.rst
>   create mode 100644 drivers/i2c/i2c-atr.c
>   create mode 100644 include/linux/i2c-atr.h
> 
[...]
> diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
> new file mode 100644
> index 000000000000..5ab890b83670
> --- /dev/null
> +++ b/drivers/i2c/i2c-atr.c
> @@ -0,0 +1,548 @@
[...]
> +
> +/*
> + * Replace all message addresses with their aliases, saving the original
> + * addresses.
> + *
> + * This function is internal for use in i2c_atr_master_xfer(). It must be
> + * followed by i2c_atr_unmap_msgs() to restore the original addresses.
> + */
> +static int i2c_atr_map_msgs(struct i2c_atr_chan *chan, struct i2c_msg *msgs,
> +			    int num)
> +{
> +	struct i2c_atr *atr = chan->atr;
> +	static struct i2c_atr_cli2alias_pair *c2a;
> +	int i;
> +
> +	/* Ensure we have enough room to save the original addresses */
> +	if (unlikely(chan->orig_addrs_size < num)) {
> +		u16 *new_buf;
> +
> +		/* We don't care about old data, hence no realloc() */
> +		new_buf = kmalloc_array(num, sizeof(*new_buf), GFP_KERNEL);
> +		if (!new_buf)
> +			return -ENOMEM;
> +
> +		kfree(chan->orig_addrs);
> +		chan->orig_addrs = new_buf;
> +		chan->orig_addrs_size = num;
> +	}
> +
> +	for (i = 0; i < num; i++) {
> +		chan->orig_addrs[i] = msgs[i].addr;
> +
> +		c2a = i2c_atr_find_mapping_by_addr(&chan->alias_list,
> +						   msgs[i].addr);
> +		if (!c2a) {
> +			dev_err(atr->dev, "client 0x%02x not mapped!\n",
> +				msgs[i].addr);
> +			return -ENXIO;
I miss the roll-back of previously modified msgs[].addr values.

> +		}
> +
> +		msgs[i].addr = c2a->alias;
> +	}
> +
> +	return 0;
> +}
> +
> +/*
> + * Restore all message address aliases with the original addresses. This
> + * function is internal for use in i2c_atr_master_xfer().
> + *
> + * @see i2c_atr_map_msgs()
> + */
> +static void i2c_atr_unmap_msgs(struct i2c_atr_chan *chan, struct i2c_msg *msgs,
> +			       int num)
> +{
> +	int i;
> +
> +	for (i = 0; i < num; i++)
> +		msgs[i].addr = chan->orig_addrs[i];
Does this code needs null and size checks for orig_addrs/orig_addrs_size 
to protect from oopses?
This cannot happen now as i2c_atr_master_xfer returns early when 
i2c_atr_map_msgs fails.

> +}
> +
> +static int i2c_atr_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
> +			       int num)
> +{
> +	struct i2c_atr_chan *chan = adap->algo_data;
> +	struct i2c_atr *atr = chan->atr;
> +	struct i2c_adapter *parent = atr->parent;
> +	int ret;
> +
> +	/* Translate addresses */
> +	mutex_lock(&chan->orig_addrs_lock);
> +
> +	ret = i2c_atr_map_msgs(chan, msgs, num);
> +	if (ret < 0)
> +		goto err_unlock;
> +
> +	/* Perform the transfer */
> +	ret = i2c_transfer(parent, msgs, num);
> +
> +	/* Restore addresses */
> +	i2c_atr_unmap_msgs(chan, msgs, num);
> +
> +err_unlock:
> +	mutex_unlock(&chan->orig_addrs_lock);
> +
> +	return ret;
> +}
> +
[...]


