Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 500CCA6289
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2019 09:31:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727929AbfICHba (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Sep 2019 03:31:30 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:42083 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725888AbfICHb1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 3 Sep 2019 03:31:27 -0400
Received: from [109.168.11.45] (port=41542 helo=[192.168.101.73])
        by hostingweb31.netsons.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <luca@lucaceresoli.net>)
        id 1i53Hd-0023u4-IW; Tue, 03 Sep 2019 09:31:21 +0200
From:   Luca Ceresoli <luca@lucaceresoli.net>
Subject: Re: [RFC,v2 2/6] i2c: add I2C Address Translator (ATR) support
To:     jacopo mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Peter Rosin <peda@axentia.se>
References: <20190723203723.11730-1-luca@lucaceresoli.net>
 <20190723203723.11730-3-luca@lucaceresoli.net>
 <20190901143101.humomdehy5ee73sk@vino>
Message-ID: <20bac324-c4d3-270c-5175-0a7f261fd760@lucaceresoli.net>
Date:   Tue, 3 Sep 2019 09:31:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190901143101.humomdehy5ee73sk@vino>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Jacopo,

thanks for your feedback.

On 01/09/19 16:31, jacopo mondi wrote:
> Hi Luca,
>    thanks for keep pushing this series! I hope we can use part of this
> for the (long time) on-going GMSL work...
> 
> I hope you will be patient enough to provide (another :) overview
> of this work during the BoF Wolfram has organized at LPC for the next
> week.

Sure!

> In the meantime I would have some comments after having a read at the
> series and trying to apply its concept to GMSL
> 
> On Tue, Jul 23, 2019 at 10:37:19PM +0200, Luca Ceresoli wrote:
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
>>
>> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
>>
>> ---
>>
>> Changes RFCv1 -> RFCv2:
>>
>>  RFCv1 was implemented inside i2c-mux.c and added yet more complexity
>>  there. RFCv2 creates a new file on its own, i2c-atr.c. Since many ATR
>>  features are not in a MUX and vice versa, the overlapping is low. This was
>>  almost a complete rewrite, but for the records here are the main
>>  differences from the old implementation:
> 
> I'm not an i2c expert, but this looks very similar to me to an
> augmented i2c-mux with the following additional features:
> - automatic selection of the i2c address to use for the children
>   behind the mux
> - automatic translation of the addresses the logical aliases to
>   the actual physical addresses of the slaves (with the help of the
>   deserializer address translation feature in this case).

A notable difference in the hardware is that a mux needs an explicit
procedure to select a port. That's why the select() op is mandatory for
muxes. The ATR, at least in the DS90UB9xx case, selects the port
automatically based on the slave address. So I added an optional
select() op in the atr, but I suspect it's useless for "real" ATRs.

More differences derive from how Linux implements muxes. The i2c-mux
code has several flags for different locking schemes, and it has a
fairly complex DT parsing scheme. These are mostly a historical burden.
Adding the ATR features to i2c-mux.c was very tricky and error-prone due
to all of this code, that's why I have moved ATR to its own file in RFCv2.

> In the GMSL perspective we have similar needs but limited to the
> selection of the i2c addresses to assign to the children behind our
> mux. The maxims's chips work by reprogramming the remote devices and
> do not support address translations on the deserializer side, unlike
> what the TI chips do.

Indeed, the Maxim chips implement a simple mux, so it seems like the
only commonality with TI is the need for address pool management.

> So I wonder if we could somehow split the here proposed solution in
> two, one part to perform the address selection, the other one to
> support address reprogramming.
> 
> One thing I have noticed is that it's up to the driver using the ATR
> (the DS90UB954 deserializer in this case) picking into the alias pool
> and assign aliases. I would have expected this to be a feature of the
> ATR itself, if you aim to have the i2c-alias-pool as a standard
> construct.
> 
> I understand the pool of free aliases 'belongs' to the base board
> device, but the ATR could be provided with a pointer to it and the
> routines to select and assign addresses generalized. Is there a reason
> why you decided otherwise that I'm not seeing?

I was about to do it, but changed my mind for a non-strongly-technical
reason. The entire body of ds90_atr_attach_client() and
ds90_atr_detach_client() is guarded by a mutex to protect the alias pool
from concurrent access. I didn't feel comfortable in hoisting the mutex
into the ATR code and have all the attach and detach callbacks run with
a lock that might be unneeded in specific drivers. At least not with
only one driver using i2c-atr.

Also, I'm not even sure a mutex is really needed to protect the pool. Is
it possible that two client adding/removal operations happen
concurrently? SHould they be serialized at the i2c core level, the
mutexes would be unneeded. But I haven't dug in the core enough to
discover it. Wolfram?

However, even though the alias picking code is not that much, I'm OK in
moving it into the ATR core if it looks good.

Now, I see you thinking "why not moving the ATR code _and_ the alias
picking code in i2c-mux and benefit in the GMSL drivers?", and I'm a
little uncomfortable about this idea. Not because the idea is bad per
se, but because the intricacies of i2c-mux make this quite dreadful.

