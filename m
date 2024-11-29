Return-Path: <linux-i2c+bounces-8260-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7C09DC31E
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Nov 2024 12:53:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 411C128216D
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Nov 2024 11:53:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B588194AFB;
	Fri, 29 Nov 2024 11:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="WxVyyEmT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E6933C5;
	Fri, 29 Nov 2024 11:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732881234; cv=none; b=inQUS6Ty/EvPR78UZvvG5iMcywspVGyDPbXBqwT91XULkDdHYQkZMb3G67odad4frHGbvcwaut+gUiUuO2rhVcdTBXMGobqsIWejGtofOwFIaO0T78jpdZePlSdK3GUDnpMkrw6/vq4iOU8N2Mqqkzdf9ah7bFsd/B/5Kpp3jOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732881234; c=relaxed/simple;
	bh=j3kYlJUz0ZaK/afBJJ+9h38eNZLmTaPSKUIofRHnXP4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NfTlgJmVwR/bOHvNJ5KgKkfTJvwT4zsXojmobVwjs80CBOxIfqXPoQumAhLa9a5LEkvdFw9P1Xuk9p3UZi+BPxJ+TqpvauvZjHlhII3RImPkN/crgQwSeRQ/mikCKaArx8R7byfvhc847rGo6C0UJyZTX1rscmHMcsrwavNUGxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=WxVyyEmT; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2A1191BF20A;
	Fri, 29 Nov 2024 11:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732881223;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ye5nj48q3iId/qtqeEWPGVqgFmv3xruHRbkutNeHEUI=;
	b=WxVyyEmTB/70tworDrjJS+kD+9bqjDVCwq05DAD1v0pCIWt8LKCMBRMvzBsxN1gKU9hp3Y
	ifSIfGT9m0DXAmUDMWkfT4e7AKzGjCM9J3d5Lg+4STimT9hKP0SO3Tc+8yBv/OfX95/vIN
	2YSN7yMEGUWVnZ3YqFa8iL32V0DxGLSGKXw8dGb2XB0WQdhH2MF70yEnLNs0WxXKKfFE2S
	y/A7E2iJAeeMWNla4BCmo0NkXvPseXES1lDJVMyVG/Fuo2Hu+CUg3eFb1Zf9UDtRThoXRa
	874VXHlnVDtKJhpnqIgq28r2xw8YyGLV+Cu2Waqk5YA3Jm1FT/CgVS8o8rRmTA==
Date: Fri, 29 Nov 2024 12:53:40 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, Wolfram Sang <wsa@kernel.org>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Cosmin Tanislav <demonsingur@gmail.com>, Tomi
 Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, Romain Gantois
 <romain.gantois@bootlin.com>, Matti Vaittinen
 <Matti.Vaittinen@fi.rohmeurope.com>
Subject: Re: [PATCH v2 2/3] i2c: atr: Allow unmapped addresses from nested
 ATRs
Message-ID: <20241129125340.0e2c57d9@booty>
In-Reply-To: <30732dbb-21e6-4075-84b1-544fc6e6abce@ideasonboard.com>
References: <20241122-i2c-atr-fixes-v2-0-0acd325b6916@ideasonboard.com>
	<20241122-i2c-atr-fixes-v2-2-0acd325b6916@ideasonboard.com>
	<20241126091610.05e2d7c7@booty>
	<b954c7b7-1094-48f9-afd9-00e386cd2443@ideasonboard.com>
	<20241127131931.19af84c2@booty>
	<30732dbb-21e6-4075-84b1-544fc6e6abce@ideasonboard.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com

Hi Tomi,

+Cc Matti

On Thu, 28 Nov 2024 19:50:46 +0200
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:

