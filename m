Return-Path: <linux-i2c+bounces-8335-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFCB9E4283
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Dec 2024 18:56:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B05F169B01
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Dec 2024 17:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 788BC213228;
	Wed,  4 Dec 2024 17:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="RjBCpCuq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16ED212B32;
	Wed,  4 Dec 2024 17:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733332811; cv=none; b=b/xsP5ZJA0XNj6Q4f4/5L6mYPHBRXm3ZGJV29HeAzmF2G+jRpp7GaAmapUP4ZgHglGdMsx0YwOZ3yM0Ux9NAYMBkdrDoRYeLtcuJ0wlWQNL1n5jddapK9L4p0LI/yQYPxQ2Z1pXJWKKhksDYeWnxkpm+ZihjOKgiEpS8uS6qCa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733332811; c=relaxed/simple;
	bh=rrzwTMHt3x8E/1ni+TFWF6p3v6qRtGpQPz3NJv2LAGA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qu25FmWGye6bGo6jNjFQhaU8pcl5Auep5LZCZWTNkiM2JCOjG3xAv9wKftXAlf88CHnYF1Ia5TbaXpwAlw86PRHkFxdgkXWVsH4lMRmnzRMjJT7nXN6dOvlrDDG9GE8i58jYgYHjbxOKJXM/+EERG42DK7Py6Q93IKvoHQin7dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=RjBCpCuq; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id D641D1BF205;
	Wed,  4 Dec 2024 17:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733332807;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+sUuv8WEBnWh2ry91oVX4FPFYh0jD4hLU1SV5Zjdf0o=;
	b=RjBCpCuqNMZ9JPWMndgv5J5tWRFxHNPzl7ZEFBt7aJFqdElZahUrRDFuj29QvRBah+zQzJ
	cZ9bjab0lXEE8uCCbsFk6/tacET3gBMdeTaIHkiYQoXo6YfMHpjbNct+ob3hrdd8zXhSjL
	uyC2xjzp/wqSkF9po5Uai/V8MYL6q/gCXaQ7v/MZCpcTY+tUdH7F/TaNDQmptw6oKjxs86
	GjH2IrPqqRYPEAJE506Va7tJuwxZrwsSg74wrLZlApqcKaExcSg/bsEa1J3KXEK2hsDDMG
	Bcej963yznHk0mPE6DVAdZAOZ0jFpaVAwkcl46aQRFoXmSwBY95Txk/l1EXicA==
Date: Wed, 4 Dec 2024 18:20:04 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, Wolfram Sang <wsa@kernel.org>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Tomi Valkeinen
 <tomi.valkeinen+renesas@ideasonboard.com>, Romain Gantois
 <romain.gantois@bootlin.com>, Matti Vaittinen
 <Matti.Vaittinen@fi.rohmeurope.com>
Subject: Re: [PATCH v2 2/3] i2c: atr: Allow unmapped addresses from nested
 ATRs
Message-ID: <20241204182004.7c317177@booty>
In-Reply-To: <fba09c57-cf13-4f50-8fb2-874ae6f6d310@gmail.com>
References: <20241122-i2c-atr-fixes-v2-0-0acd325b6916@ideasonboard.com>
	<20241122-i2c-atr-fixes-v2-2-0acd325b6916@ideasonboard.com>
	<20241126091610.05e2d7c7@booty>
	<b954c7b7-1094-48f9-afd9-00e386cd2443@ideasonboard.com>
	<20241127131931.19af84c2@booty>
	<30732dbb-21e6-4075-84b1-544fc6e6abce@ideasonboard.com>
	<20241129125340.0e2c57d9@booty>
	<9bae963f-037a-46e1-abf6-f2ec464c4cf8@ideasonboard.com>
	<20241203103932.3cd412bc@booty>
	<fba09c57-cf13-4f50-8fb2-874ae6f6d310@gmail.com>
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

Hello Cosmin, Tomi,

On Tue, 3 Dec 2024 12:35:29 +0200
Cosmin Tanislav <demonsingur@gmail.com> wrote:

> On 12/3/24 11:39 AM, Luca Ceresoli wrote:
> > Hello Tomi,
> > 
> > On Fri, 29 Nov 2024 15:31:45 +0200
> > Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:
> >   
> >> On 29/11/2024 13:53, Luca Ceresoli wrote:
> >>  
> >>>> So strictly speaking it's not an ATR, but this achieves the same.  
> >>>
> >>> Thanks for the extensive and very useful explanation. I had completely
> >>> missed the GMSL serder and their different I2C handling, apologies.
> >>>
> >>> So, the "parent ATR" is the GMSL deser, which is not an ATR but
> >>> implementing it using i2c-atr makes the implementation cleaner. That
> >>> makes sense.  
> >>
> >> Right.
> >>
> >> But, honestly, I can't make my mind if I like the use of ATR here or not =).  
> > 
> > Hehe, indeed, hardware designers use a lot of fantasy in stretching the
> > I2C standard to its limits, perhaps more than actually needed.
> >   
> >> So it's not an ATR, but I'm not quite sure what it is. It's not just
> >> that we need to change the addresses of the serializers, we need to do
> >> that in particular way, enabling one port at a time to do the change.
> >>
> >> If we forget about the init time hurdles, and consider the situation
> >> after the serializers are been set up and all ports have been enabled,
> >> we have:
> >>
> >> There's the main i2c bus, on which we have the deserializer. The
> >> deserializer acts as a i2c repeater (for any transaction that's not
> >> directed to the deser), sending the messages to all serializers. The
> >> serializers catch transactions directed at the ser, and everything else
> >> goes through ATR and to the remote bus.
> >>
> >> Do we have something that represents such a "i2c repeater"? I guess we
> >> could just have an i2c bus, created by the deser, and all the sers would
> >> be on that bus. So we'd somehow do the initial address change first,
> >> then set up the i2c bus, and the serializer i2c clients would be added
> >> to that bus.  
> > 
> > So you think about another thing, like i2c-repeater, in addition to
> > i2c-mux and i2c-atr?
> >   
> 
> Since most of the functionality needed (besides allowing pass-through
> transfers for unmapped I2C addresses) can be achieved already using I2C
> ATR, I think we should make use of it.

If it allows code reuse, then it makes sense.

> > Well, I think it would make sense, as it would generalize a feature
> > that might be used by other chips. However at the moment we do have a
> > working driver for the GMSL deser, and so I don't see the benefit of
> > extracting the i2c-repeater functionality to a separate file, unless
> > there are drivers for other chips being implemented: this would motivate
> > extracting common features to a shared file. IOW, I'd not generalize
> > something with a single user.
> >   
> 
> We have GMSL drivers for 6 new chips that make use of the I2C ATR, and
> we want to send these upstream. Adding pass-through support for the I2C
> ATR is one of the only things keeping us back, and it's the solution
> that makes the most sense to me.

I see, so I understand the aim of this patch. As it was presented
initially, in a "fixes" series and without any mention to new GMSL
drivers, it didn't make sense to me. I think it would be ideal to send
it in the same series as the GMSL driver(s) using it, otherwise there
is no reason to want this change. Also it should not be presented as a
fix, because it is not: it is changing the ATR functionality in order
to extend it to new chips. Finally, documenting the oddities (the deser
being implemented using i2c-atr even though it is not an ATR, in the
first place) wouldbe very useful in the commit message and/or cover
letter.

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

