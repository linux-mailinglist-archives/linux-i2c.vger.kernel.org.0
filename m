Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACC6E6BE963
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Mar 2023 13:37:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229629AbjCQMhh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Mar 2023 08:37:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229604AbjCQMhg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Mar 2023 08:37:36 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31DE3AD31;
        Fri, 17 Mar 2023 05:36:54 -0700 (PDT)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 932665B6;
        Fri, 17 Mar 2023 13:36:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1679056589;
        bh=EvLTNZd1r7ZkfQDY14BCMttegUAqYVO14FTeWKB9xmY=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=lye5Gpx950Nh/PkRLTGli6cN/nw81MFgDV4r6q+UUU797/lw2wRi27hevxSloXtmZ
         k155fZ7MZpYfL97VqC4oC/TJP3oiHFubrlBeSfBiC9LISr0NG94zsoD/r7mlNT0T/G
         UAdgQDFWQIlIyVdgN08H06zTqlR848j0mqF7BSP8=
Message-ID: <b281b472-f911-1f04-2cc8-c3713e771bf6@ideasonboard.com>
Date:   Fri, 17 Mar 2023 14:36:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v10 1/8] i2c: add I2C Address Translator (ATR) support
To:     Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Wolfram Sang <wsa@kernel.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
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
 <20230317101606.69602bba@booty>
Content-Language: en-US
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230317101606.69602bba@booty>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 17/03/2023 11:16, Luca Ceresoli wrote:
> Hi Tomi, Wolfram,
> 
> On Wed, 22 Feb 2023 15:29:00 +0200
> Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:
> 
>> From: Luca Ceresoli <luca@lucaceresoli.net>
>>
>> An ATR is a device that looks similar to an i2c-mux: it has an I2C
>> slave "upstream" port and N master "downstream" ports, and forwards
>> transactions from upstream to the appropriate downstream port. But it
>> is different in that the forwarded transaction has a different slave
>> address. The address used on the upstream bus is called the "alias"
>> and is (potentially) different from the physical slave address of the
>> downstream chip.
>>
>> Add a helper file (just like i2c-mux.c for a mux or switch) to allow
>> implementing ATR features in a device driver. The helper takes care or
>> adapter creation/destruction and translates addresses at each transaction.
>>
>> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> 
> Wolfram, I think Tomi improved this work as much as currently possible
> and this patch now looks extremely good to me. I wish we had this in
> mainline soon. Does it make sense for me to send a Reviewed-by tag,
> given I already have a S-o-b one?
> 
> I have a few _extremely_ minor notes below, but I hope they won't
> slow down merging this work. They can definitely be addressed as a
> follow-up patch after merging this.
> 
> Thank you a lot Tomi for having persisted in improving the ATR code!
> 
>> diff --git a/Documentation/i2c/muxes/i2c-atr.rst b/Documentation/i2c/muxes/i2c-atr.rst
>> new file mode 100644
>> index 000000000000..da226fd4de63
>> --- /dev/null
>> +++ b/Documentation/i2c/muxes/i2c-atr.rst
>> @@ -0,0 +1,97 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +=====================
>> +Kernel driver i2c-atr
>> +=====================
>> +
>> +Author: Luca Ceresoli <luca@lucaceresoli.net>
>> +Author: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> +
>> +Description
>> +-----------
>> +
>> +An I2C Address Translator (ATR) is a device with an I2C slave parent
>> +("upstream") port and N I2C master child ("downstream") ports, and
>> +forwards transactions from upstream to the appropriate downstream port
>> +with a modified slave address. The address used on the parent bus is
>> +called the "alias" and is (potentially) different from the physical
>> +slave address of the child bus. Address translation is done by the
>> +hardware.
>> +
>> +An ATR looks similar to an i2c-mux except:
>> + - the address on the parent and child busses can be different
>> + - there is normally no need to select the child port; the alias used on the
>> +   parent bus implies it
>> +
>> +The ATR functionality can be provided by a chip with many other
>> +features. This file provides a helper to implement an ATR within your
>> +driver.
>> +
>> +The ATR creates a new I2C "child" adapter on each child bus. Adding
>> +devices on the child bus ends up in invoking the driver code to select
>> +an available alias. Maintaining an appropriate pool of available aliases
>> +and picking one for each new device is up to the driver implementer. The
>> +ATR maintains an table of currently assigned alias and uses it to modify
> 
> s/an table/a table/

Right.

>> +all I2C transactions directed to devices on the child buses.
>> +
>> +A typical example follows.
>> +
>> +Topology::
>> +
>> +                      Slave X @ 0x10
>> +              .-----.   |
>> +  .-----.     |     |---+---- B
>> +  | CPU |--A--| ATR |
>> +  `-----'     |     |---+---- C
>> +              `-----'   |
>> +                      Slave Y @ 0x10
>> +
>> +Alias table:
>> +
>> +A, B and C are three physical I2C busses, electrically independent from
>> +each other. The ATR receives the transactions initiated on bus A and
>> +propagates them on bus B or bus C or none depending on the device address
>> +in the transaction and based on the alias table.
>> +
>> +Alias table:
>> +
>> +.. table::
>> +
>> +   ===============   =====
>> +   Client            Alias
>> +   ===============   =====
>> +   X (bus B, 0x10)   0x20
>> +   Y (bus C, 0x10)   0x30
>> +   ===============   =====
>> +
>> +Transaction:
>> +
>> + - Slave X driver sends a transaction (on adapter B), slave address 0x10
> 
> s/sends/requests/ is possibly better to clarify there is still no
> electrical transaction yet at this step, as we are still in software.

