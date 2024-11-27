Return-Path: <linux-i2c+bounces-8247-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3779DA7A8
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Nov 2024 13:19:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F873285C92
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Nov 2024 12:19:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5BFD1FBE9C;
	Wed, 27 Nov 2024 12:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YSOfCDAx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929DF1FBC85;
	Wed, 27 Nov 2024 12:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732709986; cv=none; b=K30N8HwQx7dStrjJ7SNWERfH2Kitf4B4MLEOgw9tVTTIqznZTPbdzQ6cqcZJt3WtVpue0T0B9R3FYleBCGI+9wYL7Ta9cxSgLWQunZN3LlX0PXXZukirNSG0lT3w14/oKpQLOSO8yOqDuRRKXTDGkwUZi05KCmjeFCjEV+aa7HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732709986; c=relaxed/simple;
	bh=NWuNC3c43uhkrT8zGwzntrXaqdQzB8Qesf5TVf78OZc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jZTwslO1mh12x0VnPynay13wtDRfb0ly4L+CDgEONcZ/V7B+8Ffoh8CxBDPzEq8VFIy2z/MXggwbuqXsBop+GQP2XqNI0auVNzogEVyIZWaRYkwD3QduydqgXxIJ5myTef3YWxrGqfqHW+ZX5S43A/jAjo7o2Oqcf5ZQVb7BR3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YSOfCDAx; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B42F440004;
	Wed, 27 Nov 2024 12:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732709975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WcD8l6qNeOtVuGNjTvtgZIbqX/5fA+izqq4+iRk8MXY=;
	b=YSOfCDAxn+aRLY448U6U8JyuDpXKPTQ08yVVB8zCXZuVFOeQaiiUWx1qQihwDzvGdRlMVu
	/76BIyRYFcTF6RFTz3OLT/Uye3IOkuFYMP/aH4KmfmJQmFAWvvq9i6dNXaSp2b/sy0ADnl
	EqDWhBLIhHk1qDRF9+fdv1a9uLZGY+4YaEY3Aoe+vv35MHLzSnavNfru/W621Vw892rVa4
	QWqfoYa00fBmxoY+v7QhAg4GXooACqH0ST1xoBT+JrbQwpe0Uk4/pBqs1bXTTS0PGCzTRX
	ebcr0VAgYDvI77odRX6Qveu9l4jhghB8CopOpCUmeadibwlGNY3KsX0OpchAug==
Date: Wed, 27 Nov 2024 13:19:31 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, Wolfram Sang <wsa@kernel.org>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Cosmin Tanislav <demonsingur@gmail.com>, Tomi
 Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, Romain Gantois
 <romain.gantois@bootlin.com>
Subject: Re: [PATCH v2 2/3] i2c: atr: Allow unmapped addresses from nested
 ATRs
Message-ID: <20241127131931.19af84c2@booty>
In-Reply-To: <b954c7b7-1094-48f9-afd9-00e386cd2443@ideasonboard.com>
References: <20241122-i2c-atr-fixes-v2-0-0acd325b6916@ideasonboard.com>
	<20241122-i2c-atr-fixes-v2-2-0acd325b6916@ideasonboard.com>
	<20241126091610.05e2d7c7@booty>
	<b954c7b7-1094-48f9-afd9-00e386cd2443@ideasonboard.com>
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

Hello Tomi,

On Tue, 26 Nov 2024 10:35:46 +0200
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:

> Hi Luca,
> 
> On 26/11/2024 10:16, Luca Ceresoli wrote:
> > Hello Tomi,
> > 
> > On Fri, 22 Nov 2024 14:26:19 +0200
> > Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:
> >   
> >> From: Cosmin Tanislav <demonsingur@gmail.com>
> >>
> >> i2c-atr translates the i2c transactions and forwards them to its parent
> >> i2c bus. Any transaction to an i2c address that has not been mapped on
> >> the i2c-atr will be rejected with an error.
> >>
> >> However, if the parent i2c bus is another i2c-atr, the parent i2c-atr
> >> gets a transaction to an i2c address that is not mapped in the parent
> >> i2c-atr, and thus fails.  
> > 
> > Nested ATRs are "interesting", to say the least! :-)
> > 
> > I must say I don't understand the problem here. If this is the picture:
> > 
> >    adapter ---->     ATR1     ---->     ATR2     ----> leaf device
> >                      map:               map:              addr:
> >                   alias addr         alias addr           0x10
> >                   0x30  0x20         0x20  0x10
> > 
> > Then I'd expect this:
> > 
> >   1. the leaf device asks ATR2 for a transaction to 0x10
> >   2. 0x10 is in ATR2 map, ATR2 translates address 0x10 to 0x20
> >   3. ATR2 asks ATR1 for a transaction to 0x20
> >   4. 0x20 is in ATR1 map, ATR1 translates address 0x20 to 0x30
> >   5. ATR1 asks adapter for transaction on 0x30
> > 
> > So ATR1 is never asked for 0x10.  
> 
> Yes, that case would work. But in your example the ATR1 somehow has 
> created a mapping for ATR2's alias.

You're of course right. I had kind of assumed ATR1 is somehow
configured to map 0x30 on 0x20, but this is not going to happen
magically and there is no code AFAIK to do that. So of course my
comment is bogus, thanks for taking time to explain.

> Generally speaking, ATR1 has aliases only for devices in its master bus 
> (i.e. the i2c bus where the ATR1 is the master, not slave), and 
> similarly for ATR2. Thus I think a more realistic example is:
> 
>      adapter ---->     ATR1     ---->     ATR2     ----> leaf device
>                     addr: 0x50         addr: 0x30
>                        map:               map:              addr:
>                     alias addr         alias addr           0x10
>                     0x40  0x30         0x20  0x10
> 
> So, both ATRs create the alias mapping based on the i2c-aliases given to 
> them in the DT, for the slave devices in their i2c bus. Assumption is, 
> of course, that the aliases are not otherwise used, and not overlapping.
> 
> Thus the aliases on ATR2 are not present in the alias table of ATR1.

OK, so the above is what now I'd expect to be configured in the ATR
alias tables.

I still fail to understand how that would work. This is the actions I'd
expect:

  1. the leaf device asks ATR2 for a transaction to 0x10
  2. 0x10 is in ATR2 map, ATR2 translates address 0x10 to 0x20
  3. ATR2 asks ATR1 for a transaction to 0x20
  4. 0x20 is *not* in ATR1 map, *but* this patch is applied
      => i2c-atr lets the transaction through, unmodified
  5. ATR1 asks adapter for transaction on 0x20
  6. adapter sends transaction for 0x20 on wires
  7. ATR1 chip receives transaction for 0x20
      => 0x20 not in its tables, ignores it

Note steps 1-5 are in software (kernel). Step 7 may work if ATR1 were
configured to let all transactions for unknown addresses go through
unmodified, but I don't remember having seen patches to allow that in
i2c-atr.c and I'm not even sure the hardware allows that, the DS90UB9xx
at least.

And even in case that were possible, that would seems a bit fragile.
What if two child ATRs attached to two different ports of the parent
ATR use the same alias, and the parent ATR let transactions for such
alias go through both ports unmodified? Sure, the alias pools can be
carefully crafted to avoid such duplicated aliases, but pools have long
been considered a non-optimal solution, and they make no sense at all
in cases like the FPC202 that Romain is working to support.

Again, I'm pretty sure I'm missing something here. If you could
elaborate with a complete example, including the case of two child ATRs
attached to two ports of the same parent ATR, I'm sure that would be
very helpful.

At my current level of understanding, it looks like the only correct
way to manage nested ATRs is to add a "recursive alias mapping", i.e.
to add for each alias another alias to all parent ATRs, up to the top
one, like in my initial picture. I realize that would imply several
complications, though.

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

