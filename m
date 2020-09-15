Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9141269A2F
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Sep 2020 02:09:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726013AbgIOAJ3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Sep 2020 20:09:29 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:51519 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725994AbgIOAJ2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Sep 2020 20:09:28 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id A4FBCCA0;
        Mon, 14 Sep 2020 20:09:26 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
  by compute3.internal (MEProxy); Mon, 14 Sep 2020 20:09:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm3; bh=w9scfiDXERdUZ5OX9u5Pjp32MnkhZcx
        HYXolYSkIPck=; b=RRZCPo2s7nPXNunsAdodeVfcNTnVLeZlHtyf63zWTC09zRB
        syZi/SPl5fCxNcs3tYnJ205tQ+QJswp0mYfojiip3gVh5gayTa0O8iBA0OuTa8ZD
        GrjhlyLZDpDvPyeEEcquZRRBQ0wYndfa5KgpzK3lXaw/FoDzXiqG3FcRh7R8Ql3A
        5byNQihkSZSdmALmrdCLP85N5e1rPXsafcu0M7mGPY9W9p+6OcBIGf7ZPq+rzAtQ
        5oUn3cU6tHQ/vaGOhBoH6W84ZQto210hK7ApQbyAaa8u0WZAPakqGRizv/SwKq4q
        wAiDLCk4EgGkMvNaEuvEH/FpQO0amXiGZqbhT1Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=w9scfi
        DXERdUZ5OX9u5Pjp32MnkhZcxHYXolYSkIPck=; b=sDtLK/DCaZhi93kXhLlCn0
        F0+srl2C2FpbczmGkSKqnkhQgWORB2/0lFTTpjSgDlgLy/8gQXGn/rxLy6kJvCq0
        sCKTxaU769j0ORqGELr0o3BebYqQTq+gIormDt4AGsSlS0wqNSglF/Xns7b83dGB
        HXXCP28bNAigV13wgFNbmNnJSUyOE6Sm7NnBE8cmX/FtmcdIFerEEFrvP3Bd0mUX
        f/1qTLNTIKV+fUs+Mc+3RF4RZQu13RqjXaezUzJ+fqrIqbbbLJvms/6dZPKWsE5P
        sO2yL2Q7RaUb8i9Ti6mwGYMdWEJ6hokCiZzy5kSPuTs/UlUDSvcMUMmRfuwCUQRw
        ==
X-ME-Sender: <xms:NQZgX0hNwYMu5A1PrQS06vDCCM4n3x3_6NdWObCrb-auE-LjaMTIAw>
    <xme:NQZgX9CzErvlMLVG_1ozKxe4YX1fs7l_Mi_J9GdUfZlDdVgcK83i3QrjEzJjJl-BN
    sA8Hq-ZseJ_B5Hygw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudeijedgvdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
    grthhtvghrnhepuddttdekueeggedvtddtueekiedutdfguedutdefieeuteefieelteet
    vddthfeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:NQZgX8HHo49cMmYEgPMeZmsv8FdRz1wiZAyKz2V9DMMi_LN03ac0IQ>
    <xmx:NQZgX1TfAhdFOmCeS-arK7sB6U5mzMlXpnA44sc50N6WsETLyUgXSA>
    <xmx:NQZgXxxTklYCTl9C8XT3f54uyKxg9LYWGXYhC1glGyjmom8rSa4jYQ>
    <xmx:NgZgXzt74FKU8LPiEpPJPlFGu7ANQ0y2MrvR8Q6P7Q6zzq_LvBtBlg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id C9649E00BF; Mon, 14 Sep 2020 20:09:24 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-259-g88fbbfa-fm-20200903.003-g88fbbfa3
Mime-Version: 1.0
Message-Id: <95dff829-d810-489b-9b05-cebe72272ae5@www.fastmail.com>
In-Reply-To: <71067b18-c4bc-533a-0069-f21069c5fd0d@roeck-us.net>
References: <20200914122811.3295678-1-andrew@aj.id.au>
 <20200914122811.3295678-3-andrew@aj.id.au>
 <71067b18-c4bc-533a-0069-f21069c5fd0d@roeck-us.net>
Date:   Tue, 15 Sep 2020 09:39:04 +0930
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

Ah, this kind of info is what I was hoping for. Thanks.

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

Yeah, 250us was what we came to after 5 minutes of playing with values and a 
logic analyzer, we didn't really take the time to determine a minimum with 
confidence. TI mentioned the minimum time between transfers in their test 
environment is 2.5ms, so 1ms is aggressive by comparison.

> 
> > +module_param(smbus_delay_us, ulong, 0664);
> > +
> 
> I would not want to have this in user control, and it should not affect devices
> not known to be affected. 

Certainly agree with the latter, and regarding the former, it was mostly a
convenient mechanism for me to experiment with values. I agree that it's
not something we would want to be changed arbitrarily by a system admin.

> I would suggest an implementation similar to other
> affected devices; again, see zl6100.c or ltc2978.c for examples.

Yes, thanks for these pointers, I will take a look.

Andrew