> Hi,
> 
> On 27/11/2024 14:19, Luca Ceresoli wrote:
> > Hello Tomi,
> > 
> > On Tue, 26 Nov 2024 10:35:46 +0200
> > Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:
> >   
> >> Hi Luca,
> >>
> >> On 26/11/2024 10:16, Luca Ceresoli wrote:  
> >>> Hello Tomi,
> >>>
> >>> On Fri, 22 Nov 2024 14:26:19 +0200
> >>> Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:
> >>>      
> >>>> From: Cosmin Tanislav <demonsingur@gmail.com>
> >>>>
> >>>> i2c-atr translates the i2c transactions and forwards them to its parent
> >>>> i2c bus. Any transaction to an i2c address that has not been mapped on
> >>>> the i2c-atr will be rejected with an error.
> >>>>
> >>>> However, if the parent i2c bus is another i2c-atr, the parent i2c-atr
> >>>> gets a transaction to an i2c address that is not mapped in the parent
> >>>> i2c-atr, and thus fails.  
> >>>
> >>> Nested ATRs are "interesting", to say the least! :-)
> >>>
> >>> I must say I don't understand the problem here. If this is the picture:
> >>>
> >>>     adapter ---->     ATR1     ---->     ATR2     ----> leaf device
> >>>                       map:               map:              addr:
> >>>                    alias addr         alias addr           0x10
> >>>                    0x30  0x20         0x20  0x10
> >>>
> >>> Then I'd expect this:
> >>>
> >>>    1. the leaf device asks ATR2 for a transaction to 0x10
> >>>    2. 0x10 is in ATR2 map, ATR2 translates address 0x10 to 0x20
> >>>    3. ATR2 asks ATR1 for a transaction to 0x20
> >>>    4. 0x20 is in ATR1 map, ATR1 translates address 0x20 to 0x30
> >>>    5. ATR1 asks adapter for transaction on 0x30
> >>>
> >>> So ATR1 is never asked for 0x10.  
> >>
> >> Yes, that case would work. But in your example the ATR1 somehow has
> >> created a mapping for ATR2's alias.  
> > 
> > You're of course right. I had kind of assumed ATR1 is somehow
> > configured to map 0x30 on 0x20, but this is not going to happen
> > magically and there is no code AFAIK to do that. So of course my
> > comment is bogus, thanks for taking time to explain.
> >   
> >> Generally speaking, ATR1 has aliases only for devices in its master bus
> >> (i.e. the i2c bus where the ATR1 is the master, not slave), and
> >> similarly for ATR2. Thus I think a more realistic example is:
> >>
> >>       adapter ---->     ATR1     ---->     ATR2     ----> leaf device
> >>                      addr: 0x50         addr: 0x30
> >>                         map:               map:              addr:
> >>                      alias addr         alias addr           0x10
> >>                      0x40  0x30         0x20  0x10
> >>
> >> So, both ATRs create the alias mapping based on the i2c-aliases given to
> >> them in the DT, for the slave devices in their i2c bus. Assumption is,
> >> of course, that the aliases are not otherwise used, and not overlapping.
> >>
> >> Thus the aliases on ATR2 are not present in the alias table of ATR1.  
> > 
> > OK, so the above is what now I'd expect to be configured in the ATR
> > alias tables.
> > 
> > I still fail to understand how that would work. This is the actions I'd
> > expect:
> > 
> >    1. the leaf device asks ATR2 for a transaction to 0x10
> >    2. 0x10 is in ATR2 map, ATR2 translates address 0x10 to 0x20
> >    3. ATR2 asks ATR1 for a transaction to 0x20
> >    4. 0x20 is *not* in ATR1 map, *but* this patch is applied  
> >        => i2c-atr lets the transaction through, unmodified  
> >    5. ATR1 asks adapter for transaction on 0x20
> >    6. adapter sends transaction for 0x20 on wires
> >    7. ATR1 chip receives transaction for 0x20  
> >        => 0x20 not in its tables, ignores it  
> > 
> > Note steps 1-5 are in software (kernel). Step 7 may work if ATR1 were
> > configured to let all transactions for unknown addresses go through
> > unmodified, but I don't remember having seen patches to allow that in
> > i2c-atr.c and I'm not even sure the hardware allows that, the DS90UB9xx
> > at least.  
> 
> DS90UB9xx has I2C_PASS_THROUGH_ALL. However, our particular use case is 
> with Maxim GMSL desers and sers. They're not as nice as the FPD-Link 
> devices in this particular area.
> 
> Cosmin, feel free to elaborate or fix my mistakes, but here's a summary:
> 
> The deserializers don't have ATRs, whereas the serializers do (so vice 
> versa compared to FPD-Link). The deserializers forward everything to all 
> enabled GMSL ports. At probe/setup time we can enable a single link at a 
> time, so that we can direct transactions to a specific serializer (or 
> devices behind it), but after the setup, we need to keep all the ports 
> enabled, as otherwise the video streams would stop for all the other 
> ports except the one we want to send an i2c transaction to.
> 
> The serializers have their own i2c address, but transactions to anything 
> else go through the ser's ATR. The ATR does the translation, if an entry 
> exists in the table, but all transactions are forwarded, whether they 
> are translated or not.
> 
> Where's the nested ATR, you ask? That's a detail which is a bit 
> "interesting": all the serializers have a default i2c address. So we can 
> have 4 serializers all replying to the same address. But we don't have 
> an ATR at the deser. However, we can change the address of the 
> serializer by writing to a serializer register. This must be done at the 
> deser probe time (and before the ser driver probes) where we can enable 
> just a single link at a time. So at probe time we change the addresses 
> of the serializers to be distinct values.
> 
> Still no ATR, right? Well, the i2c-atr accomplishes the above quite 
> nicely: there's an address pool (for the new ser addresses), 
> .attach_client() where we can set the new address for the serializer, 
> and .detach_client() where we can (optionally) restore the original 
> address. This way the serializer driver will operate using the original 
> address, but when it does an i2c transaction, the i2c-atr changes it to 
> the new address.
> 
> So strictly speaking it's not an ATR, but this achieves the same.

