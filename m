Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D70014B832D
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Feb 2022 09:44:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231330AbiBPIkf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Feb 2022 03:40:35 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:39628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbiBPIke (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 16 Feb 2022 03:40:34 -0500
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net [89.40.174.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 768B31C8847;
        Wed, 16 Feb 2022 00:40:22 -0800 (PST)
Received: from host-79-2-93-196.business.telecomitalia.it ([79.2.93.196]:33352 helo=[192.168.101.73])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <luca@lucaceresoli.net>)
        id 1nKFrH-0005i7-NY; Wed, 16 Feb 2022 09:40:19 +0100
Message-ID: <f412980a-4e41-54c7-f000-f826e015f6d2@lucaceresoli.net>
Date:   Wed, 16 Feb 2022 09:40:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
From:   Luca Ceresoli <luca@lucaceresoli.net>
Subject: Re: [RFCv3 2/6] i2c: add I2C Address Translator (ATR) support
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Peter Rosin <peda@axentia.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
References: <20220206115939.3091265-1-luca@lucaceresoli.net>
 <20220206115939.3091265-3-luca@lucaceresoli.net>
 <CAHp75Vejw86kLUJfwXR_kUn+=UCaixbcy=epO8Foe=9S2LqXTQ@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAHp75Vejw86kLUJfwXR_kUn+=UCaixbcy=epO8Foe=9S2LqXTQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca+lucaceresoli.net/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,

thank you for the _very_ detailed review and apologies for not having
found the time to reply until now.

I'm OK with most of your comments, so I'm not commenting on them for
brevity. Below my comments on the remaining topics.

On 08/02/22 12:16, Andy Shevchenko wrote:
> On Mon, Feb 7, 2022 at 7:55 PM Luca Ceresoli <luca@lucaceresoli.net> wrote:
>>
>> An ATR is a device that looks similar to an i2c-mux: it has an I2C
>> slave "upstream" port and N master "downstream" ports, and forwards
>> transactions from upstream to the appropriate downstream port. But is
>> is different in that the forwarded transaction has a different slave
>> address. The address used on the upstream bus is called the "alias"
>> and is (potentially) different from the physical slave address of the
>> downstream chip.
>>
>> Add a helper file (just like i2c-mux.c for a mux or switch) to allow
>> implementing ATR features in a device driver. The helper takes care or
>> adapter creation/destruction and translates addresses at each transaction.
> 
> Why I2C mux driver can't be updated to support this feature?

My first version did that. But it was very complex to shoehorn the ATR
features in the i2c-mux code which already handles various [corner]
cases. If memory serves, code reuse was limited to the trivial code:
allocations, cleanups and the like.

The root reason is that an atr and a mux have a similar electric
topology, but they do very different things. An mux need to be commanded
to switch from one downstream bus to another, an atr does not. An atr
modifies the transaction, including the speed, a mux does not.

>>  RFCv1 was implemented inside i2c-mux.c and added yet more complexity
>>  there. RFCv2 creates a new file on its own, i2c-atr.c. Since many ATR
>>  features are not in a MUX and vice versa, the overlapping is low. This was
>>  almost a complete rewrite, but for the records here are the main
>>  differences from the old implementation:
> 
> While this is from a code perspective, maybe i2c mux and this one can
> still share some parts?

Possibly. I'd have to look into that in more detail.
I must say having a separate file allowed me to be free to implement
whatever is best for atr. With that done I would certainly make sense to
check whether there are still enough commonalities to share code, maybe
in a .c file with shared functions.

>> +config I2C_ATR
>> +       tristate "I2C Address Translator (ATR) support"
>> +       help
>> +         Enable support for I2C Address Translator (ATR) chips.
>> +
>> +         An ATR allows accessing multiple I2C busses from a single
>> +         physical bus via address translation instead of bus selection as
>> +         i2c-muxes do.
> 
> What would be the module name?

Isn't the module name written in Kconfig files just to avoid checkpatch
complain about "too few doc lines"? :) Oook, it's i2s-atr anyway.