I have had some discussion with Peter Rosin about simplifying i2c-atr,
but they didn't show a clear path forward and were slowly abandoned.

>>  - change bus description
>>  - remove I2C_ATR_ARBITRATOR and I2C_ATR_GATE support
>>  - select() optional
>>  - rename i2c_atr_alloc -> i2c_atr_new, add i2c_atr_delete, move to bottom
>>  - lock the ATR, not the adapter or the muxes on the adapter
>>  - remove parent-locked code
>>  - remove I2C_MUX_LOCKED flag, now unused
>>  - remove I2C_ATR_ATR flag (always true)
>>  - translation in i2c_atr_smbus_xfer too
>>  - i2c_atr_map_msgs: don't ignore mapping errors
>>  - always require the "i2c-atr" DT node, no magic
>>  - remove ACPI support
>>  - one algo in the atrc, not one per adapter
>>  - remove unneeded i2c_atr_root_adapter
>>  - ditch force_nr
>>  - don't allocate private user memory, just provide a plain userdata pointer
>>  - consolidate all ops in a single struct, simplify naming
>>  - remove adapters individually, allocate in atrc->adapter[chan_id]
>> ---
>>  drivers/i2c/Kconfig     |   9 +
>>  drivers/i2c/Makefile    |   1 +
>>  drivers/i2c/i2c-atr.c   | 557 ++++++++++++++++++++++++++++++++++++++++
>>  include/linux/i2c-atr.h |  82 ++++++
>>  4 files changed, 649 insertions(+)
>>  create mode 100644 drivers/i2c/i2c-atr.c
>>  create mode 100644 include/linux/i2c-atr.h
>>
>> diff --git a/drivers/i2c/Kconfig b/drivers/i2c/Kconfig
>> index abedd55a1264..5df088b1d9de 100644
>> --- a/drivers/i2c/Kconfig
>> +++ b/drivers/i2c/Kconfig
>> @@ -71,6 +71,15 @@ config I2C_MUX
>>
>>  source "drivers/i2c/muxes/Kconfig"
>>
>> +config I2C_ATR
>> +	tristate "I2C Address Translator (ATR) support"
>> +	help
>> +	  Enable support for I2C Address Translator (ATR) chips.
>> +
>> +	  An ATR allows accessing multiple I2C busses from a single
>> +	  physical bus via address translation instead of bus selection as
>> +	  i2c-muxes do.
>> +
>>  config I2C_HELPER_AUTO
>>  	bool "Autoselect pertinent helper modules"
>>  	default y
>> diff --git a/drivers/i2c/Makefile b/drivers/i2c/Makefile
>> index bed6ba63c983..81849ea393c7 100644
>> --- a/drivers/i2c/Makefile
>> +++ b/drivers/i2c/Makefile
>> @@ -13,6 +13,7 @@ i2c-core-$(CONFIG_OF) 		+= i2c-core-of.o
>>  obj-$(CONFIG_I2C_SMBUS)		+= i2c-smbus.o
>>  obj-$(CONFIG_I2C_CHARDEV)	+= i2c-dev.o
>>  obj-$(CONFIG_I2C_MUX)		+= i2c-mux.o
>> +obj-$(CONFIG_I2C_ATR)		+= i2c-atr.o
>>  obj-y				+= algos/ busses/ muxes/
>>  obj-$(CONFIG_I2C_STUB)		+= i2c-stub.o
>>  obj-$(CONFIG_I2C_SLAVE_EEPROM)	+= i2c-slave-eeprom.o
>> diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
>> new file mode 100644
>> index 000000000000..2b61c10a8ff6
>> --- /dev/null
>> +++ b/drivers/i2c/i2c-atr.c
>> @@ -0,0 +1,557 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/**
>> + * drivers/i2c/i2c-atr.c -- I2C Address Translator
>> + *
>> + * Copyright (c) 2019 Luca Ceresoli <luca@lucaceresoli.net>
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
>> + * ATR maintains an table of currently assigned alias and uses it
>> to modify
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
> 
> If I got you right this implements a three level translation, partly
> performed by the ATR and partly performed by the deserializer chip.
> The i2c alias helps the DESR to select the RX port (channel) where to
> emit a transaction with the alias translated (with the deserializer's
> own translation mechanism) to the physical address of the slave.
> 
> Quoting your here above example:
> 
> CPU --> 0x20 --> DESR Port0 --> 0x10 --> SLAVE
> CPU --> 0x30 --> DESR Port1 --> 0x10 --> SLAVE
> 
> Did I get you right?

I would not call it a three level translation, but yes, it is how it works.

> I'm following the DT bindings discussion with Rob and I'm glad your
> last reply looks very similar to what we have in our proposed GMSL
> bindings, so I hope the two could somehow converge.

Good. After all Maxim and TI chips have the same topology, so it seems
natural that their DT description is similar.

-- 
Luca