I don't like "requests" too much either, but I see your point and I 
think it's better than "sends".

>> + - ATR driver finds slave X is on bus B and has alias 0x20, rewrites
>> +   messages with address 0x20, forwards to adapter A
>> + - Physical I2C transaction on bus A, slave address 0x20
>> + - ATR chip detects transaction on address 0x20, finds it in table,
>> +   propagates transaction on bus B with address translated to 0x10,
>> +   keeps clock streched on bus A waiting for reply
>> + - Slave X chip (on bus B) detects transaction at its own physical
>> +   address 0x10 and replies normally
>> + - ATR chip stops clock stretching and forwards reply on bus A,
>> +   with address translated back to 0x20
>> + - ATR driver receives the reply, rewrites messages with address 0x10
>> +   as they were initially
>> + - Slave X driver gets back the msgs[], with reply and address 0x10
>> +
>> +Usage:
>> +
>> + 1. In your driver (typically in the probe function) add an ATR by
>> +    calling i2c_atr_new() passing your attach/detach callbacks
>> + 2. When the attach callback is called pick an appropriate alias,
>> +    configure it in your chip and return the chosen alias in the
>> +    alias_id parameter
>> + 3. When the detach callback is called, deconfigure the alias from
>> +    your chip and put it back in the pool for later usage
>> +
>> +I2C ATR functions and data structures
>> +-------------------------------------
>> +
>> +.. kernel-doc:: include/linux/i2c-atr.h
> 
> ...
> 
>> diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
>> new file mode 100644
>> index 000000000000..5ab890b83670
>> --- /dev/null
>> +++ b/drivers/i2c/i2c-atr.c
>> @@ -0,0 +1,548 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * I2C Address Translator
>> + *
>> + * Copyright (c) 2019,2022 Luca Ceresoli <luca@lucaceresoli.net>
>> + * Copyright (c) 2022,2023 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> + *
>> + * Originally based on i2c-mux.c
> 
> Not quite anymore I think... should this line be removed?

Well, it still originally based on i2c-mux. Maybe it doesn't resemble 
i2c-mux much anymore, but the above line is a kind of thanks for the 
original authors.

>> +/**
>> + * struct i2c_atr - The I2C ATR instance
>> + * @parent:    The parent &struct i2c_adapter
>> + * @dev:       The device that owns the I2C ATR instance
>> + * @ops:       &struct i2c_atr_ops
>> + * @priv:      Private driver data, set with i2c_atr_set_driver_data()
>> + * @algo:      The &struct i2c_algorithm for adapters
>> + * @lock:      Lock for the I2C bus segment (see &struct i2c_lock_operations)
>> + * @max_adapters: Maximum number of adapters this I2C ATR can have
>> + * @adapter:   Array of adapters
>> + */
>> +struct i2c_atr {
>> +	struct i2c_adapter *parent;
>> +	struct device *dev;
>> +	const struct i2c_atr_ops *ops;
>> +
>> +	void *priv;
>> +
>> +	struct i2c_algorithm algo;
>> +	/* lock for the I2C bus segment (see struct i2c_lock_operations) */
> 
> This comment is identical to the one in the kerneldoc comments just
> above, I'd just remove it.

checkpatch wants an explicit comment for each lock.

>> +	struct mutex lock;
>> +	int max_adapters;
>> +
>> +	struct notifier_block i2c_nb;
> 
> Undocumented?

Indeed, I'll add something here.

> ...
> 
>> +void i2c_atr_delete(struct i2c_atr *atr)
>> +{
> 
> Maybe here we could iterate over atr->adapter[] and if any is != NULL
> just call BUG_ON() or WARN()?

Yes, good idea.

>> +	bus_unregister_notifier(&i2c_bus_type, &atr->i2c_nb);
>> +	mutex_destroy(&atr->lock);
>> +	kfree(atr);
>> +}
>> +EXPORT_SYMBOL_NS_GPL(i2c_atr_delete, I2C_ATR);
> 
> ...
> 
>> diff --git a/include/linux/i2c-atr.h b/include/linux/i2c-atr.h
>> new file mode 100644
>> index 000000000000..7596f70ce1ab
>> --- /dev/null
>> +++ b/include/linux/i2c-atr.h
>> @@ -0,0 +1,116 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * I2C Address Translator
>> + *
>> + * Copyright (c) 2019,2022 Luca Ceresoli <luca@lucaceresoli.net>
>> + * Copyright (c) 2022,2023 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> + *
>> + * Based on i2c-mux.h
> 
> As above, this does not apply very much anymore as it did in v1.
> 
> ...
> 
>> +/**
>> + * i2c_atr_delete - Delete an I2C ATR helper.
>> + * @atr: I2C ATR helper to be deleted.
>> + *
>> + * Precondition: all the adapters added with i2c_atr_add_adapter() mumst be
> 
> s/mumst/must/

Yep.

Thanks for the comments!

  Tomi