>> +/**
> 
> Is this a kernel doc formatted documentation?
> Haven't you got a warning?

Not from checkpatch, but I got one from the kernel test robot. Will fix.

[...]

>> + *
>> + * An I2C Address Translator (ATR) is a device with an I2C slave parent
>> + * ("upstream") port and N I2C master child ("downstream") ports, and
>> + * forwards transactions from upstream to the appropriate downstream port
>> + * with a modified slave address. The address used on the parent bus is
>> + * called the "alias" and is (potentially) different from the physical
>> + * slave address of the child bus. Address translation is done by the
>> + * hardware.
>> + *
>> + * An ATR looks similar to an i2c-mux except:
>> + * - the address on the parent and child busses can be different
>> + * - there is normally no need to select the child port; the alias used on
>> + *   the parent bus implies it
>> + *
>> + * The ATR functionality can be provided by a chip with many other
>> + * features. This file provides a helper to implement an ATR within your
>> + * driver.
>> + *
>> + * The ATR creates a new I2C "child" adapter on each child bus. Adding
>> + * devices on the child bus ends up in invoking the driver code to select
>> + * an available alias. Maintaining an appropriate pool of available aliases
>> + * and picking one for each new device is up to the driver implementer. The
>> + * ATR maintains an table of currently assigned alias and uses it to modify
>> + * all I2C transactions directed to devices on the child buses.
>> + *
>> + * A typical example follows.
>> + *
>> + * Topology:
>> + *
>> + *                       Slave X @ 0x10
>> + *               .-----.   |
>> + *   .-----.     |     |---+---- B
>> + *   | CPU |--A--| ATR |
>> + *   `-----'     |     |---+---- C
>> + *               `-----'   |
>> + *                       Slave Y @ 0x10
>> + *
>> + * Alias table:
>> + *
>> + *   Client  Alias
>> + *   -------------
>> + *      X    0x20
>> + *      Y    0x30
>> + *
>> + * Transaction:
>> + *
>> + *  - Slave X driver sends a transaction (on adapter B), slave address 0x10
>> + *  - ATR driver rewrites messages with address 0x20, forwards to adapter A
>> + *  - Physical I2C transaction on bus A, slave address 0x20
>> + *  - ATR chip propagates transaction on bus B with address translated to 0x10
>> + *  - Slave X chip replies on bus B
>> + *  - ATR chip forwards reply on bus A
>> + *  - ATR driver rewrites messages with address 0x10
>> + *  - Slave X driver gets back the msgs[], with reply and address 0x10
>> + *
>> + * Usage:
>> + *
>> + *  1. In your driver (typically in the probe function) add an ATR by
>> + *     calling i2c_atr_new() passing your attach/detach callbacks
>> + *  2. When the attach callback is called pick an appropriate alias,
>> + *     configure it in your chip and return the chosen alias in the
>> + *     alias_id parameter
>> + *  3. When the detach callback is called, deconfigure the alias from
>> + *     your chip and put it back in the pool for later usage
>> + *
>> + * Originally based on i2c-mux.c
>> + */
> 
> Shouldn't this comment be somewhere under Documentation/ ?

Uhm, yes, I agree it's a good idea to move this entire comment there.

>> +       if (dev->of_node) {
> 
> This check can be dropped, also please use device property and fwnode
> APIs. No good of having OF-centric generic modules nowadays.

Sure! This code was written in another decade and I didn't update it...
As you noticed elsewhere it also honors the old, strict 80-chars per
line limit in various places where it makes no sense anymore.

>> +       WARN(sysfs_create_link(&chan->adap.dev.kobj, &dev->kobj, "atr_device"),
>> +            "can't create symlink to atr device\n");
>> +       snprintf(symlink_name, sizeof(symlink_name), "channel-%u", chan_id);
>> +       WARN(sysfs_create_link(&dev->kobj, &chan->adap.dev.kobj, symlink_name),
>> +            "can't create symlink for channel %u\n", chan_id);
> 
> Doesn't sysfs already has a warning when it's really needed?

I have to check that. I usually don't add unnecessary log messages.

[...]

>> +#include <linux/i2c.h>
>> +#include <linux/mutex.h>
> 
> Missed types.h
> 
> Missed struct device;

Not sure I got your point here. This file has some 'struct device *',
which do not need a declaration, and has zero non-pointer uses of
'struct device'.

-- 
Luca
