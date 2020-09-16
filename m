Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1645926BBBE
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Sep 2020 07:21:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726148AbgIPFVg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Sep 2020 01:21:36 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:34295 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726068AbgIPFVf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 16 Sep 2020 01:21:35 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 4C0BB469;
        Wed, 16 Sep 2020 01:21:34 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
  by compute3.internal (MEProxy); Wed, 16 Sep 2020 01:21:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm3; bh=Ra4+jaLN+MXOy6NAuUDpQpiZtwMKVaz
        lgglIg2VCfnY=; b=GYk+BtegPglrn/LC4SM6TK0u+9ewxwONcvdB/dCntdIdOVM
        5sdFn3h+Zgve+Ip+v/i0UbnnqtwsXuvIFKca60kw6yfLwiSzOmcm5pKeVQlxQEL7
        KBXzWcW+2rkeVAlDwzZ/5zbE1ELUiNl9vCtjbo76+FF4rAB9kH2uVsIha/UMbWgH
        4kFosVa7nCT89RFeBLYN7zH390ZfkqJ8Gzw4mOuUbuuatz971BAPiBHN9pu1goO7
        e+/ZpbbEKVZ4FsCyg4KGcJw/Ia5M2v67HHJOwlUtkv+DgSPEYJ94enur/kDC2skJ
        zMD1ZtojglPFTUYosBONN/RSqQD50BXSalEnw/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Ra4+ja
        LN+MXOy6NAuUDpQpiZtwMKVazlgglIg2VCfnY=; b=JQXwvHt971ra+JJ+q5qOq7
        3cG54V6pILeLeMt+dIqktlY+DFZus1VrzLz8OOPG9A9NqbUXChHPWfL/ax9f+RMX
        79g4gv0nse9F4WDX1RhZgRDunKcXsaekq4C3CW+Y+lSQUKktiG7VKeBLVbFvOCdQ
        yHkm+Lb9tS4rvHOaiYpqv+DYZJm7JAoCytXl4Qb1l2faKnq0g1TeaKERBnOO835n
        FPjDHRmkh5U5Yj0yShj536oEYfvUKqmKWV36NOnHkfmzgu2P33oik7ADQpT7fpb7
        +Dha5aquUZ0Umc4UOlYdiSrqt9eMnbUDGDPcd9vQg/dzw1rWnB3OS2nuy/ybGLyA
        ==
X-ME-Sender: <xms:3aBhX1mU9Ucei7AlFnXaHcR-82xUEXt6-_7hAsEhsaszO0HQXPQJ9Q>
    <xme:3aBhXw082n4L0oOGPDHnKg63weQTh4ZURrl8z2K2FgwSGZvPsFg0NxxCT7xC2QVhy
    EGsMQ1Rud6aM7b_aA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrtddugdekkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
    vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
    htthgvrhhnpedutddtkeeugeegvddttdeukeeiuddtgfeuuddtfeeiueetfeeileettedv
    tdfhieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:3aBhX7qXO66M7PZzQwUgxw3MePX_SUVnSAmPuJmjPq2m-ISBOh5Kjg>
    <xmx:3aBhX1kiDCpZ_xB3_8tOpAdfaFsrRbaNYU5gXCt12n-6KW7trC9OGQ>
    <xmx:3aBhXz1aVuIdTxol-h63De_hOub3wYRv0sfGfu6t6AVOebaYbNRn-A>
    <xmx:3aBhX-SZYX2uzaWiSFOsnBFMwU6PFhXFTnlHL5gLaNt-LYc_IwK-4w>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 641C1E00C8; Wed, 16 Sep 2020 01:21:32 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-259-g88fbbfa-fm-20200903.003-g88fbbfa3
Mime-Version: 1.0
Message-Id: <48962472-b025-4b0d-90e9-60469bebf206@www.fastmail.com>
In-Reply-To: <71067b18-c4bc-533a-0069-f21069c5fd0d@roeck-us.net>
References: <20200914122811.3295678-1-andrew@aj.id.au>
 <20200914122811.3295678-3-andrew@aj.id.au>
 <71067b18-c4bc-533a-0069-f21069c5fd0d@roeck-us.net>
Date:   Wed, 16 Sep 2020 14:51:08 +0930
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Guenter Roeck" <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
        linux-i2c@vger.kernel.org
Cc:     "Jean Delvare" <jdelvare@suse.com>, wsa@kernel.org,
        "Joel Stanley" <joel@jms.id.au>, linux-kernel@vger.kernel.org
Subject: =?UTF-8?Q?Re:_[RFC_PATCH_2/2]_hwmon:_(pmbus/ucd9000)_Throttle_SMBus_tran?=
 =?UTF-8?Q?sfers_to_avoid_poor_behaviour?=
Content-Type: text/plain
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On Mon, 14 Sep 2020, at 23:44, Guenter Roeck wrote:
> On 9/14/20 5:28 AM, Andrew Jeffery wrote:
> > Short turn-around times between transfers to e.g. the UCD90320 can lead
> > to problematic behaviour, including excessive clock stretching, bus
> > lockups and potential corruption of the device's volatile state.
> > 
> > Introduce transfer throttling for the device with a minimum access
> > delay of 1ms.
> > 
> 
> Some Zilker labs devices have the same problem, though not as bad
> to need a 1ms delay. See zl6100.c. Various LTS devices have a similar
> problem, but there it is possible to poll the device until it is ready.
> See ltc2978.c.
> 
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> >  drivers/hwmon/pmbus/ucd9000.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/drivers/hwmon/pmbus/ucd9000.c b/drivers/hwmon/pmbus/ucd9000.c
> > index 81f4c4f166cd..a0b97d035326 100644
> > --- a/drivers/hwmon/pmbus/ucd9000.c
> > +++ b/drivers/hwmon/pmbus/ucd9000.c
> > @@ -9,6 +9,7 @@
> >  #include <linux/debugfs.h>
> >  #include <linux/kernel.h>
> >  #include <linux/module.h>
> > +#include <linux/moduleparam.h>
> >  #include <linux/of_device.h>
> >  #include <linux/init.h>
> >  #include <linux/err.h>
> > @@ -18,6 +19,9 @@
> >  #include <linux/gpio/driver.h>
> >  #include "pmbus.h"
> >  
> > +static unsigned long smbus_delay_us = 1000;
> 
> Is that to be on the super-safe side ? Patch 0 talks about needing 250 uS.
> 
> > +module_param(smbus_delay_us, ulong, 0664);
> > +
> 
> I would not want to have this in user control, and it should not affect devices
> not known to be affected. 

Can you clarify what you mean here? Initially I interpreted your statement as 
meaning "Don't impose delays on the UCD90160 when the issues have only been 
demonstrated with the UCD90320". But I've since looked at zl6100.c and its 
delay is also exposed as a module parameter, which makes me wonder whether it 
was unclear that smbus_delay_us here is specific to the driver's i2c_client and 
is not a delay imposed on all SMBus accesses from the associated master. That 
is, with the implementation I've posted here, other (non-UCD9000) devices on 
the same bus are _not_ impacted by this value.

> I would suggest an implementation similar to other
> affected devices; again, see zl6100.c or ltc2978.c for examples.

I've had a look at these two examples. As you suggest the delays in zl6100.c 
look pretty similar to what this series implements in the i2c core. I'm finding 
it hard to dislodge the feeling that open-coding the waits is error prone, but 
to avoid that and not implement the waits in the i2c core means having almost 
duplicate implementations of handlers for i2c_smbus_{read,write}*() and 
pmbus_{read,write}*() calls in the driver.

Andrew