Thanks for the extensive and very useful explanation. I had completely
missed the GMSL serder and their different I2C handling, apologies.

So, the "parent ATR" is the GMSL deser, which is not an ATR but
implementing it using i2c-atr makes the implementation cleaner. That
makes sense.

However removing the checks in i2c_atr_map_msgs() is dangerous in the
general case with "proper" ATRs (the TI ones and AFAIK the Rohm ones)
and it conflicts with the FPC202 case as Romain pointed out.

So I think we need those checks to be disabled only when in the the
"nested ATR" scenario, which leads to Romain's suggestion of adding a
flag when instantiating the ATR, so I'll switch to that branch of this
discussion.

> > And even in case that were possible, that would seems a bit fragile.
> > What if two child ATRs attached to two different ports of the parent
> > ATR use the same alias, and the parent ATR let transactions for such
> > alias go through both ports unmodified? Sure, the alias pools can be
> > carefully crafted to avoid such duplicated aliases, but pools have long  
> 
> Yes, the pools have to be non-overlapping and no overlap with anything 
> on the main i2c bus.
> 
> I feel the GMSL HW requires quite strict design rules, and preferably 
> the deser would be on an i2c bus alone. I think an eeprom at 0x10 and a 
> remote sensor at 0x10 would cause trouble, without any way to deal with 
> it in the SW.
> 
> > been considered a non-optimal solution, and they make no sense at all
> > in cases like the FPC202 that Romain is working to support.
> > 
> > Again, I'm pretty sure I'm missing something here. If you could
> > elaborate with a complete example, including the case of two child ATRs
> > attached to two ports of the same parent ATR, I'm sure that would be
> > very helpful.  
> 
> I hope my text above covered this.
> 
> > At my current level of understanding, it looks like the only correct
> > way to manage nested ATRs is to add a "recursive alias mapping", i.e.
> > to add for each alias another alias to all parent ATRs, up to the top
> > one, like in my initial picture. I realize that would imply several
> > complications, though.  
> 
> Yes, that has complications too. Say, if we have a device that has an 
> ATR but also passes everything through (like the GMSL ser), then the 
> driver has to manage two different kinds of aliases: one set for the 
> actual ATR, and one that are just pass-through ones.

I agree this won't make sense for the GMSL case you described.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

